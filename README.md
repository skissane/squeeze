# SQUEEZE/UNSQUEEZE

My forked version, based off [larsbrinkhoff/squeeze](https://github.com/larsbrinkhoff/squeeze).

Changes I have made:
- Modernise C syntax from K&R to ANSI/ISO
- Add 'make clean'
- Add .gitignore
- Replace original `README` with this `README.md`
- Add `LICENSE` (which notes that the actual license of this code is unclear)
- Add `roundtrip.sh` as a test/demo

# Test/example

Run: `./roundtrip.sh README.md`.

It both performs a round-trip test, and demonstrates how to use.

## Original README

```
Included in this distribution of 'sq' and 'usq' are:

	1) sq.1			- man page
	2) sqcom.h		- header file for sq and usq compilations
	3) sq.h			- header file for sq compilations
	4) usq.h		- header file for usq compilations
	5) sq.c, tr1.c, tr2.c,
	   sqio.c, sqdebug.c	- sources for sq
	6) usq.c, utr.c		- sources for usq
	7) makesq, makeusq	- 'make' files for sq and usq
	8) README		-  this file

With the exception of providing 'make' files for Unix, Xenix, etc. systems,
I have not included compilation instructions for other compilers.  The
only thing you need to know is which modules are linked with which programs.
To link 'sq', compile:

	sq.c
	tr1.c
	tr2.c
	sqio.c

and then link the four object files with your standard libraries to produce
the binary for 'sq'.  If you need to debug 'sq', compile sqdebug.c, set the
DEBUG #define in tr2.c, recompile tr2.c, and relink the above four files
plus sqdebug.

To create 'usq', compile:

	usq.c
	utr.c

and then link the two object files with your standard libraries to produce
the binary for 'usq'.

There are two system-dependent #define's in sq.c which may need to be
modified.  They are at the beginning of the source (after the large block
of comments), and are FNM_LEN and UNIX.

FNM_LEN should be set to the maximum length of a file name on the target
system.

UNIX should be defined for Unix or a derivative, and undefined (i.e.,
commented out) for CP/M, MP/M, MS-DOS, PC-DOS, or any system that
has separate file "names" and "types" (delimited by a period).

I have compiled and tested the code with the following compilers on
the following systems:

system "C" compiler		Xenix (Altos 586)
system "C" compiler		Unix BSD 4.2 (Vax 780)
system "C" compiler		Zeus (Zilog Z8000)
Computer Innovations C86	PC-DOS (MS-DOS) (IBM PC, etc.)
Computer Innovations C86	CP/M-86 (Altos 586)
DeSmet C88			CP/M-86 (Altos 586)
Aztec C II			CP/M-80 (CompuPro)

If some of the code looks funny (read: slow), remember that it has to be
portable accross all the above systems, and I get tired of too many
#define's.  If you successfully port it to some system that requires
minor (but backwards compatible) changes, let me know, and I'll update
them into my sources, and make sure they still work on the above systems.

Oh, and also, for those of you who argue that compact and uncompact should
be used under Unix, consider the following:

1)  These programs are compatible with the popular 'SQ' and 'USQ' programs
found on many bulletin board systems.  Files squeezed by other programs
will always be unsqueezable by any version of 'usq'.

2)  You have the sources yourself.  PLEASE don't make changes which affect
the internal format of the squeezed file.  This causes great portability
and compatibility headaches.

3)  'sq' and 'usq' are faster than compact/uncompact, and since they use
an adaptive Huffman coding, rather than a fixed one, they compress files
as well or better.

Notes for version 3.2:

Several files were modified as per the following request. Other than adding
parens and incrementing revision number, there were no changes. This has been
tested on the system "C" compiler under Berkeley 4.2BSD [VAX 750].
-William Swan

    Date: Friday, 3 May 1985
    From: Richard Hartman
    To:   Keith Petersen

    The following SQU-PORT files needed to be modified to work with DECUS
    C compiler on VAX/VMS.
	sqio.c tr1.c tr2.c usq.c utr.c
    The modification was minor, each statement of form:
	return x;
    is required to have a parenthesized expression:
	return (x);
    this change will not affect adversely any compiler I know of (and it
    is better style anyway...) so I suggest that it be added into the
    source SQU-PORT when it is convenient.
```
