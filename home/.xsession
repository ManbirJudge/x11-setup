#!/bin/ksh

. ~/.profile

xrdb -merge ~/.Xresources

exec i3
