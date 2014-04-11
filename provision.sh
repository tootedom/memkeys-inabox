
yum install rpm-build -y
yum install rpmdevtools rpmlint -y

#
# The rpmsetuptree does the below
#
#mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
#echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros
#

rpmdev-setuptree

yum install git -y
yum install yum-utils -y
#yum install libpcap-devel -y
#yum install pcre-devel -y
#yum install ncurses-devel -y
#yum install ruby -y
#yum install ruby-devel -y
#yum install rubygems -y
#yum install npm -y
#yum groupinstall -y development
#curl -L get.rvm.io | bash -s stable
#source /etc/profile.d/rvm.sh
#rvm reload
#rvm install 2.1.1 
#rvm use 2.1.1 --default

#gem install bundler
#gem update --system

git clone https://github.com/bmatheny/memkeys.git
tar -pczf memkeys.tar.gz memkeys
mv memkeys.tar.gz ~/rpmbuild/SOURCES/
cp /home/vagrant/shared/memkeys.spec /root/rpmbuild/SPECS/.
cd /root/rpmbuild/
yum-builddep SPECS/memkeys.spec -y

rpmbuild -v -bb --clean SPECS/memkeys.spec

cp /root/rpmbuild/RPMS/x86_64/memkeys*.rpm /home/vagrant/shared/.

#cd memkeys/build-eng
#export LC_CTYPE=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

#./autogen.sh
#cd /home/vagrant/memkeys
#./configure
#make
#make install

#yum install nc -y
#yum install memcached -y
