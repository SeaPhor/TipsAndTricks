#!/bin/bash
#
###########################################
####    Global Variables
###########################################
#
PROGNAME=$(basename $0)
PROGVERS="1.0.2-01"
PROGDATE="21 Sep 2018"
#
###########################################
####    Color Variables
###########################################
#
RED="$(tput setaf 1)"
GRN="$(tput setaf 2)"
YLLW="$(tput setaf 3)"
BLU="$(tput setaf 4)"
MAG="$(tput setaf 5)"
CYN="$(tput setaf 6)"
LTRED="$(tput setaf 9)"
LTGRN="$(tput setaf 10)"
LTYLLW="$(tput setaf 11)"
LTBLU="$(tput setaf 12)"
LTMAG="$(tput setaf 13)"
LTCYN="$(tput setaf 14)"
BGBLU="$(tput setab 4)"
BGYLLW="$(tput setab 3)"
BGLYLLW="$(tput setab 11)"
ULINE="$(tput smul)"
NULINE="$(tput rmul)"
SOMODE="$(tput smso)"
NSOMODE="$(tput rmso)"
BOLD="$(tput bold)"
RESET="$(tput sgr0)"
#
#
#
###########################################
####    SOP, Standard Operating Procedure
###########################################
#
###########################################
####    Declare Environment Variables
###########################################
#
cont_choice () {
read -p "${BOLD}${YLLW}Would you like to make another selection? [Y/n]${RESET}
" nextchoice
if [[ $nextchoice = "n" ]]; then
    exit 0
else
    start_sop
fi
}
#
###########################################
####    Declare Functions
###########################################
#
start_syn () {
    cat <<EOT
${BOLD}${YLLW}
Synopsis${RESET}${LTCYN}
  The purpose of this document is to establish a "${BOLD}${YLLW}SOP${RESET}${LTCYN}" (${BOLD}${YLLW}S${RESET}${LTCYN}tandard ${BOLD}${YLLW}O${RESET}${LTCYN}perating ${BOLD}${YLLW}P${RESET}${LTCYN}rocedure) for creating and modifying code.
  The standards outlined here are to establish effective, efficient, common, readable, trackable, and accountable code-writing methodologies so that all code written by any member can be read, understood, and explained by any other member.
  The content here is not only to establish the SOP, but, also to create and/or follow known Best Practices, including but not limited to, ${BOLD}${YLLW}PEP8${RESET}${LTCYN} (see Resources).
  The reason for creating the SOP is to standardize all code written so that it can be efficiently read, understood, modified, and communicated without the need for either excessive time spent deciphering, or re-writing a new code ('re-inventing the wheel').
${RESET}
EOT
#
#secnd_run () {
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && start_scp || new_choice
#}
}
start_scp () {
    cat <<EOT
${BOLD}${YLLW}
Scope${RESET}${LTCYN}
  This SOP should be implemented team-wide and was originally intended for BASH scripting, but, is hoped to be applicable to all code written.${BOLD}${YLLW}
  Must-Haves-${RESET}${LTCYN}
    Valid use-case and need
    Clear known objectives
    Outline- Including Objectives, Milestones, Test criteria, and completion state (Desired End Results). This should be documented in the header of the code itself.
    Stated possibility/s of risk/s and safegards for such.
    Structure, order, and comments, for easy reading, understanding, and standardization.${BOLD}${YLLW}
  Nice-To-Haves-${RESET}${LTCYN}
    Option/Parameter in calling the code/script, to print the objective outlined in the 'Must-Haves'.
    Some method of logging it's actions.
    "Script-Template" - As a team we should create, agree, and use a standardized script-template.
${RESET}
EOT
#
#secnd_run () {
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && start_gens || new_choice
#}
}
start_gens () {
    cat <<EOT
${BOLD}${YLLW}
General Standards${RESET}${LTCYN}
  Use the "${BOLD}${YLLW}DRY${RESET}${LTCYN}" (${BOLD}${YLLW}D${RESET}${LTCYN}on't ${BOLD}${YLLW}R${RESET}${LTCYN}epeat ${BOLD}${YLLW}Y${RESET}${LTCYN}ourself) principle, which states that you should ${BOLD}${YLLW}NEVER${RESET}${LTCYN} repeat the same piece of code more than once in the same script/app.
  Make it OS/Release agnostic.
  Make it Portable- Environment, Network, and Infrastucture agnostic.
  Make it scaleable, allow for growth.
  Make it adaptable- Able to adjust with changed/better/new tools, methods, paths, etc. for anything that can/may change.
  Always use variables where common, multiple calls, or complex commands/strings are needed.
  For code that requires arguements/parameters passed on the command line-
    A help/usage statement option printing a menu.
      Standard- A conditional (Arithmatic) Expression check for the correct number of arguements passed and will print the usage message if '-ne'.
        ${BOLD}${ULINE}${YLLW}Example${NULINE}${RESET}${LTCYN}- [[ ! \$1 || \$# -ne 1 ]] && { usage; echo "'\$@' Not a valid option"; exit 1; }
      Use inside a function- ${BOLD}${YLLW}EXAMPLE${RESET}${LTCYN}-
        usage () {
            cat <<EOT
          Usages and Options
          EOT
        }
${RESET}
EOT
#
#secnd_run () {
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && start_scom || new_choice
#}
}
start_proc () {
    cat <<EOT
${BOLD}${YLLW}
Process${RESET}${LTCYN}
  1. Evaluate the conditions
  2. Take action/s
  3. Carry out task/s
  4. Clean up and close
${RESET}
EOT
}
start_scom () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  Comments-${RESET}${LTCYN}
    Use comments for all sections, sub-sections, functions, and complex commands.
    Good comments explain 'why', not just how what is being done.
${RESET}
EOT
#
#secnd_run () {
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && start_slog || new_choice
#}
}
start_slog () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  Logging-${RESET}${LTCYN}
    Logging should include all stdin and stderr output.
    Logging for on-going and/or sceduled runs should be "self-rotating", based on size, using compression, and the archives rotated by date or number of archives,
    Date-Time-Stamps for logs should be structured for ease of debugging, eg. "${YLLW}2018_07_23-14:32:29${LTCYN}"
${RESET}
EOT
#
#secnd_run () {
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && start_sind || new_choice
#}
}
start_sind () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  Indenting-${RESET}${LTCYN}
    It is recommended to use 4 SPACES for indentation, instead of TABS, however, whatever you do,${BOLD}${YLLW} BE CONSISTANT! Do NOT mix TABS and SPACES, use ONLY one of the following:${RESET}${LTCYN}
      2 SPACES
      4 SPACES
      8 SPACES
      TABS (last choice)
${RESET}
EOT
#
#secnd_run () {
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && start_svar || new_choice
#}
}
start_svar () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  Variables-${RESET}${LTCYN}
    It is recommended to use only lowercase for variables, as all SYSTEM variables are in UPPERCASE, however, you can ONLY use letters, numbers, and underscores for declaring variables.
    Never combine UPPER and lower case, use one OR the other.
    As with "Indenting", whatever you do,${BOLD}${YLLW} BE CONSISTANT!${RESET}${LTCYN}
    There are different methods of calling variables, they each have their purpose, know (or learn) those differences and purposes. Example-
      [[ \$HOME vs \${HOME} vs \$(home) ]] 
      See the various sub-sections under http://wiki.bash-hackers.org/syntax/expansion/
    Remember that variables contained within a funfion are limited to that function and are not available to the rest of the script, so declare global variables outside of functions where possible.
    Always declare global variables at the top-most part of the code.
    Always variable-ize the arguments passed on the cli, eg. "OPT_1=\$1", "PARAM_1=\$2", etc.
