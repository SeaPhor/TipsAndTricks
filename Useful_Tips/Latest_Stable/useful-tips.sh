#!/usr/bin/env bash
#
##    useful-tips
##    Author       - Shawn Miller
##    Date         - 2018 02 15
##    Colaborators - 
#
###########################################
####    Global Variables
###########################################
#
PROGNAME=$(basename $0)
PROGVERS="0.0.2-07"
PROGDATE="18 Sep 2018"
MYOPT="$1"
#
#####################################################################
#####                   GNU/GPL Info
#####################################################################
#
gpl_info () {
    cat <<EOT
${LTCYN}
####c4#############################################################################
###                                                                             ###
##                      GNU/GPL Info                                             ##
##        useful-tips.sh ver-0.0.0-01 - Colaborative begun 15 February 2018	 ##
##      Released under GPL v2.0, See www.gnu.org for full license info           ##
##      Copyright (C) 2015  Shawn Miller, The Wood-Bee Company			 ##
##              EMAIL- shawn@woodbeeco.com                                       ##
##                   - seaphor@woodbeeco.com                                     ##
##  This program is free software; you can redistribute it and/or modify         ##
##    it under the terms of the GNU General Public License as published by       ##
##    the Free Software Foundation; either version 2 of the License, or          ##
##    (at your option) any later version.                                        ##
##                                                                               ##
##    This program is distributed in the hope that it will be useful,            ##
##    but WITHOUT ANY WARRANTY; without even the implied warranty of             ##
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              ##
##    GNU General Public License for more details.                               ##
##                                                                               ##
##    See this complete License at:                                              ##
##    https://github.com/SeaPhor/SeaPhor-Scripts/blob/master/LICENSE		 ##
###                                                                             ###
####w#################################b######################################c#####${RESET}
EOT
}
#
###########################################
####    Declare Variables
###########################################
#
if [[ "`echo $2`" == "quiet" ]]; then
    NOOPTS=true
else
    NOOPTS=false
