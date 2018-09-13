Name:           usefultips
Version:        0.0.2
Release:        03
Summary:        Living script consisting of collections of useful tips gathered over time

Group:          Applications/Information
License:        GPLv2
URL:            https://github.com/SeaPhor/TipsAndTricks/blob/master/Useful_Tips/Latest_Stable/useful-tips.sh
Source:		%{name}
BuildRoot:      %{buildroot}
Prefix:		/usr

%description
Bug Reporting script to automate creating and sending bug reports for a project, in a csv format to be easily posted into a higher tier bug report.

%prep
#%setup -q

%install
cd ${HOME}/rpmbuild/BUILDROOT
mkdir -p %{buildroot}/usr/local/bin
cp %{_topdir}/SOURCES/%{name} %{buildroot}/usr/local/bin/

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,$USER,users)
/usr/local/bin/usefultips
%doc

%changelog
