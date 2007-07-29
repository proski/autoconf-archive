##### http://autoconf-archive.cryp.to/ac_var_timezone_externals.html
#
# SYNOPSIS
#
#   AC_VAR_TIMEZONE_EXTERNALS
#
# DESCRIPTION
#
#   Use instead of `AC_STRUCT_TIMEZONE' to determine whether the the
#   external timezone variables `timezone', `altzone' and `daylight'
#   exist, defining `HAVE_TIMEZONE', `HAVE_ALTZONE' and `HAVE_DAYLIGHT'
#   respectively (as well as gaining the macros defined by
#   `AC_STRUCT_TIMEZONE').
#
# LAST MODIFICATION
#
#   2007-07-29
#
# COPYLEFT
#
#   Copyright (c) 2007 Mark R. Bannister
#
#   This program is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License as
#   published by the Free Software Foundation; either version 2 of the
#   License, or (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#   General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
#   02111-1307, USA.
#
#   As a special exception, the respective Autoconf Macro's copyright
#   owner gives unlimited permission to copy, distribute and modify the
#   configure scripts that are the output of Autoconf when processing
#   the Macro. You need not follow the terms of the GNU General Public
#   License when using or distributing such scripts, even though
#   portions of the text of the Macro appear in them. The GNU General
#   Public License (GPL) does govern all other use of the material that
#   constitutes the Autoconf Macro.
#
#   This special exception to the GPL applies to versions of the
#   Autoconf Macro released by the Autoconf Macro Archive. When you
#   make and distribute a modified version of the Autoconf Macro, you
#   may extend this special exception to the GPL to apply to your
#   modified version as well.

AC_DEFUN([AC_VAR_TIMEZONE_EXTERNALS],
[  AC_REQUIRE([AC_STRUCT_TIMEZONE])dnl
   AC_CACHE_CHECK(for timezone external, mb_cv_var_timezone,
   [  AC_TRY_LINK([#include <time.h>], [return (int)timezone;],
         mb_cv_var_timezone=yes,
         mb_cv_var_timezone=no)
   ])
   AC_CACHE_CHECK(for altzone external, mb_cv_var_altzone,
   [  AC_TRY_LINK([#include <time.h>], [return (int)altzone;],
         mb_cv_var_altzone=yes,
         mb_cv_var_altzone=no)
   ])
   AC_CACHE_CHECK(for daylight external, mb_cv_var_daylight,
   [  AC_TRY_LINK([#include <time.h>], [return (int)daylight;],
         mb_cv_var_daylight=yes,
         mb_cv_var_daylight=no)
   ])
   if test $mb_cv_var_timezone = yes; then
      AC_DEFINE([HAVE_TIMEZONE], 1,
              [Define if you have the external `timezone' variable.])
   fi
   if test $mb_cv_var_altzone = yes; then
      AC_DEFINE([HAVE_ALTZONE], 1,
              [Define if you have the external `altzone' variable.])
   fi
   if test $mb_cv_var_daylight = yes; then
      AC_DEFINE([HAVE_DAYLIGHT], 1,
              [Define if you have the external `daylight' variable.])
   fi
])
