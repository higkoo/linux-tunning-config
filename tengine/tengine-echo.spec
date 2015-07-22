%global  tengine_user          nobody
%global  tengine_group         %{tengine_user}
%global  tengine_home          /data/log/tengine
%global  tengine_home_tmp      %{tengine_home}/tmp
%global  tengine_logdir        %{tengine_home}
%global  tengine_confdir       %{_sysconfdir}/tengine
%global  tengine_datadir       %{_datadir}/tengine
%global  tengine_webroot       %{tengine_datadir}/html


Name:              tengine-echo
Version:           0.51
Release:           23%{?dist}

Summary:           Brings "echo", "sleep", "time", "exec" and more shell-style goodies to Nginx config file.
Group:             System Environment/Daemons
License:           BSD
URL:               https://github.com/agentzh/echo-nginx-module

%define _sourcedir %_topdir/SOURCES
Source202:	   echo-nginx-module-%{version}.zip

# removes -Werror in upstream build scripts.  -Werror conflicts with
# -D_FORTIFY_SOURCE=2 causing warnings to turn into errors.

NoSource:202
BuildRequires:     openssl-devel
BuildRequires:     pcre-devel
BuildRequires:     zlib-devel
BuildRequires:     jemalloc-devel
BuildRequires:     tengine >= 2.0.3
Requires:          tengine >= 2.0.3
Requires:          openssl
Requires:          pcre
Requires(pre):     shadow-utils
Requires(post):    chkconfig
Requires(preun):   chkconfig, initscripts
Requires(postun):  initscripts
Provides:          webserver

%description
ngx_http_echo_module.so
A Dynamic Module Loading Support For Tengine
ngx_echo - Brings "echo", "sleep", "time", "exec" and more shell-style goodies to Nginx config file.

%prep
mkdir -pv %_builddir/%{name}-%{version}
cd %_builddir/%{name}-%{version}
echo A | unzip %{SOURCE202}

# %patch2 -p1


%build

%install
mkdir -pv %{buildroot}/usr/lib64/tengine/modules
/usr/sbin/dso_tool \
    --nginx-include=/usr/share/tengine/include \
    --dst=%{buildroot}%{_libdir}/tengine/modules \
    --add-module=%_builddir/%{name}-%{version}/echo-nginx-module-%{version}

find %{buildroot} -type f -name .packlist -exec rm -f '{}' \;
find %{buildroot} -type f -name perllocal.pod -exec rm -f '{}' \;
find %{buildroot} -type f -empty -exec rm -f '{}' \;
find %{buildroot} -type f -iname '*.so' -exec chmod 0755 '{}' \;

#install -p -D -m 0644 %{_builddir}/tengine-%{version}/man/tengine.8 %{buildroot}%{_mandir}/man8/tengine.8

%pre
# Empty

%post
echo -ne "Add ++++++\n\t\t load ngx_http_echo_module.so; \nInto >>>>>>\n\t\t dso { } \nAt tengine's main config file ------\nTest config and then restart tengine to take effect! \n"

%preun
# Empty

%postun
# Empty

%clean
rm -rf %_builddir/%{name}-%{version}

%files
%{_libdir}/tengine/modules/ngx_http_echo_module.so

%changelog
* Mon Feb 10 2014 18:02:42 # hukai
- 实现模块独立编译成RPM包
