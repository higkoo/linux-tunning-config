# 文件系统被保留给超级用户的百分比：
partman-basicfilesystems	partman-basicfilesystems/specify_reserved	string	
# for internal use; can be preseeded
partman-base	partman/default_filesystem	string	ext4
# 无法安装内核
bootstrap-base	base-installer/kernel/no-kernels-found	error	
# Force GRUB installation to the EFI removable media path?
grub-installer	grub-installer/force-efi-extra-removable	boolean	false
# 连接探测等待的时间(秒)：
netcfg	netcfg/link_wait_timeout	string	3
# 已不能选择语言
d-i	localechooser/translation/no-select	note	
# for internal use; can be preseeded
d-i	hw-detect/load-ide	boolean	false
# 
partman-base	partman/exception_handler_note	note	
# 启用影子口令吗？
user-setup-udeb	passwd/shadow	boolean	true
# 您确定现在就要退出吗？
d-i	di-utils-reboot/really_reboot	boolean	false
# for internal use; can be preseeded
netcfg	netcfg/hostname	string	
# 不安装内核而继续吗？
bootstrap-base	base-installer/kernel/skip-install	boolean	false
# 要删除的卷组：
# Choices: 
partman-lvm	partman-lvm/vgdelete_names	select	
# 请选择要安装的软件：
# Choices: Debian desktop environment, ... GNOME, ... Xfce, ... KDE, ... Cinnamon, ... MATE, ... LXDE, web server, print server, SSH server, 标准系统工具
d-i	tasksel/first	multiselect	
# 此硬件架构不被支持
choose-mirror-bin	mirror/noarch	error	
# for internal use; can be preseeded
netcfg	netcfg/dhcpv6_timeout	string	15
# PCMCIA 资源范围选项：
d-i	hw-detect/pcmcia_resources	string	
# for internal use only
d-i	debian-installer/language	string	zh_CN:zh
# 初始化加密卷失败
partman-crypto	partman-crypto/init_failed	error	
# location
# Choices: 马德里, 休达, 加那利群岛
tzsetup-udeb	tzsetup/country/ES	select	Europe/Madrid
# 此 RAID0 阵列中的活跃设备：
# Choices: 
partman-md	partman-md/raid0devs	multiselect	
# 分区方法：
# Choices: 向导 - 使用整个磁盘, 向导 - 使用整个磁盘并配置 LVM, 向导 - 使用整个磁盘并配置加密的 LVM, 手动
partman-auto	partman-auto/init_automatically_partition	select	50some_device__________regular
# 探测到错误的光盘
d-i	cdrom-detect/wrong-cd	error	
# 基本系统安装出错
bootstrap-base	base-installer/debootstrap/error-abnormal	error	
# 此分区的初始向量生成算法：
# Choices: 
partman-crypto	partman-crypto/ivalgorithm	select	
# for internal use only
user-setup-udeb	passwd/user-uid	string	
# 无效的逻辑卷或卷组名称
partman-lvm	partman-lvm/badnamegiven	error	
# 无法配置 GRUB
grub-installer	grub-installer/sataraid-error	error	
# 新分区的类型：
# Choices: 主分区, 逻辑分区
partman-partitioning	partman-partitioning/new_partition_type	select	
# for internal use; can be preseeded
bootstrap-base	base-installer/debootstrap_script	string	
# 真的要删除这个软件 RAID 设备吗？
partman-md	partman-md/deleteverify	boolean	false
# 网关：
netcfg	netcfg/get_gateway	string	
# 没有发现 iSCSI 目标
partman-iscsi	partman-iscsi/login/no_targets	error	
# for internal use only
partman-auto-raid	partman-auto-raid/raidnum	string	
# 真的要删除此卷组吗？
partman-lvm	partman-lvm/vgdelete_confirm	boolean	true
# 返回菜单吗？
partman-basicmethods	partman-basicmethods/method_only	boolean	
# 此 RAID 阵列中的备用设备：
# Choices: 
partman-md	partman-md/raidsparedevs	multiselect	
# city
# Choices: 金沙萨, 卢本巴希
tzsetup-udeb	tzsetup/country/CD	select	Africa/Kinshasa
# for internal use; can be preseeded
ethdetect	ethdetect/prompt_missing_firmware	boolean	true
# for internal use; can be preseeded
apt-setup-udeb	apt-setup/multiarch	string	
# 系统保留的用户名
user-setup-udeb	passwd/username-reserved	error	
# location
# Choices: 里斯本, 马德拉群岛, 亚速尔
tzsetup-udeb	tzsetup/country/PT	select	Europe/Lisbon
# 逻辑卷大小：
partman-lvm	partman-lvm/lvcreate_size	string	
# 将修改内容写入存储设备并配置 RAID 吗？
partman-md	partman-md/confirm	boolean	false
# 网络配置方式：
# Choices: 重新尝试网络自动设置, 使用 DHCP 主机名重试网络自动设置, 手动进行网络设置, , 现在不进行网络设置
netcfg	netcfg/dhcp_options	select	Retry network autoconfiguration with a DHCP hostname
# 您要在未清空的目标文件系统中进行安装吗？
base-installer	base-installer/use_unclean_target	boolean	true
# 保留默认键盘布局 ()？
d-i	keyboard-configuration/unsupported_layout	boolean	true
# 将包含在 initrd 里的驱动程序：
# Choices: 通用：包含所有可用驱动程序, 目标：只包含此系统需要的驱动程序
bootstrap-base	base-installer/initramfs-tools/driver-policy	select	most
# for internal use only
d-i	debconf/translations-dropped	boolean	false
# 没有选择物理卷
partman-lvm	partman-lvm/vgreduce_nosel	error	
# 卷组名已被使用
partman-auto-lvm	partman-auto-lvm/vg_exists	error	
# for internal use only
d-i	anna/retriever	string	cdrom-retriever
# 要加载的安装程序组件：
# Choices: 
d-i	anna/choose_modules_lowmem	multiselect	
# 无默认路由，继续安装吗？
netcfg	netcfg/no_default_route	boolean	
# 当前 LVM 配置
partman-lvm	partman-lvm/displayall	note	
# iSCSI 登录失败
partman-iscsi	partman-iscsi/login/failed	error	
# 探测到光盘
d-i	cdrom-detect/success	note	
# zone
# Choices: 纽芬兰, 大西洋, 东部, 中部, 东 Saskatchewan, Saskatchewan, 山地, 太平洋
tzsetup-udeb	tzsetup/country/CA	select	Canada/Eastern
# 域名服务器地址：
netcfg	netcfg/get_nameservers	string	
# for internal use; can be preseeded
d-i	preseed/interactive	boolean	false
#  的 iSCSI 目标端用户名
partman-iscsi	partman-iscsi/login/incoming_username	string	
# 此 RAID 阵列中活跃设备的个数：
partman-md	partman-md/raiddevcount	string	
# 
# Choices: 安圭拉, 安提瓜和巴布达, 阿鲁巴, 巴哈马, 巴巴多斯, 百慕大, 博奈尔、圣尤斯特歇斯岛和萨巴, 开曼群岛, 古巴, 多米尼克, 多米尼加共和国, 格林纳达, 瓜德罗普, 海地, 牙买加, 马提尼克, 蒙塞拉特岛, 波多黎各, 圣巴泰勒米岛, 圣基茨和尼维斯, 圣路西亚, 法属圣马丁, 圣文森特和格林纳丁斯, 荷属圣马丁, 特里尼达和多巴哥, 特克斯和凯科斯群岛, 英属维京群岛, 美属维京群岛
d-i	localechooser/countrylist/Caribbean	select	
# Translations temporarily not available
d-i	localechooser/translation/none-yet	note	
# 请选择键盘映射：
# Choices: 美国英语, 阿尔巴尼亚语, 阿拉伯语, 阿斯图利亚斯语, 孟加拉语, 白俄罗斯语, 孟加拉语, 比利时语-拉丁1, 波斯尼亚语, 巴西, 英国英语, 保加利亚语, 保加利亚语 (phonetic 布局), Burmese, 加拿大法语, 加拿大-多語言, 加泰罗尼亚语, 汉语, 克罗地亚语, 捷克语, 丹麦语, 荷兰语, 多冉柯键盘(Dvorak), 不丹语, 世界语, 爱沙尼亚语, 埃塞俄比亚语, 芬兰语, 法语, 格鲁吉亚语, 德语, 希腊语, 古吉拉特语, 果鲁穆奇语, 希伯来语, 印地语, 匈牙利语, 冰岛语, 爱尔兰语, 意大利语, 日语, 卡纳达语, 哈萨克语, 高棉语, 吉尔吉斯语, 朝鲜语, 库尔德语(F 布局), 库尔德语(Q 布局), 老挝语, 拉丁美洲语, 拉脱维亚语, 立陶宛语, 马其顿语, 马拉雅拉姆语, 尼泊尔语, 北萨马语, 挪威语, 波斯语, Philippines, 波兰语, 葡萄牙语, 旁遮普语, 罗马尼亚语, 俄语, 塞尔维亚语-西里尔字母, 辛达语, 僧伽罗语, 斯洛伐克语, 斯洛文尼亚语, 西班牙语, 瑞典语, 瑞士法语, 瑞士德语, 塔吉克语, 泰米尔语, 泰卢固语, 泰语, 藏语, 土耳其语(F 布局), 土耳其语(Q 布局), 乌克兰语, 维吾尔语, 越南语
d-i	keyboard-configuration/xkb-keymap	select	cn
# 
# Choices: 布维群岛, 福克兰群岛(马尔维纳斯), 圣赫勒拿-阿森松-特里斯坦达库尼亚, 南乔治亚岛和南桑德韦奇岛
d-i	localechooser/countrylist/Atlantic_Ocean	select	
# for internal use; can be preseeded
network-preseed	preseed/url/checksum	string	
# /target 上没有挂载文件系统
base-installer	base-installer/no_target_mounted	error	
# 未指明足够数量的 RAID 分区
partman-auto-raid	partman-auto-raid/notenoughparts	error	
# 分区方法：
# Choices: 
partman-auto	partman-auto/automatically_partition	select	
# 用于生成启动 initrd 的工具：
# Choices: 
bootstrap-base	base-installer/initramfs/generator	select	
# 键盘布局所属国家：
# Choices: 
d-i	keyboard-configuration/layout	select	
# 保留现有的分区设置并配置 RAID 吗？
partman-md	partman-md/confirm_nochanges	boolean	false
# for internal use; can be preseeded
d-i	preseed/early_command	string	
# 返回菜单并更正此问题吗？
partman-ext3	partman-ext3/boot_not_ext2_or_ext3	boolean	
# 
# Choices: Italy, Switzerland, other
d-i	localechooser/shortlist/it	select	
# 无足够数量的 RAID 分区
partman-md	partman-md/notenoughparts	error	
# location
# Choices: 雅浦, 楚克, 波纳佩, 库塞埃
tzsetup-udeb	tzsetup/country/FM	select	Pacific/Ponape
# for internal use; can be preseeded
d-i	preseed/include_command	string	
# 此分区加密密钥的类型：
# Choices: 
partman-crypto	partman-crypto/keytype	select	
# 无效的密码
netcfg	netcfg/invalid_pass	error	
# for internal use; can be preseeded
grub-installer	grub-installer/make_active	boolean	true
# 使用中的设备
partman-base	partman-base/devicelocked	error	
# zone
# Choices: 东部, 中部, 山地, 太平洋, 阿拉斯加, 夏威夷, 亚利桑那, 东印第安那, 萨摩亚
tzsetup-udeb	tzsetup/country/US	select	US/Eastern
# 无法自动移除 LVM 数据
partman-lvm	partman-lvm/device_remove_lvm_span	error	
# 
# Choices: China, India, other
d-i	localechooser/shortlist/bo	select	
# 加载安装程序组件失败
d-i	anna/install_failed	error	
# 保留默认键盘选项 ()？
d-i	keyboard-configuration/unsupported_options	boolean	true
# for internal use
d-i	keyboard-configuration/variantcode	string	
# 未加载内核模块，继续安装吗？
d-i	anna/no_kernel_modules	boolean	false
# 点对点链接不支持 IPv6
netcfg	netcfg/no_ipv6_pointopoint	error	
# 将之前的修改写入磁盘并继续吗？
partman-partitioning	partman-partitioning/confirm_resize	boolean	
# 逻辑卷名称：
partman-lvm	partman-lvm/lvcreate_name	string	
# 没有要加密的分区
partman-crypto	partman-crypto/nothing_to_setup	note	
# for internal use; can be preseeded
d-i	preseed/file	string	
# 创建文件系统失败
partman-basicfilesystems	partman-basicfilesystems/create_failed	error	
# 强制 UEFI 安装？
partman-efi	partman-efi/non_efi_system	boolean	
# 错误
netcfg	netcfg/error	error	
# for internal use
bootstrap-base	base-installer/kernel/linux/initramfs-tools/driver-policy	string	most
# 无法从光盘上拷贝文件。要重试吗？
d-i	retriever/cdrom/error	boolean	true
# for internal use; can be preseeded
partman-partitioning	partman-partitioning/default_label	string	
# 要安装的 Debian 版本：
# Choices: 
choose-mirror-bin	mirror/suite	select	
# 手动选择光盘驱动器设备及其模块吗？
d-i	cdrom-detect/manual_config	boolean	true
# 所输入的值过小
partman-partitioning	partman-partitioning/small_new_size	error	
# 允许以根用户 (root) 登录吗？
user-setup-udeb	passwd/root-login	boolean	true
# 您准备使用 FireWire 以太网吗？
ethdetect	ethdetect/use_firewire_ethernet	boolean	false
# 将这个分区设为活动的吗？
lilo-installer	lilo-installer/activate-part	boolean	true
# 
# Choices: Macedonia\, Republic of, Albania, other
d-i	localechooser/shortlist/sq	select	
# Web 服务已启动，但网络尚未工作
d-i	save-logs/no_network	note	
# 挂载 /target/proc 失败
nobootloader	nobootloader/mounterr	error	
# 
# Choices: Andorra, Spain, France, Italy, other
d-i	localechooser/shortlist/ca	select	
# 
# Choices: Brazil, Portugal, other
d-i	localechooser/shortlist/pt_BR	select	
# 使用 JFS 根文件系统吗？(不推荐)
partman-jfs	partman-jfs/jfs_root	boolean	false
# 卷组名：
partman-lvm	partman-lvm/vgcreate_name	string	
# 
# Choices: Pakistan, India, other
d-i	localechooser/shortlist/pa	select	
# zone
# Choices: Pacific/Port_Moresby (most locations), Pacific/Bougainville (Bougainville)
tzsetup-udeb	tzsetup/country/PG	select	
# Debian 归档镜像：
# Choices: 
choose-mirror-bin	mirror/http/mirror	select	
# 删除卷组出错
partman-lvm	partman-lvm/vgdelete_error	error	
# 无法下载密码处理 (crypto) 组件
partman-crypto	partman-crypto/install_udebs_failure	error	
# 无可用的 RAID 分区
partman-md	partman-md/noparts	error	
# 基本系统安装出错
bootstrap-base	base-installer/debootstrap/error-exitcode	error	
# for internal use; can be preseeded
partman-iscsi	partman-iscsi/login/all_targets	boolean	false
# 此分区的加密方式：
# Choices: 
partman-crypto	partman-crypto/crypto_type	select	
# 软件 RAID 设备类型：
# Choices: RAID0, RAID1, RAID5, RAID6, RAID10
partman-md	partman-md/createmain	select	
# IP 地址：
netcfg	netcfg/get_ipaddress	string	
# for internal use; can be preseeded
disk-detect	disk-detect/multipath/enable	boolean	false
# for internal use; can be preseeded
apt-setup-udeb	apt-setup/security_host	string	security.debian.org
# 尽管没有足够内存，仍然安装密码处理 (crypto) 组件？
partman-crypto	partman-crypto/install_udebs_low_mem	boolean	
# 空口令句
partman-crypto	partman-crypto/passphrase-empty	error	
# 没有网络镜像，继续安装吗？
apt-mirror-setup	apt-setup/no_mirror	boolean	false
# 分区方案：
# Choices: 将所有文件放在同一个分区中 (推荐新手使用), 将 /home 放在单独的分区, 将 /home、/var 和 /tmp 都分别放在单独的分区
partman-auto	partman-auto/choose_recipe	select	/lib/partman/recipes/30atomic
# location
# Choices: 戈特霍布, Danmarkshavn, Scoresbysund, 图勒
tzsetup-udeb	tzsetup/country/GL	select	America/Godthab
# 加密配置动作
# Choices: 创建加密卷, 完成
partman-crypto	partman-crypto/mainmenu	select	
# 将 GRUB 启动引导器安装到主引导记录 (MBR) 上吗？
grub-installer	grub-installer/with_other_os	boolean	true
# 缺少所需的加密选项
partman-crypto	partman-crypto/options_missing	error	
# Web 服务已启动
d-i	save-logs/httpd_running	note	
# 将修改内容写入存储设备并配置 RAID 吗？
d-i	partman-md/confirm_nooverwrite	boolean	false
# 此分区的密钥长度：
# Choices: 
partman-crypto	partman-crypto/keysize	select	
# for internal use; can be preseeded
netcfg	netcfg/disable_autoconfig	boolean	false
# 下载本地仓库密钥失败：
# Choices: 重试, 忽略
apt-setup-udeb	apt-setup/local/key-error	select	Retry
# 此 RAID10 阵列的布局：
partman-md	partman-md/raid10layout	string	
# 网络自动设置失败
netcfg	netcfg/dhcp_failed	note	
# for internal use; can be preseeded
netcfg	netcfg/dhcp_timeout	string	25
# 如何使用此空闲空间：
# Choices: 
partman-base	partman/free_space	select	
# 再等待 30 秒让 hwclock 设定时钟吗？
clock-setup	clock-setup/hwclock-wait	boolean	false
# zone
# Choices: 中部, 山地, 太平洋
tzsetup-udeb	tzsetup/country/MX	select	Mexico/General
# 无效的挂载点
partman-basicfilesystems	partman-basicfilesystems/bad_mountpoint	error	
# for internal use; can be preseeded
netcfg	netcfg/enable	boolean	true
# 返回菜单并更正此问题吗？
partman-basicfilesystems	partman-basicfilesystems/boot_not_first_partition	boolean	
# 分区的新大小：
partman-partitioning	partman-partitioning/new_partition_size	string	some number
# 要以所选的语言继续安装吗？
d-i	localechooser/translation/warn-light	boolean	true
# 将 LILO 安装到：
# Choices: : 主引导记录, : 新 Debian 分区, 其他选择 (高级)
lilo-installer	lilo-installer/bootdev	select	
# 扩展卷组时出错
partman-lvm	partman-lvm/vgextend_error	error	
# 无法将 GRUB 安装到 
grub-installer	grub-installer/grub-install-failed	error	
# 无效的 Debian 光盘
d-i	cdrom-checker/wrongcd	error	
# 使用网络镜像吗？
apt-mirror-setup	apt-setup/use_mirror	boolean	false
# for internal use; can be preseeded
d-i	cdrom-detect/eject	boolean	true
# for internal use only
d-i	cdrom-detect/hybrid	boolean	false
# 正在为自动启动设置固件变量
nobootloader	nobootloader/confirmation_powerpc_pasemi	note	
# 您是否想返回分区菜单？
partman-ext3	partman-ext3/bad_alignment	boolean	
# 检测另一张光盘的完整性吗？
d-i	cdrom-checker/nextcd	boolean	false
# 安装基本系统失败
bootstrap-base	base-installer/debootstrap-failed	error	
# Debootstrap 错误
bootstrap-base	base-installer/debootstrap/error/unknownrelsig	error	
# 继续进行分区吗？
partman-partitioning	partman-partitioning/unsupported_label	boolean	false
# 从可移动介质加载缺失的驱动程序吗？
d-i	hw-detect/load_media	boolean	false
# for internal use only
d-i	debian-installer/exit/always_halt	boolean	false
# for internal use only
d-i	cdrom/codename	string	jessie
# 没有根文件系统
partman-target	partman-target/no_root	error	
# for internal use; can be preseeded
d-i	preseed/file/checksum	string	
# for internal use only
d-i	debconf/showold	boolean	false
# 无效的分区名
lilo-installer	lilo-installer/manual_bootdev_error	error	
# 空密码
partman-iscsi	partman-iscsi/login/empty_password	error	
# 未找到逻辑卷
partman-lvm	partman-lvm/lvdelete_nolv	error	
# 使用 non-free 软件吗？
apt-mirror-setup	apt-setup/non-free	boolean	false
# 
# Choices: 阿根廷, 波利维亚, 巴西, 智利, 哥伦比亚, 厄瓜多尔, 法属圭亚那, 圭亚那, 巴拉圭, 秘鲁, 苏里南, 乌拉圭, 委内瑞拉
d-i	localechooser/countrylist/South_America	select	
# for internal use only
user-setup-udeb	passwd/user-default-groups	string	audio cdrom dip floppy video plugdev netdev scanner bluetooth debian-tor lpadmin
# Debootstrap 错误
bootstrap-base	base-installer/debootstrap/error/couldntdl	error	
# 自动配置网络吗？
netcfg	netcfg/use_autoconfig	boolean	true
# 新分区的位置：
# Choices: 开始, 结束
partman-partitioning	partman-partitioning/new_partition_place	select	
# location
# Choices: 麦克蒙都, 罗沙拉, 帕默尔, 莫森, 戴维斯, 卡塞, 沃斯托克, 迪蒙迪维尔, 斯尤瓦
tzsetup-udeb	tzsetup/country/AQ	select	
# 交互式 shell
d-i	di-utils-shell/do-shell	note	
# 不可到达的网关
netcfg	netcfg/gateway_unreachable	error	
# 从可移动介质中加载光盘驱动器的驱动程序吗？
d-i	cdrom-detect/load_media	boolean	true
# for internal use; can be preseeded
grub-installer	grub-installer/grub2_instead_of_grub_legacy	boolean	true
# state
# Choices: 阿克里, 阿拉戈阿斯, 亚马逊州, 阿马帕, 巴伊亚, 塞阿拉, 首都特区, 圣林, 费尔南多-迪诺罗尼亚地区, 戈亚斯, 马拉尼昂州, 米纳斯吉拉斯, 南马托格罗索, 马托格罗索, 帕拉, 帕拉伊巴, 伯南布哥, 皮奥伊, 巴拉那, 里约热内卢, 北里约格朗德, 朗多尼亚, 罗赖马, 南里约格朗德, 圣卡塔琳娜, 塞尔希培, 圣保罗, 托坎廷斯
tzsetup-udeb	tzsetup/country/BR	select	America/Sao_Paulo
# 对所选磁盘分区失败
partman-auto-lvm	partman-auto-lvm/unusable_recipe	error	
# for internal use; can be preseeded
d-i	anna/standard_modules	boolean	true
# for internal use; can be preseeded
network-preseed	auto-install/defaultroot	string	d-i/jessie/./preseed.cfg
# for internal use; can be preseeded
d-i	rescue/enable	boolean	false
# 加密设置失败
partman-crypto	partman-crypto/crypto_boot_not_possible	error	
# 删除逻辑卷时出错
partman-lvm	partman-lvm/lvdelete_error	error	
# 用于文件下载的协议：
# Choices: 
choose-mirror-bin	mirror/protocol	select	http
# 继续进行安装吗？
partman-base	partman/confirm_nochanges	boolean	false
# for internal use; can be preseeded
d-i	preseed/include	string	
# 没有找到 DHCP 客户程序
netcfg	netcfg/no_dhcp_client	error	
# 无法访问软件源
apt-setup-udeb	apt-setup/service-failed	error	
# 
d-i	debian-installer/shell-plugin	terminal	
# zone
# Choices: 莫斯科-01 - 加里宁格勒, 莫斯科+00 - 莫斯科, 莫斯科+02 - 叶卡捷琳堡, 莫斯科+03 - 鄂木斯克, 莫斯科+04 - 克拉斯诺亚尔斯克, 莫斯科+05 - 伊尔库茨克, 莫斯科+06 - 雅库茨克, 莫斯科+07 - 海参崴, 莫斯科+08 - 马加丹
tzsetup-udeb	tzsetup/country/RU	select	Europe/Moscow
# Debian 归档镜像目录：
choose-mirror-bin	mirror/ftp/directory	string	/debian/
# 将 LILO 安装到：
# Choices: ：软 RAID 阵列, 其他选择 (高级)
lilo-installer	lilo-installer/bootdev_raid	select	
# 无效的归档镜像
choose-mirror-bin	mirror/bad	error	
# 尚未选择设备
partman-crypto	partman-crypto/create/nosel	error	
# 忽略低于此优先级的问题：
# Choices: 关键, 高, 中, 低
d-i	debconf/priority	select	high
# for internal use only
d-i	debian-installer/consoledisplay	string	
# for internal use; can be preseeded
d-i	debian-installer/theme	string	
# for internal use; can be preseeded
d-i	debian-installer/exit/halt	boolean	false
# 未安装启动引导器
nobootloader	nobootloader/confirmation_common	note	
# city
# Choices: 阿拉木图, 克孜勒奥尔达, 阿克托别, 阿克图, 乌拉尔
tzsetup-udeb	tzsetup/country/KZ	select	Asia/Almaty
# for internal use; can be preseeded
d-i	debian-installer/framebuffer	boolean	true
# 没有选择物理卷
partman-lvm	partman-lvm/vgcreate_nosel	error	
# 您是否想返回分区菜单？
partman-basicfilesystems	partman-basicfilesystems/no_swap	boolean	true
# LVM 配置动作：
# Choices: 
partman-lvm	partman-lvm/mainmenu	select	
# 软件 RAID 配置动作
# Choices: 创建 MD 设备, 删除 MD 设备, 完成
partman-md	partman-md/mainmenu	select	
# 要扩展的卷组：
# Choices: 
partman-lvm	partman-lvm/vgextend_names	select	
# 输入的值过大
partman-partitioning	partman-partitioning/big_new_size	error	
# 初始预配置文件位置：
network-preseed	preseed/url	string	
# 创建卷组时出现意外错误
partman-auto-lvm	partman-auto-lvm/vg_create_error	error	
# 软件 RAID 不可用
partman-md	partman-md/nomd	error	
# 您的系统时钟是否被设置为 UTC？
clock-setup	clock-setup/utc	boolean	true
# Debian 归档镜像目录：
choose-mirror-bin	mirror/http/directory	string	/debian/
# 要写入一个新的空分区表吗？
partman-partitioning	partman-partitioning/confirm_write_new_label	boolean	false
# 点对点地址：
netcfg	netcfg/get_pointopoint	string	
# 
# Choices: 库拉索
d-i	localechooser/countrylist/other	select	
# 无法配置 GRUB
grub-installer	grub-installer/update-grub-failed	error	
# for internal use only
d-i	cdrom-detect/usb-hdd	boolean	false
# 域名：
netcfg	netcfg/get_domain	string	
# 无效的 WEP 密钥
netcfg	netcfg/invalid_wep	error	
# 现在就要创建一个普通用户帐号吗？
user-setup-udeb	passwd/make-user	boolean	true
# for internal use; can be preseeded
partman-base	partman/early_command	string	
# for internal use; can be preseeded
grub-installer	grub-installer/skip	boolean	false
# 这是您目前已配置的分区和挂载点的综合信息。请选择一个分区以修改其设置 (文件系统、挂载点等)，或选择一块空闲空间以创建新分区，又或选择一个设备以初始化其分区表。
# Choices: 分区向导, 软件 RAID 设置, 配置逻辑卷管理器, 配置加密卷, 配置 iSCSI 卷, , 虚拟磁盘 1 (vda) - 64.4 GB Virtio Block Device,    ${!TAB}${!ALIGN=RIGHT}#1${!TAB}主分区${!TAB}${!ALIGN=RIGHT}61.8 GB${!TAB}${!TAB}f${!TAB}ext4${!TAB}${!TAB}/${!TAB},    ${!TAB}${!ALIGN=RIGHT}#5${!TAB}逻辑分区${!TAB}${!ALIGN=RIGHT}2.7 GB${!TAB}${!TAB}f${!TAB}swap${!TAB}${!TAB}swap${!TAB}, , 撤消对分区设置的修改, 分区设定结束并将修改写入磁盘
partman-base	partman/choose_partition	select	90finish__________finish
# 附加区域：
# Choices: aa_DJ.UTF-8, aa_DJ, aa_ER, aa_ER@saaho, aa_ET, af_ZA.UTF-8, af_ZA, ak_GH, am_ET, an_ES.UTF-8, an_ES, anp_IN, ar_AE.UTF-8, ar_AE, ar_BH.UTF-8, ar_BH, ar_DZ.UTF-8, ar_DZ, ar_EG.UTF-8, ar_EG, ar_IN, ar_IQ.UTF-8, ar_IQ, ar_JO.UTF-8, ar_JO, ar_KW.UTF-8, ar_KW, ar_LB.UTF-8, ar_LB, ar_LY.UTF-8, ar_LY, ar_MA.UTF-8, ar_MA, ar_OM.UTF-8, ar_OM, ar_QA.UTF-8, ar_QA, ar_SA.UTF-8, ar_SA, ar_SD.UTF-8, ar_SD, ar_SS, ar_SY.UTF-8, ar_SY, ar_TN.UTF-8, ar_TN, ar_YE.UTF-8, ar_YE, ayc_PE, az_AZ, as_IN, ast_ES.UTF-8, ast_ES, be_BY.UTF-8, be_BY, be_BY@latin, bem_ZM, ber_DZ, ber_MA, bg_BG.UTF-8, bg_BG, bho_IN, bn_BD, bn_IN, bo_CN, bo_IN, br_FR.UTF-8, br_FR, br_FR@euro, brx_IN, bs_BA.UTF-8, bs_BA, byn_ER, ca_AD.UTF-8, ca_AD, ca_ES.UTF-8, ca_ES, ca_ES@euro, ca_ES.UTF-8@valencia, ca_ES@valencia, ca_FR.UTF-8, ca_FR, ca_IT.UTF-8, ca_IT, cmn_TW, crh_UA, cs_CZ.UTF-8, cs_CZ, csb_PL, cv_RU, cy_GB.UTF-8, cy_GB, da_DK.UTF-8, da_DK, de_AT.UTF-8, de_AT, de_AT@euro, de_BE.UTF-8, de_BE, de_BE@euro, de_CH.UTF-8, de_CH, de_DE.UTF-8, de_DE, de_DE@euro, de_LI.UTF-8, de_LU.UTF-8, de_LU, de_LU@euro, doi_IN, dv_MV, dz_BT, el_GR.UTF-8, el_GR, el_CY.UTF-8, el_CY, en_AG, en_AU.UTF-8, en_AU, en_BW.UTF-8, en_BW, en_CA.UTF-8, en_CA, en_DK.UTF-8, en_DK.ISO-8859-15, en_DK, en_GB.UTF-8, en_GB, en_GB.ISO-8859-15, en_HK.UTF-8, en_HK, en_IE.UTF-8, en_IE, en_IE@euro, en_IN, en_NG, en_NZ.UTF-8, en_NZ, en_PH.UTF-8, en_PH, en_SG.UTF-8, en_SG, en_US.UTF-8, en_US, en_US.ISO-8859-15, en_ZA.UTF-8, en_ZA, en_ZM, en_ZW.UTF-8, en_ZW, eo.UTF-8, eo, es_AR.UTF-8, es_AR, es_BO.UTF-8, es_BO, es_CL.UTF-8, es_CL, es_CO.UTF-8, es_CO, es_CR.UTF-8, es_CR, es_CU, es_DO.UTF-8, es_DO, es_EC.UTF-8, es_EC, es_ES.UTF-8, es_ES, es_ES@euro, es_GT.UTF-8, es_GT, es_HN.UTF-8, es_HN, es_MX.UTF-8, es_MX, es_NI.UTF-8, es_NI, es_PA.UTF-8, es_PA, es_PE.UTF-8, es_PE, es_PR.UTF-8, es_PR, es_PY.UTF-8, es_PY, es_SV.UTF-8, es_SV, es_US.UTF-8, es_US, es_UY.UTF-8, es_UY, es_VE.UTF-8, es_VE, et_EE.UTF-8, et_EE, et_EE.ISO-8859-15, eu_ES.UTF-8, eu_ES, eu_ES@euro, eu_FR.UTF-8, eu_FR, eu_FR@euro, fa_IR, ff_SN, fi_FI.UTF-8, fi_FI, fi_FI@euro, fil_PH, fo_FO.UTF-8, fo_FO, fr_BE.UTF-8, fr_BE, fr_BE@euro, fr_CA.UTF-8, fr_CA, fr_CH.UTF-8, fr_CH, fr_FR.UTF-8, fr_FR, fr_FR@euro, fr_LU.UTF-8, fr_LU, fr_LU@euro, fur_IT, fy_NL, fy_DE, ga_IE.UTF-8, ga_IE, ga_IE@euro, gd_GB.UTF-8, gd_GB, gez_ER, gez_ER@abegede, gez_ET, gez_ET@abegede, gl_ES.UTF-8, gl_ES, gl_ES@euro, gu_IN, gv_GB.UTF-8, gv_GB, ha_NG, hak_TW, he_IL.UTF-8, he_IL, hi_IN, hne_IN, hr_HR.UTF-8, hr_HR, hsb_DE.UTF-8, hsb_DE, ht_HT, hu_HU.UTF-8, hu_HU, hy_AM, hy_AM.ARMSCII-8, ia_FR, id_ID.UTF-8, id_ID, ig_NG, ik_CA, is_IS.UTF-8, is_IS, it_CH.UTF-8, it_CH, it_IT.UTF-8, it_IT, it_IT@euro, iu_CA, iw_IL.UTF-8, iw_IL, ja_JP.UTF-8, ja_JP.EUC-JP, ka_GE.UTF-8, ka_GE, kk_KZ.UTF-8, kk_KZ, kl_GL.UTF-8, kl_GL, km_KH, kn_IN, ko_KR.UTF-8, ko_KR.EUC-KR, kok_IN, ks_IN, ks_IN@devanagari, ku_TR.UTF-8, ku_TR, kw_GB.UTF-8, kw_GB, ky_KG, lb_LU, lg_UG.UTF-8, lg_UG, li_BE, li_NL, lij_IT, lo_LA, lt_LT.UTF-8, lt_LT, lv_LV.UTF-8, lv_LV, lzh_TW, mag_IN, mai_IN, mg_MG.UTF-8, mg_MG, mhr_RU, mi_NZ.UTF-8, mi_NZ, mk_MK.UTF-8, mk_MK, ml_IN, mn_MN, mni_IN, mr_IN, ms_MY.UTF-8, ms_MY, mt_MT.UTF-8, mt_MT, my_MM, nan_TW, nan_TW@latin, nb_NO.UTF-8, nb_NO, nds_DE, nds_NL, ne_NP, nhn_MX, niu_NU, niu_NZ, nl_AW, nl_BE.UTF-8, nl_BE, nl_BE@euro, nl_NL.UTF-8, nl_NL, nl_NL@euro, nn_NO.UTF-8, nn_NO, nr_ZA, nso_ZA, oc_FR.UTF-8, oc_FR, om_ET, om_KE.UTF-8, om_KE, or_IN, os_RU, pa_IN, pa_PK, pap_AN, pap_AW, pap_CW, pl_PL.UTF-8, pl_PL, ps_AF, pt_BR.UTF-8, pt_BR, pt_PT.UTF-8, pt_PT, pt_PT@euro, quz_PE, ro_RO.UTF-8, ro_RO, ru_RU.UTF-8, ru_RU.KOI8-R, ru_RU, ru_RU.CP1251, ru_UA.UTF-8, ru_UA, rw_RW, sa_IN, sat_IN, sc_IT, sd_IN, sd_IN@devanagari, se_NO, shs_CA, si_LK, sid_ET, sk_SK.UTF-8, sk_SK, sl_SI.UTF-8, sl_SI, so_DJ.UTF-8, so_DJ, so_ET, so_KE.UTF-8, so_KE, so_SO.UTF-8, so_SO, sq_AL.UTF-8, sq_AL, sq_MK, sr_ME, sr_RS, sr_RS@latin, ss_ZA, st_ZA.UTF-8, st_ZA, sv_FI.UTF-8, sv_FI, sv_FI@euro, sv_SE.UTF-8, sv_SE, sv_SE.ISO-8859-15, sw_KE, sw_TZ, szl_PL, ta_IN, ta_LK, te_IN, tg_TJ.UTF-8, tg_TJ, th_TH.UTF-8, th_TH, the_NP, ti_ER, ti_ET, tig_ER, tk_TM, tl_PH.UTF-8, tl_PH, tn_ZA, tr_CY.UTF-8, tr_CY, tr_TR.UTF-8, tr_TR, ts_ZA, tt_RU, tt_RU@iqtelif, ug_CN, uk_UA.UTF-8, uk_UA, unm_US, ur_IN, ur_PK, uz_UZ.UTF-8, uz_UZ, uz_UZ@cyrillic, ve_ZA, vi_VN, wa_BE.UTF-8, wa_BE, wa_BE@euro, wae_CH, wal_ET, wo_SN, xh_ZA.UTF-8, xh_ZA, yi_US.UTF-8, yi_US, yo_NG, yue_HK, zh_CN.GB18030, zh_CN.GBK, zh_CN, zh_HK.UTF-8, zh_HK, zh_SG.UTF-8, zh_SG.GBK, zh_SG, zh_TW.UTF-8, zh_TW.EUC-TW, zh_TW, zu_ZA.UTF-8, zu_ZA
d-i	localechooser/supported-locales	multiselect	
# 对所选磁盘分区失败
partman-auto	partman-auto/autopartitioning_failed	error	
# 
# Choices: Cyprus, Turkey, other
d-i	localechooser/shortlist/tr	select	
# 要安装的内核：
# Choices: linux-image-3.16.0-4-amd64,linux-image-amd64, 无
bootstrap-base	base-installer/kernel/image	select	linux-image-amd64
# 组合键：
# Choices: 无组合键, 右 Alt 键 (AltGr), 右 Control 键, 右徽标键, 菜单键, 左徽标键, 大写锁键
d-i	keyboard-configuration/compose	select	No compose key
# for internal use; can be preseeded
d-i	debian-installer/allow_unauthenticated	boolean	false
# 
# Choices: South Sudan, Jordan, United Arab Emirates, Bahrain, Algeria, Syrian Arab Republic, Saudi Arabia, Sudan, Iraq, Kuwait, Morocco, India, Yemen, Tunisia, Oman, Qatar, Lebanon, Libya, Egypt, other
d-i	localechooser/shortlist/ar	select	
# 再次尝试挂载光盘吗？
d-i	cdrom-detect/retry	boolean	true
# HTTP 代理信息 (如果没有请置空)：
choose-mirror-bin	mirror/http/proxy	string	
# 要缩小的卷组：
# Choices: 
partman-lvm	partman-lvm/vgreduce_names	select	
# 返回并尝试另一个镜像？
choose-mirror-bin	mirror/no-default	boolean	true
# 
# Choices: 
partman-base	partman/exception_handler	select	
# 在配置文件保持当前键盘选项？
d-i	keyboard-configuration/unsupported_config_options	boolean	true
# 将改动写入磁盘吗？
partman-base	partman/confirm_nooverwrite	boolean	false
# 此 RAID 阵列中的活跃设备：
# Choices: 
partman-md	partman-md/raiddevs	multiselect	
# 无效的容量
partman-partitioning	partman-partitioning/bad_new_partition_size	error	
# 无可分区的介质
disk-detect	disk-detect/cannot_find	error	
# 将 GRUB 启动引导器安装到主引导记录 (MBR) 上吗？
grub-installer	grub-installer/only_debian	boolean	true
# 您的磁盘驱动器所需的驱动程序：
# Choices: 在无磁盘驱动器情况下继续, , 以上都不是
disk-detect	disk-detect/module_select	select	continue with no disk drive
# for internal use; can be preseeded
# Choices: Network Manager, ifupdown (/etc/network/interfaces), No network configuration
netcfg	netcfg/target_network_config	select	ifupdown
# 您要参加软件包流行度调查吗？
d-i	popularity-contest/participate	boolean	false
# 无线网络的类型：
# Choices: 共用 (Managed) 网络, Ad-hoc 网络 (点对点)
netcfg	netcfg/wireless_adhoc_managed	select	Infrastructure (Managed) network
# 使用此光盘所需要加载的模块：
# Choices: 
d-i	cdrom-detect/cdrom_module	select	none
# 保留现有的分区设置并配置加密卷吗？
partman-crypto	partman-crypto/confirm_nochanges	boolean	false
# 使用 NTP 设置时钟吗？
clock-setup	clock-setup/ntp	boolean	true
# 返回菜单并更正错误吗？
partman-basicfilesystems	partman-basicfilesystems/check_failed	boolean	
# for internal use; can be preseeded
bootstrap-base	base-installer/excludes	string	
# 您是否希望重新分区？
partman-target	partman-target/mount_failed	boolean	true
# 此 RAID 阵列中备用设备的个数：
partman-md	partman-md/raidsparecount	string	
# 删除软件 RAID 设备失败
partman-md	partman-md/deletefailed	error	
#  上的 iSCSI 目标：
# Choices: 
partman-iscsi	partman-iscsi/login/targets	multiselect	
# Debian 归档镜像所在的国家：
# Choices: 手动输入信息
choose-mirror-bin	mirror/https/countries	select	US
# 无法运行预置的命令
d-i	preseed/command_failed	error	
# 您确定要使用一个随机密钥吗？
partman-crypto	partman-crypto/use_random_for_nonswap	boolean	false
# 缩小卷组时出错
partman-lvm	partman-lvm/vgreduce_error	error	
# location
# Choices: 柏林, 布辛根
tzsetup-udeb	tzsetup/country/DE	select	Europe/Berlin
# 对所选磁盘分区失败
partman-auto	partman-auto/no_recipe	error	
# 挂载 /target/proc 失败
grub-installer	grub-installer/mounterr	error	
# 返回菜单并恢复分区进程吗？
partman-efi	partman-efi/no_efi	boolean	
# 未找到卷组
partman-lvm	partman-lvm/lvcreate_nofreevg	error	
# 要使用的服务：
# Choices: 安全更新 (来自 security.debian.org), 发布版本的更新(updates)：, 移植回来的 (backported) 软件？
apt-setup-udeb	apt-setup/services-select	multiselect	security, updates
# for internal use; can be preseeded
partman-auto	partman-auto/expert_recipe_file	string	
# Dummy template for preseeding unavailable questions
d-i	debian-installer/dummy	string	
# for internal use; can be preseeded
d-i	debian-installer/exit/poweroff	boolean	false
# 无法保存日志
d-i	save-logs/bad_directory	error	
# 返回菜单并更正此问题吗？
partman-basicfilesystems	partman-basicfilesystems/boot_not_ext2	boolean	
# 初始化物理卷时出错
partman-lvm	partman-lvm/pvcreate_error	error	
# 此分区的挂载点：
# Choices: / - 根文件系统, /boot - 启动引导器的静态文件, /home - 用户的主目录, /tmp - 临时文件, /usr - 静态数据, /var - 可变数据, /srv - 本系统所提供的服务的数据, /opt - 附加应用软件包, /usr/local - 本地目录树, 手动输入, 不挂载此分区
partman-basicfilesystems	partman-basicfilesystems/mountpoint	select	
#  的 iSCSI 发起端用户名：
partman-iscsi	partman-iscsi/login/username	string	
# 口令句输入错误
partman-crypto	partman-crypto/passphrase-mismatch	error	
# for internal use; can be preseeded
d-i	debian-installer/allow_unauthenticated_ssl	boolean	false
# 网络连接探测等待时间无效
netcfg	netcfg/bad_link_wait_timeout	error	
# 
# Choices: India, Sri Lanka, other
d-i	localechooser/shortlist/ta	select	
# 未找到卷组
partman-lvm	partman-lvm/vgextend_novg	error	
# 此分区的加密：
# Choices: 
partman-crypto	partman-crypto/cipher	select	
#  的无线 ESSID：
netcfg	netcfg/wireless_essid_again	string	
# 要加载的安装程序组件：
# Choices: cfdisk-udeb: Manually partition a hard drive (cfdisk), choose-mirror: Choose mirror to install from (menu item), cpuburn-udeb: perform CPU stress test (burn in) - expert use only, crypto-dm-modules-3.16.0-4-amd64-di: devicemapper crypto module, driver-injection-disk-detect: Detect OEM driver injection disks, espeakup-udeb: Configure the speech synthesizer voice, event-modules-3.16.0-4-amd64-di: Event support, fuse-modules-3.16.0-4-amd64-di: FUSE modules, load-media: Load installer components from removable media, lowmem: free memory for lowmem install, mbr-udeb: Master Boot Record for IBM-PC compatible computers, multipath-modules-3.16.0-4-amd64-di: Multipath support, nbd-modules-3.16.0-4-amd64-di: Network Block Device modules, network-console: Continue installation remotely using SSH, ntfs-modules-3.16.0-4-amd64-di: NTFS filesystem support, openssh-client-udeb: secure shell client for the Debian installer, parted-udeb: Manually partition a hard drive (parted), ppp-modules-3.16.0-4-amd64-di: PPP drivers, ppp-udeb: Point-to-Point Protocol (PPP) - package for Debian Installer, rescue-mode: mount requested partition and start a rescue shell, sound-modules-3.16.0-4-amd64-di: sound support, squashfs-modules-3.16.0-4-amd64-di: squashfs modules, udf-modules-3.16.0-4-amd64-di: UDF modules
d-i	anna/choose_modules	multiselect	
# 在配置文件中保留当前键盘布局吗？
d-i	keyboard-configuration/unsupported_config_layout	boolean	true
# 安装启动引导器的设备：
grub-installer	grub-installer/bootdev	string	
# for internal use; can be preseeded
network-preseed	auto-install/enable	boolean	false
# 擦除  上的数据失败
partman-crypto	partman-crypto/crypto_erase_failed	error	
# 未输入逻辑卷名
partman-lvm	partman-lvm/lvcreate_nonamegiven	error	
# 此卷组没有定义物理卷
partman-auto-lvm	partman-auto-lvm/no_pv_in_vg	error	
# location
# Choices: 瓜亚基尔, 加拉帕戈斯
tzsetup-udeb	tzsetup/country/EC	select	America/Guayaquil
# Debootstrap 错误
bootstrap-base	base-installer/debootstrap/error/missingrelentry	error	
# 区域
d-i	localechooser/help/locale	note	
# 两个文件系统使用同一挂载点
partman-target	partman-target/same_mountpoint	error	
# Debootstrap 错误
bootstrap-base	base-installer/no_codename	error	
# 此分区文件系统的标识：
partman-basicfilesystems	partman-basicfilesystems/choose_label	string	
# 未找到卷组
partman-lvm	partman-lvm/vgreduce_novg	error	
# 将修改写入磁盘并配置加密卷吗？
d-i	partman-crypto/confirm_nooverwrite	boolean	false
# 新系统的卷组名称：
partman-auto-lvm	partman-auto-lvm/new_vg_name_exists	string	
# 要加密的设备：
# Choices: 
partman-crypto	partman-crypto/create/partitions	multiselect	
# 逻辑卷管理器不可用
partman-lvm	partman-lvm/nolvm	error	
# 创建交换空间失败
partman-basicfilesystems	partman-basicfilesystems/create_swap_failed	error	
# 插入一张 Debian 光盘
d-i	cdrom-checker/askmount	note	
# 无法打开校验和文件
d-i	cdrom-checker/md5file_failed	error	
# 缺少所需的程序
partman-crypto	partman-crypto/tools_missing	note	
# 分区名称：
partman-partitioning	partman-partitioning/set_name	string	
# 返回菜单并更正此问题吗？
partman-ext3	partman/boot_not_first_partition	boolean	
# 
# Choices: Finland, Sweden, other
d-i	localechooser/shortlist/sv	select	
# 
# Choices: 阿尔及利亚, 安哥拉, 贝宁, 博兹瓦那, 布基纳法索, 布隆迪, 喀麦隆, 佛得角, 中非, 乍得, 刚果, 刚果民主共和国, 科特迪瓦, 吉布提, 埃及, 赤道几内亚, 厄立特里亚, 埃塞俄比亚, 加蓬, 冈比亚, 加纳, 几内亚, 几内亚比绍, 肯尼亚, 莱索托, 利比里亚, 利比亚, 马拉维, 马里, 毛里塔尼亚, 摩洛哥, 莫桑比克, 纳米比亚, 尼日尔, 尼日利亚, 卢旺达, 圣多美和普林西比, 塞内加尔, 塞拉利昂, 索马里, 南非, 南苏丹, 苏丹, 斯威士兰, 坦桑尼亚, 多哥, 突尼斯, 乌干达, 西撒哈拉, 赞比亚, 津巴布韦
d-i	localechooser/countrylist/Africa	select	
# for internal use; can be preseeded
bootstrap-base	base-installer/kernel/linux/extra-packages-2.6	string	
# 格式错误的 IP 地址
netcfg	netcfg/bad_ipaddress	error	
# 无法安装基本系统
bootstrap-base	base-installer/cannot_install	error	
# 此分区的一般用途：
# Choices: 
partman-basicfilesystems	partman-basicfilesystems/specify_usage	select	
# 将修改写入磁盘并配置 LVM 吗？
d-i	partman-lvm/confirm_nooverwrite	boolean	false
# 您是否想返回分区菜单？
partman-basicfilesystems	partman-basicfilesystems/no_mount_point	boolean	
# 请输入 Debian 归档镜像的主机名：
choose-mirror-bin	mirror/ftp/hostname	string	mirror
# 在 /boot 上使用 JFS 文件系统吗？(不推荐)
partman-jfs	partman-jfs/jfs_boot	boolean	false
# 运行“”过程中发生错误
d-i	hw-detect/modprobe_error	error	
# 
# Choices: Belgium, Canada, France, Luxembourg, Switzerland, other
d-i	localechooser/shortlist/fr	select	
# 擦除  上的数据失败
partman-crypto	partman-crypto/plain_erase_failed	error	
# 配置 RAID 失败
partman-md	partman-md/commit_failed	error	
# 如何保存或传送调试日志？
# Choices: 软盘, web, 已挂载的文件系统
d-i	save-logs/menu	select	
# 没有选择物理卷
partman-lvm	partman-lvm/vgextend_nosel	error	
# DHCP 主机名：
netcfg	netcfg/dhcp_hostname	string	debian8
# 完整性检查通过
d-i	cdrom-checker/passed	note	
# 真的要擦除  上的数据吗？
partman-crypto	partman-crypto/crypto_warn_erase	boolean	false
# 要装载的模块：
# Choices: usb-storage (USB storage)
d-i	hw-detect/select_modules	multiselect	usb-storage (USB storage)
# 安装步骤失败
d-i	debian-installer/main-menu/item-failure	error	
# LVM 设置失败
partman-lvm	partman-lvm/commit_failed	error	
# for internal use; can be preseeded
partman-auto	partman-auto/expert_recipe	string	
# 未探测到网络接口
netcfg	netcfg/no_interfaces	error	
# 
# Choices: 阿尔巴尼亚, 安道尔, 亚美尼亚, 奥地利, 阿塞拜疆, 白俄罗斯, 比利时, 波斯尼亚和黑塞哥维那, 保加利亚, 克罗地亚, 塞浦路斯, 捷克, 丹麦, 爱沙尼亚, 法罗群岛, 芬兰, 法国, 格鲁吉亚, 德国, 直布罗陀, 希腊, 格陵兰, 根西岛, 梵地冈, 匈牙利, 冰岛, 爱尔兰, 曼岛, 意大利, 泽西岛, 拉脱维亚, 列支敦士登, 立陶宛, 卢森堡, 马其顿, 马尔他, 摩尔多瓦, 摩纳哥, 黑山, 荷兰, 挪威, 波兰, 葡萄牙, 罗马尼亚, 俄罗斯, 圣马力诺, 塞尔维亚, 斯洛伐克, 斯洛文尼亚, 西班牙, 斯瓦尔巴特和扬马延岛, 瑞典, 瑞士, 乌克兰, 英国, 奥兰群岛
d-i	localechooser/countrylist/Europe	select	
# for internal use only
choose-mirror-bin	mirror/codename	string	
# 有关分区的帮助信息
partman-target	partman-target/help	note	
# for internal use
d-i	keyboard-configuration/store_defaults_in_debconf_db	boolean	true
# 
# Choices: China, Singapore, Taiwan, Hong Kong, other
d-i	localechooser/shortlist/zh_TW	select	
# 不在未清空的目标文件系统上安装
base-installer	base-installer/unclean_target_cancel	error	
# GRUB 安装失败
grub-installer	grub-installer/apt-install-failed	error	
# for internal use; can be preseeded
d-i	preseed/include/checksum	string	
# for internal use; can be preseeded
base-installer	base-installer/install-recommends	boolean	true
# for internal use; can be preseeded
lilo-installer	lilo-installer/skip	boolean	false
# for internal use; can be preseeded
# Choices: none, safe-upgrade, full-upgrade
pkgsel	pkgsel/upgrade	select	safe-upgrade
# Entering low memory mode
d-i	lowmem/low	note	
# 此分区的挂载点：
# Choices: /dos, /windows, 手动输入, 不挂载此分区
partman-basicfilesystems	partman-basicfilesystems/fat_mountpoint	select	
# 启动 PC 卡服务？
d-i	hw-detect/start_pcmcia	boolean	true
# 将 LILO 安装到：
lilo-installer	lilo-installer/manual_bootdev	string	
# 无法安装 
bootstrap-base	base-installer/kernel/failed-package-install	error	
# for internal use; can be preseeded
d-i	preseed/boot_command	string	
# 分区设置：
# Choices: 
partman-base	partman/active_partition	select	
# Insufficient memory
d-i	lowmem/insufficient	error	
# for internal use only
# Choices: stable, testing, unstable
d-i	cdrom/suite	select	stable
# 
# Choices: 中国, 台湾, 新加坡, 香港, 其他/other
d-i	localechooser/shortlist/zh_CN	select	
# 将修改写入磁盘并配置加密卷吗？
partman-crypto	partman-crypto/confirm	boolean	false
# 
# Choices: 美属萨摩亚, 澳大利亚, 库克群岛, 斐济, 法属玻利尼西亚, 关岛, 基里巴斯, 马绍尔群岛, 密克罗尼西亚, 瑙鲁, 新喀里多尼亚, 新西兰, 纽埃, 诺福克岛, 北马里亚纳群岛, 帕劳, 巴布亚新几内亚, 皮特克恩, 萨摩亚, 所罗门群岛, 托克劳群岛, 汤加, 图瓦鲁, 美国本土外小岛屿, 瓦努阿图, 瓦利斯和富图纳
d-i	localechooser/countrylist/Oceania	select	
# Debootstrap 错误
bootstrap-base	base-installer/debootstrap/error/invalidrel	error	
# 这块空闲空间开始于  结束于 。
partman-base	partman/show_free_chs	note	
# 使用 Control+Alt+Backspace 来终止 X 服务器吗？
d-i	keyboard-configuration/ctrl_alt_bksp	boolean	false
# 模块  的附加参数：
d-i	hw-detect/retry_params	string	
# 密码输入错误
user-setup-udeb	user-setup/password-mismatch	error	
# for internal use; can be preseeded
partman-auto	partman-auto/method	string	
# 未输入卷组名
partman-lvm	partman-lvm/vgcreate_nonamegiven	error	
# 分区的新大小：
partman-partitioning	partman-partitioning/new_size	string	some number
# 主网络接口：
# Choices: 
netcfg	netcfg/choose_interface	select	
# for internal use
d-i	keyboard-configuration/optionscode	string	
# for internal use only
bootstrap-base	base-installer/kernel/linux/initrd-2.6	boolean	true
# 读取 Release 文件出错
d-i	cdrom-detect/no-release	error	
# 下载文件失败：
# Choices: 重试, 更换镜像, 忽略
apt-mirror-setup	apt-setup/mirror/error	select	Retry
# LILO 安装失败。仍然继续吗？
lilo-installer	lilo-installer/apt-install-failed	boolean	true
# iSCSI 配置动作：
# Choices: 登录 iSCSI 目标, 完成
partman-iscsi	partman-iscsi/mainmenu	select	
# for internal use; can be preseeded
bootstrap-base	base-installer/includes	string	
# for internal use; can be preseeded
finish-install	finish-install/keep-consoles	boolean	false
# 要加入卷组的设备：
# Choices: 
partman-lvm	partman-lvm/vgextend_parts	multiselect	
# 键盘模型：
# Choices: 
d-i	keyboard-configuration/model	select	
# 
# Choices: Spain, France, other
d-i	localechooser/shortlist/eu	select	
# 移除现有的逻辑卷数据？
partman-lvm	partman-lvm/device_remove_lvm	boolean	false
# Debootstrap 错误
bootstrap-base	base-installer/debootstrap/fallback-error	error	
# 如何处理此设备：
# Choices: 
partman-base	partman/storage_device	select	
# 如何使用此分区：
# Choices: 
partman-target	partman-target/choose_method	select	
# location
# Choices: 约翰斯顿岛, 中途岛, 威克岛
tzsetup-udeb	tzsetup/country/UM	select	Pacific/Midway
# 
# Choices: 非洲, 南极洲, 亚洲, 大西洋, 加勒比海, 中美洲, 欧洲, 印度洋, 北美洲, 大洋洲, 南美洲, 其他/other
d-i	localechooser/continentlist	select	
# for internal use
d-i	keyboard-configuration/modelcode	string	pc105
# 此分区加密密钥哈希值的类型：
# Choices: 
partman-crypto	partman-crypto/keyhash	select	
# 正在为自动启动设置固件变量
nobootloader	nobootloader/confirmation_powerpc_chrp_pegasos	note	
# 两个文件系统有相同的标签
partman-target	partman-target/same_label	error	
# 返回菜单并更正错误吗？
partman-basicfilesystems	partman-basicfilesystems/swap_check_failed	boolean	
# 安装完成
finish-install	finish-install/reboot_in_progress	note	
# 请输入新用户的全名：
user-setup-udeb	passwd/user-fullname	string	higkoo
# 要在此设备上创建新的空分区表吗？
partman-partitioning	partman-partitioning/confirm_new_label	boolean	false
# 此分区开始于  结束于  。
partman-base	partman/show_partition_chs	note	
# 使用中的分区
partman-base	partman-base/partlocked	error	
# for internal use only
d-i	debconf/frontend	string	
# 配置 RAID 时出错
partman-auto-raid	partman-auto-raid/error	error	
# 
# Choices: Belgium, Germany, Liechtenstein, Luxembourg, Switzerland, Austria, other
d-i	localechooser/shortlist/de	select	
# for internal use; can be preseeded
bootstrap-base	base-installer/kernel/linux/extra-packages	string	
# 要保存调试日志的目录：
d-i	save-logs/directory	string	/mnt
# 从可移动介质加载缺失的固件吗？
d-i	hw-detect/load_firmware	boolean	true
# 
# Choices: 加拿大, 墨西哥, 圣皮埃尔和密克隆, 美国
d-i	localechooser/countrylist/North_America	select	
# 无法挂载软盘
d-i	save-logs/floppy_mount_failed	error	
# 请在驱动器中插入已格式化的软盘
d-i	save-logs/insert_floppy	note	
# 新系统的卷组名称：
partman-auto-lvm	partman-auto-lvm/new_vg_name	string	
# 这里不允许使用单独的文件系统
partman-target	partman-target/must_be_on_root	error	
# 读取预配置文件失败
d-i	preseed/retrieve_error	error	
# 卷组名已被使用
partman-lvm	partman-lvm/vgcreate_nameused	error	
# 无线网络设备  的 WEP 密钥：
netcfg	netcfg/wireless_wep	string	
# for internal use; can be preseeded
pkgsel	pkgsel/include	string	
# for internal use; can be preseeded
# Choices: traditional, label, uuid
partman-target	partman/mount_style	select	uuid
# 
# Choices: Aruba, Belgium, Netherlands, other
d-i	localechooser/shortlist/nl	select	
# zone
# Choices: 圣地亚哥, 复活节岛
tzsetup-udeb	tzsetup/country/CL	select	America/Santiago
# for internal use; can be preseeded
d-i	debian-installer/add-kernel-opts	string	
# 要使用的 NTP 服务器：
clock-setup	clock-setup/ntp-server	string	0.debian.pool.ntp.org
# 创建新逻辑卷时出错
partman-lvm	partman-lvm/lvcreate_error	error	
# LILO 被配置为使用串行控制台
lilo-installer	lilo-installer/serial-console	note	
# 要以所选的语言继续安装吗？
d-i	localechooser/translation/warn-severe	boolean	true
# for internal use only
clock-setup	clock-setup/system-time-changed	boolean	false
# 新卷组使用的设备：
# Choices: 
partman-lvm	partman-lvm/vgcreate_parts	multiselect	
# 插入 Debian 的启动光盘
d-i	cdrom-checker/firstcd	note	
# 请选择您的时区：
# Choices: Asia/Shanghai
tzsetup-udeb	time/zone	select	Asia/Shanghai
# 要从卷组中移除的设备：
# Choices: 
partman-lvm	partman-lvm/vgreduce_parts	multiselect	
# 返回到菜单设置可启动标识吗？
partman-ext3	partman-ext3/boot_not_bootable	boolean	
# 
# Choices: 阿富汗, 巴林, 孟加拉, 不丹, 文莱, 柬埔塞, 中国, 香港, 印度, 印度尼西亚, 伊朗, 伊拉克, 以色列, 日本, 约旦, 哈萨克斯坦, 朝鲜, 韩国, 科威特, 吉尔吉斯坦, 老挝人民民主共和国, 黎巴嫩, 澳门, 马来西亚, 蒙古, 缅甸, 尼泊尔, 阿曼, 巴基斯坦, 巴勒斯坦, 菲律宾, 卡塔尔, 沙特阿拉伯, 新加坡, 斯里兰卡, 叙利亚, 台湾, 塔吉克斯坦, 泰国, 东帝汶, 土耳其, 土库曼斯坦, 阿联酋, 乌兹别克斯坦, 越南, 也门
d-i	localechooser/countrylist/Asia	select	
# 卷组：
# Choices: 
partman-lvm	partman-lvm/lvcreate_vgnames	select	
# 
# Choices: Argentina, Bolivia, Chile, Colombia, Costa Rica, Cuba, Ecuador, El Salvador, Spain, United States, Guatemala, Honduras, Mexico, Nicaragua, Panama, Paraguay, Peru, Puerto Rico, Dominican Republic, Uruguay, Venezuela, other
d-i	localechooser/shortlist/es	select	
# 保留现有的分区设置并配置 LVM 吗？
partman-lvm	partman-lvm/confirm_nochanges	boolean	false
# 基于默认区域设置选择的国家：
# Choices: 中国${!TAB}-${!TAB}zh_CN.UTF-8, 台湾${!TAB}-${!TAB}zh_TW.UTF-8, 新加坡${!TAB}-${!TAB}zh_SG.UTF-8, 香港${!TAB}-${!TAB}zh_HK.UTF-8
d-i	localechooser/preferred-locale	select	zh_CN.UTF-8
# 此分区的挂载点：
partman-basicfilesystems	partman-basicfilesystems/mountpoint_manual	string	
# 键盘布局：
# Choices: 
d-i	keyboard-configuration/variant	select	
# 将修改写入磁盘并配置 LVM 吗？
partman-lvm	partman-lvm/confirm	boolean	false
#  上的 kill switch 开关已开启
netcfg	netcfg/kill_switch_enabled	note	
# 无线网络设备  的 WPA/WPA2 密码：
netcfg	netcfg/wireless_wpa	string	
# 分区表类型：
# Choices: aix, amiga, bsd, dvh, gpt, mac, msdos, pc98, sun, loop
partman-partitioning	partman-partitioning/choose_label	select	
# for internal use only
d-i	cdrom-detect/cdrom_fs	string	iso9660
# FTP 代理信息 (如果没有请置空)：
choose-mirror-bin	mirror/ftp/proxy	string	
# 
# Choices: Antigua and Barbuda, Australia, Botswana, Canada, Hong Kong, India, Ireland, New Zealand, Nigeria, Philippines, Singapore, South Africa, United Kingdom, United States, Zambia, Zimbabwe, other
d-i	localechooser/shortlist/en	select	
# 改变分区大小失败
partman-partitioning	partman-partitioning/new_size_commit_failed	error	
# 要扫描其他 CD 或 DVD 吗？
apt-cdrom-setup	apt-setup/cdrom/set-failed	boolean	true
# 挂载选项：
# Choices: 
partman-basicfilesystems	partman-basicfilesystems/mountoptions	multiselect	
# 您的以太网卡所需的驱动模块：
# Choices: 无以太网卡, , 以上都不是
ethdetect	ethdetect/module_select	select	no ethernet card
# 
# Choices: Serbia, Montenegro, other
d-i	localechooser/shortlist/sr	select	
# 终端插件不可用
d-i	debian-installer/terminal-plugin-unavailable	error	
# 逻辑卷：
# Choices: 
partman-lvm	partman-lvm/lvdelete_lvnames	select	
# 无法支持的 initrd 生成工具
bootstrap-base	base-installer/initramfs/unsupported	error	
# iSCSI 目标门户地址：
partman-iscsi	partman-iscsi/login/address	string	
# 逻辑卷管理：
partman-lvm	partman-lvm/help	note	
# for internal use; can be preseeded (deprecated)
netcfg	netcfg/disable_dhcp	boolean	false
# 无效的 ESSID
netcfg	netcfg/invalid_essid	error	
# 无线网络：
# Choices:  手动输入 ESSID
netcfg	netcfg/wireless_show_essids	select	
# for internal use; can be preseeded
d-i	preseed/run	string	
# 网络掩码：
netcfg	netcfg/get_netmask	string	
# 完整性检查失败
d-i	cdrom-checker/mismatch	error	
# for internal use only
d-i	debconf/language	string	zh_CN:zh
# 使用 contrib 软件吗？
apt-mirror-setup	apt-setup/contrib	boolean	false
# 系统区域 (locale)：
# Choices: 
d-i	debian-installer/locale	select	zh_CN.UTF-8
# 将改动写入磁盘吗？
partman-base	partman/confirm	boolean	false
# 使用弱口令句吗？
partman-crypto	partman-crypto/weak_passphrase	boolean	false
# Apt 设置问题
apt-cdrom-setup	apt-setup/cdrom/failed	error	
# country code or "manual" (for internal use)
choose-mirror-bin	mirror/country	string	
#  的无线网络类型：
# Choices: WEP/开放网络, WPA/WPA2 PSK
netcfg	netcfg/wireless_security_type	select	
# 将 GRUB 启动引导程序安装到 SATA RAID 磁盘吗？
grub-installer	grub-installer/sataraid	boolean	true
# 这些信息正确吗？
netcfg	netcfg/confirm_static	boolean	true
# 主机名：
netcfg	netcfg/get_hostname	string	debian8
# for internal use; can be preseeded
partman-auto	partman-auto/disk	string	
# 空密码
user-setup-udeb	user-setup/password-empty	error	
# for internal use
d-i	keyboard-configuration/layoutcode	string	cn
# 未找到以太网卡
ethdetect	ethdetect/cannot_find	error	
# 
# Choices: 南极洲
d-i	localechooser/countrylist/Antarctica	select	
# city
# Choices: 乌兰巴托, 科布多, 卓巴尔塞
tzsetup-udeb	tzsetup/country/MN	select	Asia/Ulaanbaatar
# 
# Choices: Bangladesh, India, other
d-i	localechooser/shortlist/bn	select	
# LILO 安装失败
lilo-installer	lilo-installer/failed	error	
# Debootstrap 错误
bootstrap-base	base-installer/debootstrap/error/nogetrel	error	
#  的加密密钥已经产生了。
partman-crypto	partman-crypto/entropy	entropy	
# 无法挂载光盘
d-i	cdrom-checker/mntfailed	error	
# 密码输入错误
grub-installer	grub-installer/password-mismatch	error	
# 无效的主机名
netcfg	netcfg/invalid_hostname	error	
# 
# Choices: Brazil, Portugal, other
d-i	localechooser/shortlist/pt	select	
# for internal use; can be preseeded
disk-detect	disk-detect/dmraid/enable	boolean	false
# 请选择下一个安装步骤：
# Choices: 选择语言/Choose language, 配置键盘, 探测并挂载光盘, 从光盘加载安装程序组件, 探测网络设备, 配置网络, 设置用户和密码, 时钟设置, 探测磁盘, 磁盘分区, 安装基本系统, 配置软件包管理器, 选择并安装软件, 将 GRUB 安装至硬盘, 将 LILO 安装至硬盘, 不安装启动引导器，继续, 结束安装进程, 改变 debconf 的优先级设置, 检测光盘的完整性, 保存调试日志, 运行 shell, 从光驱中弹出光盘, 中止安装
d-i	debian-installer/main-menu	select	结束安装进程
# Debian 归档镜像所在的国家：
# Choices: 手动输入信息, 阿尔及利亚, 阿根廷, 澳大利亚, 奥地利, 孟加拉, 白俄罗斯, 比利时, 巴西, 保加利亚, 加拿大, 智利, 中国, 哥伦比亚, 哥斯达黎加, 克罗地亚, 捷克, 丹麦, 萨尔瓦多, 爱沙尼亚, 芬兰, 法国, 法属玻利尼西亚, 格鲁吉亚, 德国, 希腊, 香港, 匈牙利, 冰岛, 印度, 印度尼西亚, 伊朗, 爱尔兰, 以色列, 意大利, 日本, 哈萨克斯坦, 肯尼亚, 韩国, 拉脱维亚, 立陶宛, 卢森堡, 马其顿, 马来西亚, 墨西哥, 摩尔多瓦, 荷兰, 新喀里多尼亚, 新西兰, 尼加拉瓜, 挪威, 菲律宾, 波兰, 葡萄牙, 罗马尼亚, 俄罗斯, 塞尔维亚, 新加坡, 斯洛伐克, 斯洛文尼亚, 南非, 西班牙, 瑞典, 瑞士, 台湾, 塔吉克斯坦, 泰国, 突尼斯, 土耳其, 乌克兰, 英国, 美国, 乌兹别克斯坦, 瓦努阿图, 委内瑞拉, 越南, 津巴布韦
choose-mirror-bin	mirror/http/countries	select	CN
# EFI 分区过小：
partman-efi	partman-efi/too_small_efi	error	
# 
# Choices: Greece, Cyprus, other
d-i	localechooser/shortlist/el	select	
# state
# Choices: 澳大利亚首都特区, 新南威尔士, 维多利亚州, 北领地, 昆士兰州, 南澳大利亚州, 塔斯曼尼亚, 西澳大利亚州, 艾尔高速公路, Yancowinna 县, 豪勋爵岛
tzsetup-udeb	tzsetup/country/AU	select	Australia/Canberra
# 无效的用户名
user-setup-udeb	passwd/username-bad	error	
# 用于在国家与拉丁模式之间切换的方法：
# Choices: 大写锁键, 右 Alt 键 (AltGr), 右 Control 键, 右 Shift 键, 右徽标键, 菜单键, Alt+Shift, Control+Shift, Control+Alt, Alt+大写锁键, 左 Control+左 Shift, 左 Alt, 左 Control, 左 Shift, 左徽标键, 滚动锁键, 无切换
d-i	keyboard-configuration/toggle	select	No toggling
# 新分区的标志：
# Choices: 
partman-partitioning	partman-partitioning/set_flags	multiselect	
# 创建新逻辑卷时出错
partman-lvm	partman-lvm/lvcreate_exists	error	
# 安装启动引导器的设备：
# Choices: 手动输入设备, /dev/vda
grub-installer	grub-installer/choose_bootdev	select	/dev/vda
# for internal use; can be preseeded
d-i	debian-installer/country	string	CN
# 处理预配置文件失败
d-i	preseed/load_error	error	
# 加密软件包安装失败
partman-crypto	partman-crypto/module_package_missing	error	
# 加密卷设置失败
partman-crypto	partman-crypto/commit_failed	error	
# 要扫描其他 CD 或 DVD 吗？
apt-cdrom-setup	apt-setup/cdrom/set-first	boolean	false
# 要删除的软件 RAID 设备
# Choices: 
partman-md	partman-md/deletemenu	select	
# 
# Choices: 伯利兹, 哥斯达黎加, 萨尔瓦多, 瓜地马拉, 洪都拉斯, 尼加拉瓜, 巴拿马
d-i	localechooser/countrylist/Central_America	select	
# 无软件 RAID 设备可用
partman-md	partman-md/delete_no_md	error	
# Language:
# Choices: C, Albanian, Arabic, Asturian, Basque, Belarusian, Bosnian, Bulgarian, Catalan, Chinese (Simplified), Chinese (Traditional), Croatian, Czech, Danish, Dutch, English, Esperanto, Estonian, Finnish, French, Galician, German, Greek, Hebrew, Hungarian, Icelandic, Indonesian, Irish, Italian, Japanese, Kazakh, Korean, Kurdish, Latvian, Lithuanian, Macedonian, Northern Sami, Norwegian Bokmaal, Norwegian Nynorsk, Persian, Polish, Portuguese, Portuguese (Brazil), Romanian, Russian, Serbian (Cyrillic), Slovak, Slovenian, Spanish, Swedish, Tagalog, Tajik, Thai, Turkish, Ukrainian, Uyghur, Vietnamese, Welsh
d-i	localechooser/languagelist	select	zh_CN
# for internal use; can be preseeded
partman-auto-raid	partman-auto-raid/recipe	string	
# 创建密钥文件失败
partman-crypto	partman-crypto/keyfile-problem	error	
# 真的要擦除  上的数据吗？
partman-crypto	partman-crypto/plain_warn_erase	boolean	false
# 无法改变分区大小。
partman-partitioning	partman-partitioning/impossible_resize	error	
# 您所输入的大小是无效的。
partman-partitioning	partman-partitioning/bad_new_size	error	
# for internal use only
bootstrap-base	base-installer/kernel/linux/link_in_boot	boolean	false
# 不可用的空闲空间
partman-auto	partman-auto/unusable_space	error	
# 卷组名与设备名重复
partman-lvm	partman-lvm/vgcreate_devnameused	error	
# 不存在的物理卷：
partman-auto-lvm	partman-auto-lvm/no_such_pv	error	
# for internal use; can be preseeded
# Choices: cylinder, minimal, optimal
partman-base	partman/alignment	select	optimal
# 在没有 /boot 分区的情况下继续安装吗？
partman-auto-lvm	partman-auto-lvm/no_boot	boolean	
# 
# Choices: 英属印度洋领地, 圣诞岛, 科科斯群岛, 科摩罗, 法属南半球领地, 赫德岛与麦克唐纳群岛, 马达加斯加, 马尔代夫, 毛里求斯, 马约特, 留尼汪, 塞舌尔
d-i	localechooser/countrylist/Indian_Ocean	select	
# 请选择一个安装步骤：
# Choices: 
d-i	debian-installer/missing-provide	select	${DEFAULT}
# 无法配置 GRUB
grub-installer	grub-installer/multipath-error	error	
# 无法安装所选的内核
bootstrap-base	base-installer/kernel/failed-install	error	
# 要扫描其他 CD 或 DVD 吗？
apt-cdrom-setup	apt-setup/cdrom/set-double	boolean	true
# 探测到不安全的交换空间
partman-crypto	partman-crypto/unsafe_swap	error	
# 请选择要分区的磁盘：
# Choices: 虚拟磁盘 1 (vda) - 64.4 GB Virtio Block Device
partman-auto	partman-auto/select_disk	select	/var/lib/partman/devices/=dev=vda
# 作为 AltGr 的键：
# Choices: 键盘布局默认值, 无 AltGr 键, 右 Alt 键 (AltGr), 右 Control 键, 右徽标键, 菜单键, 左 Alt, 左徽标键, 小键盘回车键, 两个徽标键, 两个 Alt 键
d-i	keyboard-configuration/altgr	select	The default for the keyboard layout
# 继续进行分区吗？
partman-partitioning	partman-partitioning/unknown_label	boolean	true
#  的无线 ESSID：
netcfg	netcfg/wireless_essid	string	
# 将 GRUB 启动引导器安装到多重路径(multipath)设备上吗？
grub-installer	grub-installer/multipath	boolean	true
# 
# Choices: Russian Federation, Ukraine, other
d-i	localechooser/shortlist/ru	select	
# for internal use; can be preseeded
d-i	preseed/late_command	string	
# location
# Choices: 塔希提 (社会群岛), 马尔科萨斯群岛, 甘比尔群岛
tzsetup-udeb	tzsetup/country/PF	select	Pacific/Tahiti
# Debootstrap 警告
bootstrap-base	base-installer/debootstrap/fallback-warning	error	
# zone
# Choices: 塔拉瓦 (吉尔伯特群岛), 恩德贝里 (凤凰群岛), 基里蒂马蒂环礁 (莱恩群岛)
tzsetup-udeb	tzsetup/country/KI	select	Pacific/Tarawa
# city
# Choices: 西区(苏门答腊、雅加达、爪哇、加里曼丹中西部), 中区(苏拉威西、巴厘岛、努沙登加拉、加里曼丹东部和南部), 东区(马鲁古群岛，巴布亚)
tzsetup-udeb	tzsetup/country/ID	select	Asia/Jakarta
# 要扫描其他 CD 或 DVD 吗？
apt-cdrom-setup	apt-setup/cdrom/set-next	boolean	false
# Debootstrap 错误
bootstrap-base	base-installer/debootstrap/error/nogetrelsig	error	
# 加密设置失败
partman-crypto	partman-crypto/crypto_root_needs_boot	error	
# 请输入 Debian 归档镜像的主机名：
choose-mirror-bin	mirror/http/hostname	string	mirror
# 密钥交换和协商失败
netcfg	netcfg/wpa_supplicant_failed	note	
# 您的帐号的用户名：
user-setup-udeb	passwd/username	string	higkoo
# 光盘驱动器所对应的设备文件：
d-i	cdrom-detect/cdrom_device	string	/dev/sr0
# 国家、领地或地区：
# Choices: 中国, 台湾, 新加坡, 香港, 其他/other
d-i	localechooser/shortlist	select	CN
# 您确定需要一个可启动的逻辑分区吗？
partman-partitioning	partman-partitioning/bootable_logical	boolean	false
# 检测 CD-ROM 的完整性吗？
d-i	cdrom-checker/start	boolean	false
# 不适用于此挂载点的文件系统
partman-basicfilesystems	partman-basicfilesystems/posix_filesystem_required	error	
# 未找到卷组
partman-lvm	partman-lvm/vgdelete_novg	error	
# location
# Choices: 奥克兰, 查塔姆群岛
tzsetup-udeb	tzsetup/country/NZ	select	Pacific/Auckland
# 没有找到可用的物理卷
partman-lvm	partman-lvm/nopartitions	error	
# 临时在国家和拉丁输入之间切换的方法：
# Choices: 无临时切换键, 两个徽标键, 右 Alt 键 (AltGr), 右徽标键, 左 Alt, 左徽标键
d-i	keyboard-configuration/switch	select	No temporary switch
# 创建卷组出错
partman-lvm	partman-lvm/vgcreate_error	error	
# 安装 GRUB？
grub-installer	grub-installer/grub_not_mature_on_this_platform	boolean	false
# 移除现有软件 RAID 分区吗？
partman-md	partman-md/device_remove_md	boolean	false
