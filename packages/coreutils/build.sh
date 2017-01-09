TERMUX_PKG_HOMEPAGE=https://www.gnu.org/software/coreutils/
TERMUX_PKG_DESCRIPTION="Basic file, shell and text manipulation utilities from the GNU project"
TERMUX_PKG_VERSION=8.26
TERMUX_PKG_BUILD_REVISION=2
TERMUX_PKG_SRCURL=https://mirrors.kernel.org/gnu/coreutils/coreutils-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=155e94d748f8e2bc327c66e0cbebdb8d6ab265d2f37c3c928f7bf6c3beba9a8e
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="ac_cv_func_mkfifo=yes gl_cv_host_operating_system=Android --without-gmp --enable-single-binary=symlinks ac_cv_func_endpwent=no"
# pinky has no usage on Android.
# df does not work either, let system binary prevail.
# $PREFIX/bin/env is provided by busybox for shebangs to work directly.
# users and who doesn't work and does not make much sense for Termux.
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-no-install-program=pinky,df,chroot,env,users,who"
TERMUX_PKG_EXTRA_HOSTBUILD_CONFIGURE_ARGS="$TERMUX_PKG_EXTRA_CONFIGURE_ARGS"
TERMUX_PKG_BUILD_IN_SRC=yes
# Host build for man pages generated by help2man, see makefile.patch:
TERMUX_PKG_HOSTBUILD=yes

termux_step_pre_configure() {
	CPPFLAGS+=" -DDEFAULT_TMPDIR=\\\"$TERMUX_PREFIX/tmp\\\""
}
