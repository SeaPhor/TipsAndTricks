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
RST="$(tput sgr0)"
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
read -p "${BOLD}${YLLW}Would you like to make another selection? [Y/n]${RST}
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
Synopsis${RST}${CYN}
  The purpose of this document is to establish a "${BOLD}SOP${RST}${CYN}" (${BOLD}S${RST}${CYN}tandard ${BOLD}O${RST}${CYN}perating ${BOLD}P${RST}${CYN}rocedure) for creating and modifying code.
  The standards outlined here are to establish effective, efficient, common, readable, trackable, and accountable code-writing methodologies so that all code written by any member can be read, understood, and explained by any other member.
  The content here is not only to establish the SOP, but, also to create and/or follow known Best Practices, including but not limited to, ${BOLD}PEP8${RST}${CYN} (see Resources).
  The reason for creating the SOP is to standardize all code written so that it can be efficiently read, understood, modified, and communicated without the need for either excessive time spent deciphering, or re-writing a new code ('re-inventing the wheel').
${RST}
EOT
}
start_scp () {
    cat <<EOT
${BOLD}${YLLW}
Scope${RST}${CYN}
  This SOP should be implemented team-wide and was originally intended for BASH scripting, but, is hoped to be applicable to all code written.${BOLD}
  Must-Haves-${RST}${CYN}
    Valid use-case and need
    Clear known objectives
    Outline- Including Objectives, Milestones, Test criteria, and completion state (Desired End Results). This should be documented in the header of the code itself.
    Stated possibility/s of risk/s and safegards for such.
    Structure, order, and comments, for easy reading, understanding, and standardization.${BOLD}
  Nice-To-Haves-${RST}${CYN}
    Option/Parameter in calling the code/script, to print the objective outlined in the 'Must-Haves'.
    Some method of logging it's actions.
    "Script-Template" - As a team we should create, agree, and use a standardized script-template.
${RST}
EOT
}
start_gens () {
    cat <<EOT
${BOLD}${YLLW}
General Standards${RST}${CYN}
  Use the "${BOLD}DRY${RST}${CYN}" (${BOLD}D${RST}${CYN}on't ${BOLD}R${RST}${CYN}epeat ${BOLD}Y${RST}${CYN}ourself) principle, which states that you should ${BOLD}NEVER${RST}${CYN} repeat the same piece of code more than once in the same script/app.
  Make it OS/Release agnostic.
  Make it Portable- Environment, Network, and Infrastucture agnostic.
  Make it scaleable, allow for growth.
  Make it adaptable- Able to adjust with changed/better/new tools, methods, paths, etc. for anything that can/may change.
  Always use variables where common, multiple calls, or complex commands/strings are needed.
  For code that requires arguements/parameters passed on the command line-
    A help/usage statement option printing a menu.
      Standard- A conditional (Arithmatic) Expression check for the correct number of arguements passed and will print the usage message if '-ne'.
        ${BOLD}${ULINE}Example${NULINE}${RST}${CYN}- [[ ! \$1 || \$# -ne 1 ]] && { usage; echo "'\$@' Not a valid option"; exit 1; }
      Use inside a function- ${BOLD}EXAMPLE${RST}${CYN}-
        usage () {
            cat <<EOT
          Usages and Options
          EOT
        }
${RST}
EOT
}
start_proc () {
    cat <<EOT
${BOLD}${YLLW}
Process${RST}${CYN}
  1. Evaluate the conditions
  2. Take action/s
  3. Carry out task/s
  4. Clean up and close
${RST}
EOT
}
start_scom () {
    cat <<EOT
${BOLD}${YLLW}
Standards${CYN}
  Comments-${RST}${CYN}
    Use comments for all sections, sub-sections, functions, and complex commands.
    Good comments explain 'why', not just how what is being done.
${RST}
EOT
}
start_slog () {
    cat <<EOT
${BOLD}${YLLW}
Standards${CYN}
  Logging-${RST}${CYN}
    Logging should include all stdin and stderr output.
    Logging for on-going and/or sceduled runs should be "self-rotating", based on size, using compression, and the archives rotated by date or number of archives,
    Date-Time-Stamps for logs should be structured for ease of debugging, eg. "2018_07_23-14:32:29"
${RST}
EOT
}
start_sind () {
    cat <<EOT
${BOLD}${YLLW}
Standards${CYN}
  Indenting-${RST}${CYN}
    It is recommended to use 4 SPACES for indentation, instead of TABS, however, whatever you do,${BOLD} BE CONSISTANT! Do NOT mix TABS and SPACES, use ONLY one of the following:${RST}${CYN}
      2 SPACES
      4 SPACES
      8 SPACES
      TABS (last choice)
${RST}
EOT
}
start_svar () {
    cat <<EOT
${BOLD}${YLLW}
Standards${CYN}
  Variables-${RST}${CYN}
    It is recommended to use only lowercase for variables, as all SYSTEM variables are in UPPERCASE, however, you can ONLY use letters, numbers, and underscores for declaring variables.
    Never combine UPPER and lower case, use one OR the other.
    As with "Indenting", whatever you do,${BOLD} BE CONSISTANT!${RST}${CYN}
    There are different methods of calling variables, they each have their purpose, know (or learn) those differences and purposes. Example-
      [[ \$HOME vs \${HOME} vs \$(home) ]] 
      See the various sub-sections under http://wiki.bash-hackers.org/syntax/expansion/
    Remember that variables contained within a funfion are limited to that function and are not available to the rest of the script, so declare global variables outside of functions where possible.
    Always declare global variables at the top-most part of the code.
    Always variable-ize the arguments passed on the cli, eg. "OPT_1=\$1", "PARAM_1=\$2", etc.
${RST}
EOT
}
start_sif () {
    cat <<EOT
${BOLD}${YLLW}
Standards${CYN}
  IF statements-${RST}${CYN}
    Use 'elif' statements instead of nested if-statements where possible.
    Use the Conditional structure where possible- Example-
      [[ -e \${HOME}/.ssh ]] || { echo "No .ssh directory in \${HOME}"; exit 1; }
    Always use exit statements
${RST}
EOT
}
start_sloop () {
    cat <<EOT
${BOLD}${YLLW}
Standards${CYN}
  Loops (for, while, until)${RST}${CYN}
    Not started
${RST}
EOT
}
#
start_sop () {
    cat <<EOT
${BOLD}${YLLW}
    Objective- Effective Code Writing and Execution${RST}${YLLW}
  The Team SOP, ${BOLD}S${RST}${YLLW}tandard ${BOLD}O${RST}${YLLW}perating ${BOLD}P${RST}${YLLW}rocedure, is comprised of many facets, 
    this record is comprised of the following options:${BOLD}${YLLW}
  [1]${CYN}    Synopsis${YLLW}
  [2]${CYN}    Scope${YLLW}
  [3]${CYN}    Geneal Standards${YLLW}
  [4]${CYN}    Standards- Comments${YLLW}
  [5]${CYN}    Standards- Logging${YLLW}
  [6]${CYN}    Standards- Indenting${YLLW}
  [7]${CYN}    Standards- Variables${YLLW}
  [8]${CYN}    Standards- If Statements${YLLW}
  [9]${CYN}    Standards- Loops- for, while, until${YLLW}
  [q]${CYN}    Quit/Exit${RST}
EOT
new_choice
}
new_choice () {
read -p "Please select an option...
" mychoice
case $mychoice in
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
