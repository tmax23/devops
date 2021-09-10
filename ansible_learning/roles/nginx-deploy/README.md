For RedHat

create a file named /etc/yum.repos.d/nginx.repo
[nginx]
name=nginx repo
baseurl=https://nginx.org/packages/rhel/$releasever/$basearch/
gpgcheck=0
enabled=1

$releasever 6,7 or 8

For ubuntu/debian

/etc/apt/sources.list.d/nginx.list
deb https://nginx.org/packages/ubuntu/ focal nginx
deb-src https://nginx.org/packages/ubuntu/ focal nginx

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key

deb https://nginx.org/packages/debian/ buster nginx
deb-src https://nginx.org/packages/debian/ buster nginx
