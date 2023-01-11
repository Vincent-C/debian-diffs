% VALIDATE-BORGMATIC-CONFIG(1) backups manager for borgbackup manual
% Dan Helfman <witten@torsion.org>
% August, 2019

# NAME

validate-borgmatic-config - validate borgmatic configuration

# SYNOPSIS

validate-borgmatic-config [*options*]

# DESCRIPTION

Validate borgmatic configuration file(s).

# OPTIONS

-h, \--help
:   Show this help message and exit

-c *CONFIG_PATHS [CONFIG_PATHS ...]*, \--config *CONFIG_PATHS [CONFIG_PATHS ...]*
:   Configuration filenames or directories, defaults to: /etc/borgmatic/config.yaml /etc/borgmatic.d /root/.config/borgmatic/config.yaml

# SEE ALSO

The borgmatic source code and all documentation may be downloaded from <https://github.com/witten/borgmatic>
