%global  tengine_user          nobody
%global  tengine_group         %{tengine_user}
%global  tengine_home          /data/log/tengine
%global  tengine_home_tmp      %{tengine_home}/tmp
%global  tengine_logdir        %{tengine_home}
%global  tengine_confdir       %{_sysconfdir}/tengine
%global  tengine_datadir       %{_datadir}/tengine
%global  tengine_webroot       %{tengine_datadir}/html

Name:              tengine
Version:           2.0.3
Release:           2%{?dist}

Summary:           Tengine is a web server originated by Taobao based on Nginx.
Group:             System Environment/Daemons
# BSD License (two clause)
# http://www.freebsd.org/copyright/freebsd-license.html
License:           BSD
URL:               http://tengine.taobao.org

%define _sourcedir %_topdir/SOURCES
Source0:           %{name}-%{version}.tar.gz
Source1:           tengine.init
Source2:           tengine.logrotate
Source3:           tengine.conf
Source4:           default.conf
Source5:           ssl.conf
Source6:           virtual.conf
Source7:           tengine.sysconfig
Source8:           module_stubs
Source100:         index.html
Source102:         favicon.ico
Source103:         404.html
Source104:         50x.html
Source105:         tengine-standard-dso.ini
Source106:	   tengine-3rdparty-dso.ini

# removes -Werror in upstream build scripts.  -Werror conflicts with
# -D_FORTIFY_SOURCE=2 causing warnings to turn into errors.
Patch1:     tengine-mime-types.patch
Patch2:     tengine-http-parse.patch

NoSource:0
BuildRequires:     GeoIP-devel
BuildRequires:     gd-devel
BuildRequires:     libxslt-devel
BuildRequires:     openssl-devel
BuildRequires:     pcre-devel
BuildRequires:     lua-devel
BuildRequires:     luajit-devel >= 2.0
# BuildRequires:     perl-devel
# BuildRequires:     perl(ExtUtils::Embed)
BuildRequires:     zlib-devel
BuildRequires:     jemalloc-devel
Requires:          GeoIP
Requires:          gd
Requires:          lua
Requires:          luajit >= 2.0
Requires:          libxslt
Requires:          openssl
Requires:          pcre
# Requires:          perl(:MODULE_COMPAT_%(eval "`%{__perl} -V:version`"; echo $version))
Requires(pre):     shadow-utils
Requires(post):    chkconfig
Requires(preun):   chkconfig, initscripts
Requires(postun):  initscripts
Provides:          webserver

%description
Tengine is a web server originated by Taobao,
the largest e-commerce website in Asia.
It is based on the Nginx HTTP server and has many advanced features.
Tengine has proven to be very stable and efficient on some of the top 100 websites in the world,
including taobao.com and tmall.com.
Dynamic module loading support (DSO). You don't have to recompile Tengine when adding new modules to it.
SPDY v3 support, and SPDY/HTTP servers can listen on the same port.
Sends unbuffered upload directly to HTTP and FastCGI backend servers, which saves disk I/Os.
Dynamic scripting language (Lua) support.
Syslog (local and remote), pipe logging and log sampling are supported...

%prep
%setup -q
%patch1 -p1
# %patch2 -p1


