
_shutdown:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 e4 f0             	and    $0xfffffff0,%esp
  shutdown();
   a:	e8 b5 00 00 00       	call   c4 <shutdown>
  exit();
   f:	e8 08 00 00 00       	call   1c <exit>

00000014 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
  14:	b8 01 00 00 00       	mov    $0x1,%eax
  19:	cd 40                	int    $0x40
  1b:	c3                   	ret    

0000001c <exit>:
SYSCALL(exit)
  1c:	b8 02 00 00 00       	mov    $0x2,%eax
  21:	cd 40                	int    $0x40
  23:	c3                   	ret    

00000024 <wait>:
SYSCALL(wait)
  24:	b8 03 00 00 00       	mov    $0x3,%eax
  29:	cd 40                	int    $0x40
  2b:	c3                   	ret    

0000002c <pipe>:
SYSCALL(pipe)
  2c:	b8 04 00 00 00       	mov    $0x4,%eax
  31:	cd 40                	int    $0x40
  33:	c3                   	ret    

00000034 <read>:
SYSCALL(read)
  34:	b8 05 00 00 00       	mov    $0x5,%eax
  39:	cd 40                	int    $0x40
  3b:	c3                   	ret    

0000003c <write>:
SYSCALL(write)
  3c:	b8 10 00 00 00       	mov    $0x10,%eax
  41:	cd 40                	int    $0x40
  43:	c3                   	ret    

00000044 <close>:
SYSCALL(close)
  44:	b8 15 00 00 00       	mov    $0x15,%eax
  49:	cd 40                	int    $0x40
  4b:	c3                   	ret    

0000004c <kill>:
SYSCALL(kill)
  4c:	b8 06 00 00 00       	mov    $0x6,%eax
  51:	cd 40                	int    $0x40
  53:	c3                   	ret    

00000054 <exec>:
SYSCALL(exec)
  54:	b8 07 00 00 00       	mov    $0x7,%eax
  59:	cd 40                	int    $0x40
  5b:	c3                   	ret    

0000005c <open>:
SYSCALL(open)
  5c:	b8 0f 00 00 00       	mov    $0xf,%eax
  61:	cd 40                	int    $0x40
  63:	c3                   	ret    

00000064 <mknod>:
SYSCALL(mknod)
  64:	b8 11 00 00 00       	mov    $0x11,%eax
  69:	cd 40                	int    $0x40
  6b:	c3                   	ret    

0000006c <unlink>:
SYSCALL(unlink)
  6c:	b8 12 00 00 00       	mov    $0x12,%eax
  71:	cd 40                	int    $0x40
  73:	c3                   	ret    

00000074 <fstat>:
SYSCALL(fstat)
  74:	b8 08 00 00 00       	mov    $0x8,%eax
  79:	cd 40                	int    $0x40
  7b:	c3                   	ret    

0000007c <link>:
SYSCALL(link)
  7c:	b8 13 00 00 00       	mov    $0x13,%eax
  81:	cd 40                	int    $0x40
  83:	c3                   	ret    

00000084 <mkdir>:
SYSCALL(mkdir)
  84:	b8 14 00 00 00       	mov    $0x14,%eax
  89:	cd 40                	int    $0x40
  8b:	c3                   	ret    

0000008c <chdir>:
SYSCALL(chdir)
  8c:	b8 09 00 00 00       	mov    $0x9,%eax
  91:	cd 40                	int    $0x40
  93:	c3                   	ret    

00000094 <dup>:
SYSCALL(dup)
  94:	b8 0a 00 00 00       	mov    $0xa,%eax
  99:	cd 40                	int    $0x40
  9b:	c3                   	ret    

0000009c <getpid>:
SYSCALL(getpid)
  9c:	b8 0b 00 00 00       	mov    $0xb,%eax
  a1:	cd 40                	int    $0x40
  a3:	c3                   	ret    

000000a4 <sbrk>:
SYSCALL(sbrk)
  a4:	b8 0c 00 00 00       	mov    $0xc,%eax
  a9:	cd 40                	int    $0x40
  ab:	c3                   	ret    

000000ac <sleep>:
SYSCALL(sleep)
  ac:	b8 0d 00 00 00       	mov    $0xd,%eax
  b1:	cd 40                	int    $0x40
  b3:	c3                   	ret    

000000b4 <uptime>:
SYSCALL(uptime)
  b4:	b8 0e 00 00 00       	mov    $0xe,%eax
  b9:	cd 40                	int    $0x40
  bb:	c3                   	ret    

000000bc <yield>:
SYSCALL(yield)
  bc:	b8 16 00 00 00       	mov    $0x16,%eax
  c1:	cd 40                	int    $0x40
  c3:	c3                   	ret    

000000c4 <shutdown>:
SYSCALL(shutdown)
  c4:	b8 17 00 00 00       	mov    $0x17,%eax
  c9:	cd 40                	int    $0x40
  cb:	c3                   	ret    

000000cc <ps>:
SYSCALL(ps)
  cc:	b8 18 00 00 00       	mov    $0x18,%eax
  d1:	cd 40                	int    $0x40
  d3:	c3                   	ret    

000000d4 <nice>:
SYSCALL(nice)
  d4:	b8 1b 00 00 00       	mov    $0x1b,%eax
  d9:	cd 40                	int    $0x40
  db:	c3                   	ret    

000000dc <flock>:
SYSCALL(flock)
  dc:	b8 19 00 00 00       	mov    $0x19,%eax
  e1:	cd 40                	int    $0x40
  e3:	c3                   	ret    

000000e4 <funlock>:
  e4:	b8 1a 00 00 00       	mov    $0x1a,%eax
  e9:	cd 40                	int    $0x40
  eb:	c3                   	ret    
