/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"fixinc/tests/inc/curses.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */



#if defined( AVOID_BOOL_DEFINE_CHECK )
#ifndef __cplusplus
# define bool	 char 
#endif

#endif  /* AVOID_BOOL_DEFINE_CHECK */


#if defined( AVOID_BOOL_TYPE_CHECK )
#ifndef __cplusplus
typedef unsigned int	bool 	;
#endif /* bool
 type */
#endif  /* AVOID_BOOL_TYPE_CHECK */


#if defined( BAD_STRUCT_TERM_CHECK )
struct term;
#endif  /* BAD_STRUCT_TERM_CHECK */


#if defined( LYNX_VOID_INT_CHECK )
/* curses foiled again */
#endif  /* LYNX_VOID_INT_CHECK */


#if defined( VOID_NULL_CHECK )
#ifndef NULL
#define NULL 0  /* typed NULL */
#endif
#endif  /* VOID_NULL_CHECK */