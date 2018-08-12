#!/bin/bash
#
###########################################
###	Define Variables
###########################################
#
PROGNAME=$(basename $0)
PROGVERS="0.0.0-08"
PROGDATE="19 Mar 2018"
#
###	Color Variables [Delete unused variables when done]
#
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
CYAN=`tput setaf 6`
LTRED=`tput setaf 9`
LTGRN=`tput setaf 10`
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
###	Sticky- Keep at top
function show_objective
{
printf "\n\t $LTYLLW $BOLD Objective- Effective Code Writing and Execution$RESET $LTCYN
  1. Evaluate conditions
  2. Take actions
  3. Carry out tasks, repeat some of them
  4. Cleanup and close. $RESET $LTYLLW
\t   Desired End Results$RESET $LTCYN
  1. Must be OS/Release Agnostic
  2. Must be scalable and allow for growth
  3. Must be adaptable- able to adjust with changed/better tools easily$RESET$LTYLLW [variables]$RESET$LTCYN
  4. Must be portable
  5. Must have structure, order, and Comments for easy reading/debugging
$RESET
"
sleep 3
}
#
function show_opts
{
printf "\n\t $LTCYN $BOLD Usage-$RESET $LTMAG
  sh $PROGNAME [option] $RESET
"
printf "\t $LTCYN $BOLD Options-$RESET $YELLOW
  Option\t Short Desc.\t  Description$RESET $CYAN
  []\t\t None\t\t  Shows this menu and exits.
  [help]\t Help\t\t  Shows the entire menu in 'more' and exits after\n\t\t\t\t  hitting bottom.
  [sobj]\t Objective\t  Show the Objective for this script and all coding,\n\t\t\t\t  cmmands, and structure.
  [vers]\t Version\t  Shows this revision's Verion and exits.
  [meta]\t Meta Chars\t  Shows ways to remove files with names that are\n\t\t\t\t  meta-characters including by-inode number.
  [lvmn]\t LVM Notes\t  Shows LVM management for adding a disk.
  [tool]\t Useful Tools\t  Tools- Security, Monitoring, and troubleshooting
  [umnt]\t Monitor Tips\t  Tips for Monitoring and troubleshooting
  [vims]\t VIM Cmds\t  Helpful vim shortcuts and tips.
  [pend]\t Prepend\t  Prepend the beginning of every line in a file\n\t\t Append\t\t  Or, append to the end of every line in a file.
  [susr]\t UserAdd SFTP\t  Create a secure SFTP user and password with hash,\n\t\t\t\t  in a chroot-jail environment.
  [sftp]\t SFTP Chroot\t  Create a secure SFTP environment using\n\t\t\t\t  a chroot-jail file system structure.
  [emty]\t Empty Lines\t  Remove Empty Lines in a file, including \n\t\t\t\t  white-space, tabs, and commented lines.
  [expr]\t Expressions\t  Full list and explanation of Conditional\n\t\t\t\t  and Regular Expressions.$RESET $LTRED
\n  NOTE: I will not add any items here that are not Distro-Agnostic, Support ALL/Most or stay HOME!
$RESET
"
}
#
function set_chroot
{
	PASSP="`echo '/sftp/chroot/home/%' | sed -e 's/$/u/' `"
echo -e "$LTCYN $BOLD
\t Create a secure SFTP environment with chroot-jailed users.
\t There are some things are required before this will function properly-$RESET $YELLOW
  The base file structure must exist and be OWNED by root,\n  preferably on it's own partition [see lvmn option]
    For this example we'll use /sftp/chroot/home/ as the 'root'\n    of the chroot environment.$RESET $LTCYN $BOLD
  Requirements- $RESET $LTRED
\t 1. Create the sftp group to be jailed [example below- 'sftponly' ]
\t 2. Set the sftp directive in /etc/ssh/sshd_config [example below]
\t 3. Set the Match group directive in /etc/ssh/sshd_config [example below]$RESET $LTRED $BOLD
\t 4. The user's home directory MUST be owned by root!!!  [example below]$RESET $LTRED
\t   Any and all sub-directories under that should be owned by the user and sftp-group.
\t 5. Best-Practices- Limit who can login by Group or specific users [example below]
\t 6. Best-Practices- Limit root login to ONLY use PRIVATE RSA-Keys [example below]$RESET $YELLOW

  EXAMPLE Home directory ownership-$RESET $LTCYN
# ls -l /sftp/chroot/home/
drwxr-xr-x 10 root sftponly 4096 Mar 16 12:15 sftpuser$RESET $YELLOW

  EXAMPLE /etc/ssh/sshd_config -$RESET $LTYLLW
PermitRootLogin$RESET $CYAN without-password$RESET $YELLOW
  #Replace 'Subsystem' line with$RESET$LTCYN$BOLD internal-sftp$RESET$YELLOW as below$RESET $LTYLLW
Subsystem$RESET    sftp$BOLD    internal-sftp$RESET $LTYLLW 
AllowGroups$RESET LinuxAdmins crew colab sftponly root$RESET $LTYLLW
Match$RESET$LTGRN group$RESET sftponly,!wheel,!users,!colab,!LinuxAdmins$RESET $YELLOW #The '!' means NOT this group$RESET $LTYLLW
    ForceCommand$RESET $CYAN internal-sftp$RESET $LTYLLW
    AllowTcpForwarding$RESET $CYAN no$RESET $LTYLLW
    Chrootdirectory$RESET $PASSP
\n $RESET
"
}
#
function make_users
{
printf "$LTCYN $BOLD
\t Create a secure user and password with hashed pasword$RESET $YELLOW
  Create the User Password and Hash-$RESET $CYAN
# openssl rand -base64 15 > username.txt && cat username.txt | openssl passwd -1 -stdin >> username.txt && cat username.txt $RESET $YELLOW
  Output-$RESET $LTCYN 
5t5sYKAhwkY6sQ2URteuL$RESET $YELLOW  < Password $RESET $LTCYN
\$1fJ4L4f9NEoNwFxUtRVsoTQ.TVLot/gJ/$RESET $YELLOW  < Password Hash
  Create the user-$RESET $CYAN
# useradd -s /bin/false -c \"SFTP User\" -m -d /sftp/chroot/home/username -g sftpchroot username$RESET $YELLOW
  This will create the user 'username' and chroot-jail it to /sftp/chroot/home/username
  Now set the user's password with 'passwd username' and copy/paste the password generated
    Some preparation must be done first if you don't have sftp chroot-jail setup-
  To setup SFTP Chroot-Jail run this command with the [sftp] Option.$RESET $LTCYAN
\t Do want to see that information now? [y/N] (n) $RESET
\n"
read RUNSFTP
if [[ "`echo $RUNSFTP`" != "y" ]]; then
	printf "Exiting...\n "
	exit $?
else
	set_chroot
fi
}
#
function vim_cmds
{
printf "$LTCYN $BOLD
\t Helpful vim shortcuts and tips$RESET $YELLOW
 Deleting-$RESET $LTYLLW
\tx\t - delete current character
\tdw\t - delete current word
\tdd\t - delete current line
\t5dd\t - delete five lines
\td$\t - delete to end of line
\td0\t - delete to beginning of line
\t:1,.d\t - delete to beginning of file
\t:.,\$d\t - delete to end of file$RESET $YELLOW
 Resource- vi/vim delete commands and examples$RESET$CYAN
  https://alvinalexander.com/linux/vi-vim-delete-line-commands-to-end$RESET $YELLOW

 Search and Replace-$RESET $LTYLLW
\t:%s/search/replace/gc\t - Ask for confirmation before substitution.$RESET $YELLOW
\n Resource- Vim tips: The basics of search and replace$RESET $CYAN
  https://www.linux.com/learn/vim-tips-basics-search-and-replace$RESET

"
}
#
function rem_emty
{
printf "$LTCYN $BOLD
\t Remove Empty Lines in a file, including white-space and tabs...$RESET $YELLOW
Using sed example-$RESET $CYAN
# cat /etc/apache2/httpd.conf | grep -v '#' | sed '/^\s*$/d'
$RESET $YELLOW
Using tr and awk to parse a file with 4 digit strings within brackets,\n and then have the output linier rather than vertical,\n and then remove the leading bracket-$RESET"
echo "$CYAN
# cat myfile.txt | grep \"\\[....\\]\" | awk -F] '{print \$1}' | tr -d '\n' | tr -d '['
$RESET"
}
#
function rem_meta
{
printf "$LTCYN $BOLD
\t Removing files with special characters and by inode-$RESET $CYAN
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
function mon_troub
{
printf "$YELLOW $BOLD
\t Useful Monitoring and Troubleshooting Information$RESET$LTYLLW
  NMON-$RESET$LTCYN
\t Testing an issue with a known method to reproduce...\n  in this case CPU & Top processes for a specific\n  block of time in which to record the data for debugging.\n\t The command below will take a snapshot of all\n  details of CPU usage- Every 20 seconds for 15 iterations [5 minutes]\n  The -- 'c' is to tell nmon to only collect CPU info\n  -- 'm' would be Memory,, etc.$RESET$LTMAG
  # nmon -ft -s 20 -c 15 -- 'c'$RESET$LTCYN
\t This will create a '.csv'-type file with an 'nmon' extension\n  in your Present Working Direcory[PWD].$RESET$LTYLLW 
\t Optional-$RESET$YELLOW Parsing the generated PWD/file.nmon for just the data\n  and format that I want...$RESET$LTMAG
  # cat hostname_date_time.nmon | grep \"^[C,Z]\" >> hostname_date_time.nmon.csv
  # cat hostname_date_time.nmon | grep ^T >> hostname_date_time.nmon.csv$RESET$LTYLLW
\t EXAMPLE-$RESET$YELLOW My edited version, and only showing 1 instance-$RESET$LTCYN
CPUs	time	usr	sys	inuse	Idle	Status$RESET$CYAN
ZZZZ	T0004	10:21:31 19-MAR-2018		ALERT
CPU001	T0004	5.9	8.5	6.5	79.1	TRUE
CPU002	T0004	2.4	4.2	0.9	92.6	FALSE
CPU003	T0004	13.4	30.1	0.9	55.7	TRUE
CPU004	T0004	4.2	4.5	2.8	88.5	TRUE
CPU005	T0004	5.8	21.2	1.3	71.7	TRUE
CPU006	T0004	6.9	7	0.8	85.3	TRUE
CPU007	T0004	5.5	11.2	10.8	72.4	TRUE
CPU008	T0004	1.8	4.3	1.6	92.3	FALSE
CPU_ALL	T0004	5.7	11.4	3.2	79.7	TRUE$RESET$LTYLLW
\t I added the 'Status' collumn, and used 2 formulas\n  for generating the status automattically\n  The 'TRUE/FALSE' has a value of '0' or '1', formula-$RESET$LTMAG
  fn[=IF(SUBTOTAL(9,F2)<90)]$RESET$LTYLLW
\t And the 'ALERT' has a value of 'ALERT' or 'OK'\n  generated by the SUM of the T|F values$RESET$LTMAG
  fn[=IF(SUM(G2:G10)>0,\"ALERT\",\"OK\")]$RESET$LTYLLW
\t The 'TOP' process for that time [T0004] is what we're
  interested in finding what is happening at the time...-$RESET$CYAN
TOP	T0004	69.26	37.68	31.58	lr402.x86_64$RESET$LTYLLW
\t So the$RESET$CYAN 'lr402.x86_64'$RESET$LTYLLW is the main culpret, we can\n  look at next-higest, but here I knew what I was looking for.
\n $RESET"
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
\tTo add a character to the beginning of every line in myfile.txt$RESET $LTMAG
# sed 's/^/#/' myfile.txt >> myfile-commented.txt$RESET $YELLOW
 Or$RESET $LTMAG
# sed -i 's/^/#/' myfile.txt$RESET $YELLOW
\n\tAlso, add a space & character to the end of every line in myfile.txt$RESET $LTMAG
# sed -i 's/$/\\ #/' myfile.txt
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
###########################################
###	Define Execution
###########################################
#
case $1 in
  "help")
	show_objective
	#sleep 5
        show_opts | more
        exit $?
        ;;
  "sobj")
	show_objective
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
  "pend")
	add_prefix
       	exit $?
	;;
  "tool")
	use_tools
       	exit $?
	;;
  "umnt")
	mon_troub | more
       	exit $?
	;;
  "emty")
	rem_emty
       	exit $?
	;;
  "vims")
	vim_cmds
       	exit $?
	;;
  "susr")
	make_users
       	exit $?
	;;
  "sftp")
	set_chroot
       	exit $?
	;;
  "vers")
	printf "$LTCYN This Version/Revision of $PROGNAME is $PROGVERS released on $PROGDATE $RESET \n"
       	exit $?
	;;
  *)
	show_objective
        show_opts
        exit $?
        ;;
esac
exit $?
# Next steps
#	ChangeLog
#@CLN Need to fix the '%u' in the sftp option
#	FIXED it with
#	PASSP="`echo '/sftp/chroot/home/%' | sed -e 's/$/u/' `"
#	Chrootdirectory$RESET $PASSP
# 	
# 	Added a Objective section
# 	Added mon_troub [umnt] optio for monitoring an issue witn nmon
# 	
# 	
