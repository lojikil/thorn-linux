#!/bin/sh
### set variables
#the UID that Tor runs as (varies from system to system)
_tor_uid="$(id -u debian-tor)"

#Tor’s TransPort
_trans_port="9040"

### flush iptables
iptables -F
iptables -t nat -F

### set iptables *nat
iptables -t nat -A OUTPUT -m owner --uid-owner $_tor_uid -j RETURN
iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 53

#redirect all output to Tor’s TransPort
iptables -t nat -A OUTPUT -p tcp --syn -j REDIRECT --to-ports $_trans_port

### set iptables *filter
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#allow only Tor output
iptables -A OUTPUT -m owner --uid-owner $_tor_uid -j ACCEPT
iptables -A OUTPUT -j REJECT
systemctl start tor
