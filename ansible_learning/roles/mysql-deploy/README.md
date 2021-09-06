Для Ubuntu и Debian

1. sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5

2. Добавить в репозиторий /etc/apt/sources.list.d/mysql.list источник, а остальные записи удалить

sudo sh -c 'echo "deb http://repo.mysql.com/apt/ubuntu/ bionic mysql-8.0" > /etc/apt/sources.list.d/mysql.list'

   for Ubuntu:
   deb http://repo.mysql.com/apt/ubuntu/ bionic mysql-8.0
   for Debian:
   deb http://repo.mysql.com/apt/debian/ buster mysql-8.0

3. sudo apt-get update

4. Нужно выбрать версию в зависимости от дистрибутива ну или просто передать ее в
   переменной и не заморачиваться. Но узнаем версию при помощи playbook

apt-cache madison mysql-server | grep 8.0.26 | grep 20.04 | awk '{print $3}' | head -n 1


4. Установка mysql-server в неинтерактивном режиме

sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password MYPASSWORD"

sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password MYPASSWORD"

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server=8.0.26-0ubuntu0.20.04.2
