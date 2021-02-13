FROM centos/httpd

## Installing libraries and packages
RUN yum update -y && \
    yum install wget vim -y && \
    yum install centos-release-scl -y && \
    yum install -y httpd24-httpd rh-php73 rh-php73-php rh-php73-php-mbstring rh-php73-php-mysqlnd rh-php73-php-gd rh-php73-php-xml mariadb-server mariadb 

WORKDIR /workspace

## Downloading mediawiki package
RUN wget  https://releases.wikimedia.org/mediawiki/1.35/mediawiki-1.35.1.tar.gz

## Copying the data from source to file
COPY ./source /workspace

## Replacing apache config file
RUN mv conf/httpd.conf /etc/httpd/conf/httpd.conf && \
    chown root:root /etc/httpd/conf/httpd.conf

## Installing mediawiki package
RUN cd /var/www && \
    tar -zxf /workspace/mediawiki-1.35.1.tar.gz && \
    ln -s mediawiki-1.35.1/ mediawiki && \
    chown -R apache:apache /var/www/mediawiki-1.35.1 && \
    chown -R apache:apache /var/www/mediawiki && \
    cd /usr/share && \
    ln -s /var/www/mediawiki mediawiki-1.35.1 && ln -s /var/www/mediawiki mediawiki && \
    chown -R apache:apache mediawiki && chown -R apache:apache mediawiki-1.35.1

## Configuring MySQL
# RUN /bin/mysqld_safe --initialize && \
RUN mysql_install_db && \
    chown -R mysql:mysql /var/lib/mysql && /bin/mysqld_safe --nowatch

EXPOSE 80

ENTRYPOINT ["httpd", "-D", "FOREGROUND"]
