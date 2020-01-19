FROM centos:7

USER root

RUN yum -y update; \
    yum -y install centos-release-scl-rh epel-release; \
    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm; \
    yum -y install wget curl tar git vim unzip bzip2 less cat split sudo make socat cmake3 net-tools mc; yum clean all

RUN yum -y install devtoolset-7-gcc devtoolset-7-binutils devtoolset-7-gcc-c++ devtoolset-7-libasan-devel devtoolset-7-gdb devtoolset-7-gcc-gdb-plugin; \
    yum -y install ccache llvm-toolset-7-clang kernel-headers; yum clean all

RUN echo 'source /opt/rh/devtoolset-7/enable' >> /etc/bashrc; mkdir /root/.ssh; \
    printf "Host github.com\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null\n" >> /etc/ssh/ssh_config >> /root/.ssh/config; \
    printf "python\nimport libstdcxx.v6\nlibstdcxx.v6.register_libstdcxx_printers(gdb.current_objfile())\nend\n" >> /root/.gdbinit