%build
# tengine does not utilize a standard configure script.  It has its own
# and the standard configure options cause the tengine configure script
# to error out.  This is is also the reason for the DESTDIR environment
# variable.
./configure \
    --prefix=%{_datadir}/%{name} \
    --sbin-path=%{_sbindir}/%{name} \
    --dso-tool-path=%{_sbindir}/dso_tool \
    --dso-path=%{_libdir}/%{name}/modules \
    --conf-path=%{tengine_confdir}/tengine.conf \
    --error-log-path=%{tengine_logdir}/error.log \
    --http-log-path=%{tengine_logdir}/access.log \
    --http-client-body-temp-path=%{tengine_home_tmp}/client_body \
    --http-proxy-temp-path=%{tengine_home_tmp}/proxy \
    --http-fastcgi-temp-path=%{tengine_home_tmp}/fastcgi \
    --http-uwsgi-temp-path=%{tengine_home_tmp}/uwsgi \
    --http-scgi-temp-path=%{tengine_home_tmp}/scgi \
    --pid-path=%{_localstatedir}/run/tengine.pid \
    --lock-path=%{_localstatedir}/lock/subsys/tengine \
    --user=%{tengine_user} \
    --group=%{tengine_group} \
    --with-syslog \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-jemalloc \
    --with-http_realip_module \
    --with-http_addition_module=shared \
    --with-http_xslt_module=shared \
    --with-http_image_filter_module=shared \
    --with-http_geoip_module=shared \
    --with-http_sub_module=shared \
    --with-http_flv_module=shared \
    --with-http_slice_module=shared \
    --with-http_mp4_module=shared \
    --with-http_concat_module=shared \
    --with-http_random_index_module=shared \
    --with-http_secure_link_module=shared \
    --with-http_sysguard_module=shared \
    --with-http_userid_filter_module=shared \
    --with-http_footer_filter_module=shared \
    --with-http_trim_filter_module=shared \
    --with-http_autoindex_module=shared \
    --with-http_map_module=shared \
    --with-http_split_clients_module=shared \
    --with-http_referer_module=shared \
    --with-http_uwsgi_module=shared \
    --with-http_scgi_module=shared \
    --with-http_memcached_module=shared \
    --with-http_limit_conn_module=shared \
    --with-http_limit_req_module=shared \
    --with-http_empty_gif_module=shared \
    --with-http_browser_module=shared \
    --with-http_user_agent_module=shared \
    --with-http_upstream_ip_hash_module=shared \
    --with-http_upstream_least_conn_module=shared \
    --with-http_upstream_session_sticky_module=shared \
    --with-http_reqstat_module=shared \
    --with-http_lua_module=shared \
    --with-luajit-inc=/usr/include/luajit-2.0 \
    --with-luajit-lib=/usr/lib64 \
    --with-cc-opt="%{optflags} $(pcre-config --cflags)" \
    --with-ld-opt="-Wl,-E" # so the perl module finds its symbols

make %{?_smp_mflags}

%install
mkdir -pv %{buildroot}%{tengine_home_tmp} %{buildroot}%{tengine_confdir}/vhost.d
make install DESTDIR=%{buildroot}
# add modules by default if you need
# %{buildroot}%{_sbindir}/dso_tool --dst=%{buildroot}%{_libdir}/%{name}/modules --nginx-source=`pwd` --add-module=`pwd`/ngx_realtime_request_module-master

find %{buildroot} -type f -name .packlist -exec rm -f '{}' \;
find %{buildroot} -type f -name perllocal.pod -exec rm -f '{}' \;
find %{buildroot} -type f -empty -exec rm -f '{}' \;
find %{buildroot} -type f -iname '*.so' -exec chmod 0755 '{}' \;

install -p -D -m 0755 %{SOURCE1} %{buildroot}%{_initrddir}/%{name}
install -p -D -m 0644 %{SOURCE2} %{buildroot}%{_sysconfdir}/logrotate.d/%{name}
install -p -D -m 0644 %{SOURCE7} %{buildroot}%{_sysconfdir}/sysconfig/%{name}

install -p -d -m 0755 %{buildroot}%{tengine_confdir}/conf.d
install -p -d -m 0755 %{buildroot}%{tengine_confdir}/vhost.d
install -p -d -m 0755 %{buildroot}%{tengine_home_tmp}
install -p -d -m 0755 %{buildroot}%{tengine_logdir}
install -p -d -m 0755 %{buildroot}%{tengine_webroot}

install -p -m 0644 %{SOURCE3} %{SOURCE8} %{buildroot}%{tengine_confdir}
install -p -m 0644 %{SOURCE4} %{SOURCE5} %{SOURCE6} %{buildroot}%{tengine_confdir}/vhost.d
install -p -m 0644 %{SOURCE105} %{SOURCE106} %{buildroot}%{tengine_confdir}/conf.d

install -p -m 0644 %{SOURCE100} %{buildroot}%{tengine_webroot}
install -p -m 0644 %{SOURCE102} %{buildroot}%{tengine_webroot}
install -p -m 0644 %{SOURCE103} %{SOURCE104} %{buildroot}%{tengine_webroot}

#install -p -D -m 0644 %{_builddir}/tengine-%{version}/man/tengine.8 %{buildroot}%{_mandir}/man8/tengine.8

%pre
#if [ $1 -eq 1 ]; then
#    getent group %{tengine_group} > /dev/null || groupadd -r %{tengine_group}
#    getent passwd %{tengine_user} > /dev/null || \
#        useradd -r -d %{tengine_home} -g %{tengine_group} \
#        -s /sbin/nologin -c "Tengine web server" %{tengine_user}
#    exit 0
#fi

%post
if [ $1 == 1 ]; then
    /sbin/chkconfig --add %{name}
