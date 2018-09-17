#!/bin/bash
#
###########################################
####    Define Variables
###########################################
#
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAG=`tput setaf 5`
CYAN=`tput setaf 6`
LTRED=`tput setaf 9`
LTGRN=`tput setaf 10`
LTYLLW=`tput setaf 11`
LTBLU=`tput setaf 12`
LTMAG=`tput setaf 13`
LTCYN=`tput setaf 14`
BGBLU=`tput setab 4`
BGYLLW=`tput setab 3`
BGLYLLW=`tput setab 11`
ULINE=`tput smul`
NULINE=`tput rmul`
BOLD=`tput bold`
RESET=`tput sgr0`
#
###########################################
####    RPM-Build
###########################################
#
#
###########################################
####    Define functions
###########################################
#
content_run () {
    clear
    cat <<EOT
${BOLD}${YELLOW}
RPM-Build${LTYLLW}
    How To Build RPM Packages.${RESET}${CYAN}
Contents${LTCYN}
  Building rpms with 'rpmbuild'
    Build an rpm from a script
      Preparation
        Requirements
        The rpm directory structure
      The 'SOURCE' code Directory
      The 'spec' file
      The 'rpmbuild' command to build the rpm
      Verify, Install, and Test the rpm
    Build an rpm from source (src) code
  Notes on RPM, Versioning, and Structure
  Documentation
  References${RESET}
EOT
}
#
####    How-To
prep_run () {
    clear
    cat <<EOT
${BOLD}${YELLOW}
1. Building rpms with 'rpmbuild'${LTYLLW}
  a. Build an rpm from a script${RESET}${LTCYN}

    1. Preparation (This is the same for "Build an rpm from source)
       Before you begin building rpms you may need to prepare the environment.
      a. Requirements${CYAN}
        ####    Install the 'rpm-build' package/s
        ####    -SUSE${LTGRN}
        $ sudo zypper in patterns-devel-base-devel_rpm_build rpm-build${CYAN}
        ####    -Redhat${LTGRN}
        $ sudo yum install rpm-build${LTCYN}
      b. The rpm directory structure
        It is best to start with a standard rpmbuild directory structure in your
         user's \${HOME}/ directory, don't get in the habbit of building rpms as
         root, there is potential for breaking things if you do.${CYAN}
        ####    rpmbuild directory structure${LTGRN}
        $ mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
        $ cd ~/rpmbuild
        $ tree -L 1 .${LTCYN}
        .
        ├── BUILD
        ├── BUILDROOT
        ├── RPMS
        ├── SOURCES
        ├── SPECS
        └── SRPMS${RESET}
EOT
}
#
srcdir_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
    2. The 'SOURCE' code Directory${RESET}${LTYLLW}
      The 'source' is the script itself, placed in the "SOURCES" directory under the 
       rpmbuild directory structure.${CYAN}
      ####    Get the script into the "SOURCES" directory- notice the re-name (my pref)${LTGRN}
      $ cp ~/repos/github/TipsAndTricks/Useful_Tips/useful-tips.sh ~/rpmbuild/SOURCES/usefultips${RESET}
EOT
}
#
spec_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
    3. The 'spec' file${RESET}${LTYLLW}
       Examples for this documentation- I will use my "usefultips.sh" script for the 
        "source", I will use my user's info for the Path, etc.
       The 'spec' filename suould match the name of the 'source', e.g. "usefultips.spec",
        and the content "%define name" must be the name of the script-name inside the 
        "SOURCES" directory, e.g. "usefultips".
       The spec file must be in the "SPECS" directory under the rpmbuild directory 
        structure.
       Here's the spec file for the usefultips.sh script${LTGRN}
       $ cat SPECS/usefultips.spec${CYAN}
       ####    Output${LTCYN}
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
A Living script for Useful Linux commands, scripting, and configuring 
in an Enterprise environment
%prep
#%setup -q
%install
cd /home/c4/rpmbuild/BUILDROOT
mkdir -p %{buildroot}/usr/local/bin
cp %{_topdir}/SOURCES/%{name} %{buildroot}/usr/local/bin/
%clean
rm -rf \$RPM_BUILD_ROOT
%files
%defattr(-,c4,users)
/usr/local/bin/usefultips
%doc
%changelog${RESET}${YELLOW}
       After the spec file is in the "SPECS" directory, and the script is in the "SOURCES"
        directory, your environment should look like so:${LTGRN}
       $ rpmbuild> tree -L 2 .${CYAN}
       ####    Output${LTCYN}
       .
       ├── BUILD
       ├── BUILDROOT
       ├── RPMS
       ├── SOURCES
       │   └── usefultips
       ├── SPECS
       │   └── usefultips.spec
       └── SRPMS${BOLD}${YELLOW}
  Note:${RESET}${YELLOW}
    You can create your spec file by simply copying an existing spec file and modifying it.
    As an alternative, you can use the vim or emacs command to open any new file that ends in .spec. The editor will automatically create a template within the new file for writing an RPM spec file.${RESET}

