FROM centos/systemd


RUN yum install -y epel-release; \
    yum update  -y; \
    yum upgrade -y

# Install packages
RUN yum install -y wget unzip git vim telnet net-tools mc; \
    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm; \
    yum install -y https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-3.noarch.rpm; \
    yum install -y postgresql12; \
    printf "Host github.com\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null\n" >> /etc/ssh/ssh_config

RUN yum install -y make gcc gcc-c++ zeromq zeromq-devel

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -

RUN yum install -y nodejs node-gyp; yum clean all
RUN npm install pm2@2.5 -g

# Copy config
#COPY /conf/core.config.php /etc/well.d/

ADD prepareAndRun.sh /root/prepareAndRun.sh

USER root

EXPOSE 3000
