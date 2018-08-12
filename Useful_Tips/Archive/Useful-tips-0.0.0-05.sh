#!/bin/bash
#
###########################################
###	Define Variables
###########################################
#
PROGNAME=$(basename $0)
PROGVERS="0.0.0-05"
PROGDATE="09 Mar 2018"
#
###	Color Variables [Delete unused variables when done]
#
RED=`tput setaf 1`
YELLOW=`tput setaf 3`
CYAN=`tput setaf 6`
LTRED=`tput setaf 9`
LTYLLW=`tput setaf 11`
LTMAG=`tput setaf 13`
LTCYN=`tput setaf 14`
#
BOLD=`tput bold`
RESET=`tput sgr0`
#
###########################################
###	Define Functions
###########################################
#
function show_opts
{
printf "\n\t $LTCYN $BOLD Options-$RESET $CYAN
  [help]\t Help\t\t  Shows this menu and exits.
  [vers]\t Version\t  Shows this revision's Verion and exits.
  [meta]\t Meta Chars\t  Shows ways to remove files with names\n\t\t\t\t  that are meta-characters including\n\t\t\t\t  by-inode number, and a link to the site resourced.
  [lvmn]\t LVM Notes\t  Shows LVM management for adding a disk.
  [tool]\t Useful Tools\t  Tools for Security, Monitoring, and troubleshooting
  [prep]\t Prepend\t  Prepend the beginning of every line in a file\n\t\t\t\t  Or, To the end of every line in a file.
  [expr]\t Expressions\t  Full list and explanation of Conditional\n\t\t\t\t  and Regular Expressions.\n\t\t\t\t  This option requires a 2nd parameter\n\t\t\t\t  The ONLY parameters are one of the following\n\t\t\t\t  'view', 'cat', or a filename. Syntax is as so =>$RESET $LTMAG \n\t    command option [view|cat|<filename.txt>].
\n$RESET
"
}
function rem_meta
{
printf "$LTCYN $BOLD
Removing files with special characters and by inode-$RESET $CYAN
https://www.linux.com/blog/linux-shell-tip-remove-files-names-contains-spaces-and-special-characters-such$RESET $LTMAG
Tip #1: Put filenames in quotes
Tip #3: Try a ./ at the beginning of the filename or absolute path
Tip #4: Try a -- at the beginning of the filename$RESET $YELLOW
Tip #5: Remove file by an inode number
# ls -li$RESET $LTYLLW #Find the inode <nnnnnnn> of the file$RESET $YELLOW
# find . -inum <nnnnnnn> -delete
# find . -inum <nnnnnnn> -exec rm -i {} \;
\n$RESET
"
}
#
function def_expres
{
printf "$YELLOW $BOLD
\n\t $CYAN You can find the expressions.txt at -$RESET
$LTCYN # wget http://woodbeeco.com/scripts/expressions.txt$RESET
$YELLOW or $RESET
$LTCYN # https://github.com/SeaPhor/SeaPhor-Scripts\n
$RESET"
}
#
function lvm_notes
{
printf "\n$YELLOW
#LVM - Adding a new disk to a existing Volume Group (VG)
#Add new disk with VMware tool.

#Usually, the command fdisk -l will not detect the new disk. Execute this command to do rescan the bus: 
#Command: echo \"- - -\" > /sys/class/scsi_host/host#/scan where # is 0 or 1 or 2
# fdisk -l

#Command: pvcreate /dev/sd<x>
# pvdisplay

#Command: vgextend [VolumeGroupName] [PhysicalDevicePath]
# vgextend system /dev/sd<x>

#Executing pvdisplay again shows the /dev/sdb is now part of VG system:
# pvdisplay
#--- Physical volume ---
#PV Name		/dev/sdb
#VG Name		system
#PV Size		8.00 GiB not usable 4.00 MiB
#Allocatable		yes
#PE Size		4.00 MiB
#Total PE		2047
#Free PE		2047

#To add via Free PE
# lvextend -l +2047 /dev/system/root

#To Add via amount of GB to add
# lvextend -L+1G /dev/system/root

#To Add via amount of GB to be total size
# lvextend -L12G /dev/system/root

#Command: resize2fs The last step is to resize the logical volume 
# resize2fs /dev/system/root
# df -hl 
\n $RESET "
}
#
function add_prefix
{
echo -e "$YELLOW
\tTo add a character to the beginning of every line in myfile.txt
### sed 's/^/#/' myfile.txt >> myfile-commented.txt
 Or
### sed -i 's/^/#/' myfile.txt
\n\tAlso, add a space & character to the end of every line in myfile.txt
### sed -i 's/$/\\ #/' myfile.txt
\n $RESET "
}
#
function use_tools
{
printf "$LTMAG $BOLD
  Tools for Security, Monitoring, and troubleshooting$RESET
\t$YELLOW  Monitoring & troubleshooting $RESET
$LTCYN  nmon$RESET $CYAN - In most distributions repositories$RESET
$LTCYN  sysstat$RESET $CYAN - In most distributions repositories$RESET
$LTCYN  htop$RESET $CYAN - In most distributions$RESET
$LTCYN  Nagios$RESET $CYAN - Availabale at https://www.nagios.org/projects/nagios-core/$RESET
$YELLOW \t  Security Settings $RESET
$LTCYN  PermitRootLogin without-password$RESET $CYAN - In /etc/ssh/sshd_config$RESET
$LTCYN  AllowGroups $RESET $LTMAG OR $RESET $LTCYN  AllowUsers$RESET $CYAN - In /etc/ssh/sshd_config$RESET
$YELLOW \t  System Mangement $RESET
$LTCYN  Puppet$RESET $CYAN - In SUSE repos, or from puppelabs.org, manages all OS's$RESET
$LTCYN  Git$RESET $CYAN - In most distributions repositories$RESET
$LTCYN  GitLab Server$RESET $CYAN - See http://woodbeeco.com/docs/GitLab_Setup.pdf$RESET
$LTCYN  PXE-Boot Server$RESET $CYAN - Doc. Coming soon at http://woodbeeco.com$RESET
$YELLOW \t  Enterprise Level tools $RESET
$LTCYN  SUSE Manager Server$RESET $CYAN - Manages SLES & RHEL, PXE-Boot AutoInstall, has Salt Built-In for management, $RESET
$LTCYN  SaltStack$RESET $CYAN - Manages All OS's, Config Management, provisioning, deploying- on-prem & Cloud$RESET
$LTRED \n    NOTE: I will not add any items here that are not OS-Agnostic, Support ALL/Most or stay HOME! $RESET
\n "
}
#
case $1 in
  "help")
        show_opts
        exit $?
        ;;
  "meta")
	rem_meta
        exit $?
	;;
  "expr")
	def_expres
       	exit $?
	;;
  "lvmn")
	lvm_notes
       	exit $?
	;;
  "prep")
	add_prefix
       	exit $?
	;;
  "tool")
	use_tools
       	exit $?
	;;
  "vers")
	printf "$LTCYN This Version/Revision of $PROGNAME is $PROGVERS released on $PROGDATE $RESET \n"
       	exit $?
	;;
  *)
        show_opts
        exit $?
        ;;
esac
exit $?
# Next steps
#
