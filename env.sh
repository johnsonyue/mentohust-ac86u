git clone https://github.com/RMerl/am-toolchains
ln -s /home/john/merlin/am-toolchains/brcm-arm-hnd /opt/am-toolchains
export LD_LIBRARY=$LD_LIBRARY:/opt/am-toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib
export LD_LIBRARY_PATH=$LD_LIBRARY:/opt/am-toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib
export TOOLCHAIN_BASE=/opt/am-toolchains
export PATH=$PATH:/opt/am-toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/bin

export PATH=$PATH:$TOOLCHAIN_BASE/usr/bin/
export CC=arm-linux-gcc
export CPP=arm-linux-cpp
export GCC=arm-linux-gcc
export CXX=arm-linux-g++
export RANLIB=arm-linux-gcc-ranlib
export ac_cv_linux_vers=4.1
export LDFLAGS="-static"
export CFLAGS="-Os -s"
export STAGING_DIR=$TOOLCHAIN_BASE

# make libpcap.a
cd libpcap-1.9.1/
./configure --host=arm-linux --prefix=/home/john/merlin/ --with-pcap=linux
make
cp libpcap.a /home/john/merlin

# make mentohust
git clone https://github.com/microcai/mentohust.git
cd mentohust/
./configure --host=arm-linux --disable-encodepass --disable-notify --prefix=/jffs --with-pcap=/home/john/merlin/libpcap.a
make
ls src/mentohust
