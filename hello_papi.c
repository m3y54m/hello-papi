#include <stdlib.h>
#include <stdio.h>
#include <papi.h>

int retval;

int main()
{
  /* Initialize the PAPI library */
  retval = PAPI_library_init(PAPI_VER_CURRENT);

  if (retval != PAPI_VER_CURRENT && retval > 0) {
    fprintf(stderr,"PAPI library version mismatch!\n");
    exit(1);
  }

  if (retval < 0) {
    fprintf(stderr, "Initialization error!\n");
    exit(1);
  }

  fprintf(stdout, "PAPI Version Number\n");
  fprintf(stdout, "MAJOR:    %d\n", PAPI_VERSION_MAJOR(retval));
  fprintf(stdout, "MINOR:    %d\n", PAPI_VERSION_MINOR(retval));
  fprintf(stdout, "REVISION: %d\n", PAPI_VERSION_REVISION(retval));
  
  return 0;
}