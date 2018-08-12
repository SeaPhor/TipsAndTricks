#!/usr/bin/env bash
#
###########################################
### Define Variables
###########################################
#
PROGNAME=$(basename $0)
PROGVERS="0.0.1-09"
PROGDATE="11 Aug 2018"
if [[ "`echo $2`" == "quiet" ]]; then
    NOOPTS=true
else
    NOOPTS=false
fi
#
### Color Variables [Delete unused variables when done]
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
#
BGBLU=`tput setab 4`
BGYLLW=`tput setab 3`
BGLYLLW=`tput setab 11`
#
ULINE=`tput smul`
NULINE=`tput rmul`
BOLD=`tput bold`
RESET=`tput sgr0`
#
###########################################
### Define Functions
###########################################
#
### Sticky- Keep at top
function show_objective
{
printf "\n\t $LTYLLW $BOLD Objective- Effective Code Writing and Execution$RESET $LTCYN
  1. Evaluate conditions
  2. Take actions
  3. Carry out tasks, repeat some of them$LTYLLW [with functions and variables- NOT code]$LTCYN
  4. Cleanup and close. $LTYLLW
\t   Desired End Results$LTCYN
  1. Must be OS/Release Agnostic
  2. Must be scalable and allow for growth
  3. Must be adaptable- able to adjust with changed/better tools easily$LTYLLW [variables]$LTCYN
  4. Must be portable
  5. Must have structure, order, and Comments for easy reading/debugging
  6. Must use The$BOLD$LTYLLW DRY$RESET$LTCYN (Don't Repeat Yourself) principle, which states that you\n     should never repeat the same piece of code more than once in your application
$RESET
"
printf "\t$YELLOW$BOLD PEP8 Compliance Guidelines and suggested Resolution\n\t$LTYLLW PEP8 is technically for Python coding but we believe it is a good\n  standard for all coding.$YELLOW
\t  Find more at $CYAN \nhttps://www.datacamp.com/community/tutorials/pep8-tutorial-python-code\n And Here-  https://www.python.org/dev/peps/pep-0008/\n$RESET
"
#sleep 3
}
#
function show_opts
{
printf "\n$LTCYN$BOLD$BGYLLW\tUsage-$RESET$LTMAG
  sh $PROGNAME$YELLOW [$LTCYN option | option-info$YELLOW ] optional-$LTCYN quiet$YELLOW for non-interactive
  EXAMPLE-$LTMAG $PROGNAME pep8$YELLOW or $LTMAG $PROGNAME pep8 quiet
"
printf "$LTCYN$BOLD$BGYLLW\tOptions-$RESET$YELLOW
$ULINE  Option\tShort Desc.\t  Description$LTCYN$NULINE
  []$BOLD\t\tNone\t\t$RESET$LTCYN  Shows this menu and exits. same as help
  [help]$BOLD\tHelp\t\t$RESET$LTCYN  Shows the entire menu and exits
  [sobj]$BOLD\tObjective\t$RESET$LTCYN  Show the Objective for this script and all coding,\n\t\t\t\t  commands, and structure.
  [vers]$BOLD\tVersion\t\t$RESET$LTCYN  Shows this revision's Verion and exits.$YELLOW
  Options Below have an 'INFO' option-
    [-info]\t Information\t  Add to the end of option the '-info' to get\n\t\t\t\t  more detailed description-\n\t\t\t\t  EXAMPLE-$LTMAG $PROGNAME meta-info$LTCYN
  [meta]$BOLD\tMeta Chars\t$RESET$LTCYN  Shows ways to remove files with names that are\n\t\t\t\t  meta-characters including by-inode number.
  [lvmn]$BOLD\tLVM Notes\t$RESET$LTCYN  Shows LVM management for adding a disk.
  [tool]$BOLD\tUseful Tools\t$RESET$LTCYN  Tools- Security, Monitoring, and troubleshooting
  [umnt]$BOLD\tMonitor Tips\t$RESET$LTCYN  Tips for Monitoring and troubleshooting
  [vims]$BOLD\tVIM Tips\t$RESET$LTCYN  Helpful vim shortcuts and tips.
  [pend]$BOLD\tPrepend\t\t$RESET$LTCYN  Prepend the beginning of every line in a file\n$BOLD\t\tAppend\t\t$RESET$LTCYN  Or, append to the end of every line in a file.
  [seds]$BOLD\tSed Stuff\t$RESET$LTCYN  Helpful Replacement shortcuts and tips- sed, tr, etc.
  [emty]$BOLD\tEmpty Lines\t$RESET$LTCYN  Remove Empty Lines in a file, including \n\t\t\t\t  white-space, tabs, and commented lines.
  [sftp]$BOLD\tSFTP Chroot\t$RESET$LTCYN  Create a secure SFTP environment using\n\t\t\t\t  a chroot-jail file system structure.
  [susr]$BOLD\tUserAdd SFTP\t$RESET$LTCYN  Create a secure SFTP user and password with hash,\n\t\t\t\t  in a chroot-jail environment.
  [expr]$BOLD\tExpressions\t$RESET$LTCYN  Full list and explanation of Conditional\n\t\t\t\t  and Regular Expressions.
  [pep8]$BOLD\tPEP8 Tools\t$RESET$LTCYN  PEP8 Living Doc- Code compliane structure and tips.
  [irsi]$BOLD\tIRSSI Tips\t$RESET$LTCYN  IRSSI Living Doc- Helpful Info and tips.
  [link]$BOLD\tMy Links\t$RESET$LTCYN  Links to various helpful tools, tips, tutorials, etc.
  [read]$BOLD\tUser Input\t$RESET$LTCYN  Request user input in bash script, supress the stdin/out
  [date]$BOLD\tCustom Date\t$RESET$LTCYN  Using custom date command in scripts and/or cli
  [type]$BOLD\tType Command\t$RESET$LTCYN  Using the type command to find other command in scripting.
  [colr]$BOLD\tAdd Colors\t$RESET$LTCYN  Add colors and effects to the output of your\n\t\t\t\t   scripts asn commands.
  [cows]$BOLD\tLogin Profile\t$RESET$LTCYN  Silly little hack so you will have a fortune\n\t\t\t\t   each time you log in. -Also has cows-info
  [gtal]$BOLD\tGit Aliases\t$RESET$LTCYN  Add Aliases to short-cuts to git commands in ~/.gitconfig
  [gtbr]$BOLD\tGit Branches\t$RESET$LTCYN  Working with Branches in GIT
  [gitl]$BOLD\tGitLab Setup\t$RESET$LTCYN  Setup your own GitLab Server from Beginning to end.$RESET
\n"
}
#
function set_chroot
{
    PASSP="`echo '/sftp/chroot/home/%' | sed -e 's/$/u/' `"
echo -e "$LTCYN $BOLD
\t Create a secure SFTP environment with chroot-jailed users.
\t There are some things are required before this will function properly-$RESET$YELLOW
  The base file structure must exist and be OWNED by root,\n  preferably on it's own partition [see lvmn option]
    For this example we'll use /sftp/chroot/home/ as the 'root'\n    of the chroot environment.$LTCYN $BOLD
  Requirements- $RESET $LTRED
\t 1. Create the sftp group to be jailed [example below- 'sftponly' ]
\t 2. Set the sftp directive in /etc/ssh/sshd_config [example below]
\t 3. Set the Match group directive in /etc/ssh/sshd_config [example below]$LTRED $BOLD
\t 4. The user's home directory MUST be owned by root!!!  [example below]$RESET $LTRED
\t   Any and all sub-directories under that should be owned by the user and sftp-group.
\t 5. Best-Practices- Limit who can login by Group or specific users [example below]
\t 6. Best-Practices- Limit root login to ONLY use PRIVATE RSA-Keys [example below]$YELLOW

  EXAMPLE Home directory ownership-$LTCYN
# ls -l /sftp/chroot/home/
drwxr-xr-x 10 root sftponly 4096 Mar 16 12:15 sftpuser$YELLOW

  EXAMPLE /etc/ssh/sshd_config -$LTYLLW
PermitRootLogin$CYAN without-password$YELLOW
  #Replace 'Subsystem' line with$LTCYN$BOLD internal-sftp$YELLOW as below$LTYLLW
Subsystem\tsftp$BOLD    internal-sftp$RESET $LTYLLW 
AllowGroups\tLinuxAdmins crew colab sftponly root$LTYLLW
Match$LTGRN group sftponly,!wheel,!users,!colab,!LinuxAdmins$YELLOW #The '!' means NOT this group$LTYLLW
    ForceCommand$CYAN internal-sftp$LTYLLW
    AllowTcpForwarding$CYAN no$LTYLLW
    Chrootdirectory$RESET $PASSP
\n
"
make_users
}
#
function make_users
{
printf "$LTCYN $BOLD
\t Create a secure user and password with hashed pasword$RESET $YELLOW
  Create the User Password and Hash-$CYAN
# openssl rand -base64 15 > username.txt && cat username.txt | openssl passwd -1 -stdin >> username.txt && cat username.txt $YELLOW
  Output-$LTCYN 
5t5sYKAhwkY6sQ2URteuL$YELLOW  < Password $LTCYN
\$1fJ4L4f9NEoNwFxUtRVsoTQ.TVLot/gJ/$YELLOW  < Password Hash
  Create the user-$CYAN
# useradd -s /bin/false -c \"SFTP User\" -m -d /sftp/chroot/home/username -g sftponly username$YELLOW
  This will create the user 'username' and chroot-jail it to /sftp/chroot/home/username
  Now set the user's password with 'passwd username' and copy/paste the password generated
  The Hash is used if you are managing users with Puppet... Discussed in Puppet SetUp.
$RESET
\n"
}
#
function vim_cmds
{
echo -e "$LTCYN $BOLD
\t Helpful vim shortcuts and tips$RESET $YELLOW
 Deleting-$RESET $LTYLLW
\tx\t - delete current character
\tdw\t - delete current word
\t3dw\t - delete next 3 words from current word
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
# cat /etc/apache2/httpd.conf | grep -v '^#' | sed '/^\s*$/d'
$RESET $YELLOW
Using tr and awk to parse a file with 4 digit strings within brackets,\n and then have the output linier rather than vertical,\n and then remove the leading bracket-$RESET"
echo "$CYAN
# cat myfile.txt | grep \"\\[....\\]\" | awk -F] '{print \$1}' | tr -d '\n' | tr -d '['
$RESET
"
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
# find . -inum <nnnnnnn> -exec rm -i {} \; $RESET $LTYLLW
If you just typo'd and want to keep the file-$RESET $YELLOW
# find . -inum <nnnnnnn> -exec cp {} <goodname> \; $RESET $LTYLLW
  OR $RESET $YELLOW
# find . -inum <nnnnnnn> -exec cp -a {} <goodname> \;
\n$RESET
"
}
#
function meta_info
{
printf "$LTCYN $BOLD
\t Removing files with special characters and by inode-$RESET $CYAN
https://www.linux.com/blog/linux-shell-tip-remove-files-names-contains-spaces-and-special-characters-such $RESET $LTYLLW
\t  Sometimes we find, or create a file with special characters, a '-' prepending the filename, or other special characters in the filename that prevents us from being able to move, copy, or delete them, and outputs an error- [$RESET$LTRED <partial-filename> No such file...$RESET$LTYLLW ].
\t  This Option gives a few ways to accomplish what we need to do.
\n $RESET"
}
#
###    Monitoring and Troubleshooting
function mon_troub
{
    SWTCHBLU=$RESET$LTBLU'F2'$RESET$LTMAG
    SWTCHBLUG=$RESET$LTBLU'G2:G10'$RESET$LTMAG
printf "$YELLOW $BOLD
\t Useful Monitoring and Troubleshooting Information$RESET$LTYLLW
  NMON-$RESET$LTCYN
\t Testing an issue with a known method to reproduce...\n  in this case CPU & Top processes for a specific\n  block of time in which to record the data for debugging.\n\t The command below will take a snapshot of all\n  details of CPU usage- Every 20 seconds for 15 iterations [5 minutes]\n  The -- 'c' is to tell nmon to only collect CPU info\n  -- 'm' would be Memory,, etc.$RESET$LTMAG
  # nmon -ft -s 20 -c 15 -- 'c'$RESET$LTCYN
\t This will create a '.csv'-type file with an 'nmon' extension\n  in your Present Working Direcory[PWD].$RESET$LTYLLW 
\t Optional-$RESET$YELLOW Parsing the generated PWD/file.nmon for just the data\n  and format that I want...$RESET$LTMAG
  # cat hostname_date_time.nmon | grep \"^[C,Z]\" >> hostname_date_time.nmon.csv
  # cat hostname_date_time.nmon | grep ^T >> hostname_date_time.nmon.csv$RESET$LTYLLW
\t EXAMPLE-$RESET$YELLOW My edited version, and only showing 1 instance-$RESET$LTBLU
Row     |Col-A  |Col-B  |Col-C  |Col-D  |Col-E  |Col-F  |Col-G  |
--------|-------|-------|-------|-------|-------|-------|-------|$RESET$LTCYN
00      |CPUs   |time   |usr    |sys    |inuse  |Idle   |Status |$RESET$CYAN
01      |ZZZZ   |T0004  |10:21:31 19-MAR-2018   |       |ALERT  |
02      |CPU001 |T0004  |5.9    |8.5    |6.5    |79.1   |TRUE   |
03      |CPU002 |T0004  |2.4    |4.2    |0.9    |92.6   |FALSE  |
04      |CPU003 |T0004  |13.4   |30.1   |0.9    |55.7   |TRUE   |
05      |CPU004 |T0004  |4.2    |4.5    |2.8    |88.5   |TRUE   |
06      |CPU005 |T0004  |5.8    |21.2   |1.3    |71.7   |TRUE   |
07      |CPU006 |T0004  |6.9    |7      |0.8    |85.3   |TRUE   |
08      |CPU007 |T0004  |5.5    |11.2   |10.8   |72.4   |TRUE   |
09      |CPU008 |T0004  |1.8    |4.3    |1.6    |92.3   |FALSE  |
10      |CPU_ALL|T0004  |5.7    |11.4   |3.2    |79.7   |TRUE   |$RESET$LTYLLW
\t I added the 'Status' collumn, and used 2 formulas\n  for generating the status automattically\n  The 'TRUE/FALSE' has a value of '0' or '1', formula-$RESET$LTMAG
  fn[=IF(SUBTOTAL(9,$SWTCHBLU)<90)]$RESET$LTYLLW
\t And the 'ALERT' has a value of 'ALERT' or 'OK'\n  generated by the SUM of the T|F values$RESET$LTMAG
  fn[=IF(SUM($SWTCHBLUG)>0,\"ALERT\",\"OK\")]$RESET$LTYLLW
\t The 'TOP' process for that time [T0004] is what we're
  interested in finding what is happening at the time...-$RESET$CYAN
TOP T0004   69.26   37.68   31.58   lr402.x86_64$RESET$LTYLLW
\t So the$RESET$CYAN 'lr402.x86_64'$RESET$LTYLLW is the main culpret, we can\n  look at next-higest, but I knew what I was looking for.
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
#Command:$RESET$LTCYN echo \"- - -\" > /sys/class/scsi_host/host#/scan$RESET$LTYLLW where # is 0 or 1 or 2$RESET$LTCYN
# fdisk -l$RESET$YELLOW

#Command:$RESET$LTCYN pvcreate /dev/sd<x>
# pvdisplay$RESET$YELLOW

#Command: vgextend [VolumeGroupName] [PhysicalDevicePath]$RESET$LTCYN
# vgextend system /dev/sd<x>$RESET$YELLOW

#Executing pvdisplay again shows the /dev/sdb is now part of VG system:$RESET$LTCYN
# pvdisplay$RESET$CYAN
#--- Physical volume ---
#PV Name        /dev/sdb
#VG Name        system
#PV Size        8.00 GiB not usable 4.00 MiB
#Allocatable        yes
#PE Size        4.00 MiB
#Total PE       2047
#Free PE        2047$RESET$YELLOW

#To add via Free PE$RESET$LTCYN
# lvextend -l +2047 /dev/system/root$RESET$YELLOW

#To Add via amount of GB to add$RESET$LTCYN
# lvextend -L+1G /dev/system/root$RESET$YELLOW

#To Add via amount of GB to be total size$RESET$LTCYN
# lvextend -L12G /dev/system/root$RESET$YELLOW

#Command: resize2fs The last step is to resize the logical volume $RESET$LTCYN
# resize2fs /dev/system/root
# df -hl $RESET
\n
"
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
$LTYLLW  PermitRootLogin$RESET$LTCYN without-password$RESET $CYAN - In /etc/ssh/sshd_config$RESET
$LTYLLW  AllowGroups $RESET $LTMAG OR $RESET $LTYLLW  AllowUsers$RESET $CYAN - In /etc/ssh/sshd_config$RESET
$YELLOW \t  System Mangement $RESET
$LTCYN  Puppet$RESET $CYAN - In SUSE repos, or from puppelabs.org, manages all OSs$RESET
$LTCYN  Git$RESET $CYAN - In most distributions repositories$RESET
$LTCYN  GitLab Server$RESET $CYAN - See http://woodbeeco.com/docs/GitLab_Setup.pdf$RESET
$LTCYN  PXE-Boot Server$RESET $CYAN - Doc. Coming soon at http://woodbeeco.com$RESET
$YELLOW \t  Enterprise Level tools $RESET
$LTCYN  SUSE Manager Server$RESET $CYAN - Manages SLES & RHEL, PXE-Boot AutoInstall, has Salt Built-In for management, $RESET
$LTCYN  SaltStack$RESET $CYAN - Manages All OSs, Config Management, provisioning, deploying- on-prem & Cloud$RESET
$LTRED \n    NOTE: I will not add any items here that are not OS-Agnostic, Support ALL/Most or stay HOME! $RESET
\n "
}
function tool_info
{
printf "\n\t No Info for tool yet- In-Progress... coming soon\n "
}
#
###    Replacing TABS with 4 spaces for PEP8 Compliance
function rep_tabs
{
REPNEW='\\t'
printf "$LTCYN$BOLD    Replacing all TABS with 4 SPACES for PEP8 Compliance\n$RESET$CYAN  I prefer the expand command over sed because that is what it is for-$RESET$YELLOW$BOLD
  expand command, In lines that begin with a TAB-$RESET$LTYLLW
#  expand -i -t 4 input | sponge output$RESET$YELLOW
    where
    -i is used to expand only leading tabs on each line;
    -t 4 means that each tab will be converted to 4 whitespace chars (8 by default).
    sponge is from the moreutils package, and avoids clearing the input file.$RESET$LTYLLW
#  expand -i -t 4 input | sponge tstoutput && mv tstoutput input$RESET$YELLOW$BOLD
\n  sed command, In ALL lines-$RESET$YELLOW
    Use backslash-escaped sed.
  Replace all tabs with 1 hyphen inplace, in all *.txt files:$RESET$LTYLLW
# sed -i 's/$REPNEW/-/g' *.txt$RESET$YELLOW
  Replace all tabs with 1 space inplace, in all *.txt files:$RESET$LTYLLW
# sed -i 's/$REPNEW/ /g' *.txt$RESET$YELLOW
  Replace all tabs with 4 spaces inplace, in all *.txt files:$RESET$LTYLLW
# sed -i 's/$REPNEW/    /g' *.txt\n$RESET
"
}
function tabs_info
{
printf "\n\t No Info for tabs yet- In-Progress... coming soon\n "
}
#
function sed_cmds
{
printf "\n\t$LTCYN$BOLD  Helpful Replacement shortcuts and tips- sed, tr, etc.$RESET$LTYLLW \n \t Output Deleting a individual line in a file [Line #3] $RESET$LTMAG
 $ sed '3d' file $RESET$LTYLLW
\t Delete a individual line in a file [Line #3] $RESET$LTMAG
 $ sed -i '3d' file$RESET$LTYLLW
\t Delete a range of lines, [2nd line till 4th line] $RESET$LTMAG
 $ sed '2,4d' file$RESET$LTYLLW
\t Delete the lines starting from the 3rd line till encountering the pattern 'Linux' $RESET$LTMAG
 $ sed '1,/Linux/d' file
\t$RESET$YELLOW Resource-
  $RESET$CYAN  http://www.theunixschool.com/2012/06/sed-25-examples-to-delete-line-or.html
$RESET$LTCYN\n\t Remove Spaces in filenames and replace with underscore-\n$RESET$LTYLLW  Best amd easiest wasy I know of...$RESET$LTMAG
 $ for f in *\\ *; do mv \"\$f\" \"\${f// /_}\"; done\n$RESET$LTYLLW  In script form for standardized code...$RESET$LTMAG
for f in *\\ *
do
    mv \"\$f\" \"\${f// /_}\"
done
\t$RESET$YELLOW Resource-
  $RESET$CYAN  https://stackoverflow.com/questions/2709458/how-to-replace-spaces-in-file-names-using-a-bash-script
$RESET$LTCYN $BOLD
\t Remove Empty Lines in a file, including white-space and tabs...$RESET $YELLOW
Using sed example-$RESET $CYAN
# cat /etc/apache2/httpd.conf | grep -v '^#' | sed '/^\\s*$/d'
$RESET
"
rep_tabs
rem_emty
}
function seds_info
{
echo -e "\n\t No Info for seds yet- In-Progress... coming soon\n "
}
#
function pep_eight
{
printf "\t$YELLOW$BOLD PEP8 Compliance Guidelines and suggested Resolution$RESET$YELLOW
\t  Find more at $RESET$CYAN \nhttps://www.datacamp.com/community/tutorials/pep8-tutorial-python-code\n And Here-\nhttps://www.python.org/dev/peps/pep-0008/\n$RESET$LTYLLW
\t PEP8 is technically for Python coding but we believe it is a good\n  standard for all coding. This is a living and growing  part of this\n script and we will be adding more...\n$RESET$LTCYN$BOLD
\t Here is the list of Options as of this release-$RESET$LTCYN
  [tabs]\t$RESET$LTYLLW Replace TABS\t Replacing all TABS with 4 SPACES for PEP8 Compliance$RESET$LTCYN
  [quit]\t$RESET$LTYLLW Quit/Exit\t Exit this script\n$RESET"
if $NOOPTS; then
    rep_tabs
    exit $?
else
    printf "$RESET$YELLOW
\t Please choose from the following$RESET$LTCYN Options...
  [1]\t$RESET$CYAN=>\ttabs$RESET$LTCYN
  [q]\t$RESET$CYAN=>\tquit\n$RESET
 [1|q]...(q)"
read PEPEIGHT
case $PEPEIGHT in
    "1")
        rep_tabs
        exit $?
    ;;
    "q")
        exit $?
    ;;
    *)
        exit $?
    ;;
esac
fi
}
function pep8_info
{
echo -e "\n\t No Info for pep8 yet- In-Progress... coming soon\n "
}
#
function irsi_logs
{
printf "\t$YELLOW$BOLD How-To setup Logging with IRSSI IRC$RESET$LTYLLW
  Set the directory structure$RESET$LTCYN
# sudo mkdir /var/log/irclogs
# sudo chown wbc:LinuxAdmins /var/log/irclogs$RESET$LTYLLW

  In IRC Irssi Console$RESET$YELLOW
[#channel] /SET autolog ON
[#channel] /SET autolog_path /var/log/irclogs/\$tag/\$0.log
[#channel] /save #answer 'yes'$RESET$LTYLLW

  Create the logrotate config$RESET$LTCYN
# sudo vi /etc/logrotate.d/irssi$RESET$LTMAG
/var/log/irclogs/*/*.log {
    copytruncate
    compress
    notifempty
    missingok
}$RESET$LTYLLW

  Execute a manual logrotate$RESET$LTCYN
# sudo /usr/sbin/logrotate -d /etc/logrotate.conf 
# sudo /usr/sbin/logrotate -f /etc/logrotate.conf$RESET$LTYLLW

  Verify logs rotated$RESET$YELLOW
    say something in one of your irssi irc channels$RESET$LTCYN
# ls -lart  /var/log/irclogs/
# ls -lart  /var/log/irclogs/freenode/

$RESET$YELLOW  Resource-$RESET$CYAN
http://www.chovy.com/linux/logging-irssi-and-rotating-them-with-logrotate\n$RESET
"
}
function irsi_noob
{
printf "\n\t$YELLOW$BOLD New to IRSSI? Here is some tips to get started-$RESET$YELLOW
\t Irssi is not that difficult once you get the basics down...\n$RESET$LTYLLW
  Using screen [$ screen] to run your irssi client- This will allow\n  you to login from any source that has ssh\n  access to your irssi host [screen -x]\n
  Connecting to the IRC Server...$RESET$CYAN
  $ irssi -c irc.freenode.net -n [nick] -w [password]\n$RESET$LTYLLW
  Joining a channel...$RESET$LTMAG
  [(status)] /join #channel\n$RESET$LTYLLW
  Getting help in the irssi console...$RESET$LTYLLW$BOLD
 NOTE- Messaging chanserv or nickserv is the same as a PM...\n You need to switch to that PM channel in your Console\n Use CTRL+n for NEXT channel, CTRL+p for PREVIOUS channel$RESET$LTMAG
  [#channel] /msg chanserv help
  [#channel] /msg nickserv help
  [#channel] /msg chanserv help <command>$RESET$LTYLLW
 EXAMPLE-$RESET$LTMAG
  [#channel] /msg chanserv help REGISTER$RESET$CYAN
    REGISTER allows you to register a channel
    so that you have better control.
    allows you to maintain a channel access list
    Syntax: REGISTER <##channel>
    /msg ChanServ REGISTER <##channel>\n$RESET$LTYLLW
  Registering your nick...$RESET$LTMAG
  [#channel] /msg nickserv help REGISTER $RESET$CYAN
    This will register your current nickname with NickServ.
    The password is a case-sensitive password that you make
    You have to confirm the email address. To do this,
    follow the instructions in the message sent to the email
    address.
    Syntax: REGISTER <password> <email-address>
    /msg NickServ REGISTER bar foo@bar.com\n$RESET"
}
function irsi_tips
{
echo -e "\t$YELLOW$BOLD IRSSI IRC Tips and shortcuts-$RESET$YELLOW
\t Irssi is an IRC (Internet Relay Chat) client for use in\n\t the Command Line Interface\n  This is a living and growing  part of this script and we will be\n adding more Tips and Info...\n$RESET$LTCYN$BOLD
\t Here is the list of Options as of this release-$RESET$LTCYN
  [logs]\t$RESET$LTYLLW Log Capture\t Capture all logs from Your channels\n\t\t\t\t  and rotate them with logrotate$RESET$LTCYN
  [inew]\t$RESET$LTYLLW New to Irssi\t Tips for users that are new to Irssi$RESET$LTCYN
  [quit]\t$RESET$LTYLLW Quit/Exit\t Exit this script\n$RESET"
if $NOOPTS; then
    irsi_logs
    irsi_noob
    exit $?
else
    printf "\n$RESET$YELLOW
\t Please choose from the following$RESET$LTCYN Options...
  [1]\t$RESET$CYAN=>\tlogs$RESET$LTCYN
  [2]\t$RESET$CYAN=>\tinew$RESET$LTCYN
  [q]\t$RESET$CYAN=>\tquit\n$RESET
 [1|q]...(q)"
read IRSSIOPT
case $IRSSIOPT in
    "1")
        irsi_logs
        exit $?
    ;;
    "2")
        irsi_noob
        exit $?
    ;;
    "q")
        exit $?
    ;;
    *)
        exit $?
    ;;
esac
fi
}
#
function cust_ltlid
{
printf "\n\t$YELLOW$BOLD Set the power settings for laptop lid to NOT sleep-\n$RESET$LTYLLW
\t I run my web server in a VM on a laptop headlessly, so it\n  just sits in a closet on a shelf and I have no need to have \n  the lid open- By default the OS Laptop package sets it\n  to enter sleep on lid close.\n\t The better way maybe to not install that package, but-\n  I would not have this in the script! :P\n$RESET$LTCYN
  Edit /etc/systemd/logind.conf-$RESET$CYAN
  # vi /etc/systemd/logind.conf$RESET$LTCYN
  Add/Edit to show the following Value ...$RESET$LTMAG
  HandleLidSwitch=ignore$RESET$LTCYN
  Reboot the system and test\n$RESET$YELLOW
\t NOTE- I know there is a better way to reload the settings\n\t WITHOUT a reboot, butI did not have the time to research\n\t and will update with that and remove this line.\n$RESET
"
}
function cust_tips
{
echo -e "\n\t$YELLOW$BOLD Custom Configurations Tips and shortcuts-$RESET$YELLOW
\t  This is a living and growing  part of this script and we will be\n adding more Tips and Info...\n$RESET$LTCYN$BOLD
\t Here is the list of Options as of this release-$RESET$LTCYN
  [ltpw]\t$RESET$LTYLLW Laptop Lid\t Configure a laptop to be a headless server\n\t\t\t\t and manage power settings for Lid Close$RESET$LTCYN
  [quit]\t$RESET$LTYLLW Quit/Exit\t Exit this script\n$RESET"
if $NOOPTS; then
    clear
    cust_ltlid
    exit $?
else
    printf "\n$YELLOW
\t Please choose from the following$RESET$LTCYN Options...
  [1]\t$RESET$CYAN=>\tltpw$RESET$LTCYN
  [2]\t$RESET$CYAN=>\tnone$RESET$LTCYN
  [q]\t$RESET$CYAN=>\tquit\n$RESET
 [1|q]...(q)"
read IRSSIOPT
case $IRSSIOPT in
    "1")
        clear
        cust_ltlid
        exit $?
    ;;
    "2")
        echo "coming soon..."
        exit $?
    ;;
    "q")
        exit $?
    ;;
    *)
        exit $?
    ;;
esac
fi
}
#
function git_lab
{
printf "\n\t$YELLOW$BOLD GitLab Setup Beginning to end$RESET$LTYLLW

  Get files =>$CYAN
https://packages.gitlab.com/gitlab/gitlab-ce/packages/opensuse/42.2/gitlab-ce-10.3.1-ce.0.sles42.x86_64.rpm/download$YELLOW
\t(Or whatever distro in parent of that link)$LTYLLW
\tOR-
  Add the repos for your distro - this example uses OpenSUSE$LTMAG
  zypper ar https://packages.gitlab.com/gitlab/gitlab-ce/opensuse/42.3/x86_64 gitlab-ce
  zypper ar https://packages.gitlab.com/gitlab/gitlab-ce/opensuse/42.3/SRPMS gitlab-ce-src

  Install & Enable/Start Dependancies =>$LTCYN
\tPostfix
\tPostgresql$LTYLLW

  Open Firewall Port/s =>$LTMAG
sudo yast2 firewall services add tcpport=80,443,22,25,465,587 udpport=80,443,22,25,465,587 zone=EXT$LTYLLW

  Set Hostname & Install =>$LTMAG
EXTERNAL_URL=\"http://<FQDN>\" zypper install <rpm from above link>$LTYLLW
  OR-$LTMAG
EXTERNAL_URL=\"http://<FQDN>\" zypper install gitlab-ce$LTYLLW
  If Importing a backed-up instance, ensure the Versions match$LTMAG
EXTERNAL_URL=\"http://server.domain.com\" zypper install gitlab-ce=10.8.3-ce.0.sles42$LTYLLW

  Set Configuration =>$LTMAG
gitlab-ctl reconfigure$LTYLLW
\tVerify FQDN is in$LTCYN /etc/gitlab/gitlab.rb$LTYLLW

  Restart GitLab =>$LTMAG
gitlab-ctl restart
gitlab-ctl status$LTYLLW

  Initial UI Configuration in Browser =>$CYAN
\thttp://<FQDN>$LTYLLW
  On first opening of UI must reset Administrator (root) password$YELLOW
    Setup Users as needed
\tSetup Groups as needed
\tSetup Roles as needed\n$LTYLLW
  Importing github repos-$YELLOW
  The hard way-
    Follow instructions from$CYAN https://docs.gitlab.com/ee/user/project/import/github.html$LTYLLW
  The easy way-$YELLOW
    1. Login to your gitlab WebUI as YOUR User- NOT Admin/root
    2. Create a Group- assuming you dont have one already
      a.$LTCYN Groups$YELLOW from top toolbar =>$LTCYN New Group$YELLOW
    3. Click on the Group listed
    4.$LTCYN New Project => Import project => Repo by URL$YELLOW
      a. Copy/paste the url from your github repo into the$LTCYN Git repository URL$YELLOW field
      b. Populate the remaining fields as desired, ensuring that the Group Name under$LTCYN Project Path$YELLOW is correct
      c. Select$LTCYN Create Project$LTYLLW
    This will import your github repo along with the history from the commit logs.
    You cah now go into that repo in the WebUI and select either HTTP or SSH and copy that URL,
      and on your PC- cd to where you want the repo, and$LTMAG git clone <Paste-URL>$LTYLLW

Creating New Repos-$YELLOW
  1. Login to your gitlab WebUI as YOUR User- NOT Admin/root
  2. Create a Group- assuming you dont have one already
    a.$LTCYN Groups$YELLOW in top bar =>$LTCYN New Group$YELLOW
  3. Click on the Group listed
  4.$LTCYN New Project$YELLOW => Populate the fields as desired, ensuring that the Group Name under Project Path is correct
  5. Select$LTCYN Create Project$YELLOW
  6. Click the$LTCYN \"+\"$YELLOW drop-down in the upper toolbar, Select$LTCYN \"New file\"$YELLOW
  7. Name it what you want [README is good], and add some text, like a description...
  8. Save and commit the change
  You cah now go into that repo in the WebUI and select either HTTP or SSH and copy that URL,
    and on your PC- cd to where you want the repo, and$LTMAG \'git clone <Paste-URL>\'\n$LTYLLW
  Export gitlab-server from one server to another-\n$RESET
"
}
#
function git_branch
{
printf "\n\t$YELLOW$BOLD Working with branches in GIT$RESET$LTCYN
  Static Rules$CYAN
    1. Always pull before any push
    2. Don\'t pull branches from master
    3. If other branches, they each do same process$LTCYN
  Steps$CYAN
    1. Create <branch1>
    2. Checkout new branch
    3. Make changes
    4. Add/Commit
    5. Test
    6. Fix
    7. Add/Commit
    8. Test
    9. Add/commit/Pull/push
    10. Checkout master
    11. Merge <branch1>
\n$RESET"
}
#
function my_links
{
printf "\n$BOLD$LTYLLW    Links to other scripts, tutorials, etc. that are designed\n    to help, automate, or otherwise serve a purpose in daily life.$RESET$LTCYN
  seaphor\t$RESET$CYAN  System Information gathering script, it gathers MB, BIOS, GFX-Card, WLAN, LAN, OS, RAM, CPU, Disk, Repos, and more...$RESET
    https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/reports/sysinfo/seaphor-4.1-7$LTCYN
  c4-bug-report\t$CYAN  Script created to generate a bug report to CSV format, and can be adjusted to fit any needs. there is also an alpha TUI version I am working on, I will post both here...$RESET
    https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/reports/Bug-Report/Latest_Stable$RESET
\n"
}
#
function user_input
{
    echo -e "\n$BOLD$YELLOW    To ask the user for input to be set in a variable,
  EXAMPLE-$RESET$YELLOW Use the -p and the -s options for login credentials $RESET$LTCYN
    # Ask the user for login details
    printf \"Please enter your login credentials when prompted...\"
    read -p 'Username: ' uservar
    read -sp 'Password: ' passvar
    echo
    printf \"Thank you \$uservar we now have your login details\" $RESET$YELLOW
  Output in the Terminal-$RESET$BOLD$CYAN
    ./login.sh
    Username: ryan
    Password:
    Thank you ryan we now have your login details$RESET$LTYLLW

  Resource-$CYAN
    https://ryanstutorials.net/bash-scripting-tutorial/bash-input.php\n$RESET$YELLOW
  Now, there are 2 tnings you can do with these variables
    1. Use it within the script to execute other cammands passing
       the variables instead of prompting once or multiple times.$RESET$LTYLLW
  EXAMPLE- For the 1st Option, using the example above
      Say you wanted to pass a command to a/some different 
      box/es via ssh and didnt want to put that info in 
      your script, the lines would look something like... $RESET$LTCYN
    MYHOST=\"hostname -f\"
    MYOS=\"cat /etc/*release\"
    MYKERN=\"uname -r\"
    for i in \`cat hostlist.txt\`
    do
      sshpass -p \$passvar ssh \$uservar@\$i \$MYHOST && \$MYOS && \$MYKERN >> myhosts-details.txt
      echo >> myhosts-details.txt
    done$RESET$YELLOW
       
    2. Set the variable values to a [Local]'source' file
       to be used in subsequent runs of your script/s.$RESET$LTYLLW
  EXAMPLE- For the 2nd Option, using the example above$RESET$LTCYN
    if [[ ! -a ~/.myusercreds ]]; then
        # Ask the user for login details
        printf \"Please enter your login credentials when prompted...\"
        echo
        read -p 'Username: ' uservar
        read -sp 'Password: ' passvar
        echo
        printf \"Thank you \$uservar we now have your login details\"
        echo
        echo \"MYUSER=\$uservar\" > ~/.myusercreds
        echo \"MYPASS=\$passvar\" >> ~/.myusercreds
        chmod +x ~/.myusercreds
        source ~/.myusercreds
    else
        source ~/.myusercreds
    fi$RESET$LTYLLW

  Resource- Find out more about this and much more at...$RESET$CYAN
    https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/Sourcing$RESET
"
}
#
function custom_date
{
    echo -e "\n$BOLD$YELLOW   Using custom date command in scripts and/or cli$RESET$YELLOW
    In Scripts create Variables for date output/input$CYAN
TDATE=\`date +%a\ %b\ %d\ %Y\`
JDATE=\`date +%y%m%d-%H.%M.%S\`
WDATE=\"\`date +%U\ %Y\`\"$LTYLLW

Examples and outputs-$YELLOW
Casual$CYAN
$ date +%a\ %b\ %d\ %Y$LTCYN
Mon Apr 30 2018$YELLOW

International$CYAN
$ date +%d\ %b\ %Y$LTCYN
30 Apr 2018$YELLOW

Tech- filename$CYAN
$ date +%y%m%d-%H.%M.%S$LTCYN
180430-09.47.48$YELLOW

Week & Year$CYAN
$ date +%U\ %Y$LTCYN
17 2018$YELLOW

Year & Month Alpha$CYAN
$ date +%Y\ %B$LTCYN
2018 April$YELLOW

Year & Month Numeric$CYAN
$ date +%Y\ %m$LTCYN
2018 04$YELLOW

Year Month Day Numeric$CYAN
$ date +%Y\ %m\ %d$LTCYN
2018 04 30$YELLOW

Slashed$CYAN
$ date +%D$LTCYN
04/30/18$YELLOW

Casual-tech$CYAN
$ date +%Y\ %m\ %d\ %A$LTCYN
2018 04 30 Monday$YELLOW

Convert Epoc date/time into Human-Readable$CYAN
$ date -d @1521415551$LTCYN
Sun, Mar 18, 2018  6:25:51 PM$YELLOW

for log/output-filename$CYAN
date +%Y-%m-%d_%H-M$LTCYN
2018-04-30_09-53-27$YELLOW

for logging$CYAN
$ date +%Y-%m-%d_%H:%M$LTCYN
2018-04-30_09:53:27$YELLOW

Add a date/time-stamp to your history,$CYAN
add this to the end of your ~/.bash_profile or ~/.bashrc, then 'source' the one youe edited$LTCYN
export HISTTIMEFORMAT=\${HISTTIMEFORMAT:-\"%F %H:%M:%S \"}$LTYLLW
 1119  2018-08-03 16:33:23 vi Useful_Tips/useful-tips.sh\n$RESET"
}
#
function chk_cmd
{
    echo -e "\n$BOLD$YELLOW   Need to find out if a particular command is available?$RESET$LTYLLW
        You can use the 'which' command, but, in scripting most\n times you just need a yes/no answer.\n    Thats where 'type' command comes in...\n
       $YELLOW  Here's a script example...$LTCYN
type -P getent &>/dev/null && GETENT=true || GETENT=false
if \$GETENT; then
    USERPW=\"\`getent passwd \$1\`\"
else
    USERPW=\"cnf - getent - command not found...\"
fi
echo \"Result of getent passwd \$1 is - \$USERPW\"\n$RESET"
}
#
function for_cows
{
    echo -e "\n$BOLD$YELLOW   Silly little hack so you will have a fortune each time you log in\n$RESET$YELLOW
        Add or Uncomment and modify this to your users ~/.profile
	Or ad to /etc/skel/profile - Use any available ascii,
       	I chose dragon here\n$LTYLLW
	NOTE- You will need both fortune and cowsay installed$LTCYN

    if [ -x /usr/bin/fortune ] ; then
        echo
        /usr/bin/fortune | cowsay -f dragon
        echo
    fi\n$LTYLLW
        You can use$LTMAG $PROGNAME cows-info$LTYLLW to see a list of ascii 'cows' to use
	  Or, do$LTMAG ls /usr/share/cows/
    \n$RESET"
}
function cows_info
{
    echo -e "\n$BOLD$YELLOW   Here is a list of available 'cows' in my installation-\n$RESET$LTCYN
    ls /usr/share/cows/
beavis.zen.cow  dragon-and-cow.cow     hellokitty.cow  moofasa.cow    sodomized.cow    turtle.cow
bong.cow        dragon.cow             kiss.cow        moose.cow      stegosaurus.cow  tux.cow
bud-frogs.cow   elephant.cow           kitty.cow       mutilated.cow  stimpy.cow       udder.cow
bunny.cow       elephant-in-snake.cow  koala.cow       ren.cow        supermilker.cow  vader.cow
cheese.cow      eyes.cow               kosh.cow        satanic.cow    surgery.cow      vader-koala.cow
cower.cow       flaming-sheep.cow      luke-koala.cow  sheep.cow      telebears.cow    www.cow
daemon.cow      ghostbusters.cow       meow.cow        skeleton.cow   three-eyes.cow
default.cow     head-in.cow            milk.cow        small.cow      turkey.cow\n$LTYLLW
    For a quick preview of available cows, run the following-$BOLD$LTYLLW
    BUT- not all are appropriate for all audiences.\n$RESET$LTMAG
    for i in \`ls -1 /usr/share/cows/\`; do cowsay -f \$i \"\$i\"; sleep 3;  done\n$RESET"
}
#
function git_alias
{
    echo -e "\n$BOLD$YELLOW   Add these declarations to your users ~/.gitconfig for efficiency\n$RESET$YELLOW
[alias]$LTCYN
  co = checkout
  ci = commit -a -m
  st = status
  br = branch
  hist = log --pretty=format:\\\"%h %ad | %s%d [%an]\\\" --graph --date=short
  type = cat-file -t
  dump = cat-file -p
  last = log -1 HEAD\n
    \n$RESET"
}
#
function add_color
{
    echo -e "\n$BOLD$YELLOW\t   Add these Colors and effects to the output of your scripts-\n$RESET
    Output$RED
    \tRed$LTRED
    \tLight Red$GREEN
    \tGreen$LTGRN
    \tLight Green$CYAN
    \tCyan$LTCYN
    \tLight Cyan$BLUE
    \tBlue$LTBLU
    \tLight Blue$MAG
    \tMagenta$LTMAG
    \tLight Magenta$YELLOW
    \tYellow$LTYLLW
    \tLight Yellow$BOLD$CYAN
    \tAdd BOLD to the text
    $BGBLU$LTRED\tAdd Background Highlighting to the text$RESET
    $LTYLLW$ULINE\tAdd Underlining to the text$NULINE$RESET\n
 $LTYLLW I will add a '-info' for this and display how I do this in the script
  Or, you can just open this script and see for yourself$RED (_:^(|)$MAG [dead-Homer]\n$RESET"
}
#
###    END OF DEFINE FUNCTIONS
#
###########################################
### Define Execution
###########################################
#
case $1 in
    "help")
        #show_objective
        #sleep 5
        show_opts
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
    "meta-info")
        meta_info
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
        mon_troub
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
    "tabs")
        rep_tabs
        exit $?
    ;;
    "tabs-info")
        tabs_info
        exit $?
    ;;
    "seds")
        sed_cmds
        exit $?
    ;;
    "seds-info")
        seds_info
        exit $?
    ;;
    "pep8")
        clear
        pep_eight
        exit $?
    ;;
    "pep8-info")
        clear
        pep8_info
        exit $?
    ;;
    "irsi")
        clear
        irsi_tips
        exit $?
    ;;
    "cust")
        clear
        cust_tips
        exit $?
    ;;
    "gtbr")
        clear
        git_branch
        exit $?
    ;;
    "link")
        clear
        my_links
        exit $?
    ;;
    "gitl")
        clear
        git_lab
        exit $?
    ;;
    "gtal")
        clear
        git_alias
        exit $?
    ;;
    "read")
        clear
        user_input
        exit $?
    ;;
    "date")
        clear
        custom_date
        exit $?
    ;;
    "type")
        clear
        chk_cmd
        exit $?
    ;;
    "cows")
        clear
        for_cows
        exit $?
    ;;
    "cows-info")
        clear
        cows_info
        exit $?
    ;;
    "colr")
        clear
        add_color
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
#   ChangeLog
#@CLN Need to fix the '%u' in the sftp option
#   FIXED it with
#   PASSP=`echo '/sftp/chroot/home/%' | sed -e 's/$/u/' `
#   Chrootdirectory$RESET $PASSP
#     
#   Added a Objective section
#   Added mon_troub [umnt] optio for monitoring an issue witn nmon
#   Added a Information section- append option with -info to get full description- not all have yet, only 'meta'
#     Added read option for variablizing user input and promote to 02 & Latest
#     Added date option for Using custom date command in scripts and/or cli, merging branch and ptomoting to Latest
#
#  Added import/create repos to gitlab setup- promote to 05
#    Added type option for type cmd - promote to 06
#
#