${RESET}
EOT
#
#secnd_run () {
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && start_sif || new_choice
#}
}
start_sif () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  IF statements-${RESET}${LTCYN}
    Use 'elif' statements instead of nested if-statements where possible.
    Use the Conditional structure where possible- Example-
      [[ -e \${HOME}/.ssh ]] || { echo "No .ssh directory in \${HOME}"; exit 1; }
    Always use exit statements
${RESET}
EOT
#
#secnd_run () {
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && start_sloop || new_choice
#}
}
start_sloop () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  Loops (for, while, until)${RESET}${LTCYN}
    Not started
${RESET}
EOT
#
#secnd_run () {
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && start_sop || new_choice
#}
}
#
start_sop () {
    cat <<EOT
${BOLD}${YLLW}
    ${ULINE}Objective${NULINE}- Effective Code Writing and Execution${RESET}${YLLW}
  The Team${BOLD} SOP${RESET}${YLLW}, ${BOLD}S${RESET}${YLLW}tandard ${BOLD}O${RESET}${YLLW}perating ${BOLD}P${RESET}${YLLW}rocedure, is comprised of many facets, 
    this record is comprised of the following options:${BOLD}${YLLW}
  [1]${LTCYN}    Synopsis${YLLW}
  [2]${LTCYN}    Scope${YLLW}
  [3]${LTCYN}    Geneal Standards${YLLW}
  [4]${LTCYN}    Standards- Comments${YLLW}
  [5]${LTCYN}        ├───── Logging${YLLW}
  [6]${LTCYN}        ├───── Indenting${YLLW}
  [7]${LTCYN}        ├───── Variables${YLLW}
  [8]${LTCYN}        ├───── If Statements${YLLW}
  [9]${LTCYN}        └───── Loops- for, while, until${YLLW}
  [q]${LTCYN}    Quit/Exit${RESET}
EOT
nextset=start_syn
next_set
}
next_set () {
#
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && $nextset || new_choice
}
new_choice () {
case $anykey in
    1)
        clear
	start_syn
	cont_choice
    ;;
    2)
        clear
        start_scp
	cont_choice
    ;;
    3)
        clear
        start_gens
	cont_choice
    ;;
    4)
        clear
        start_scom
	cont_choice
    ;;
    5)
        clear
        start_slog
	cont_choice
    ;;
    6)
        clear
        start_sind
	cont_choice
    ;;
    7)
        clear
        start_svar
	cont_choice
    ;;
    8)
        clear
        start_sif
	cont_choice
    ;;
    9)
        clear
        start_sloop
	cont_choice
    ;;
    q)
        exit 0
    ;;
    *)
        echo "invalid option, exiting..."
        exit 1
    ;;
esac
}
start_sop
exit 0