fi
#
### Color Variables [Delete unused variables when done]
#
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAG="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
LTRED="$(tput setaf 9)"
LTGRN="$(tput setaf 10)"
LTYLLW="$(tput setaf 11)"
LTBLU="$(tput setaf 12)"
LTMAG="$(tput setaf 13)"
LTCYN="$(tput setaf 14)"
#
BLRED=${BOLD}${LTRED}
BLYLW=${BOLD}${LTYLLW}
BYLW=${BOLD}${YELLOW}
BLCYN=${BOLD}${LTCYN}
BCYN=${BOLD}${CYAN}
#
BGBLU="$(tput setab 4)"
BGYLLW="$(tput setab 3)"
BGLYLLW="$(tput setab 11)"
#
ULINE="$(tput smul)"
NULINE="$(tput rmul)"
SOMODE="$(tput smso)"
NSOMODE="$(tput rmso)"
BOLD="$(tput bold)"
RESET="$(tput sgr0)"
#
###########################################
### Define Functions
###########################################
#
### Sticky- Keep at top
show_objective () {
    clear
    cat <<EOT

${LTYLLW}${BOLD}    Objective- Effective Code Writing and Execution${RESET}${LTCYN}
  1. Evaluate conditions
  2. Take actions
  3. Carry out tasks, repeat some of them${LTYLLW} [with functions and variables- NOT code]${LTCYN}
  4. Cleanup and close. ${LTYLLW}
    Desired End Results${LTCYN}
  1. Must be OS/Release Agnostic
  2. Must be scalable and allow for growth
  3. Must be adaptable- able to adjust with changed/better tools easily${LTYLLW} [variables]${LTCYN}
  4. Must be portable
  5. Must have structure, order, and Comments for easy reading/debugging
  6. Must use The${BOLD}${LTYLLW} DRY${RESET}${LTCYN} (${BOLD}${LTYLLW}D${RESET}${LTCYN}on't ${BOLD}${LTYLLW}R${RESET}${LTCYN}epeat ${BOLD}${LTYLLW}Y${RESET}${LTCYN}ourself) principle, which states that you
     should never repeat the same piece of code more than once in your application${RESET}

${YELLOW}${BOLD}    PEP8 Compliance Guidelines and suggested Resolution${LTYLLW}
    PEP8 is technically for Python coding but we believe it is a good
  standard for all coding.${YELLOW}
  Find more at${CYAN}
https://www.datacamp.com/community/tutorials/pep8-tutorial-python-code
 And Here-  https://www.python.org/dev/peps/pep-0008/${RESET}

EOT
}
#
show_opts () {
    clear
    cat <<EOT
${LTCYN}${BOLD}
${SOMODE}Usage-${NSOMODE}${RESET}${GREEN}
  sh ${PROGNAME}${YELLOW} [${LTCYN}option${YELLOW}|${LTCYN}option${GREEN}-info${YELLOW}] optional 2nd arg- [${GREEN}quiet${YELLOW}] for non-interactive
  Some options have an 'INFO' option- Add '${GREEN}-info${YELLOW}' to the option to get more detailed description-
  EXAMPLES-${GREEN}
    ${PROGNAME} pep8
    ${PROGNAME} pep8 quiet
    ${PROGNAME} meta-info${LTCYN}${BOLD}
${SOMODE}Options-${NSOMODE}${RESET}${YELLOW}
  ${ULINE}Option    Short Desc.   Description${LTCYN}${NULINE}
  [    ]${BOLD}    None       ${RESET}${LTCYN}   Shows this menu and exits. same as help
  [help]${BOLD}    Help       ${RESET}${LTCYN}   Shows the entire menu and exits
  [sobj]${BOLD}    Objective  ${RESET}${LTCYN}   Show the Objective for this script and all coding, commands, and structure.
  [vers]${BOLD}    Version    ${RESET}${LTCYN}   Shows this revision's Verion and exits.
  [meta]${BOLD}    Meta Chars${RESET}${LTCYN}    Shows ways to remove files with names that are meta-characters including by-inode number.
  [lvmn]${BOLD}    LVM Notes${RESET}${LTCYN}     Shows LVM management for adding a disk.
  [tool]${BOLD}    Useful Tools${RESET}${LTCYN}  Tools- Security, Monitoring, and troubleshooting
  [umnt]${BOLD}    Monitor Tips${RESET}${LTCYN}  Tips for Monitoring and troubleshooting
  [vims]${BOLD}    VIM Tips${RESET}${LTCYN}      Helpful vim shortcuts and tips.
  [pend]${BOLD}    Prepend${RESET}${LTCYN}       Prepend the beginning of every line in a file OR ${BOLD}Append${RESET}${LTCYN} to the end of every line in a file.
  [seds]${BOLD}    Sed Stuff${RESET}${LTCYN}     Helpful Replacement shortcuts and tips- sed, tr, etc.
  [emty]${BOLD}    Empty Lines${RESET}${LTCYN}   Remove Empty Lines in a file, including white-space, tabs, and commented lines.
  [sftp]${BOLD}    SFTP Chroot${RESET}${LTCYN}   Create a secure SFTP environment using a chroot-jail file system structure.
  [susr]${BOLD}    UserAdd SFTP${RESET}${LTCYN}  Create a secure SFTP user and password with hash, in a chroot-jail environment.
  [expr]${BOLD}    Expressions${RESET}${LTCYN}   Full list and explanation of Conditional and Regular Expressions.
  [pep8]${BOLD}    PEP8 Tools${RESET}${LTCYN}    PEP8 Living Doc- Code compliane structure and tips.
  [irsi]${BOLD}    IRSSI Tips${RESET}${LTCYN}    IRSSI Living Doc- Helpful Info and tips.
  [link]${BOLD}    My Links${RESET}${LTCYN}      Links to various helpful tools, tips, tutorials, etc.
  [read]${BOLD}    User Input${RESET}${LTCYN}    Request user input in bash script, supress the stdin/out
  [date]${BOLD}    Custom Date${RESET}${LTCYN}   Using custom date command in scripts and/or cli
  [type]${BOLD}    Type Command${RESET}${LTCYN}  Using the type command to find other command in scripting.
  [colr]${BOLD}    Add Colors${RESET}${LTCYN}    Add colors and effects to the output of your scripts and commands.
  [cows]${BOLD}    Login Profile${RESET}${LTCYN} Silly little hack so you will have a fortune each time you log in. -Also has cows-info
  [gtal]${BOLD}    Git Aliases${RESET}${LTCYN}   Add Aliases to short-cuts to git commands in ~/.gitconfig
  [gtbr]${BOLD}    Git Branches${RESET}${LTCYN}  Working with Branches in GIT
  [gitl]${BOLD}    GitLab Setup${RESET}${LTCYN}  Setup your own GitLab Server from Beginning to end.
  [rpmb]${BOLD}    RPM Build${RESET}${LTCYN}     How to Build your own rpms, a script or source code.
  [tars]${BOLD}    Tar Command${RESET}${LTCYN}   Common uses of the tar command
  [math]${BOLD}    Simple Math${RESET}${LTCYN}   Performing simple math in the command line and scripting
${RESET}
EOT
}
#
[[ ${MYOPT} ]] || { show_opts; echo -e "\t${BOLD}${RED}Requires at least 1 parameter\n${RESET}"; exit 1; }
#
set_chroot () {
	cat <<EOT

${LTCYN}${BOLD}    Create a secure SFTP environment with chroot-jailed users.
    There are some things are required before this will function properly-${RESET}${YELLOW}
  The base file structure must exist and${BOLD} MUST be OWNED by root${RESET}${YELLOW},
  preferably on it's own partition [see lvmn option]
    For this example we'll use /sftp/chroot/home/ as the 'root'
    of the chroot environment.${LTCYN}${BOLD}
  Requirements- ${RESET}${LTRED}
    1. Create the sftp group to be jailed [example below- 'sftponly' ]
    2. Set the sftp directive in /etc/ssh/sshd_config [example below]
    3. Set the Match group directive in /etc/ssh/sshd_config [example below]${LTRED}${BOLD}
    ${ULINE}4. The user's home directory MUST be owned by root!!!  [example below]${NULINE}${RESET}${LTRED}
     Any and all sub-directories under that should be owned by the user and sftp-group.
    5. Best-Practices- Limit who can login by Group or specific users [example below]
    6. Best-Practices- Limit root login to ONLY use PRIVATE RSA-Keys [example below]${YELLOW}

  EXAMPLE Home directory ownership-${LTCYN}
# ls -l /sftp/chroot/home/
drwxr-xr-x 10 root sftponly 4096 Mar 16 12:15 sftpuser${YELLOW}

  EXAMPLE /etc/ssh/sshd_config -${LTYLLW}
PermitRootLogin${CYAN} without-password${YELLOW}
  #Replace 'Subsystem' line with${LTCYN}${BOLD} internal-sftp${YELLOW} as below${LTYLLW}
Subsystem${GREEN}    sftp${CYAN}    internal-sftp${RESET}${LTYLLW}
AllowGroups${GREEN}    LinuxAdmins crew colab sftponly root${LTYLLW}
Match${GREEN} group sftponly,!wheel,!users,!colab,!LinuxAdmins${YELLOW} #The '!' means NOT this group${LTYLLW}
    ForceCommand${CYAN} internal-sftp${LTYLLW}
    AllowTcpForwarding${CYAN} no${LTYLLW}
    Chrootdirectory${GREEN} /sftp/chroot/home/${LTCYN}%u${RESET}

EOT
make_users
}
#
make_users () {
	cat <<EOT
${LTCYN}${BOLD}    Create a secure user and password with hashed pasword${RESET}${YELLOW}
  Create the User Password and Hash-${GREEN}
# openssl rand -base64 15 > username.txt && cat username.txt | openssl passwd -1 -stdin >> username.txt && cat username.txt${YELLOW}
  Output-${LTCYN}
5t5sYKAhwkY6sQ2URteuL${YELLOW}  < Password${LTCYN}
 \$1fJ4L4f9NEoNwFxUtRVsoTQ.TVLot/gJ/${YELLOW}  < Password Hash
  Create the user-${GREEN}
# useradd -s /bin/false -c "SFTP User" -m -d /sftp/chroot/home/username -g sftponly username${YELLOW}
  This will create the user 'username' and chroot-jail it to /sftp/chroot/home/username
  Now set the user's password with 'passwd username' and copy/paste the password generated
  The Hash is used if you are managing users with Puppet... Discussed in Puppet SetUp.${RESET}

EOT
}
#
vim_cmds () {
	cat <<EOT
${LTCYN}${BOLD}    Helpful vim shortcuts and tips${RESET}${YELLOW}
  Deleting -${RESET}${LTYLLW}
    x      - delete current character
    dw     - delete current word
    3dw    - delete next 3 words from current word
    dd     - delete current line
    5dd    - delete five lines
    d$     - delete to end of line
    d0     - delete to beginning of line
    :1,.d  - delete to beginning of file
    :.,\$d  - delete to end of file${RESET}${YELLOW}
  Resource- vi/vim delete commands and examples${RESET}${CYAN}
  https://alvinalexander.com/linux/vi-vim-delete-line-commands-to-end${RESET}${YELLOW}

 Search and Replace-${RESET}${LTYLLW}
    :%s/search/replace/gc    - Ask for confirmation before substitution.${RESET}${YELLOW}

  Resource- Vim tips: The basics of search and replace${RESET}${CYAN}
  https://www.linux.com/learn/vim-tips-basics-search-and-replace${RESET}

EOT
}
#
rem_emty () {
	cat <<EOT
${LTCYN}${BOLD}    Remove Empty Lines in a file, including white-space and tabs...${RESET}${YELLOW}
Using sed example-${RESET}${CYAN}
# cat /etc/apache2/httpd.conf | grep -v '^#' | sed '/^\s*$/d'${RESET}${YELLOW}
Using tr and awk to parse a file with 4 digit strings within brackets,
 and then have the output linier rather than vertical,
 and then remove the leading bracket-${RESET}${CYAN}

# cat myfile.txt | grep "\[....\]" | awk -F] '{print \$1}' | tr -d '\n' | tr -d '['${RESET}

EOT
}
#
rem_meta () {
	cat <<EOT

${LTCYN}${BOLD}    Removing files with special characters and by inode-${RESET}${CYAN}
https://www.linux.com/blog/linux-shell-tip-remove-files-names-contains-spaces-and-special-characters-such${RESET}${LTMAG}
Tip #1: Put filenames in quotes
Tip #3: Try a ./ at the beginning of the filename or absolute path
Tip #4: Try a -- at the beginning of the filename${RESET}${YELLOW}
Tip #5: Remove file by an inode number
# ls -li${RESET}${LTYLLW} #Find the inode <nnnnnnn> of the file${RESET}${YELLOW}
# find . -inum <nnnnnnn> -delete
# find . -inum <nnnnnnn> -exec rm -i {} \;${RESET}${LTYLLW}
If you just typo'd and want to keep the file-${RESET}${YELLOW}
# find . -inum <nnnnnnn> -exec cp {} <goodname> \;${RESET}${LTYLLW}
  OR ${RESET}${YELLOW}
# find . -inum <nnnnnnn> -exec cp -a {} <goodname> \;${RESET}

EOT
}
#
meta_info () {
	cat <<EOT

${LTCYN}${BOLD}    Removing files with special characters and by inode-${RESET}${CYAN}
https://www.linux.com/blog/linux-shell-tip-remove-files-names-contains-spaces-and-special-characters-such${RESET}${LTYLLW}
    Sometimes we find, or create a file with special characters, a '-' prepending the filename, or other special characters in the filename that prevents us from being able to move, copy, or delete them, and outputs an error- [${RESET}${LTRED} <partial-filename> No such file...${RESET}${LTYLLW} ].
    This Option gives a few ways to accomplish what we need to do.${RESET}

EOT
}
#
###    Monitoring and Troubleshooting
mon_troub () {
	cat <<EOT

    SWTCHBLU=$RESET$LTBLU'F2'$RESET$LTMAG
    SWTCHBLUG=$RESET$LTBLU'G2:G10'$RESET$LTMAG
${YELLOW}${BOLD}    Useful Monitoring and Troubleshooting Information${RESET}${LTYLLW}
  NMON-${RESET}${LTCYN}
    Testing an issue with a known method to reproduce...
  in this case CPU & Top processes for a specific
  block of time in which to record the data for debugging.
    The command below will take a snapshot of all
  details of CPU usage- Every 20 seconds for 15 iterations [5 minutes]
  The -- 'c' is to tell nmon to only collect CPU info
  -- 'm' would be Memory,, etc.${RESET}${LTMAG}
  # nmon -ft -s 20 -c 15 -- 'c'${RESET}${LTCYN}
    This will create a '.csv'-type file with an 'nmon' extension
  in your Present Working Direcory[PWD].${RESET}${LTYLLW}
    Optional-${RESET}${YELLOW} Parsing the generated PWD/file.nmon for just the data
  and format that I want...${RESET}${LTMAG}
  # cat hostname_date_time.nmon | grep "^[C,Z]" >> hostname_date_time.nmon.csv
  # cat hostname_date_time.nmon | grep ^T >> hostname_date_time.nmon.csv${RESET}${LTYLLW}
 EXAMPLE-${RESET}${YELLOW} My edited version, and only showing 1 instance-${RESET}${LTBLU}
Row     |Col-A  |Col-B  |Col-C  |Col-D  |Col-E  |Col-F  |Col-G  |
--------|-------|-------|-------|-------|-------|-------|-------|${RESET}${LTCYN}
00      |CPUs   |time   |usr    |sys    |inuse  |Idle   |Status |${RESET}${CYAN}
01      |ZZZZ   |T0004  |10:21:31 19-MAR-2018   |       |ALERT  |
02      |CPU001 |T0004  |5.9    |8.5    |6.5    |79.1   |TRUE   |
03      |CPU002 |T0004  |2.4    |4.2    |0.9    |92.6   |FALSE  |
04      |CPU003 |T0004  |13.4   |30.1   |0.9    |55.7   |TRUE   |
05      |CPU004 |T0004  |4.2    |4.5    |2.8    |88.5   |TRUE   |
06      |CPU005 |T0004  |5.8    |21.2   |1.3    |71.7   |TRUE   |
07      |CPU006 |T0004  |6.9    |7      |0.8    |85.3   |TRUE   |
08      |CPU007 |T0004  |5.5    |11.2   |10.8   |72.4   |TRUE   |
09      |CPU008 |T0004  |1.8    |4.3    |1.6    |92.3   |FALSE  |
10      |CPU_ALL|T0004  |5.7    |11.4   |3.2    |79.7   |TRUE   |${RESET}${LTYLLW}
  I added the 'Status' collumn, and used 2 formulas
  for generating the status automattically
  The 'TRUE/FALSE' has a value of '0' or '1', formula-${RESET}${LTMAG}
  fn[=IF(SUBTOTAL(9,${RESET}${LTBLU}'F2'${RESET}${LTMAG})<90)]${RESET}${LTYLLW}
    And the 'ALERT' has a value of 'ALERT' or 'OK'
  generated by the SUM of the T|F values${RESET}${LTMAG}
  fn[=IF(SUM(${RESET}${LTBLU}'G2:G10'${RESET}${LTMAG})>0,"ALERT","OK")]${RESET}${LTYLLW}
    The 'TOP' process for that time [T0004] is what we're
  interested in finding what is happening at the time...-${RESET}${CYAN}
TOP T0004   69.26   37.68   31.58   lr402.x86_64${RESET}${LTYLLW}
    So the${RESET}${CYAN} 'lr402.x86_64'${RESET}${LTYLLW} is the main culpret, we can
  look at next-higest, but I knew what I was looking for.${RESET}

EOT
}
#
###    Conditionam and Regular Expressions
#
cond_expr () {
    clear
    cat <<EOT
${BLYLW}    Bash Conditional Expressions${RESET}${LTYLLW}
Conditional expressions are used by the [[ compound command and the test and [ builtin commands.${LTCYN}

-a${YELLOW}|${LTCYN}e file${YELLOW}    True if file exists..${LTCYN} 
-b file${YELLOW}      True if file exists and is a block special file..${LTCYN}
-c file${YELLOW}      True if file exists and is a character special file..${LTCYN}
-d file${YELLOW}      True if file exists and is a directory..${LTCYN}
-f file${YELLOW}      True if file exists and is a regular file..${LTCYN}
-g file${YELLOW}      True if file exists and its set-group-id bit is set..${LTCYN}
-h${YELLOW}|${LTCYN}L file${YELLOW}    True if file exists and is a symbolic link..${LTCYN}
-k file${YELLOW}      True if file exists and its "sticky" bit is set..${LTCYN}
-p file${YELLOW}      True if file exists and is a named pipe (FIFO)..${LTCYN}
-r file${YELLOW}      True if file exists and is readable..${LTCYN}
-s file${YELLOW}      True if file exists and has a size greater than zero..${LTCYN}
-t fd${YELLOW}        True if file descriptor fd is open and refers to a terminal..${LTCYN}
-u file${YELLOW}      True if file exists and its set-user-id bit is set..${LTCYN}
-w file${YELLOW}      True if file exists and is writable..${LTCYN}
-x file${YELLOW}      True if file exists and is executable..${LTCYN}
-G file${YELLOW}      True if file exists and is owned by the effective group id..${LTCYN}
-N file${YELLOW}      True if file exists and has been modified since it was last read..${LTCYN}
-O file${YELLOW}      True if file exists and is owned by the effective user id..${LTCYN}
-S file${YELLOW}      True if file exists and is a socket..${RESET}

EOT
read -p "${BLYLW}Press${BLCYN} [ENTER]${BLYLW} or any key to cotinnue, or press '${BLCYN}q${BLYLW}' to Quit...${RESET}
" mychoice
[[ $mychoice = q ]] && exit 0 || read_expr
}
#
conex_oper () {
    clear
    cat <<EOT

${BLYLW}    Extended Conditional Expression Operators${RESET}${LTYLLW}
file1 -ef file2
    True if file1 and file2 refer to the same device and inode numbers.${LTYLLW}
file1 -nt file2${LTCYN}
    True if file1 is newer (according to modification date) than file2, or if file1 exists and file2 does not.${LTYLLW}
file1 -ot file2${LTCYN}
    True if file1 is older than file2, or if file2 exists and file1 does not.${LTYLLW}
-o optname${LTCYN}
    True if the shell option optname is enabled. The list of options appears in the description of the -o option to the set builtin (see The Set Builtin).${LTYLLW}
-v varname${LTCYN}
    True if the shell variable varname is set (has been assigned a value).${LTYLLW}
-R varname${LTCYN}
    True if the shell variable varname is set and is a name reference.${LTYLLW}
-z string${LTCYN}
    True if the length of string is zero.${LTYLLW}
-n string${LTCYN}
string
    True if the length of string is non-zero.${LTYLLW}
string1 == string2
string1 = string2${LTCYN}
    True if the strings are equal. When used with the [[ command, this performs pattern matching as described above (see Conditional Constructs).${LTYLLW}
    ‘=’ should be used with the test command for POSIX conformance.
string1 != string2${LTCYN}
    True if the strings are not equal.${LTYLLW}
string1 < string2${LTCYN}
    True if string1 sorts before string2 lexicographically.${LTYLLW}
string1 > string2${LTCYN}
    True if string1 sorts after string2 lexicographically.${RESET}

EOT
read -p "${BLYLW}Press${BLCYN} [ENTER]${BLYLW} or any key to cotinnue, or press '${BLCYN}q${BLYLW}' to Quit...${RESET}
" mychoice
[[ $mychoice = q ]] && exit 0 || read_expr
}
#
arith_oper () {
    clear
    cat <<EOT

${BOLD}${LTYLLW}    Arithmetic binary Operators${RESET}${LTYLLW}
arg1${LTCYN} OP${LTYLLW} arg2${LTCYN}
    OP is one of${BOLD} ‘-eq’, ‘-ne’, ‘-lt’, ‘-le’, ‘-gt’, or ‘-ge’.${RESET}${LTYLLW}
    These arithmetic binary operators return true if arg1 is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to arg2, respectively. Arg1 and arg2 may be positive or negative integers.${BOLD}
EXAMPLE-${RESET}${LTCYN}
[[ \$# -ne 1 ]] && { echo "Requires 1 argument"; exit 1; }${RESET}

EOT
read -p "${BLYLW}Press${BLCYN} [ENTER]${BLYLW} or any key to cotinnue, or press '${BLCYN}q${BLYLW}' to Quit...${RESET}
" mychoice
[[ $mychoice = q ]] && exit 0 || read_expr
}
#
regex_oper () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}    Regular expression operators${YELLOW}${ULINE}
Operator	Effect${NULINE}${RESET}${LTCYN}
.${LTYLLW}	Matches any single character.${LTCYN}
?${LTYLLW}	The preceding item is optional and will be matched, at most, once.${LTCYN}
*${LTYLLW}	The preceding item will be matched zero or more times.${LTCYN}
+${LTYLLW}	The preceding item will be matched one or more times.${LTCYN}
{N}${LTYLLW}	The preceding item is matched exactly N times.${LTCYN}
{N,}${LTYLLW}	The preceding item is matched N or more times.${LTCYN}
{N,M}${LTYLLW}	The preceding item is matched at least N times, but not more than M times.${LTCYN}
-${LTYLLW}	represents the range if it's not first or last in a list or the ending point of a range in a list.${LTCYN}
^${LTYLLW}	Matches the empty string at the beginning of a line; also represents the characters not in the range of a list.${LTCYN}
\$${LTYLLW}	Matches the empty string at the end of a line.${LTCYN}
\b${LTYLLW}	Matches the empty string at the edge of a word.${LTCYN}
\B${LTYLLW}	Matches the empty string provided it's not at the edge of a word.${LTCYN}
\<${LTYLLW}	Match the empty string at the beginning of word.${LTCYN}
\>${LTYLLW}	Match the empty string at the end of word.${LTYLLW}

Basic versus extended regular expressions
In basic regular expressions the metacharacters${LTCYN} "?", "+", "{", "|", "(",${LTYLLW} and${LTCYN} ")"${LTYLLW} lose their special meaning; instead use the backslashed versions${LTCYN} "\?", "\+", "\{", "\|", "\(",${LTYLLW} and${LTCYN} "\)".${RESET}

EOT
read -p "${BLYLW}Press${BLCYN} [ENTER]${BLYLW} or any key to cotinnue, or press '${BLCYN}q${BLYLW}' to Quit...${RESET}
" mychoice
[[ $mychoice = q ]] && exit 0 || read_expr
}
#
grep_examp () {
    clear
    cat <<EOT

${BOLD}${LTYLLW}    Examples With grep and Character Classes${RESET}${LTYLLW}
Line and word anchors
From the previous example, we now exclusively want to display lines starting with the string "root":${GREEN}

cathy ~> grep ^root /etc/passwd${LTCYN}
root:x:0:0:root:/root:/bin/bash${LTYLLW}

If we want to see which accounts have no shell assigned whatsoever, we search for lines ending in ":":${GREEN}

cathy ~> grep :$ /etc/passwd${LTCYN}
news:x:9:13:news:/var/spool/news:${LTYLLW}

To check that PATH is exported in ~/.bashrc, first select "export" lines and then search for lines starting with the string "PATH", so as not to display MANPATH and other possible paths:${GREEN}

cathy ~> grep export ~/.bashrc | grep '\<PATH'${LTCYN}
  export PATH="/bin:/usr/lib/mh:/lib:/usr/bin:/usr/local/bin:/usr/ucb:/usr/dbin:\$PATH"${LTYLLW}

Similarly, \> matches the end of a word.

If you want to find a string that is a separate word (enclosed by spaces), it is better use the -w, as in this example where we are displaying information for the root partition:${GREEN}

cathy ~> grep -w / /etc/fstab${LTCYN}
LABEL=/                 /                       ext3    defaults        1 1${LTYLLW}
If this option is not used, all the lines from the file system table will be displayed.

Character classes

A bracket expression is a list of characters enclosed by "[" and "]". It matches any single character in that list; if the first character of the list is the caret, "^", then it matches any character NOT in the list. For example, the regular expression "[0123456789]" matches any single digit.

Within a bracket expression, a range expression consists of two characters separated by a hyphen. It matches any single character that sorts between the two characters, inclusive, using the locale's collating sequence and character set. For example, in the default C locale, "[a-d]" is equivalent to "[abcd]". Many locales sort characters in dictionary order, and in these locales "[a-d]" is typically not equivalent to "[abcd]"; it might be equivalent to "[aBbCcDd]", for example. To obtain the traditional interpretation of bracket expressions, you can use the C locale by setting the LC_ALL environment variable to the value "C".${GREEN}

cathy ~> grep [yf] /etc/group${LTCYN}
sys:x:3:root,bin,adm
tty:x:5:
mail:x:12:mail,postfix
ftp:x:50:
nobody:x:99:
floppy:x:19:
xfs:x:43:
nfsnobody:x:65534:
postfix:x:89:${LTYLLW}

In the example, all the lines containing either a "y" or "f" character are displayed.
4.2.2.3. Wildcards

Use the "." for a single character match. If you want to get a list of all five-character English dictionary words starting with "c" and ending in "h" (handy for solving crosswords):${GREEN}

cathy ~> grep '\<c...h\>' /usr/share/dict/words${LTCYN}
catch
clash
cloth
coach
couch
cough
crash
crush${LTYLLW}

If you want to display lines containing the literal dot character, use the -F option to grep.

For matching multiple characters, use the asterisk. This example selects all words starting with "c" and ending in "h" from the system's dictionary:${GREEN}

cathy ~> grep '\<c.*h\>' /usr/share/dict/words${LTCYN}
caliph
cash
catch
cheesecloth
cheetah${LTYLLW}

If you want to find the literal asterisk character in a file or output, use single quotes. Cathy in the example below first tries finding the asterisk character in /etc/profile without using quotes, which does not return any lines. Using quotes, output is generated:${GREEN}

cathy ~> grep * /etc/profile
cathy ~> grep '*' /etc/profile${LTCYN}
for i in /etc/profile.d/*.sh ; do${LTYLLW}

Pattern matching using Bash features
 Character ranges${GREEN}

cathy ~> touch "*"
cathy ~> ls "*"${LTYLLW}

But you can also use the square braces to match any enclosed character or range of characters, if pairs of characters are separated by a hyphen. An example:${GREEN}

cathy ~> ls -ld [a-cx-z]*${LTCYN}
drwxr-xr-x    2 cathy	 cathy		4096 Jul 20  2002 app-defaults/
drwxrwxr-x    4 cathy    cathy          4096 May 25  2002 arabic/
drwxrwxr-x    2 cathy    cathy          4096 Mar  4 18:30 bin/
drwxr-xr-x    7 cathy    cathy          4096 Sep  2  2001 crossover/
drwxrwxr-x    3 cathy    cathy          4096 Mar 22  2002 xml/${LTYLLW}

This lists all files in cathy's home directory, starting with${LTCYN} "a", "b", "c", "x", "y" or "z".${LTYLLW}

If the first character within the braces is "!" or "^", any character not enclosed will be matched. To match the dash ("-"), include it as the first or last character in the set. The sorting depends on the current locale and of the value of the LC_COLLATE variable, if it is set. Mind that other locales might interpret "[a-cx-z]" as "[aBbCcXxYyZz]" if sorting is done in dictionary order. If you want to be sure to have the traditional interpretation of ranges, force this behavior by setting LC_COLLATE or LC_ALL to "C".

Character classes

Character classes can be specified within the square braces, using the syntax [:CLASS:], where CLASS is defined in the POSIX standard and has one of the values${LTCYN}

"alnum", "alpha", "ascii", "blank", "cntrl", "digit", "graph", "lower", "print", "punct", "space", "upper", "word" or "xdigit".${LTYLLW}

Some examples:${GREEN}

cathy ~> ls -ld [[:digit:]]*${LTCYN}
drwxrwxr-x    2 cathy	cathy		4096 Apr 20 13:45 2/${GREEN}

cathy ~> ls -ld [[:upper:]]*${LTCYN}
drwxrwxr--    3 cathy   cathy           4096 Sep 30  2001 Nautilus/
drwxrwxr-x    4 cathy   cathy           4096 Jul 11  2002 OpenOffice.org1.0/
-rw-rw-r--    1 cathy   cathy         997376 Apr 18 15:39 Schedule.sdc${LTYLLW}

When the extglob shell option is enabled (using the shopt built-in), several extended pattern matching operators are recognized. Read more in the Bash info pages, section Basic shell features->Shell Expansions->Filename Expansion->Pattern Matching.${RESET}

EOT
read -p "${BLYLW}Press${BLCYN} [ENTER]${BLYLW} or any key to cotinnue, or press '${BLCYN}q${BLYLW}' to Quit...${RESET}
" mychoice
[[ $mychoice = q ]] && exit 0 || read_expr
}
#
read_expr () {
    clear
    echo -e "\n${BLYLW}    There are many sections in Conditional and Regular Expressions
    we have divided this into sub-sections...${BLCYN}
    Please select one of the following options for the section you wish-${BLYLW}
  1 -${BLCYN}    Bash Conditional Expressions${BLYLW}
  2 -${BLCYN}    Extended Conditional Expression Operators${BLYLW}
  3 -${BLCYN}    Arithmetic binary Operators${BLYLW}
  4 -${BLCYN}    Regular expression operators${BLYLW}
  5 -${BLCYN}    Examples With grep and Character Classes${BLYLW}
  q -${BLCYN}    Quit\n${RESET}"
    read MYEXPR
    case $MYEXPR in
	    1)
		    cond_expr
		    ;;
	    2)
		    conex_oper
		    ;;
	    3)
		    arith_oper
		    ;;
	    4)
		    regex_oper
		    ;;
	    5)
		    grep_examp
		    ;;
	    q)
		    exit 0
		    ;;
    esac
}
#
def_expres () {
	cat <<EOT

${YELLOW}${BOLD}    You can find the expressions.txt at -${RESET}${LTCYN}
# wget http://woodbeeco.com/scripts/expressions.txt$YELLOW
 or${RESET}${LTCYN}
# https://github.com/SeaPhor/SeaPhor-Scripts${RESET}

EOT
read_expr
}
#
lvm_notes () {
	cat <<EOT

${YELLOW}    #LVM - Adding a new disk to a existing Volume Group (VG) in a Virtual Machine (VM)
  Add new disk with VMware tool.
Usually, the command fdisk -l will not detect the new disk in a VM. Execute this command to do rescan the bus: 
Command:${LTCYN}
# echo "- - -" > /sys/class/scsi_host/host${RED}#${LTCYN}/scan${BOLD}${LTYLLW} ## where${RED} #${LTYLLW} is${RED} 0${LTYLLW} or${RED} 1${LTYLLW} or${RED} 2${RESET}${LTCYN}
# fdisk -l${YELLOW}

Command:${LTCYN}
# pvcreate /dev/sd<x>
# pvdisplay${YELLOW}

Command: vgextend [VolumeGroupName] [PhysicalDevicePath]${LTCYN}
# vgextend system /dev/sd<x>${YELLOW}

Executing pvdisplay again shows the /dev/sdb is now part of VG system:${LTCYN}
# pvdisplay${CYAN}
#--- Physical volume ---
#PV Name        /dev/sdb
#VG Name        system
#PV Size        8.00 GiB not usable 4.00 MiB
#Allocatable        yes
#PE Size        4.00 MiB
#Total PE       2047
#Free PE        2047${YELLOW}

#To add via Free PE${LTCYN}
# lvextend -l +2047 /dev/system/root${YELLOW}

#To Add via amount of GB to add${LTCYN}
# lvextend -L+1G /dev/system/root${YELLOW}

#To Add via amount of GB to be total size${LTCYN}
# lvextend -L12G /dev/system/root${YELLOW}

#Command: resize2fs - The last step is to resize the logical volume${LTCYN}
# resize2fs /dev/system/root
# df -hl${RESET}

EOT
}
#
add_prefix () {
	cat <<EOT

${YELLOW}    To add a character to the beginning of every line in myfile.txt${RESET}${LTMAG}
# sed 's/^/#/' myfile.txt >> myfile-commented.txt${RESET}${YELLOW}
 Or${RESET}${LTMAG}
# sed -i 's/^/#/' myfile.txt${RESET}${YELLOW}

    Also, add a space & character to the end of every line in myfile.txt${RESET}${LTMAG}
# sed -i 's/$/\ #/' myfile.txt${RESET}

EOT
}
#
use_tools () {
	cat <<EOT

${LTMAG}${BOLD}  Tools for Security, Monitoring, and troubleshooting${RESET}${YELLOW}
    Monitoring & troubleshooting${LTCYN}
  nmon${CYAN} - In most distributions repositories${LTCYN}
  sysstat${CYAN} - In most distributions repositories${LTCYN}
  htop${CYAN} - In most distributions${LTCYN}
  Nagios${CYAN} - Availabale at https://www.nagios.org/projects/nagios-core/${YELLOW}
    Security Settings${LTYLLW}
  PermitRootLogin${LTCYN} without-password${YELLOW} or${LTCYN} no${CYAN} - In /etc/ssh/sshd_config${LTYLLW}
  AllowGroups${LTMAG} OR${LTYLLW}  AllowUsers${CYAN} - In /etc/ssh/sshd_config${LTYLLW} to limit who can even login${YELLOW}
    System Mangement${LTCYN}
  Puppet${CYAN} - In SUSE repos, or from puppelabs.org, manages all OSs${LTCYN}
  Git${CYAN} - In most distributions repositories${LTCYN}
  GitLab Server${CYAN} - See http://woodbeeco.com/docs/GitLab_Setup.pdf${LTCYN}
  PXE-Boot Server${CYAN} - Doc. Coming soon at http://woodbeeco.com${YELLOW}
    Enterprise Level tools${LTCYN}
  SUSE Manager Server${CYAN} - Manages SLES & RHEL, PXE-Boot AutoInstall, has Salt Built-In for management and provisioning.${LTCYN}
  SaltStack${CYAN} - Manages All OSs, Config Management, provisioning, deploying- on-prem & Cloud${LTRED}
    NOTE: I will not add any items here that are not OS-Agnostic, Support ALL/Most or stay HOME!${RESET}

EOT
}
#
tool_info () {
	cat <<EOT

    No Info for tool yet- In-Progress... coming soon

EOT
}
#
###    Replacing TABS with 4 spaces for PEP8 Compliance
rep_tabs () {
	cat <<EOT

${BOLD}${LTCYN}    Replacing all TABS with 4 SPACES for PEP8 Compliance$RESET$CYAN
  I prefer the expand command over sed because that is what it is for-${BOLD}${YELLOW}
  expand command, In lines that begin with a TAB-${RESET}${LTYLLW}
#  expand -i -t 4 input | sponge output${YELLOW}
    where
    -i is used to expand only leading tabs on each line;
    -t 4 means that each tab will be converted to 4 whitespace chars (8 by default).
    sponge is from the moreutils package, and avoids clearing the input file.${LTYLLW}
#  expand -i -t 4 input | sponge tstoutput && mv tstoutput input${BOLD}${YELLOW}

  sed command, In ALL lines-${RESET}${YELLOW}
    Use backslash-escaped sed.
  Replace all tabs with 1 hyphen inplace, in all *.txt files:${LTYLLW}
# sed -i 's/\t/-/g' *.txt${YELLOW}
  Replace all tabs with 1 space inplace, in all *.txt files:${LTYLLW}
# sed -i 's/\t/ /g' *.txt${YELLOW}
  Replace all tabs with 4 spaces inplace, in all *.txt files:${LTYLLW}
# sed -i 's/\t/    /g' *.txt${RESET}

EOT
}
#
tabs_info () {
	cat <<EOT

    No Info for tabs yet- In-Progress... coming soon

EOT
}
#
sed_cmds () {
	cat <<EOT

${BOLD}${LTCYN}    Helpful Replacement shortcuts and tips- sed, tr, etc.${RESET}${LTYLLW}

    Output Deleting a individual line in a file [Line #3]${LTMAG}
 $ sed '3d' file${LTYLLW}
 Delete a individual line in a file [Line #3]${LTMAG}
 $ sed -i '3d' file${LTYLLW}
 Delete a range of lines, [2nd line till 4th line]${LTMAG}
 $ sed '2,4d' file${LTYLLW}
 Delete the lines starting from the 3rd line till encountering the pattern 'Linux'${LTMAG}
 $ sed '3,/Linux/d' file${YELLOW}
    Resource-${CYAN}
http://www.theunixschool.com/2012/06/sed-25-examples-to-delete-line-or.html${LTCYN}

    Remove Spaces in filenames and replace with underscore-${LTYLLW}
  Best amd easiest wasy I know of...${LTMAG}
 $ for f in *\ *; do mv "\$f" "\${f// /_}"; done${LTYLLW}
  In script form for standardized code...${LTMAG}
for f in *\ *
do
    mv "\$f" "\${f// /_}"
done${YELLOW}
    Resource-${CYAN}
 https://stackoverflow.com/questions/2709458/how-to-replace-spaces-in-file-names-using-a-bash-script${BOLD}${LTCYN}
    Remove Empty Lines in a file, including white-space and tabs...${YELLOW}
Using sed example-${CYAN}
# cat /etc/apache2/httpd.conf | grep -v '^#' | sed '/^\s*$/d'${RESET}
EOT
rep_tabs
rem_emty
}
#
seds_info () {
	cat <<EOT

No Info for seds yet- In-Progress... coming soon

EOT
}
#
pep_eight () {
	cat <<EOT

${BOLD}${YELLOW}    PEP8 Compliance Guidelines and suggested Resolution${RESET}${YELLOW}
    Find more at${CYAN}
https://www.datacamp.com/community/tutorials/pep8-tutorial-python-code\n And Here-\nhttps://www.python.org/dev/peps/pep-0008/${LTYLLW}
    PEP8 is technically for Python coding but we believe it is a good
  standard for all coding. This is a living and growing  part of this
  script and we will be adding more...${BOLD}${LTCYN}
    Here is the list of Options as of this release-${RESET}${LTCYN}
  [tabs]${LTYLLW}    Replace TABS    Replacing all TABS with 4 SPACES for PEP8 Compliance${LTCYN}
  [quit]${LTYLLW}    Quit/Exit       Exit this script${RESET}
EOT
if $NOOPTS; then
    rep_tabs
    exit $?
else
    cat <<EOT
${YELLOW}    Please choose from the following${LTCYN} Options...
  [1]${CYAN}    =>    tabs${LTCYN}
  [q]${CYAN}    =>    quit${RESET}
 [1|q]...(q)
EOT
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
#
pep8_info () {
	cat <<EOT
    No Info for pep8 yet- In-Progress... coming soon
EOT
}
#
irsi_logs () {
	cat <<EOT

${BOLD}${YELLOW}    How-To setup Logging with IRSSI IRC${LTYLLW}
  Set the directory structure${LTCYN}
# sudo mkdir /var/log/irclogs
# sudo chown wbc:LinuxAdmins /var/log/irclogs${LTYLLW}

  In IRC Irssi Console${YELLOW}
[#channel] /SET autolog ON
[#channel] /SET autolog_path /var/log/irclogs/\$tag/\$0.log
[#channel] /save #answer 'yes'${LTYLLW}

  Create the logrotate config${LTCYN}
# sudo vi /etc/logrotate.d/irssi${LTMAG}
/var/log/irclogs/*/*.log {
    copytruncate
    compress
    notifempty
    missingok
}${LTYLLW}

  Execute a manual logrotate${LTCYN}
# sudo /usr/sbin/logrotate -d /etc/logrotate.conf 
# sudo /usr/sbin/logrotate -f /etc/logrotate.conf${LTYLLW}

  Verify logs rotated${YELLOW}
    say something in one of your irssi irc channels${LTCYN}
# ls -lart  /var/log/irclogs/
# ls -lart  /var/log/irclogs/freenode/${YELLOW}

  Resource-${CYAN}
http://www.chovy.com/linux/logging-irssi-and-rotating-them-with-logrotate${RESET}

EOT
}
irsi_noob () {
	cat <<EOT

${BOLD}${YELLOW}    New to IRSSI? Here is some tips to get started-${RESET}${YELLOW}
    Irssi is not that difficult once you get the basics down...${LTYLLW}
  Using screen [$ screen] to run your irssi client- This will allow
  you to login from any source that has ssh
  access to your irssi host [screen -x]
  Connecting to the IRC Server...${CYAN}
  $ irssi -c irc.freenode.net -n [nick] -w [password]${LTYLLW}
  Joining a channel...${LTMAG}
  [(status)] /join #channel${LTYLLW}
  Getting help in the irssi console...${BOLD}${LTYLLW}
 NOTE- Messaging chanserv or nickserv is the same as a PM...
 You need to switch to that PM channel in your Console
 Use CTRL+n for NEXT channel, CTRL+p for PREVIOUS channel${RESET}${LTMAG}
  [#channel] /msg chanserv help
  [#channel] /msg nickserv help
  [#channel] /msg chanserv help <command>${LTYLLW}
 EXAMPLE-${LTMAG}
  [#channel] /msg chanserv help REGISTER${CYAN}
    REGISTER allows you to register a channel
    so that you have better control.
    allows you to maintain a channel access list
    Syntax: REGISTER <##channel>
    /msg ChanServ REGISTER <##channel>${LTYLLW}
  Registering your nick...${LTMAG}
  [#channel] /msg nickserv help REGISTER${CYAN}
    This will register your current nickname with NickServ.
    The password is a case-sensitive password that you make
    You have to confirm the email address. To do this,
    follow the instructions in the message sent to the email
    address.
    Syntax: REGISTER <password> <email-address>
    /msg NickServ REGISTER bar foo@bar.com${RESET}

EOT
}
#
irsi_tips () {
	cat <<EOT

${BOLD}${YELLOW}    IRSSI IRC Tips and shortcuts-${RESET}${YELLOW}
  Irssi is an IRC (Internet Relay Chat) client for use in
    the Command Line Interface
  This is a living and growing  part of this script and we will be
  adding more Tips and Info...${BOLD}${LTCYN}
    Here is the list of Options as of this release-${RESET}${LTCYN}
  [logs]${LTYLLW}    Log Capture    Capture all logs from Your channels
                           and rotate them with logrotate${LTCYN}
  [inew]${LTYLLW}    New to Irssi   Tips for users that are new to Irssi${LTCYN}
  [quit]${LTYLLW}    Quit/Exit      Exit this script${RESET}
EOT
if $NOOPTS; then
    irsi_logs
    irsi_noob
    exit $?
else
    printf "\n${YELLOW}
\t Please choose from the following${LTCYN} Options...
  [1]\t${CYAN}=>\tlogs${LTCYN}
  [2]\t${CYAN}=>\tinew${LTCYN}
  [q]\t${CYAN}=>\tquit\n${RESET}
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
cust_ltlid () {
	cat <<EOT

${BOLD}${YELLOW}    Set the power settings for laptop lid to NOT sleep-${RESET}${LTYLLW}
    I run my web server in a VM on a laptop headlessly, so it
  just sits in a closet on a shelf and I have no need to have
  the lid open- By default the OS Laptop package sets it
  to enter sleep on lid close.
    The better way maybe to not install that package, but-
  I would not have this in the script! :P${LTCYN}
  Edit /etc/systemd/logind.conf-${CYAN}
  # vi /etc/systemd/logind.conf${LTCYN}
  Add/Edit to show the following Value ...${LTMAG}
  HandleLidSwitch=ignore${LTCYN}
  Reboot the system and test${YELLOW}
    NOTE- I know there is a better way to reload the settings
    WITHOUT a reboot, butI did not have the time to research
    and will update with that and remove this line.${RESET}

EOT
}
#
cust_tips () {
	cat <<EOT

${BOLD}${YELLOW}    Custom Configurations Tips and shortcuts-${RESET}${YELLOW}
    This is a living and growing  part of this script and we will be
  adding more Tips and Info...${BOLD}${LTCYN}
    Here is the list of Options as of this release-${RESET}${LTCYN}
  [ltpw]${LTYLLW}    Laptop Lid    Configure a laptop to be a headless server
                          and manage power settings for Lid Close${LTCYN}
  [quit]${LTYLLW}    Quit/Exit     Exit this script${RESET}
EOT
if $NOOPTS; then
    clear
    cust_ltlid
    exit $?
else
    printf "\n${YELLOW}
\t Please choose from the following${LTCYN} Options...
  [1]\t${CYAN}=>\tltpw${LTCYN}
  [2]\t${CYAN}=>\tnone${LTCYN}
  [q]\t${CYAN}=>\tquit\n${RESET}
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
git_lab () {
	cat <<EOT

${BOLD}${YELLOW}    GitLab Setup Beginning to end${RESET}${LTYLLW}

  Get files =>${CYAN}
https://packages.gitlab.com/gitlab/gitlab-ce/packages/opensuse/42.2/gitlab-ce-10.3.1-ce.0.sles42.x86_64.rpm/download${YELLOW}
    (Or whatever distro in parent of that link)${LTYLLW}
    OR-
  Add the repos for your distro - this example uses OpenSUSE${LTMAG}
  zypper ar https://packages.gitlab.com/gitlab/gitlab-ce/opensuse/42.3/x86_64 gitlab-ce
  zypper ar https://packages.gitlab.com/gitlab/gitlab-ce/opensuse/42.3/SRPMS gitlab-ce-src

  Install & Enable/Start Dependancies =>${LTCYN}
    Postfix
    Postgresql${LTYLLW}

  Open Firewall Port/s =>${LTMAG}
sudo yast2 firewall services add tcpport=80,443,22,25,465,587 udpport=80,443,22,25,465,587 zone=EXT${LTYLLW}

  Set Hostname & Install =>${LTMAG}
EXTERNAL_URL="http://<FQDN>" zypper install <rpm from above link>${LTYLLW}
  OR-${LTMAG}
EXTERNAL_URL="http://<FQDN>" zypper install gitlab-ce${LTYLLW}
  If Importing a backed-up instance, ensure the Versions match${LTMAG}
EXTERNAL_URL="http://server.domain.com" zypper install gitlab-ce=10.8.3-ce.0.sles42${LTYLLW}

  Set Configuration =>${LTMAG}
gitlab-ctl reconfigure${LTYLLW}
    Verify FQDN is in${LTCYN} /etc/gitlab/gitlab.rb${LTYLLW}

  Restart GitLab =>${LTMAG}
gitlab-ctl restart
gitlab-ctl status${LTYLLW}

  Initial UI Configuration in Browser =>${CYAN}
    http://<FQDN>${LTYLLW}
  On first opening of UI must reset Administrator (root) password${YELLOW}
    Setup Users as needed
    Setup Groups as needed
    Setup Roles as needed${LTYLLW}
  Importing github repos-${YELLOW}
  The hard way-
    Follow instructions from${CYAN} https://docs.gitlab.com/ee/user/project/import/github.html${LTYLLW}
  The easy way-${YELLOW}
    1. Login to your gitlab WebUI as YOUR User- NOT Admin/root
    2. Create a Group- assuming you dont have one already
      a.${LTCYN} Groups${YELLOW} from top toolbar =>${LTCYN} New Group${YELLOW}
    3. Click on the Group listed
    4.${LTCYN} New Project => Import project => Repo by URL${YELLOW}
      a. Copy/paste the url from your github repo into the${LTCYN} Git repository URL${YELLOW} field
      b. Populate the remaining fields as desired, ensuring that the Group Name under${LTCYN} Project Path${YELLOW} is correct
      c. Select${LTCYN} Create Project${LTYLLW}
    This will import your github repo along with the history from the commit logs.
    You cah now go into that repo in the WebUI and select either HTTP or SSH and copy that URL,
      and on your PC- cd to where you want the repo, and${LTMAG} git clone <Paste-URL>${LTYLLW}

Creating New Repos-${YELLOW}
  1. Login to your gitlab WebUI as YOUR User- NOT Admin/root
  2. Create a Group- assuming you dont have one already
    a.${LTCYN} Groups${YELLOW} in top bar =>${LTCYN} New Group${YELLOW}
  3. Click on the Group listed
  4.${LTCYN} New Project${YELLOW} => Populate the fields as desired, ensuring that the Group Name under Project Path is correct
  5. Select${LTCYN} Create Project${YELLOW}
  6. Click the${LTCYN} "+"${YELLOW} drop-down in the upper toolbar, Select${LTCYN} "New file"${YELLOW}
  7. Name it what you want [README is good], and add some text, like a description...
  8. Save and commit the change
  You cah now go into that repo in the WebUI and select either HTTP or SSH and copy that URL,
    and on your PC- cd to where you want the repo, and${LTMAG} 'git clone <Paste-URL>'${LTYLLW}
  Export gitlab-server from one server to another-${RESET}

EOT
}
#
git_branch () {
	cat <<EOT

${BOLD}${YELLOW}    Working with branches in GIT${RESET}${LTCYN}
  Static Rules${CYAN}
    1. Always pull before any push
    2. Don\'t pull branches from master
    3. If other branches, they each do same process${LTCYN}
  Steps${CYAN}
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
    11. Merge <branch1>${RESET}

EOT
}
#
my_links () {
	cat <<EOT

${BOLD}${LTYLLW}    Links to other scripts, tutorials, etc. that are designed
    to help, automate, or otherwise serve a purpose in daily life.${RESET}${LTCYN}
  seaphor${CYAN}    System Information gathering script, it gathers MB, BIOS, GFX-Card, WLAN, LAN, OS, RAM, CPU, Disk, Repos, and more...${RESET}
    https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/reports/sysinfo/seaphor-4.1-7${LTCYN}
  c4-bug-report${CYAN}    Script created to generate a bug report to CSV format, and can be adjusted to fit any needs. there is also an alpha TUI version I am working on, I will post both here...${RESET}
    https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/reports/Bug-Report/Latest_Stable${RESET}

EOT
}
#
user_input () {
	cat <<EOT

${BOLD}${YELLOW}    To ask the user for input to be set in a variable,
  EXAMPLE-${RESET}${YELLOW} Use the -p and the -s options for login credentials${LTCYN}
    # Ask the user for login details
    printf "Please enter your login credentials when prompted..."
    read -p 'Username: ' uservar
    read -sp 'Password: ' passvar
    echo
    printf "Thank you \$uservar we now have your login details"${YELLOW}
  Output in the Terminal-${BOLD}${CYAN}
    ./login.sh
    Username: ryan
    Password:
    Thank you ryan we now have your login details${RESET}${LTYLLW}

  Resource-${CYAN}
    https://ryanstutorials.net/bash-scripting-tutorial/bash-input.php${YELLOW}
  Now, there are 2 tnings you can do with these variables
    1. Use it within the script to execute other cammands passing
       the variables instead of prompting once or multiple times.${LTYLLW}
  EXAMPLE- For the 1st Option, using the example above
      Say you wanted to pass a command to a/some different 
      box/es via ssh and didnt want to put that info in 
      your script, the lines would look something like...${LTCYN}
    MYHOST="hostname -f"
    MYOS="cat /etc/*release"
    MYKERN="uname -r"
    for i in \`cat hostlist.txt\`
    do
      sshpass -p \$passvar ssh \$uservar@\$i \$MYHOST && \$MYOS && \$MYKERN >> myhosts-details.txt
      echo >> myhosts-details.txt
    done${YELLOW}
       
    2. Set the variable values to a [Local]'source' file
       to be used in subsequent runs of your script/s.${LTYLLW}
  EXAMPLE- For the 2nd Option, using the example above${LTCYN}
    if [[ ! -a ~/.myusercreds ]]; then
        # Ask the user for login details
        printf "Please enter your login credentials when prompted..."
        echo
        read -p 'Username: ' uservar
        read -sp 'Password: ' passvar
        echo
        printf "Thank you \$uservar we now have your login details"
        echo
        echo "MYUSER=\$uservar" > ~/.myusercreds
        echo "MYPASS=\$passvar" >> ~/.myusercreds
        chmod +x ~/.myusercreds
        source ~/.myusercreds
    else
        source ~/.myusercreds
    fi${LTYLLW}

  Resource- Find out more about this and much more at...${CYAN}
    https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/Sourcing${RESET}

EOT
}
#
custom_date () {
	cat <<EOT
${BOLD}${YELLOW}    Using custom date command in scripts and/or cli${RESET}${YELLOW}
    In Scripts create Variables for date output/input${CYAN}
TDATE=\`date +%a\ %b\ %d\ %Y\`
JDATE=\`date +%y%m%d-%H.%M.%S\`
WDATE=\`date +%U\ %Y\`${LTYLLW}

Examples and outputs-${YELLOW}
Casual${CYAN}
$ date +%a\ %b\ %d\ %Y${LTCYN}
Mon Apr 30 2018${YELLOW}

International${CYAN}
$ date +%d\ %b\ %Y${LTCYN}
30 Apr 2018${YELLOW}

Tech- filename${CYAN}
$ date +%y%m%d-%H.%M.%S${LTCYN}
180430-09.47.48${YELLOW}

Week & Year${CYAN}
$ date +%U\ %Y${LTCYN}
17 2018${YELLOW}

Year & Month Alpha${CYAN}
$ date +%Y\ %B${LTCYN}
2018 April${YELLOW}

Year & Month Numeric${CYAN}
$ date +%Y\ %m${LTCYN}
2018 04${YELLOW}

Year Month Day Numeric${CYAN}
$ date +%Y\ %m\ %d${LTCYN}
2018 04 30${YELLOW}

Slashed${CYAN}
$ date +%D${LTCYN}
04/30/18${YELLOW}

Casual-tech${CYAN}
$ date +%Y\ %m\ %d\ %A${LTCYN}
2018 04 30 Monday${YELLOW}

Convert Epoc date/time into Human-Readable${CYAN}
$ date -d @1521415551${LTCYN}
Sun, Mar 18, 2018  6:25:51 PM${YELLOW}

for log/output-filename${CYAN}
date +%Y-%m-%d_%H-M${LTCYN}
2018-04-30_09-53-27${YELLOW}

for logging${CYAN}
$ date +%Y-%m-%d_%H:%M${LTCYN}
2018-04-30_09:53:27${YELLOW}

Add a date/time-stamp to your history,${CYAN}
add this to the end of your ~/.bash_profile or ~/.bashrc, then 'source' the one youe edited${LTCYN}
export HISTTIMEFORMAT=\${HISTTIMEFORMAT:-"%F %H:%M:%S "}${LTYLLW}
 1119  2018-08-03 16:33:23 vi Useful_Tips/useful-tips.sh${RESET}

EOT
}
#
chk_cmd () {
	cat <<EOT
${BOLD}${YELLOW}    Need to find out if a particular command is available?${RESET}${LTYLLW}
  You can use the 'which' command, but, in scripting most
  times you just need a yes/no answer.
    Thats where 'type' command comes in...${YELLOW}
  Here's a script example...${LTCYN}
type -P getent &>/dev/null && GETENT=true || GETENT=false
if \$GETENT; then
    USERPW="\`getent passwd \$1\` "
else
    USERPW="cnf - getent - command not found..."
fi
echo "Result of getent passwd \$1 is - \$USERPW"${RESET}

EOT
}
#
for_cows () {
	cat <<EOT

${BOLD}${YELLOW}    Silly little hack so you will have a fortune each time you log in${RESET}${YELLOW}
    Add or Uncomment and modify this to your users ~/.profile
    Or ad to /etc/skel/profile - Use any available ascii,
    I chose dragon here${LTYLLW}
  NOTE- You will need both fortune and cowsay installed$LTCYN

  if [ -x /usr/bin/fortune ] ; then
      echo
      /usr/bin/fortune | cowsay -f dragon
      echo
  fi${LTYLLW}
    You can use${LTMAG} ${PROGNAME} cows-info${LTYLLW} to see a list of ascii 'cows' to use
    Or, do${LTMAG} ls /usr/share/cows/${RESET}

EOT
}
#
cows_info () {
	cat <<EOT

${BOLD}${YELLOW}    Here is a list of available 'cows' in my installation-${RESET}${LTCYN}
    ls /usr/share/cows/
beavis.zen.cow  dragon-and-cow.cow     hellokitty.cow  moofasa.cow    sodomized.cow    turtle.cow
bong.cow        dragon.cow             kiss.cow        moose.cow      stegosaurus.cow  tux.cow
bud-frogs.cow   elephant.cow           kitty.cow       mutilated.cow  stimpy.cow       udder.cow
bunny.cow       elephant-in-snake.cow  koala.cow       ren.cow        supermilker.cow  vader.cow
cheese.cow      eyes.cow               kosh.cow        satanic.cow    surgery.cow      vader-koala.cow
cower.cow       flaming-sheep.cow      luke-koala.cow  sheep.cow      telebears.cow    www.cow
daemon.cow      ghostbusters.cow       meow.cow        skeleton.cow   three-eyes.cow
default.cow     head-in.cow            milk.cow        small.cow      turkey.cow${LTYLLW}
    For a quick preview of available cows, run the following-${BOLD}${LTYLLW}
    BUT- not all are appropriate for all audiences.${RESET}${LTMAG}
    for i in \`ls -1 /usr/share/cows/\`; do cowsay -f \$i "\$i"; sleep 3;  done${RESET}

EOT
}
#
git_alias () {
	cat <<EOT

${BOLD}${YELLOW}    You wont have a ~/.gitconfig until you do the following, and its a good idea anyway${RESET}${LTCYN}
  git config --global user.name "Firstname Lastname"
  git config --global user.email email@domain.com${BOLD}${YELLOW}
    Add these declarations to your users ~/.gitconfig for efficiency${RESET}${YELLOW}
[alias]${LTCYN}
  co = checkout
  ci = commit -a -m
  st = status
  br = branch
  hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
  type = cat-file -t
  dump = cat-file -p
  last = log -1 HEAD${RESET}

EOT
}
#
add_color () {
	cat <<EOT

${BOLD}${YELLOW}    Add these Colors and effects to the output of your scripts-${RESET}
  Output${RED}
    Red${LTRED}
    Light Red${GREEN}
    Green${LTGRN}
    Light Green${CYAN}
    Cyan${LTCYN}
    Light Cyan${BLUE}
    Blue${LTBLU}
    Light Blue${MAG}
    Magenta${LTMAG}
    Light Magenta${YELLOW}
    Yellow${LTYLLW}
    Light Yellow${BOLD}${CYAN}
    Add BOLD to the text
    ${SOMODE}Add Standout mode${NSOMODE}${BOLD}${CYAN}
    ${BGBLU}${LTRED}Add Background Highlighting to the text${RESET}${LTYLLW}
    ${ULINE}Add Underlining to the text${NULINE}${RESET}${LTYLLW}
    I added a '-info' for this and display how I do this in the script
  Or, you can just open this script and see for yourself${RED} (_:^(|)${MAG} [dead-Homer]${RESET}

EOT
}
colr_info () {
    cat <<EOT
${BOLD}${YELLOW}
    Using Color to enhance the output of your scripts${RESET}${YELLOW}
  Use 'tput' in a variablized way and declare those in the head of scripts${LTCYN}
  Here are the ones in this script ($PROGNAME),${BOLD}${LTYLLW} Turning off colors for this...${RESET}
RED="\$(tput setaf 1)"
GREEN="\$(tput setaf 2)"
YELLOW="\$(tput setaf 3)"
BLUE="\$(tput setaf 4)"
MAG="\$(tput setaf 5)"
CYAN="\$(tput setaf 6)"
LTRED="\$(tput setaf 9)"
LTGRN="\$(tput setaf 10)"
LTYLLW="\$(tput setaf 11)"
LTBLU="\$(tput setaf 12)"
LTMAG="\$(tput setaf 13)"
LTCYN="\$(tput setaf 14)"
BGBLU="\$(tput setab 4)"
BGYLLW="\$(tput setab 3)"
BGLYLLW="\$(tput setab 11)"
ULINE="\$(tput smul)"
NULINE="\$(tput rmul)"
SOMODE="\$(tput smso)"
NSOMODE="\$(tput rmso)"
BOLD="\$(tput bold)"
RESET="\$(tput sgr0)"
${BOLD}${YELLOW}
  Example-${RESET}${LTYLLW}(For command line, use above for scripts)${GREEN}
    Try it, copy/paste the following line in your terminal-
echo -e "\n\$(tput bold)\$(tput setaf 1)This is a example,\n\t\$(tput sgr0)\$(tput setaf 14)for adding colors to commands and scripts.\$(tput sgr0)\n"${RESET}

EOT
}
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
        exit $?
    ;;
esac
}
#
###########################################
####    TAR Command
###########################################
#
cmmd_tar () {
    clear
    cat <<EOT
${BOLD}${YELLOW}
    The tar command, example answers to common questions${RESET}${YELLOW}
  The most common question I know is the use of -C to remove the trailing path-
  In this example I will archive MyApp config to my user home directory.${GREEN}
$ tar -czvf \${HOME}/myuser/bakups/MyAppConf_\$MYDATE.tar.gz -C /opt/myapp/ conf.d
$ tar -tf \${HOME}/myuser/bakups/MyAppConf_\$MYDATE.tar.gz${LTCYN}
conf.d
${RESET}
EOT
}
#
###########################################
####    Simple MATH
###########################################
#
smpl_math () {
    clear
    cat <<EOT
${BOLD}${YELLOW}
    Performing Simple Math calculations in command line and scripting${RESET}${YELLOW}
  Using cal and expr to find number of days between 2 dates, in this
  example using employment start date to current date.${GREEN}
> cal -j 2 4 2018${LTCYN}
         April 2018        
Sun Mon Tue Wed Thu Fri Sat
 91  ${SOMODE}92${NSOMODE}  93  94  95  96  97 
 98  99 100 101 102 103 104 
105 106 107 108 109 110 111 
112 113 114 115 116 117 118 
119 120${GREEN}
> cal -j 18 9 2018${LTCYN}
       September 2018      
Sun Mon Tue Wed Thu Fri Sat
                        244 
245 246 247 248 249 250 251 
252 253 254 255 256 257 258 
259 260 ${SOMODE}261${NSOMODE} 262 263 264 265 
266 267 268 269 270 271 272 
273${GREEN}                         
> expr 261 - 92${LTCYN}
${SOMODE}169${NSOMODE}
${RESET}
EOT
}
#
###########################################
####    Run script & exit
###########################################
#
###    END OF DEFINE FUNCTIONS
#
###########################################
### Define Execution
###########################################
#
case $MYOPT in
    "help")
        #show_objective
        #sleep 5
        clear
	show_opts
        exit $0
    ;;
    "sobj")
        clear
	show_objective
        exit $0
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
        printf "${LTCYN} This Version/Revision of ${PROGNAME} is ${PROGVERS} released on ${PROGDATE} ${RESET}\n"
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
    "colr-info")
        clear
        colr_info
        exit $?
    ;;
    "rpmb")
        clear
        rpmdoc_run
    ;;
    "tars")
        clear
        cmmd_tar
    ;;
    "math")
        clear
        smpl_math
    ;;
    *)
        clear
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
#  Added config --global to gtal
#
#    Change- "0.0.2-01" 01 Sep 2018
#      Total re-write of all functions to use 'cat <<EOT message EOT'
#      removing the need to work-around fixes above
#      added check for arg and error-exit
#      All tested and working, quickly
#    Change- "0.0.2-02" 02 Sep 2018
#      Fixed typo in Version number
#      Variablized the Arg
#    Change- '0.0.2-03' 02 Sep 2018- Added Color to ALL expr output
#    Change- '0.0.2-04' 15 Sep 2018- 
#      cleanup for rpmbuild
#    Change- '0.0.2-05' 15 Sep 2018- 
#      Added RPM-Build
#    Change- '0.0.2-06' 17 Sep 2018- 
#      Added Note on spec-file in useful
#      Fixed syntax mistake in the "Usage" output
#      Fixed allignment mistake in the "Usage" output
#      Cleaned up structure of entire "Usage"... MUCH cleaner output
#    Change- '0.0.2-07' 18 Sep 2018- 
#      Added Enter/Exit standout mode
#      Added tars and math
#      Added colr-info
#
#
