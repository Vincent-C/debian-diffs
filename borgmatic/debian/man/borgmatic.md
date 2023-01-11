% BORGMATIC(1) backups manager for borgbackup manual
% Dan Helfman <witten@torsion.org>
% August, 2019

# NAME

borgmatic - backups manager for borgbackup

# SYNOPSIS

borgmatic [*options*]

# DESCRIPTION

A simple wrapper script for the Borg backup software that creates and prunes backups. If none of the action options are given, then borgmatic defaults to: prune, create, and check archives.

# OPTIONS

## optional arguments

-h, \--help
:   Show this help message and exit

## global arguments

-c *[CONFIG_PATHS [CONFIG_PATHS ...]]*, \--config *[CONFIG_PATHS [CONFIG_PATHS ...]]*
:   Configuration filenames or directories, defaults to: /etc/borgmatic/config.yaml /etc/borgmatic.d /root/.config/borgmatic/config.yaml

\--excludes *EXCLUDES_FILENAME*
:   Deprecated in favor of exclude_patterns within configuration

-n, \--dry-run
:   Go through the motions, but do not actually write to any repositories

-nc, \--no-color
:   Disable colored output

-v *{0,1,2}*, \--verbosity *{0,1,2}*
:   Display verbose progress to the console (from none to lots: 0, 1, or 2)

\--syslog-verbosity *{0,1,2}*
:   Display verbose progress to syslog (from none to lots: 0, 1, or 2). Ignored when console is interactive

\--version
:   Display installed version number of borgmatic and exit

## actions

Specify zero or more actions. Defaults to prune, create, and check. Use --help with action for details:

init (*\--init, -I*)
:   Initialize an empty Borg repository

prune (*\--prune, -p*)
:   Prune archives according to the retention policy

create (*\--create, -C*)
:   Create archives (actually perform backups)

check (*\--check, -k*)
:   Check archives for consistency

extract (*\--extract, -x*)
:   Extract a named archive to the current directory

list (*\--list, -l*)
:   List archives

info (*\--info, -i*)
:   Display summary information on archives

# SEE ALSO

The borgmatic source code and all documentation may be downloaded from <https://github.com/witten/borgmatic>
