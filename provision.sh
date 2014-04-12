
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


git clone https://github.com/bmatheny/memkeys.git
tar -pczf memkeys.tar.gz memkeys
mv memkeys.tar.gz ~/rpmbuild/SOURCES/
cp /home/vagrant/shared/memkeys.spec /root/rpmbuild/SPECS/.
cd /root/rpmbuild/
yum-builddep SPECS/memkeys.spec -y

rpmbuild -v -bb --clean SPECS/memkeys.spec

cp /root/rpmbuild/RPMS/x86_64/memkeys*.rpm /home/vagrant/shared/.

