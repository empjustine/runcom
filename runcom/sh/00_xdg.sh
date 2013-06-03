#!/bin/sh

# X Desktop Group Base Directories
# --------------------------------

# User-specific data files
export XDG_DATA_HOME=${HOME}/.local/share
# User-specific configuration files
export XDG_CONFIG_HOME=${HOME}/.config

# User-specific data file search patch.
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
# User-specific configuration file search patch
export XDG_CONFIG_DIRS=/etc/xdg

# User-specific non-essential data
export XDG_CACHE_HOME=${HOME}/.cache
# User-specific runtime files and other file objects
#systemd does this for us
#export XDG_RUNTIME_DIR

# X Desktop Group User Directories
# --------------------------------

# User-specific configuration files
# export XDG_CONFIG_HOME=${HOME}/.config

if [ -f ${XDG_CONFIG_HOME}/user-dirs.dirs ]; then
  . ${XDG_CONFIG_HOME}/user-dirs.dirs
  export XDG_DESKTOP_DIR XDG_DOWNLOAD_DIR XDG_TEMPLATES_DIR XDG_PUBLICSHARE_DIR XDG_DOCUMENTS_DIR XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_VIDEOS_DIR
fi
