# $Id$
# Authority: dag
# Upstream: Jordan Ritter <jpr5$darkridge,com>

%define _default_patch_fuzz 2

%define _include_pcap %{_includedir}/pcap

%{!?dtag:%define _with_libpcapdevel 1}
%{?el6:%define _with_libpcapdevel 1}
%{?el5:%define _with_libpcapdevel 1}
%{?el5:%define _include_pcap %{_includedir}}
%{?el4:%define _include_pcap %{_includedir}}
%{?el3:%define _include_pcap %{_includedir}}
%{?el2:%define _include_pcap %{_includedir}}

Summary: Realtime memcached key get usage
Name: memkeys
Version: 1.0
Release: 0%{?dist}
License:  Apache License, Version 2.0
Group: Applications/Internet
URL: https://github.com/bmatheny/memkeys

Source: memkeys.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

BuildRequires: libpcap
BuildRequires: pcre-devel
BuildRequires: ncurses-devel
BuildRequires: autoconf
BuildRequires: automake
BuildRequires: gcc-c++
BuildRequires: libtool
%{?_with_libpcapdevel:BuildRequires: libpcap-devel}

%description
Show your memcache key usage in realtime.

This was originally inspired by mctop from etsy. It was found that 
under load mctop would drop between 50 and 75 percent of packets. 
Under the same load memkeys will typically drop less than 3 
percent of packets. This is on a machine saturating a 1Gb network link.

%prep
%setup -c

%build
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EXTRA_INCLUDES="$(pcre-config --cflags)"
export EXTRA_LIBS="$(pcre-config --libs)"
cd memkeys/build-eng/
./autogen.sh
cd ..
%configure \
    --enable-ipv6 \
    --enable-pcre \
    --with-pcap-includes="%{_include_pcap}"
%{__make} %{?_smp_mflags} STRIPFLAG=

%install
mkdir -p ${RPM_BUILD_ROOT}%{_sbindir}/
cp -R /root/rpmbuild/BUILD/%{name}-%{version}/memkeys/src/memkeys ${RPM_BUILD_ROOT}%{_sbindir}/.

%clean
%{__rm} -rf %{buildroot}

%files
%defattr(-, root, root, 0755)
%{_sbindir}/memkeys

%changelog
* Fri Apr 11 2014 tootedom 1.45-2
- build and package of https://github.com/bmatheny/memkeys 
