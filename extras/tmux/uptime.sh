# shellcheck shell=bash
# print system uptime nicely

s_to_dhms() {
  ((d=${1}/86400))
  ((h=(${1}%86400)/3600))
  ((m=(${1}%3600)/60))
  printf "↑ %dd %dh %dm\n" "$d" "$h" "$m"
}

bt=$(sysctl -n kern.boottime | awk -F'[=,}]' '{print $2}')
ct=$(date +%s)
s_to_dhms "$((ct - bt))"