EOT
}
#
cmd_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
    4. The 'rpmbuild' command to build the rpm${RESET}${LTYLLW}
       Read the man page for the other options available, for this document I am 
        only using what is needed.${CYAN}
       ####    The rpmbuild command${LTGRN}
       $ rpmbuild -v -bb --clean SPECS/usefultips.spec${CYAN}
       ####    Output${LTCYN}
Executing(%prep): /bin/sh -e /var/tmp/rpm-tmp.aXzDRT
+ umask 022
+ cd /home/c4/rpmbuild/BUILD
+ exit 0
Executing(%install): /bin/sh -e /var/tmp/rpm-tmp.mopZjD
+ umask 022
+ cd /home/c4/rpmbuild/BUILD
+ cd /home/c4/rpmbuild/BUILDROOT
+ mkdir -p /home/c4/rpmbuild/BUILDROOT/usefultips-0.0.2-04.x86_64/usr/local/bin
+ cp /home/c4/rpmbuild/SOURCES/usefultips /home/c4/rpmbuild/BUILDROOT/usefultips-0.0.2-04.x86_64/usr/local/bin/
+ /usr/lib/rpm/brp-compress
+ /usr/lib/rpm/brp-suse
calling /usr/lib/rpm/brp-suse.d/brp-99-compress-vmlinux
calling /usr/lib/rpm/brp-suse.d/brp-99-pesign
No buildservice signing certificate
Creating /home/c4/rpmbuild/OTHER/usefultips.cpio.rsasign
1 block
Processing files: usefultips-0.0.2-04.x86_64
Provides: usefultips = 0.0.2-04 usefultips(x86-64) = 0.0.2-04
Requires(rpmlib): rpmlib(CompressedFileNames) <= 3.0.4-1 rpmlib(FileDigests) <= 4.6.0-1 rpmlib(PayloadFilesHavePrefix) <= 4.0-1
Requires: /usr/bin/env
Checking for unpackaged file(s): /usr/lib/rpm/check-files /home/c4/rpmbuild/BUILDROOT/usefultips-0.0.2-04.x86_64
Wrote: /home/c4/rpmbuild/RPMS/x86_64/usefultips-0.0.2-04.x86_64.rpm
Executing(%clean): /bin/sh -e /var/tmp/rpm-tmp.0bADvn
+ umask 022
+ cd /home/c4/rpmbuild/BUILD
+ rm -rf /home/c4/rpmbuild/BUILDROOT/usefultips-0.0.2-04.x86_64
+ exit 0
Executing(--clean): /bin/sh -e /var/tmp/rpm-tmp.yr4HH7
+ umask 022
+ cd /home/c4/rpmbuild/BUILD
+ exit 0${RESET}
EOT
}
#
inst_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
    5. Verify, Install, and Test the rpm${RESET}${LTYLLW}
      In the output above you will see the full path to the newly created rpm:${BOLD}${CYAN}
       "Wrote: /home/c4/rpmbuild/RPMS/x86_64/usefultips-0.0.2-04.x86_64.rpm"${RESET}${CYAN}
      ####    Verify the rpm${LTGRN}
      $ rpm -qpi RPMS/x86_64/usefultips-0.0.2-04.x86_64.rpm${CYAN}
      ####    Output will be the contents of your spec file
      ####    Install the rpm ${BOLD}(${ULINE}ALWAYS use "U"${NULINE})${RESET}${LTGRN}
      $ sudo rpm -Uhv RPMS/x86_64/usefultips-0.0.2-04.x86_64.rpm${CYAN}
      ####    Output${LTCYN}
      Preparing...                          ################################# [100%]
      Updating / installing...
         1:usefultips-0.0.2-04              ################################# [100%]${LTGRN}
      $ which usefultips${LTCYN}
      /usr/local/bin/usefultips${LTGRN}
      $ usefultips vers${LTCYN}
      This Version/Revision of usefultips is 0.0.2-04 released on 15 Sep 2018${RESET}
