#include <stdio.h>
#include <string.h>

#include "version.h"

extern void boot_microdisc();

void version()
{
  printf("bootfd %s\n",VERSION);
}

void usage()
{
  printf("usage:\n");
  printf("boodfd\n");
  printf("boodfd -v|--version : displays version\n");
  printf("boodfd -h|--help : displays help\n");
  return;
}


int main(int argc,char *argv[])
{
  if (argc==2 && (strcmp(argv[1],"--version")==0 || strcmp(argv[1],"-v")==0 ))
  {
    version();
    return 0;
  }

  if (argc==2 && (strcmp(argv[1],"--help")==0 || strcmp(argv[1],"-h")==0 ))
  {
    usage();
    return 0;
  }  
    
  if (argc!=1)
  {
    usage();
    return 1;
  }

  boot_microdisc();
  return 0;  
	
}
