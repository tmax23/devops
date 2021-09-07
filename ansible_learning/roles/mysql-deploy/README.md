Для Ubuntu и Debian

1. sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5

2. Добавить в репозиторий /etc/apt/sources.list.d/mysql.list источник, а остальные записи удалить
   for Ubuntu:
   deb http://repo.mysql.com/apt/ubuntu/ bionic mysql-8.0
   for Debian:
   deb http://repo.mysql.com/apt/debian/ buster mysql-8.0

3. sudo apt-get update

4. Установка mysql-server в неинтерактивном режиме
sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password MYPASSWORD"
sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password MYPASSWORD"
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server=8.0.26-0ubuntu0.20.04.2


ansible_distribution: RedHat Ubuntu Debian
ansible_os_family: RedHat Debian  

Для RedHat

1. Скачиваем пакет в зависимости от "ansible_distribution_major_version": "6, 7 or 8"
https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
https://dev.mysql.com/get/mysql80-community-release-el6-3.noarch.rpm

2. sudo yum install platform-and-version-specific-package-name.rpm

2021-09-07T16:25:19.891818Z 6 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: Af9eFX+,iXmT
