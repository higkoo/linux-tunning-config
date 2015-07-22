sudo apt-get install libpcre3-dev libssl-dev libxml2-dev libxslt1-dev libgd-dev libgeoip-dev libluajit-5.1-dev

./configure --user=www-data \
--group=www-data \
--with-pcre-jit \
--prefix=/usr/share/tengine \
--sbin-path=/usr/sbin/tengine \
--dso-tool-path=/usr/sbin/dso_tool \
--dso-path=/usr/lib64/tengine/modules \
--conf-path=/etc/tengine/tengine.conf \
--http-log-path=/var/log/tengine/access.log \
--error-log-path=/var/log/tengine/error.log \
--lock-path=/var/lock/tengine.lock \
--pid-path=/run/tengine.pid \
--http-client-body-temp-path=/var/lib/tengine/body \
--http-fastcgi-temp-path=/var/lib/tengine/fastcgi \
--http-proxy-temp-path=/var/lib/tengine/proxy \
--http-scgi-temp-path=/var/lib/tengine/scgi \
--http-uwsgi-temp-path=/var/lib/tengine/uwsgi \
--with-http_auth_request_module \
--with-http_dav_module \
--with-http_gzip_static_module \
--with-http_image_filter_module \
--with-http_spdy_module \
--with-mail \
--with-mail_ssl_module \
--with-syslog \
--with-http_ssl_module \
--with-http_stub_status_module \
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
--with-luajit-lib=/usr/lib/x86_64-linux-gnu \
--with-ld-opt=-Wl,-z,relro \
--with-cc-opt='-g -O2 -fstack-protector-strong -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2'

make -j24

make install DESTDIR=~/deb-root/tengine-2.1.0

# tengine-common 更新好的配置文件打个包，以后编译后之后再下载下来更新进去
fpm -f -s dir -t deb -n tengine-common --epoch 1 -v 1.0.0 --iteration 1 -C ~/deb-root/tengine-2.1.0 -p ~/deb-file --verbose --category 'Development/Languages' --description 'Tengine Documents' --url 'tengine.taobao.org' --license 'BSD' -m 'higkoo' var/log/tengine lib/systemd/system/tengine.service etc/ufw/applications.d/tengine etc/default/tengine etc/logrotate.d/tengine etc/tengine etc/init.d/tengine usr/share/tengine/html

# tengine
fpm -f -s dir -t deb -n tengine --epoch 2 -v 2.1.0 --iteration 2 -C ~/deb-root/tengine-2.1.0 -p ~/deb-file \
-d 'libc6 >= 2.14' -d 'libexpat1 >= 2.0.1' -d 'libgd3 >= 2.1.0~alpha~' -d 'libgeoip1' \
-d 'libpam0g >= 0.99.7.1' -d 'libpcre3 >= 8.35' -d 'libssl1.0.0 >= 1.0.1' -d 'libxml2 >= 2.7.4' \
-d 'libxslt1.1 >= 1.1.25' -d 'zlib1g >= 1:1.2.0' \
--verbose --category 'Service/HTTP(s)Server' --description 'Tengine Web Server' --url 'tengine.taobao.org' --license 'BSD' -m 'higkoo' usr/sbin/dso_tool usr/sbin/tengine usr/share/tengine usr/lib64/tengine var/log/tengine etc/tengine
