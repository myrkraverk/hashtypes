#include "postgres.h"
#include "fmgr.h"

#include <stdint.h>

typedef uint32 crc32;

#define PG_GETARG_CRC32(N)    PG_GETARG_UINT32(N)
#define PG_RETURN_CRC32(X)    PG_RETURN_UINT32(X)

PGDLLEXPORT Datum crc32_in(PG_FUNCTION_ARGS);
PGDLLEXPORT Datum crc32_out(PG_FUNCTION_ARGS);

PG_FUNCTION_INFO_V1(crc32_in);
Datum
crc32_in(PG_FUNCTION_ARGS)
{
  char *in = PG_GETARG_CSTRING(0);

  if (strlen(in) > 8)
  {
    ereport(ERROR, (
      errcode(ERRCODE_INVALID_PARAMETER_VALUE),
      errmsg("crc32 value cannot exceed 32 bits")));
  }

  crc32 *out = palloc(sizeof(crc32));


  char *p;
  errno = 0;
  long int pout = strtol(in, &p, 16);
  if (errno != 0 || *p != 0 || p == in)
  {
    ereport(ERROR, (
      errcode(ERRCODE_INVALID_PARAMETER_VALUE),
      errmsg("cannot parse hex value")));
  }

  /* I don't check if pout overflows uint32 because it's restricted by string
   * length check above.
   */
  out = (uint32_t)pout;

  PG_RETURN_CRC32(out);
}

PG_FUNCTION_INFO_V1(crc32_out);
Datum
crc32_out(PG_FUNCTION_ARGS)
{
  crc32 *in = PG_GETARG_CRC32(0);
  char *out = (char *) palloc(10);
  snprintf(out, 10, "%08x", in);
  PG_RETURN_CSTRING(out);
}

