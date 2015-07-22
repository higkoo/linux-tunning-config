#!/bin/bash

# tengine-common
fpm -f -s dir -t deb -n tengine-common --epoch 1 -v 1.0.0 --iteration 1 -C ~/deb-root -p ~/deb-file --verbose --category 'Development/Languages' --description 'Tengine Documents' --url 'tengine.taobao.org' --license 'BSD' -m 'higkoo' var/log/tengine var/lib/tengine lib/systemd/system/tengine.service etc/ufw/applications.d/tengine etc/default/tengine etc/logrotate.d/tengine etc/tengine etc/init.d/tengine
