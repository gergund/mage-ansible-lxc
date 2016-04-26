#!/bin/bash
lxc launch images:centos/6/amd64 web01
lxc file push bootstrap.sh web01/root/bootstrap.sh
lxc exec web01 -- /root/bootstrap.sh
