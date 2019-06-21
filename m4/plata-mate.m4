# PLATA_MATE ()
# -----------------------------------------------------------
AC_DEFUN([PLATA_MATE], [
    MATE_IS_SUPPORTED="no"

    AS_IF(
        [test x"$ENABLE_MATE" = xyes], [
            MARCO_VERSION=`$PKG_CONFIG --modversion libmarco-private`
            MARCO_MINOR_VERSION=`echo $MARCO_VERSION | cut -d'.' -f2`
            MARCO_MICRO_VERSION=`echo $MARCO_VERSION | cut -d'.' -f3`

            AS_IF(
                [test `echo $MARCO_MINOR_VERSION` -eq "22"], [
                    AS_IF(
                        [test `echo $MARCO_MICRO_VERSION` -ge "2"],
                        [MATE_IS_SUPPORTED="yes"],
                        [MATE_IS_SUPPORTED="no"]
                    )
                ])
            AS_IF(
                [test `echo $MARCO_MINOR_VERSION` -ge "23"],
                [MATE_IS_SUPPORTED="yes"]
            )
        ])
    AC_SUBST([MATE_IS_SUPPORTED])
    AC_MSG_RESULT([checking for Mate Gtk theming support... $MATE_IS_SUPPORTED])

# Store flag into SCSS file
echo \
"// Mate support flag
\$mate_support: `echo $MATE_IS_SUPPORTED`;" \
> ./src/gtk/sass/common/resources/_mate_flag.scss

AC_MSG_RESULT([creating ./src/gtk/sass/common/resources/_mate_flag.scss])
])
