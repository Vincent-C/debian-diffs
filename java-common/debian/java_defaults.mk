
# makefile fragment to define the macros java_default_version,
# java{,5,6,7,8,9}_architectures

java9_architectures =
java8_architectures = $(java9_architectures) \
		alpha amd64 arm64 armel armhf i386 \
		m68k mips mipsel mips64el \
		powerpc powerpcspe ppc64 ppc64el \
		s390x sh4 sparc64 x32 \
		kfreebsd-amd64 kfreebsd-i386
java7_architectures = $(java8_architectures)
java6_architectures = $(java7_architectures)
java5_architectures = $(java6_architectures) \
		hppa ia64 s390 sparc \
		hurd-i386
java_architectures = $(java5_architectures)

java_plugin_architectures = \
		amd64 arm64 armel armhf i386 \
		powerpc ppc64 ppc64el s390x \
		kfreebsd-amd64 kfreebsd-i386 \
		x32

_java_host_arch := $(if $(DEB_HOST_ARCH),$(DEB_HOST_ARCH),$(shell dpkg-architecture -qDEB_HOST_ARCH))
ifneq (,$(filter $(_java_host_arch),$(java9_architectures)))
  java_default_version = 9
else ifneq (,$(filter $(_java_host_arch),$(java8_architectures)))
  java_default_version = 8
else ifneq (,$(filter $(_java_host_arch),$(java6_architectures)))
  java_default_version = 7
else ifneq (,$(filter $(_java_host_arch),$(java6_architectures)))
  java_default_version = 6
else ifneq (,$(filter $(_java_host_arch),$(java5_architectures)))
  java_default_version = 5
endif

# jvm_archdir is the directory for architecture specific files / libraries
# in <JAVA_HOME>/jre/lib/<jvm_archdir> or <JAVA_HOME>/lib/<jvm_archdir>
# jvm_archpath is the relative path of jvm_archdir in JAVA_HOME.

_java_host_cpu := $(if $(DEB_HOST_ARCH_CPU),$(DEB_HOST_ARCH_CPU),$(shell dpkg-architecture -qDEB_HOST_ARCH_CPU))
jvm_archdir_map = \
	alpha=alpha armel=arm armhf=arm arm64=aarch64 amd64=amd64 hppa=parisc \
	i386=i386 m68k=m68k mips=mips mipsel=mipsel mips64=mips64 mips64el=mips64el \
	powerpc=ppc powerpcspe=ppc ppc64=ppc64 ppc64el=ppc64le \
	sparc=sparc sparc64=sparc64 sh4=sh s390x=s390x ia64=ia64 x32=x32

jvm_archdir := \
	$(strip $(patsubst $(_java_host_cpu)=%, %, $(filter $(_java_host_cpu)=%, $(jvm_archdir_map))))

ifneq (,$(filter $(java_default_version), 9))
  jvm_archpath := lib/$(jvm_archdir)
else
  jvm_archpath := jre/lib/$(jvm_archdir)
endif

_jvm_osinclude = linux
ifeq ($(java_default_version),5)
  jvm_includes = \
	-I/usr/lib/jvm/java-gcj/include -I/usr/lib/jvm/java-gcj/include/$(_jvm_osinclude)
else
  ifeq (,$(filter $(java_default_version), 6 7))
    _jvm_osinclude = $(if $(findstring kfreebsd,$(_java_host_arch)),bsd,linux)
  endif
  jvm_includes = \
	-I/usr/lib/jvm/java-$(java_default_version)-openjdk-$(_java_host_arch)/include \
	-I/usr/lib/jvm/java-$(java_default_version)-openjdk-$(_java_host_arch)/include/$(_jvm_osinclude)
endif