EOT
}
#
srcode_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
  b. Build an rpm from source (src) code${RESET}${LTYLLW}
    Not available yet, see the "Resources" section for links${RESET}
EOT
}
#
patch_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
  c. Creating Patch to update source code${RESET}${LTYLLW}
    Not available yet, see the "Resources" section for links${RESET}
EOT
}
#
note_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
2. Notes on RPM, Versioning, and Structure${RESET}${LTYLLW}
  a. It recommended to ALWAYS use "${BOLD}${LTCYN}U${RESET}${LTYLLW}" instead of "${BOLD}${LTCYN}i${RESET}${LTYLLW}" when installing an rpm... 
      Read the man page to find out why.
  b. Use a standardized versioning method and be consistant with its use.
  c. When building a newer rev of a previously built rpm, remember to copy the edited 
      script to the "SOURCES" directory, and update the "Release", and possible the 
      "Version" section/s of the 'spec' file.${RESET}
EOT
}
#
doc_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
3. Documentation${RESET}${LTYLLW}
  The commands, files, and executions in this document were performed on openSUSE Leap-15
  Whether SUSE-based distro or Redhat-based the structure and process is basically
   the same, but, SUSE has some built in and enhanced/expanded capabilities.
  Whether SUSE or Redhat platform, there are other tools to use instead of this 
   manual process, such as, SUSE's "Open Build Service", which is distro agnostic, and
   can be used online or downloaded and used locally. (see "Rferences")
EOT
}
#
ref_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
4. References${RESET}${LTCYN}
  https://cromwell-intl.com/open-source/rpm-patch.html
  https://www.suse.com/documentation/suse-best-practices/pdfdoc/sbp-rpm-packaging/sbp-rpm-packaging.pdf
  https://access.redhat.com/sites/default/files/attachments/rpm_building_howto.pdf
  https://openbuildservice.org/
EOT
}
#
###########################################
####    Show menu, receive imput, execute 
###########################################
#
rpmdoc_run () {
    cat <<EOT
${BOLD}${YELLOW}
This is a long document so it is broken into sections...${RESET}${YELLOW}
${ULINE}Option   Section${NULINE}${LTCYN}
  [1]${YELLOW}    Contents${LTCYN}
  [2]${YELLOW}     Preparation${LTCYN}
  [3]${YELLOW}      The 'SOURCE' code Directory${LTCYN}
  [4]${YELLOW}      The 'spec' file${LTCYN}
  [5]${YELLOW}      The 'rpmbuild' command to build the rpm${LTCYN}
  [6]${YELLOW}      Verify, Install, and Test the rpm${LTCYN}
  [7]${YELLOW}    Build an rpm from source (src) code${LTCYN}
  [8]${YELLOW}    Notes on RPM, Versioning, and Structure${LTCYN}
  [9]${YELLOW}    Documentation${LTCYN}
  [r]${YELLOW}    References${LTCYN}
  [q]${YELLOW}    Quit/Exit${RESET}
EOT
read -p "${BOLD}${LTCYN}Please select an Option from above....${RESET}
" mychoice
case $mychoice in
    1)
        clear
	content_run
        rpmdoc_run
    ;;
    2)
        clear
        prep_run
        rpmdoc_run
    ;;
    3)
        clear
        srcdir_run
        rpmdoc_run
    ;;
    4)
        clear
        spec_run
        rpmdoc_run
    ;;
    5)
        clear
        cmd_run
        rpmdoc_run
    ;;
    6)
        clear
        inst_run
        rpmdoc_run
    ;;
    7)
        clear
        srcode_run
        rpmdoc_run
    ;;
    8)
        clear
        note_run
        rpmdoc_run
    ;;
    9)
        clear
        doc_run
        rpmdoc_run
    ;;
    r)
        clear
        ref_run
        rpmdoc_run
    ;;
    q)
        exit 0
    ;;
    *)
        clear
        rpmdoc_run
    ;;
esac
}
#
###########################################
####    Run script & exit
###########################################
#
rpmdoc_run
exit $?

