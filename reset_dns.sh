#!/bin/bash

function get_pri_srvc_id ()
{
  cat <<EOF | scutil | \
    grep 'PrimaryService' | \
    awk -F': ' '{print $2}'
show State:/Network/Global/IPv4
EOF
}

function get_srvc_name ()
{
  cat <<EOF | scutil | \
    grep 'UserDefinedName' | \
    awk -F': ' '{print $2}'
show Setup:/Network/Service/$1
EOF
}

function get_srvc_ids ()
{
  cat <<EOF | scutil | \
    sed -nEe '
/ServiceOrder/ {
  :ids
  n
  /[0-9]+ :/ {
    s/ *[0-9]+ : ([0-9A-Z-]+) */\1/p
    b ids
  }
}'
show Setup:/Network/Global/IPv4
EOF
}

function get_srvc_id_by_name ()
{
  local srvc_ids=$(get_srvc_ids)

  for srvc_id in $srvc_ids
  do
    local srvc_name=$(get_srvc_name "$srvc_id")
    if [[ "$srvc_name" == "$1" ]]
    then
      echo $srvc_id
      return
    fi
  done
}

function get_dns_ips ()
{
  local srvc_id=$(get_srvc_id_by_name "$1")

  cat <<EOF | scutil | \
    sed -nEe '
/ServerAddresses/ {
  :ips
  n
  /[0-9]+ :/ {
    s/ *[0-9]+ : ([0-9.]+) */\1/p
    b ips
  }
}'
show $2:/Network/Service/$srvc_id/DNS
EOF
}

function set_dns_ips ()
{
  networksetup -setdnsservers "$@"
}

vpn_srvc_name='MY VPN'
ip_file='/tmp/setup_dns_ips'

pri_srvc_id=$(get_pri_srvc_id)
pri_srvc_name=$(get_srvc_name "$pri_srvc_id")

if [[ ! -e "$ip_file" ]]
then
  setup_dns_ips=$(get_dns_ips "$pri_srvc_name" "Setup")
  state_dns_ips=$(get_dns_ips "$pri_srvc_name" "State")
  setup_vpn_ips=$(get_dns_ips "$vpn_srvc_name" "Setup")
  state_vpn_ips=$(get_dns_ips "$vpn_srvc_name" "State")

  echo "set_dns_ips $pri_srvc_name $setup_vpn_ips $state_vpn_ips $setup_dns_ips $state_dns_ips"
  set_dns_ips "$pri_srvc_name" $setup_vpn_ips $state_vpn_ips $setup_dns_ips $state_dns_ips

  if [[ -z "$setup_dns_ips" ]]
  then
    setup_dns_ips="Empty"
  fi

  echo $setup_dns_ips >$ip_file
else
  setup_dns_ips=$(cat $ip_file)

  echo "set_dns_ips $pri_srvc_name $setup_dns_ips"
  set_dns_ips "$pri_srvc_name" $setup_dns_ips

  rm $ip_file
fi
