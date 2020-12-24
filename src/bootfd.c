#include <stdio.h>
#include <string.h>
#include <PEEKPOKE.h>

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

unsigned char eprom[8192];


extern void copy_eeprom();

unsigned char read_load_microdisc_eprom()
{
  FILE *fp;

  unsigned int nb;
  fp=fopen("/usr/share/bootfd/microdis.rom","r");
  if (fp==NULL)
  {
    printf("Can't open /usr/share/bootfd/mdisc.rom\n");
    return 1;
  }

  nb=fread(eprom,1,8192,fp);

  // Then copy now


  fclose(fp);

  
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
  
  if (PEEK(0x342)&15 <2) {
    printf("It needs to have twilighte board firmware 2 to start\n");
    return 1;

  }
    
  
  read_load_microdisc_eprom();
  copy_eeprom(eprom);
  return 0;
  	
}
