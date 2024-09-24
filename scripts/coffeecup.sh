#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

main()
{
  if ! command -v coffeecup-cli &> /dev/null
  then
    exit 1
  fi

  coffeecupStatus=$(coffeecup-cli status | awk -F '|' '/⌛/ { split($2, time, " "); gsub(/^[ \t]+|[ \t]+$/, "", $1); print $1" "time[2]time[3] }')
  if [ -z "$coffeecupStatus"]; then
    echo "CC idle"
  else
    echo "CC ${coffeecupStatus}"
  fi
}
#  coffeecup-cli status | awk -F '|' '/⌛/ { split($2, time, " "); print gsub(/^[ \t]+$/, "", $1), time[2], time[3] }'
# run the main driver
main
