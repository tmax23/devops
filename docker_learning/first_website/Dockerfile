FROM ubuntu:20.04

ENV TZ=Asia/Barnaul

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update; apt-get -y install apache2
COPY . /var/www/html/

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
