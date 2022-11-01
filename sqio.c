#include <stdlib.h>
#include <stdio.h>
#include "sqcom.h"
#include "sq.h"
#define ERROR -1

/* Get next byte from file and update checksum */

int
getc_crc(FILE *ib)
{
	int c;

	c = getc(ib);
	if (c != EOF)
		crc += c;		/* checksum */
	return (c);
}

/* Output functions with error reporting */

static char obuf[128];
static int oblen = 0;

void putce(int c, FILE *iob)
{
	obuf[oblen++] = c;
	if (oblen >= sizeof(obuf)) oflush(iob);
}

void putwe(int w, FILE *iob)
{
	obuf[oblen++] = w;
	if (oblen >= sizeof(obuf)) oflush(iob);
	obuf[oblen++] = w >> 8;
	if (oblen >= sizeof(obuf)) oflush(iob);
}

void oflush(FILE *iob)				/* flush output buffer */

{
	if (oblen && !fwrite(obuf, oblen, 1, iob)) {
		printf("Error writing output file\n");
		exit(1);
	}
	oblen = 0;
}
