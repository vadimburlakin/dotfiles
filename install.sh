#!/bin/bash

export RED='\033[0;31m'
export GREEN='\033[0;32m'
export NC='\033[0m'

while getopts s:o:f:r flag
do
  case "${flag}" in
    s) SCRIPTSDIR=${OPTARG};;
    o) ONLY=${OPTARG};;
    f) FROM=${OPTARG};;
    r) REINSTALL="-r";;
  esac
done

export SCRIPTSDIR=${SCRIPTSDIR:-scripts}
SCRIPTS=$($SCRIPTSDIR/runlist.sh)
FAILED_SCRIPTS=()

configure_script() {
 CURRENT_SCRIPT_PATH="./$SCRIPTSDIR/$1.sh"
}

newline() {
  echo ""
  echo ""
}

separator() {
  echo "----------------------"
}

warning() {
  printf "$RED$1$NC\n"
}
export -f warning

yay() {
  printf "$GREEN$1$NC\n"
}
export -f yay

echo "Configured scripts: $SCRIPTS"

newline

if [[ "$FROM" != "" ]]; then
  echo "Running from $FROM"
fi

if [[ "$ONLY" == "" ]]; then
  RUN_LIST=($SCRIPTS)
else
  echo "Running only $ONLY"
  RUN_LIST=("$ONLY")
fi

newline

for script in "${RUN_LIST[@]}"; do
  if [[ "$FROM" != "" ]]; then
    if [[ "$FOUND_NEXT" != "true" ]] && [[ "$PREV_SCRIPT" != "$FROM" ]]; then
      PREV_SCRIPT="$script"
      continue
    else
      FOUND_NEXT="true"
    fi
  fi

  configure_script $script  

  if ! [[ -e "$CURRENT_SCRIPT_PATH" ]]; then
    echo "Script $script does not exist, skipping"
    continue
  fi

  echo "Running $script:"
  separator
  $CURRENT_SCRIPT_PATH $REINSTALL
  RESULT=$?
  separator

  if [[ "$RESULT" != "0" ]]; then
    warning "$script failed!"
    FAILED_SCRIPTS+=("$script")
  else
    yay "Finished with $script"
  fi

  newline
done;

echo "Failed scripts:"
if [[ "${FAILED_SCRIPTS[@]}" == "" ]]; then
  echo " (none)"
else
  echo "$FAILED_SCRIPTS"
fi
