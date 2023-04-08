
_mycat2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, const char *argv[]) {
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 28             	sub    $0x28,%esp
  18:	8b 01                	mov    (%ecx),%eax
  1a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1d:	8b 51 04             	mov    0x4(%ecx),%edx
  20:	89 55 cc             	mov    %edx,-0x34(%ebp)
    if(1 >= argc) {
  23:	83 f8 01             	cmp    $0x1,%eax
  26:	7e 09                	jle    31 <main+0x31>
        write(2, "Usage: <path>\n", 14);
    } else {
        for(int i = 1; i < argc; i++) {
  28:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  2f:	eb 49                	jmp    7a <main+0x7a>
        write(2, "Usage: <path>\n", 14);
  31:	83 ec 04             	sub    $0x4,%esp
  34:	6a 0e                	push   $0xe
  36:	68 ba 01 00 00       	push   $0x1ba
  3b:	6a 02                	push   $0x2
  3d:	e8 c8 00 00 00       	call   10a <write>
  42:	83 c4 10             	add    $0x10,%esp
            }
            close(fd);
        }
    }
    return 0;
}
  45:	b8 00 00 00 00       	mov    $0x0,%eax
  4a:	8d 65 f0             	lea    -0x10(%ebp),%esp
  4d:	59                   	pop    %ecx
  4e:	5b                   	pop    %ebx
  4f:	5e                   	pop    %esi
  50:	5f                   	pop    %edi
  51:	5d                   	pop    %ebp
  52:	8d 61 fc             	lea    -0x4(%ecx),%esp
  55:	c3                   	ret    
                write(2, "Error Opening to file:\n", 23);
  56:	83 ec 04             	sub    $0x4,%esp
  59:	6a 17                	push   $0x17
  5b:	68 c9 01 00 00       	push   $0x1c9
  60:	6a 02                	push   $0x2
  62:	e8 a3 00 00 00       	call   10a <write>
  67:	83 c4 10             	add    $0x10,%esp
            close(fd);
  6a:	83 ec 0c             	sub    $0xc,%esp
  6d:	57                   	push   %edi
  6e:	e8 9f 00 00 00       	call   112 <close>
        for(int i = 1; i < argc; i++) {
  73:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
  77:	83 c4 10             	add    $0x10,%esp
  7a:	8b 55 d0             	mov    -0x30(%ebp),%edx
  7d:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  80:	7d c3                	jge    45 <main+0x45>
            const char *path = argv[i];
  82:	8b 45 cc             	mov    -0x34(%ebp),%eax
  85:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  88:	8b 04 88             	mov    (%eax,%ecx,4),%eax
            int fd = open(path, 0);
  8b:	83 ec 08             	sub    $0x8,%esp
  8e:	6a 00                	push   $0x0
  90:	50                   	push   %eax
  91:	e8 94 00 00 00       	call   12a <open>
  96:	89 c7                	mov    %eax,%edi
            if(0 > fd) {
  98:	83 c4 10             	add    $0x10,%esp
  9b:	85 c0                	test   %eax,%eax
  9d:	78 b7                	js     56 <main+0x56>
                char buffer[2] = {0,0};
  9f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
                    status = read(fd, buffer, 1);
  a5:	83 ec 04             	sub    $0x4,%esp
  a8:	6a 01                	push   $0x1
  aa:	8d 75 e6             	lea    -0x1a(%ebp),%esi
  ad:	56                   	push   %esi
  ae:	57                   	push   %edi
  af:	e8 4e 00 00 00       	call   102 <read>
  b4:	89 c3                	mov    %eax,%ebx
                    write(1, buffer, 1);
  b6:	83 c4 0c             	add    $0xc,%esp
  b9:	6a 01                	push   $0x1
  bb:	56                   	push   %esi
  bc:	6a 01                	push   $0x1
  be:	e8 47 00 00 00       	call   10a <write>
                } while(0 < status);
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 db                	test   %ebx,%ebx
  c8:	7f db                	jg     a5 <main+0xa5>
                if(0 > status) {
  ca:	79 9e                	jns    6a <main+0x6a>
                    write(2, "Error: Writing to file:\n", 25);
  cc:	83 ec 04             	sub    $0x4,%esp
  cf:	6a 19                	push   $0x19
  d1:	68 e1 01 00 00       	push   $0x1e1
  d6:	6a 02                	push   $0x2
  d8:	e8 2d 00 00 00       	call   10a <write>
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	eb 88                	jmp    6a <main+0x6a>

000000e2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
  e2:	b8 01 00 00 00       	mov    $0x1,%eax
  e7:	cd 40                	int    $0x40
  e9:	c3                   	ret    

000000ea <exit>:
SYSCALL(exit)
  ea:	b8 02 00 00 00       	mov    $0x2,%eax
  ef:	cd 40                	int    $0x40
  f1:	c3                   	ret    

000000f2 <wait>:
SYSCALL(wait)
  f2:	b8 03 00 00 00       	mov    $0x3,%eax
  f7:	cd 40                	int    $0x40
  f9:	c3                   	ret    

000000fa <pipe>:
SYSCALL(pipe)
  fa:	b8 04 00 00 00       	mov    $0x4,%eax
  ff:	cd 40                	int    $0x40
 101:	c3                   	ret    

00000102 <read>:
SYSCALL(read)
 102:	b8 05 00 00 00       	mov    $0x5,%eax
 107:	cd 40                	int    $0x40
 109:	c3                   	ret    

0000010a <write>:
SYSCALL(write)
 10a:	b8 10 00 00 00       	mov    $0x10,%eax
 10f:	cd 40                	int    $0x40
 111:	c3                   	ret    

00000112 <close>:
SYSCALL(close)
 112:	b8 15 00 00 00       	mov    $0x15,%eax
 117:	cd 40                	int    $0x40
 119:	c3                   	ret    

0000011a <kill>:
SYSCALL(kill)
 11a:	b8 06 00 00 00       	mov    $0x6,%eax
 11f:	cd 40                	int    $0x40
 121:	c3                   	ret    

00000122 <exec>:
SYSCALL(exec)
 122:	b8 07 00 00 00       	mov    $0x7,%eax
 127:	cd 40                	int    $0x40
 129:	c3                   	ret    

0000012a <open>:
SYSCALL(open)
 12a:	b8 0f 00 00 00       	mov    $0xf,%eax
 12f:	cd 40                	int    $0x40
 131:	c3                   	ret    

00000132 <mknod>:
SYSCALL(mknod)
 132:	b8 11 00 00 00       	mov    $0x11,%eax
 137:	cd 40                	int    $0x40
 139:	c3                   	ret    

0000013a <unlink>:
SYSCALL(unlink)
 13a:	b8 12 00 00 00       	mov    $0x12,%eax
 13f:	cd 40                	int    $0x40
 141:	c3                   	ret    

00000142 <fstat>:
SYSCALL(fstat)
 142:	b8 08 00 00 00       	mov    $0x8,%eax
 147:	cd 40                	int    $0x40
 149:	c3                   	ret    

0000014a <link>:
SYSCALL(link)
 14a:	b8 13 00 00 00       	mov    $0x13,%eax
 14f:	cd 40                	int    $0x40
 151:	c3                   	ret    

00000152 <mkdir>:
SYSCALL(mkdir)
 152:	b8 14 00 00 00       	mov    $0x14,%eax
 157:	cd 40                	int    $0x40
 159:	c3                   	ret    

0000015a <chdir>:
SYSCALL(chdir)
 15a:	b8 09 00 00 00       	mov    $0x9,%eax
 15f:	cd 40                	int    $0x40
 161:	c3                   	ret    

00000162 <dup>:
SYSCALL(dup)
 162:	b8 0a 00 00 00       	mov    $0xa,%eax
 167:	cd 40                	int    $0x40
 169:	c3                   	ret    

0000016a <getpid>:
SYSCALL(getpid)
 16a:	b8 0b 00 00 00       	mov    $0xb,%eax
 16f:	cd 40                	int    $0x40
 171:	c3                   	ret    

00000172 <sbrk>:
SYSCALL(sbrk)
 172:	b8 0c 00 00 00       	mov    $0xc,%eax
 177:	cd 40                	int    $0x40
 179:	c3                   	ret    

0000017a <sleep>:
SYSCALL(sleep)
 17a:	b8 0d 00 00 00       	mov    $0xd,%eax
 17f:	cd 40                	int    $0x40
 181:	c3                   	ret    

00000182 <uptime>:
SYSCALL(uptime)
 182:	b8 0e 00 00 00       	mov    $0xe,%eax
 187:	cd 40                	int    $0x40
 189:	c3                   	ret    

0000018a <yield>:
SYSCALL(yield)
 18a:	b8 16 00 00 00       	mov    $0x16,%eax
 18f:	cd 40                	int    $0x40
 191:	c3                   	ret    

00000192 <shutdown>:
SYSCALL(shutdown)
 192:	b8 17 00 00 00       	mov    $0x17,%eax
 197:	cd 40                	int    $0x40
 199:	c3                   	ret    

0000019a <ps>:
SYSCALL(ps)
 19a:	b8 18 00 00 00       	mov    $0x18,%eax
 19f:	cd 40                	int    $0x40
 1a1:	c3                   	ret    

000001a2 <nice>:
SYSCALL(nice)
 1a2:	b8 1b 00 00 00       	mov    $0x1b,%eax
 1a7:	cd 40                	int    $0x40
 1a9:	c3                   	ret    

000001aa <flock>:
SYSCALL(flock)
 1aa:	b8 19 00 00 00       	mov    $0x19,%eax
 1af:	cd 40                	int    $0x40
 1b1:	c3                   	ret    

000001b2 <funlock>:
 1b2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 1b7:	cd 40                	int    $0x40
 1b9:	c3                   	ret    
