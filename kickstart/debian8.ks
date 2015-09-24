# higkoo, <higkoohk@gmail.com>, China, 2015

d-i debian-installer/locale string en_US
d-i debian-installer/language string en
d-i debian-installer/country string US
d-i debian-installer/locale string en_US.UTF-8

d-i localechooser/supported-locales multiselect en_US.UTF-8 zh_CN.UTF-8

d-i console-setup/ask_detect boolean false
d-i console-setup/modelcode string pc105
d-i console-setup/layoutcode string us
d-i console-setup/variantcode string USA
d-i console-keymaps-at/keymap select us

d-i keyboard-configuration/xkb-keymap select us
d-i clock-setup/utc boolean true
d-i time/zone string Asia/Shanghai
d-i clock-setup/ntp boolean false
d-i clock-setup/ntp-server string cn.pool.ntp.org

d-i netcfg/choose_interface select auto
d-i netcfg/disable_dhcp boolean true
d-i netcfg/disable_autoconfig boolean true
d-i netcfg/get_ipaddress string 192.168.168.168
d-i netcfg/get_nameservers string 223.5.5.5
d-i netcfg/get_netmask string 255.255.255.0
d-i netcfg/get_gateway string 192.168.168.1
d-i netcfg/confirm_static boolean true
d-i netcfg/get_hostname string ops.2233.tv
d-i netcfg/get_domain string 
d-i netcfg/wireless_wep string

popularity-contest popularity-contest/participate boolean false
d-i partman-auto/method string regular
d-i partman-auto/disk string /dev/sda
d-i partman-auto/choose_recipe select All files in one partition (recommended for new users)
d-i partman-auto/expert_recipe string                         \
      boot-root ::                                            \
              30000 10000 30000 ext4                          \
                      $primary{ } $bootable{ }                \
                      method{ format } format{ }              \
                      use_filesystem{ } filesystem{ ext4 }    \
                      mountpoint{ / }                         \
              .                                               \
              12000 10000 200% linux-swap                     \
                      $primary{ }                             \
                      method{ swap } format{ }                \
              .                                               \
              20000 10000 2000000000000 xfs                   \
                      $primary{ }                             \
                      method{ format } format{ }              \
                      use_filesystem{ } filesystem{ xfs }     \
                      mountpoint{ /data }                     \
              .
d-i partman/confirm boolean true
d-i partman/confirm_write_new_label boolean true
d-i partman/choose_partition select Finish partitioning and write changes to disk
d-i partman-lvm/confirm boolean true
d-i partman-lvm/device_remove_lvm boolean true
d-i partman-md/confirm_nooverwrite boolean true
d-i partman/choose_partition select finish
d-i partman/confirm_nooverwrite boolean true
d-i partman/confirm_write_changes_to_disks_and_configure_lvm boolean true

apt-mirror-setup        apt-setup/no_mirror     boolean true
apt-mirror-setup        apt-setup/use_mirror    boolean false
apt-mirror-setup        apt-setup/contrib       boolean false
apt-mirror-setup        apt-setup/non-free      boolean false
apt-cdrom-setup apt-setup/cdrom/set-next        boolean false
apt-setup-udeb  apt-setup/services-select       multiselect     

# Need If using iso
d-i apt-setup/use_mirror boolean false
d-i apt-setup/cdrom/set-first boolean false
d-i apt-setup/cdrom/set-next boolean false   
d-i apt-setup/cdrom/set-failed boolean false

d-i  mirror/country             string manual
d-i  mirror/http/hostname       string mirrors.aliyun.com
d-i  mirror/http/directory      string /debian
d-i  mirror/http/proxy          string
tasksel tasksel/first multiselect standard 

d-i  debian-installer/splash    boolean true
d-i  pkgsel/include string openssh-server build-essential vim iproute
d-i  pkgsel/language-packs string 
d-i  pkgsel/install-language-support boolean false
d-i  pkgsel/update-policy        select unattended-upgrades
d-i  pkgsel/upgrade               select safe-upgrade

d-i  passwd/root-login                  boolean true
d-i  passwd/make-user                   boolean false
d-i  passwd/root-password               password zo0O0Ooz
d-i  passwd/root-password-again         password zo0O0Ooz
d-i  user-setup/allow-password-weak     boolean true

d-i  grub-installer/only_debian         boolean true
d-i  grub-installer/with_other_os       boolean true
d-i  grub-installer/bootdev             string /dev/sda
d-i  finish-install/keep-consoles       boolean false
d-i  finish-install/reboot_in_progress  note
d-i  cdrom-detect/eject                 boolean true
d-i  debian-installer/exit/halt         boolean false
d-i  debian-installer/exit/poweroff     boolean false


d-i  preseed/late_command       string cp -frv /cdrom/tools/* /target/opt/
