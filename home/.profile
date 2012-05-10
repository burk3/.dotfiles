#!/bin/bash
EDITOR=vim
if [ -n "$DISPLAY" ]; then
	BROWSER=chromium
fi


if [ -d ~/.local/bin ] ; then
  PATH=~/.local/bin:"${PATH}"
fi

if [ -d ~/.dotfiles/bin ] ; then
	PATH=~/.dotfiles/bin:"${PATH}"
fi

if [ -d /opt/android-sdk/tools ] ; then
  PATH=/opt/android-sdk/tools:"${PATH}"
fi

if [ -d /opt/android-sdk/platform-tools ] ; then
  PATH=/opt/android-sdk/platform-tools:"${PATH}"
fi

if [ -d /opt/inferno-os/Linux/386/bin ] ; then
	PATH=/opt/inferno-os/Linux/386/bin:"${PATH}"
fi

if [ -d ~/.luarocks/bin ] ; then
	PATH=~/.luarocks/bin:"${PATH}"
fi

if [ -d /opt/PalmPDK/bin ] ; then
	PATH=/opt/PalmPDK/bin:"${PATH}"
fi

if [ -d /opt/PalmSDK/Current/bin ] ; then
	PATH=/opt/PalmSDK/Current/bin:"${PATH}"
fi

if [ -d /home/burke/.local/narwhal/bin ] ; then
	PATH=/home/burke/.local/narwhal/bin:"${PATH}"
	CAPP_BUILD=/home/burke/Build
fi

if [ -d /home/burke/.local/nacl-sdk ] ; then
	NACL_SDK_ROOT=/home/burke/.local/nacl-sdk
fi

if [ -d /opt/vmware/bin ] ; then
	PATH=/opt/vmware/bin:"${PATH}"
fi
