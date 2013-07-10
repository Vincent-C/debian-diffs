debian-diffs
============

Contains Debian packaging files for packages maintained in my local repository

Ubuntu fonts:
There are 4 packages that are relevant for Debian users who want Ubuntu-like
font rendering:
 - freetype
 - fontconfig
 - cairo
 - libxft

libxft is now identical in Debian and Ubuntu, and cairo is practically the same
as well, with the sole exception of an additional patch being carried in Ubuntu
(server-side-gradients.patch, nothng to do with font rendering). Therefore, the
ony packages that need to be patched currently are freetype and fontconfig.
