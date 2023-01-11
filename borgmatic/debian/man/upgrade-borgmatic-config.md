% UPGRADE-BORGMATIC-CONFIG(1) backups manager for borgbackup manual
% Dan Helfman <witten@torsion.org>
% August, 2019

# NAME

upgrade-borgmatic-config - upgrade borgmatic configuration

# SYNOPSIS

upgrade-borgmatic-config [*options*]

# DESCRIPTION

Convert legacy INI-style borgmatic configuration and excludes files to a
single YAML configuration file. Note that this replaces any comments from the
source files.

# OPTIONS

-h, \--help
:   Show this help message and exit

-s *SOURCE_CONFIG_FILENAME*, \--source-config *SOURCE_CONFIG_FILENAME*
:   Source INI-style configuration filename. Default: /etc/borgmatic/config

-e *SOURCE_EXCLUDES_FILENAME*, \--source-excludes *SOURCE_EXCLUDES_FILENAME*
:   Excludes filename

-d *DESTINATION_CONFIG_FILENAME*, \--destination-config *DESTINATION_CONFIG_FILENAME*
:   Destination YAML configuration filename. Default: /etc/borgmatic/config.yaml


# SEE ALSO

The borgmatic source code and all documentation may be downloaded from <https://github.com/witten/borgmatic>
