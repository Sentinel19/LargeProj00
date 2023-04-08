
_longRunner:     file format elf32-i386


Disassembly of section .text:

00000000 <loop>:
#include "user.h"

static volatile int counter = 0;

int loop(int n)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	53                   	push   %ebx
    for(int i = n * 4096; i > 0; --i) {
   8:	8b 5d 08             	mov    0x8(%ebp),%ebx
   b:	c1 e3 0c             	shl    $0xc,%ebx
   e:	89 d9                	mov    %ebx,%ecx
  10:	eb 17                	jmp    29 <loop+0x29>
        for(int j = n * 4096; j > 0; --j) {
            counter += 1;
  12:	a1 44 01 00 00       	mov    0x144,%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	a3 44 01 00 00       	mov    %eax,0x144
        for(int j = n * 4096; j > 0; --j) {
  1f:	83 ea 01             	sub    $0x1,%edx
  22:	85 d2                	test   %edx,%edx
  24:	7f ec                	jg     12 <loop+0x12>
    for(int i = n * 4096; i > 0; --i) {
  26:	83 e9 01             	sub    $0x1,%ecx
  29:	85 c9                	test   %ecx,%ecx
  2b:	7e 04                	jle    31 <loop+0x31>
        for(int j = n * 4096; j > 0; --j) {
  2d:	89 da                	mov    %ebx,%edx
  2f:	eb f1                	jmp    22 <loop+0x22>
        }
    }
    return counter;
  31:	a1 44 01 00 00       	mov    0x144,%eax
}
  36:	5b                   	pop    %ebx
  37:	5d                   	pop    %ebp
  38:	c3                   	ret    

00000039 <main>:

int
main(int argc, char *argv[])
{
  39:	f3 0f 1e fb          	endbr32 
  3d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  41:	83 e4 f0             	and    $0xfffffff0,%esp
  44:	ff 71 fc             	pushl  -0x4(%ecx)
  47:	55                   	push   %ebp
  48:	89 e5                	mov    %esp,%ebp
  4a:	53                   	push   %ebx
  4b:	51                   	push   %ecx
    for(int j = 3; j > 0; --j) {
  4c:	bb 03 00 00 00       	mov    $0x3,%ebx
  51:	eb 0f                	jmp    62 <main+0x29>
        loop(j);
  53:	83 ec 0c             	sub    $0xc,%esp
  56:	53                   	push   %ebx
  57:	e8 a4 ff ff ff       	call   0 <loop>
    for(int j = 3; j > 0; --j) {
  5c:	83 eb 01             	sub    $0x1,%ebx
  5f:	83 c4 10             	add    $0x10,%esp
  62:	85 db                	test   %ebx,%ebx
  64:	7f ed                	jg     53 <main+0x1a>
    }
    exit();
  66:	e8 08 00 00 00       	call   73 <exit>

0000006b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
  6b:	b8 01 00 00 00       	mov    $0x1,%eax
  70:	cd 40                	int    $0x40
  72:	c3                   	ret    

00000073 <exit>:
SYSCALL(exit)
  73:	b8 02 00 00 00       	mov    $0x2,%eax
  78:	cd 40                	int    $0x40
  7a:	c3                   	ret    

0000007b <wait>:
SYSCALL(wait)
  7b:	b8 03 00 00 00       	mov    $0x3,%eax
  80:	cd 40                	int    $0x40
  82:	c3                   	ret    

00000083 <pipe>:
SYSCALL(pipe)
  83:	b8 04 00 00 00       	mov    $0x4,%eax
  88:	cd 40                	int    $0x40
  8a:	c3                   	ret    

0000008b <read>:
SYSCALL(read)
  8b:	b8 05 00 00 00       	mov    $0x5,%eax
  90:	cd 40                	int    $0x40
  92:	c3                   	ret    

00000093 <write>:
SYSCALL(write)
  93:	b8 10 00 00 00       	mov    $0x10,%eax
  98:	cd 40                	int    $0x40
  9a:	c3                   	ret    

0000009b <close>:
SYSCALL(close)
  9b:	b8 15 00 00 00       	mov    $0x15,%eax
  a0:	cd 40                	int    $0x40
  a2:	c3                   	ret    

000000a3 <kill>:
SYSCALL(kill)
  a3:	b8 06 00 00 00       	mov    $0x6,%eax
  a8:	cd 40                	int    $0x40
  aa:	c3                   	ret    

000000ab <exec>:
SYSCALL(exec)
  ab:	b8 07 00 00 00       	mov    $0x7,%eax
  b0:	cd 40                	int    $0x40
  b2:	c3                   	ret    

000000b3 <open>:
SYSCALL(open)
  b3:	b8 0f 00 00 00       	mov    $0xf,%eax
  b8:	cd 40                	int    $0x40
  ba:	c3                   	ret    

000000bb <mknod>:
SYSCALL(mknod)
  bb:	b8 11 00 00 00       	mov    $0x11,%eax
  c0:	cd 40                	int    $0x40
  c2:	c3                   	ret    

000000c3 <unlink>:
SYSCALL(unlink)
  c3:	b8 12 00 00 00       	mov    $0x12,%eax
  c8:	cd 40                	int    $0x40
  ca:	c3                   	ret    

000000cb <fstat>:
SYSCALL(fstat)
  cb:	b8 08 00 00 00       	mov    $0x8,%eax
  d0:	cd 40                	int    $0x40
  d2:	c3                   	ret    

000000d3 <link>:
SYSCALL(link)
  d3:	b8 13 00 00 00       	mov    $0x13,%eax
  d8:	cd 40                	int    $0x40
  da:	c3                   	ret    

000000db <mkdir>:
SYSCALL(mkdir)
  db:	b8 14 00 00 00       	mov    $0x14,%eax
  e0:	cd 40                	int    $0x40
  e2:	c3                   	ret    

000000e3 <chdir>:
SYSCALL(chdir)
  e3:	b8 09 00 00 00       	mov    $0x9,%eax
  e8:	cd 40                	int    $0x40
  ea:	c3                   	ret    

000000eb <dup>:
SYSCALL(dup)
  eb:	b8 0a 00 00 00       	mov    $0xa,%eax
  f0:	cd 40                	int    $0x40
  f2:	c3                   	ret    

000000f3 <getpid>:
SYSCALL(getpid)
  f3:	b8 0b 00 00 00       	mov    $0xb,%eax
  f8:	cd 40                	int    $0x40
  fa:	c3                   	ret    

000000fb <sbrk>:
SYSCALL(sbrk)
  fb:	b8 0c 00 00 00       	mov    $0xc,%eax
 100:	cd 40                	int    $0x40
 102:	c3                   	ret    

00000103 <sleep>:
SYSCALL(sleep)
 103:	b8 0d 00 00 00       	mov    $0xd,%eax
 108:	cd 40                	int    $0x40
 10a:	c3                   	ret    

0000010b <uptime>:
SYSCALL(uptime)
 10b:	b8 0e 00 00 00       	mov    $0xe,%eax
 110:	cd 40                	int    $0x40
 112:	c3                   	ret    

00000113 <yield>:
SYSCALL(yield)
 113:	b8 16 00 00 00       	mov    $0x16,%eax
 118:	cd 40                	int    $0x40
 11a:	c3                   	ret    

0000011b <shutdown>:
SYSCALL(shutdown)
 11b:	b8 17 00 00 00       	mov    $0x17,%eax
 120:	cd 40                	int    $0x40
 122:	c3                   	ret    

00000123 <ps>:
SYSCALL(ps)
 123:	b8 18 00 00 00       	mov    $0x18,%eax
 128:	cd 40                	int    $0x40
 12a:	c3                   	ret    

0000012b <nice>:
SYSCALL(nice)
 12b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 130:	cd 40                	int    $0x40
 132:	c3                   	ret    

00000133 <flock>:
SYSCALL(flock)
 133:	b8 19 00 00 00       	mov    $0x19,%eax
 138:	cd 40                	int    $0x40
 13a:	c3                   	ret    

0000013b <funlock>:
 13b:	b8 1a 00 00 00       	mov    $0x1a,%eax
 140:	cd 40                	int    $0x40
 142:	c3                   	ret    