fi

%preun
if [ $1 = 0 ]; then
    /sbin/service %{name} stop >/dev/null 2>&1
    /sbin/chkconfig --del %{name}
fi

%postun
if [ $1 == 2 ]; then
    /sbin/service %{name} upgrade || :
fi

%files
%doc LICENSE CHANGES README
%{_datadir}/%{name}/html
%{_datadir}/%{name}/include
%{_sbindir}/%{name}
%{_sbindir}/dso_tool
%{_libdir}/%{name}/modules/*.so
#%{_mandir}/man3/tengine.3pm*
#%{_mandir}/man8/tengine.8*
%{_initrddir}/%{name}
%dir %{tengine_confdir}
%dir %{tengine_confdir}/conf.d
%dir %{tengine_confdir}/vhost.d
%dir %{tengine_logdir}
%dir %{tengine_home_tmp}
%config(noreplace) %{tengine_confdir}/browsers
%config(noreplace) %{tengine_confdir}/fastcgi.conf
%config(noreplace) %{tengine_confdir}/fastcgi.conf.default
%config(noreplace) %{tengine_confdir}/fastcgi_params
%config(noreplace) %{tengine_confdir}/fastcgi_params.default
%config(noreplace) %{tengine_confdir}/koi-utf
%config(noreplace) %{tengine_confdir}/koi-win
%config(noreplace) %{tengine_confdir}/mime.types
%config(noreplace) %{tengine_confdir}/module_stubs
%config(noreplace) %{tengine_confdir}/mime.types.default
%config(noreplace) %{tengine_confdir}/tengine.conf
%config(noreplace) %{tengine_confdir}/nginx.conf.default
%config(noreplace) %{tengine_confdir}/scgi_params
%config(noreplace) %{tengine_confdir}/scgi_params.default
%config(noreplace) %{tengine_confdir}/uwsgi_params
%config(noreplace) %{tengine_confdir}/uwsgi_params.default
%config(noreplace) %{tengine_confdir}/win-utf
%config(noreplace) %{tengine_confdir}/vhost.d/*.conf
%config(noreplace) %{tengine_confdir}/conf.d/*.ini
%config(noreplace) %{_sysconfdir}/logrotate.d/%{name}
%config(noreplace) %{_sysconfdir}/sysconfig/%{name}
#%dir %{perl_vendorarch}/auto/tengine
#%{perl_vendorarch}/tengine.pm
#%{perl_vendorarch}/auto/tengine/tengine.so
#%attr(-,%{tengine_user},%{tengine_group}) %dir %{tengine_home}
#%attr(-,%{tengine_user},%{tengine_group}) %dir %{tengine_home_tmp}


%changelog
* Mon Jun  2 2014 17:23:23 # hukai
- 添加 ngx_http_reqstat_module、ngx_http_log_module

* Tue Feb 11 2014 13:24:43 # hukai
- 将第三方模块独立出去
- 必须的核心模块静态化
- 添加luajit支持（v2.0.2）

* Sun Feb  9 2014 17:38:46 # hukai
- 添Shared模式添加第三方模块 echo、memc、drizzle

* Fri Jan 24 2014 15:08:08 # hukai
- 以Shared模式添加内置模块 http_sub_module、http_lua_module
- 将 ngx_realtime_request_module 改为动态加载
- 去掉 Vendor 相关标签

* Mon Jan 20 2014 @ 15:29:14 # hukai
- 增加隐藏文件、目录的过滤，比如 .bash_history
- 增加vhost监控模块 https://github.com/magicbear/ngx_realtime_request_module
- 将vhost配置文件放入vhost.d目录，其它配置放在conf.d。

* Mon Jan  6 2014 @ 13:00:15 # hukai
- 添加 http_realip_module 、http_sysguard_module 模块

* Wed Nov 20 2013 @ 17:50:02 # hukai
- 打上安全补丁，并升级最新版本 ： http://nginx.org/download/patch.2013.space.txt

* Mon May 20 2013 @ 15:11:24 # hukai
- 默认重定向到毒霸网址导航
- Mime增加Json类型

* Wed May 15 2013 @ 16:52:33  # luhuiyong
- 升级到tengine-1.4.6

* Wed Apr 03 2013 @ 11:07:52  # luhuiyong
- 加入DSO动态加载模块的支持

* Thu Dec 06 2012 @ 14:05:28 # hukai
- Tengine 第1版本，从Nginx直接转换过来
