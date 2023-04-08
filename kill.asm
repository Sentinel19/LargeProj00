
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
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
  15:	83 ec 08             	sub    $0x8,%esp
  18:	8b 31                	mov    (%ecx),%esi
  1a:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1d:	83 fe 01             	cmp    $0x1,%esi
  20:	7e 07                	jle    29 <main+0x29>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  22:	bb 01 00 00 00       	mov    $0x1,%ebx
  27:	eb 2d                	jmp    56 <main+0x56>
    printf(2, "usage: kill pid...\n");
  29:	83 ec 08             	sub    $0x8,%esp
  2c:	68 c8 06 00 00       	push   $0x6c8
  31:	6a 02                	push   $0x2
  33:	e8 63 06 00 00       	call   69b <printf>
    exit();
  38:	e8 df 01 00 00       	call   21c <exit>
    kill(atoi(argv[i]));
  3d:	83 ec 0c             	sub    $0xc,%esp
  40:	ff 34 9f             	pushl  (%edi,%ebx,4)
  43:	e8 6a 01 00 00       	call   1b2 <atoi>
  48:	89 04 24             	mov    %eax,(%esp)
  4b:	e8 fc 01 00 00       	call   24c <kill>
  for(i=1; i<argc; i++)
  50:	83 c3 01             	add    $0x1,%ebx
  53:	83 c4 10             	add    $0x10,%esp
  56:	39 f3                	cmp    %esi,%ebx
  58:	7c e3                	jl     3d <main+0x3d>
  exit();
  5a:	e8 bd 01 00 00       	call   21c <exit>

0000005f <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  5f:	f3 0f 1e fb          	endbr32 
  63:	55                   	push   %ebp
  64:	89 e5                	mov    %esp,%ebp
  66:	56                   	push   %esi
  67:	53                   	push   %ebx
  68:	8b 75 08             	mov    0x8(%ebp),%esi
  6b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6e:	89 f0                	mov    %esi,%eax
  70:	89 d1                	mov    %edx,%ecx
  72:	83 c2 01             	add    $0x1,%edx
  75:	89 c3                	mov    %eax,%ebx
  77:	83 c0 01             	add    $0x1,%eax
  7a:	0f b6 09             	movzbl (%ecx),%ecx
  7d:	88 0b                	mov    %cl,(%ebx)
  7f:	84 c9                	test   %cl,%cl
  81:	75 ed                	jne    70 <strcpy+0x11>
    ;
  return os;
}
  83:	89 f0                	mov    %esi,%eax
  85:	5b                   	pop    %ebx
  86:	5e                   	pop    %esi
  87:	5d                   	pop    %ebp
  88:	c3                   	ret    

00000089 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  89:	f3 0f 1e fb          	endbr32 
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	8b 4d 08             	mov    0x8(%ebp),%ecx
  93:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  96:	0f b6 01             	movzbl (%ecx),%eax
  99:	84 c0                	test   %al,%al
  9b:	74 0c                	je     a9 <strcmp+0x20>
  9d:	3a 02                	cmp    (%edx),%al
  9f:	75 08                	jne    a9 <strcmp+0x20>
    p++, q++;
  a1:	83 c1 01             	add    $0x1,%ecx
  a4:	83 c2 01             	add    $0x1,%edx
  a7:	eb ed                	jmp    96 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  a9:	0f b6 c0             	movzbl %al,%eax
  ac:	0f b6 12             	movzbl (%edx),%edx
  af:	29 d0                	sub    %edx,%eax
}
  b1:	5d                   	pop    %ebp
  b2:	c3                   	ret    

000000b3 <strlen>:

uint
strlen(const char *s)
{
  b3:	f3 0f 1e fb          	endbr32 
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  bd:	b8 00 00 00 00       	mov    $0x0,%eax
  c2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  c6:	74 05                	je     cd <strlen+0x1a>
  c8:	83 c0 01             	add    $0x1,%eax
  cb:	eb f5                	jmp    c2 <strlen+0xf>
    ;
  return n;
}
  cd:	5d                   	pop    %ebp
  ce:	c3                   	ret    

000000cf <memset>:

void*
memset(void *dst, int c, uint n)
{
  cf:	f3 0f 1e fb          	endbr32 
  d3:	55                   	push   %ebp
  d4:	89 e5                	mov    %esp,%ebp
  d6:	57                   	push   %edi
  d7:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  da:	89 d7                	mov    %edx,%edi
  dc:	8b 4d 10             	mov    0x10(%ebp),%ecx
  df:	8b 45 0c             	mov    0xc(%ebp),%eax
  e2:	fc                   	cld    
  e3:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e5:	89 d0                	mov    %edx,%eax
  e7:	5f                   	pop    %edi
  e8:	5d                   	pop    %ebp
  e9:	c3                   	ret    

000000ea <strchr>:

char*
strchr(const char *s, char c)
{
  ea:	f3 0f 1e fb          	endbr32 
  ee:	55                   	push   %ebp
  ef:	89 e5                	mov    %esp,%ebp
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  f8:	0f b6 10             	movzbl (%eax),%edx
  fb:	84 d2                	test   %dl,%dl
  fd:	74 09                	je     108 <strchr+0x1e>
    if(*s == c)
  ff:	38 ca                	cmp    %cl,%dl
 101:	74 0a                	je     10d <strchr+0x23>
  for(; *s; s++)
 103:	83 c0 01             	add    $0x1,%eax
 106:	eb f0                	jmp    f8 <strchr+0xe>
      return (char*)s;
  return 0;
 108:	b8 00 00 00 00       	mov    $0x0,%eax
}
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    

0000010f <gets>:

char*
gets(char *buf, int max)
{
 10f:	f3 0f 1e fb          	endbr32 
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	57                   	push   %edi
 117:	56                   	push   %esi
 118:	53                   	push   %ebx
 119:	83 ec 1c             	sub    $0x1c,%esp
 11c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 11f:	bb 00 00 00 00       	mov    $0x0,%ebx
 124:	89 de                	mov    %ebx,%esi
 126:	83 c3 01             	add    $0x1,%ebx
 129:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 12c:	7d 2e                	jge    15c <gets+0x4d>
    cc = read(0, &c, 1);
 12e:	83 ec 04             	sub    $0x4,%esp
 131:	6a 01                	push   $0x1
 133:	8d 45 e7             	lea    -0x19(%ebp),%eax
 136:	50                   	push   %eax
 137:	6a 00                	push   $0x0
 139:	e8 f6 00 00 00       	call   234 <read>
    if(cc < 1)
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	7e 17                	jle    15c <gets+0x4d>
      break;
    buf[i++] = c;
 145:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 149:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 14c:	3c 0a                	cmp    $0xa,%al
 14e:	0f 94 c2             	sete   %dl
 151:	3c 0d                	cmp    $0xd,%al
 153:	0f 94 c0             	sete   %al
 156:	08 c2                	or     %al,%dl
 158:	74 ca                	je     124 <gets+0x15>
    buf[i++] = c;
 15a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 15c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 160:	89 f8                	mov    %edi,%eax
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    

0000016a <stat>:

int
stat(const char *n, struct stat *st)
{
 16a:	f3 0f 1e fb          	endbr32 
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	56                   	push   %esi
 172:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 173:	83 ec 08             	sub    $0x8,%esp
 176:	6a 00                	push   $0x0
 178:	ff 75 08             	pushl  0x8(%ebp)
 17b:	e8 dc 00 00 00       	call   25c <open>
  if(fd < 0)
 180:	83 c4 10             	add    $0x10,%esp
 183:	85 c0                	test   %eax,%eax
 185:	78 24                	js     1ab <stat+0x41>
 187:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 189:	83 ec 08             	sub    $0x8,%esp
 18c:	ff 75 0c             	pushl  0xc(%ebp)
 18f:	50                   	push   %eax
 190:	e8 df 00 00 00       	call   274 <fstat>
 195:	89 c6                	mov    %eax,%esi
  close(fd);
 197:	89 1c 24             	mov    %ebx,(%esp)
 19a:	e8 a5 00 00 00       	call   244 <close>
  return r;
 19f:	83 c4 10             	add    $0x10,%esp
}
 1a2:	89 f0                	mov    %esi,%eax
 1a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a7:	5b                   	pop    %ebx
 1a8:	5e                   	pop    %esi
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    
    return -1;
 1ab:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1b0:	eb f0                	jmp    1a2 <stat+0x38>

000001b2 <atoi>:

int
atoi(const char *s)
{
 1b2:	f3 0f 1e fb          	endbr32 
 1b6:	55                   	push   %ebp
 1b7:	89 e5                	mov    %esp,%ebp
 1b9:	53                   	push   %ebx
 1ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1bd:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1c2:	0f b6 01             	movzbl (%ecx),%eax
 1c5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1c8:	80 fb 09             	cmp    $0x9,%bl
 1cb:	77 12                	ja     1df <atoi+0x2d>
    n = n*10 + *s++ - '0';
 1cd:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1d0:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1d3:	83 c1 01             	add    $0x1,%ecx
 1d6:	0f be c0             	movsbl %al,%eax
 1d9:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 1dd:	eb e3                	jmp    1c2 <atoi+0x10>
  return n;
}
 1df:	89 d0                	mov    %edx,%eax
 1e1:	5b                   	pop    %ebx
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    

000001e4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1e4:	f3 0f 1e fb          	endbr32 
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	56                   	push   %esi
 1ec:	53                   	push   %ebx
 1ed:	8b 75 08             	mov    0x8(%ebp),%esi
 1f0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1f3:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1f6:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1f8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1fb:	85 c0                	test   %eax,%eax
 1fd:	7e 0f                	jle    20e <memmove+0x2a>
    *dst++ = *src++;
 1ff:	0f b6 01             	movzbl (%ecx),%eax
 202:	88 02                	mov    %al,(%edx)
 204:	8d 49 01             	lea    0x1(%ecx),%ecx
 207:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 20a:	89 d8                	mov    %ebx,%eax
 20c:	eb ea                	jmp    1f8 <memmove+0x14>
  return vdst;
}
 20e:	89 f0                	mov    %esi,%eax
 210:	5b                   	pop    %ebx
 211:	5e                   	pop    %esi
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    

00000214 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 214:	b8 01 00 00 00       	mov    $0x1,%eax
 219:	cd 40                	int    $0x40
 21b:	c3                   	ret    

0000021c <exit>:
SYSCALL(exit)
 21c:	b8 02 00 00 00       	mov    $0x2,%eax
 221:	cd 40                	int    $0x40
 223:	c3                   	ret    

00000224 <wait>:
SYSCALL(wait)
 224:	b8 03 00 00 00       	mov    $0x3,%eax
 229:	cd 40                	int    $0x40
 22b:	c3                   	ret    

0000022c <pipe>:
SYSCALL(pipe)
 22c:	b8 04 00 00 00       	mov    $0x4,%eax
 231:	cd 40                	int    $0x40
 233:	c3                   	ret    

00000234 <read>:
SYSCALL(read)
 234:	b8 05 00 00 00       	mov    $0x5,%eax
 239:	cd 40                	int    $0x40
 23b:	c3                   	ret    

0000023c <write>:
SYSCALL(write)
 23c:	b8 10 00 00 00       	mov    $0x10,%eax
 241:	cd 40                	int    $0x40
 243:	c3                   	ret    

00000244 <close>:
SYSCALL(close)
 244:	b8 15 00 00 00       	mov    $0x15,%eax
 249:	cd 40                	int    $0x40
 24b:	c3                   	ret    

0000024c <kill>:
SYSCALL(kill)
 24c:	b8 06 00 00 00       	mov    $0x6,%eax
 251:	cd 40                	int    $0x40
 253:	c3                   	ret    

00000254 <exec>:
SYSCALL(exec)
 254:	b8 07 00 00 00       	mov    $0x7,%eax
 259:	cd 40                	int    $0x40
 25b:	c3                   	ret    

0000025c <open>:
SYSCALL(open)
 25c:	b8 0f 00 00 00       	mov    $0xf,%eax
 261:	cd 40                	int    $0x40
 263:	c3                   	ret    

00000264 <mknod>:
SYSCALL(mknod)
 264:	b8 11 00 00 00       	mov    $0x11,%eax
 269:	cd 40                	int    $0x40
 26b:	c3                   	ret    

0000026c <unlink>:
SYSCALL(unlink)
 26c:	b8 12 00 00 00       	mov    $0x12,%eax
 271:	cd 40                	int    $0x40
 273:	c3                   	ret    

00000274 <fstat>:
SYSCALL(fstat)
 274:	b8 08 00 00 00       	mov    $0x8,%eax
 279:	cd 40                	int    $0x40
 27b:	c3                   	ret    

0000027c <link>:
SYSCALL(link)
 27c:	b8 13 00 00 00       	mov    $0x13,%eax
 281:	cd 40                	int    $0x40
 283:	c3                   	ret    

00000284 <mkdir>:
SYSCALL(mkdir)
 284:	b8 14 00 00 00       	mov    $0x14,%eax
 289:	cd 40                	int    $0x40
 28b:	c3                   	ret    

0000028c <chdir>:
SYSCALL(chdir)
 28c:	b8 09 00 00 00       	mov    $0x9,%eax
 291:	cd 40                	int    $0x40
 293:	c3                   	ret    

00000294 <dup>:
SYSCALL(dup)
 294:	b8 0a 00 00 00       	mov    $0xa,%eax
 299:	cd 40                	int    $0x40
 29b:	c3                   	ret    

0000029c <getpid>:
SYSCALL(getpid)
 29c:	b8 0b 00 00 00       	mov    $0xb,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <sbrk>:
SYSCALL(sbrk)
 2a4:	b8 0c 00 00 00       	mov    $0xc,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <sleep>:
SYSCALL(sleep)
 2ac:	b8 0d 00 00 00       	mov    $0xd,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <uptime>:
SYSCALL(uptime)
 2b4:	b8 0e 00 00 00       	mov    $0xe,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <yield>:
SYSCALL(yield)
 2bc:	b8 16 00 00 00       	mov    $0x16,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <shutdown>:
SYSCALL(shutdown)
 2c4:	b8 17 00 00 00       	mov    $0x17,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <ps>:
SYSCALL(ps)
 2cc:	b8 18 00 00 00       	mov    $0x18,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <nice>:
SYSCALL(nice)
 2d4:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <flock>:
SYSCALL(flock)
 2dc:	b8 19 00 00 00       	mov    $0x19,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <funlock>:
 2e4:	b8 1a 00 00 00       	mov    $0x1a,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 2ec:	f3 0f 1e fb          	endbr32 
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	8b 45 14             	mov    0x14(%ebp),%eax
 2f6:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 2f9:	3b 45 10             	cmp    0x10(%ebp),%eax
 2fc:	73 06                	jae    304 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 2fe:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 301:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 304:	5d                   	pop    %ebp
 305:	c3                   	ret    

00000306 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 306:	55                   	push   %ebp
 307:	89 e5                	mov    %esp,%ebp
 309:	57                   	push   %edi
 30a:	56                   	push   %esi
 30b:	53                   	push   %ebx
 30c:	83 ec 08             	sub    $0x8,%esp
 30f:	89 c6                	mov    %eax,%esi
 311:	89 d3                	mov    %edx,%ebx
 313:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 316:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 31a:	0f 95 c2             	setne  %dl
 31d:	89 c8                	mov    %ecx,%eax
 31f:	c1 e8 1f             	shr    $0x1f,%eax
 322:	84 c2                	test   %al,%dl
 324:	74 33                	je     359 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 326:	89 c8                	mov    %ecx,%eax
 328:	f7 d8                	neg    %eax
    neg = 1;
 32a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 331:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 336:	8d 4f 01             	lea    0x1(%edi),%ecx
 339:	89 ca                	mov    %ecx,%edx
 33b:	39 d9                	cmp    %ebx,%ecx
 33d:	73 26                	jae    365 <s_getReverseDigits+0x5f>
 33f:	85 c0                	test   %eax,%eax
 341:	74 22                	je     365 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 343:	ba 00 00 00 00       	mov    $0x0,%edx
 348:	f7 75 08             	divl   0x8(%ebp)
 34b:	0f b6 92 e4 06 00 00 	movzbl 0x6e4(%edx),%edx
 352:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 355:	89 cf                	mov    %ecx,%edi
 357:	eb dd                	jmp    336 <s_getReverseDigits+0x30>
    x = xx;
 359:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 35c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 363:	eb cc                	jmp    331 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 365:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 369:	75 0a                	jne    375 <s_getReverseDigits+0x6f>
 36b:	39 da                	cmp    %ebx,%edx
 36d:	73 06                	jae    375 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 36f:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 373:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 375:	89 fa                	mov    %edi,%edx
 377:	39 df                	cmp    %ebx,%edi
 379:	0f 92 c0             	setb   %al
 37c:	84 45 ec             	test   %al,-0x14(%ebp)
 37f:	74 07                	je     388 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 381:	83 c7 01             	add    $0x1,%edi
 384:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 388:	89 f8                	mov    %edi,%eax
 38a:	83 c4 08             	add    $0x8,%esp
 38d:	5b                   	pop    %ebx
 38e:	5e                   	pop    %esi
 38f:	5f                   	pop    %edi
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 392:	39 c2                	cmp    %eax,%edx
 394:	0f 46 c2             	cmovbe %edx,%eax
}
 397:	c3                   	ret    

00000398 <s_printint>:
{
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	57                   	push   %edi
 39c:	56                   	push   %esi
 39d:	53                   	push   %ebx
 39e:	83 ec 2c             	sub    $0x2c,%esp
 3a1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3a4:	89 55 d0             	mov    %edx,-0x30(%ebp)
 3a7:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 3aa:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 3ad:	ff 75 14             	pushl  0x14(%ebp)
 3b0:	ff 75 10             	pushl  0x10(%ebp)
 3b3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3b6:	ba 10 00 00 00       	mov    $0x10,%edx
 3bb:	8d 45 d8             	lea    -0x28(%ebp),%eax
 3be:	e8 43 ff ff ff       	call   306 <s_getReverseDigits>
 3c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 3c6:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 3c8:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 3cb:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 3d0:	83 eb 01             	sub    $0x1,%ebx
 3d3:	78 22                	js     3f7 <s_printint+0x5f>
 3d5:	39 fe                	cmp    %edi,%esi
 3d7:	73 1e                	jae    3f7 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 3d9:	83 ec 0c             	sub    $0xc,%esp
 3dc:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 3e1:	50                   	push   %eax
 3e2:	56                   	push   %esi
 3e3:	57                   	push   %edi
 3e4:	ff 75 cc             	pushl  -0x34(%ebp)
 3e7:	ff 75 d0             	pushl  -0x30(%ebp)
 3ea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 3ed:	ff d0                	call   *%eax
    j++;
 3ef:	83 c6 01             	add    $0x1,%esi
 3f2:	83 c4 20             	add    $0x20,%esp
 3f5:	eb d9                	jmp    3d0 <s_printint+0x38>
}
 3f7:	8b 45 c8             	mov    -0x38(%ebp),%eax
 3fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fd:	5b                   	pop    %ebx
 3fe:	5e                   	pop    %esi
 3ff:	5f                   	pop    %edi
 400:	5d                   	pop    %ebp
 401:	c3                   	ret    

00000402 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 402:	55                   	push   %ebp
 403:	89 e5                	mov    %esp,%ebp
 405:	57                   	push   %edi
 406:	56                   	push   %esi
 407:	53                   	push   %ebx
 408:	83 ec 2c             	sub    $0x2c,%esp
 40b:	89 45 d8             	mov    %eax,-0x28(%ebp)
 40e:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 411:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 414:	8b 45 08             	mov    0x8(%ebp),%eax
 417:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 41a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 421:	bb 00 00 00 00       	mov    $0x0,%ebx
 426:	89 f8                	mov    %edi,%eax
 428:	89 df                	mov    %ebx,%edi
 42a:	89 c6                	mov    %eax,%esi
 42c:	eb 20                	jmp    44e <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 42e:	8d 43 01             	lea    0x1(%ebx),%eax
 431:	89 45 e0             	mov    %eax,-0x20(%ebp)
 434:	83 ec 0c             	sub    $0xc,%esp
 437:	51                   	push   %ecx
 438:	53                   	push   %ebx
 439:	56                   	push   %esi
 43a:	ff 75 d0             	pushl  -0x30(%ebp)
 43d:	ff 75 d4             	pushl  -0x2c(%ebp)
 440:	8b 55 d8             	mov    -0x28(%ebp),%edx
 443:	ff d2                	call   *%edx
 445:	83 c4 20             	add    $0x20,%esp
 448:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 44b:	83 c7 01             	add    $0x1,%edi
 44e:	8b 45 0c             	mov    0xc(%ebp),%eax
 451:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 455:	84 c0                	test   %al,%al
 457:	0f 84 cd 01 00 00    	je     62a <s_printf+0x228>
 45d:	89 75 e0             	mov    %esi,-0x20(%ebp)
 460:	39 de                	cmp    %ebx,%esi
 462:	0f 86 c2 01 00 00    	jbe    62a <s_printf+0x228>
    c = fmt[i] & 0xff;
 468:	0f be c8             	movsbl %al,%ecx
 46b:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 46e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 471:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 475:	75 0a                	jne    481 <s_printf+0x7f>
      if(c == '%') {
 477:	83 f8 25             	cmp    $0x25,%eax
 47a:	75 b2                	jne    42e <s_printf+0x2c>
        state = '%';
 47c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 47f:	eb ca                	jmp    44b <s_printf+0x49>
      }
    } else if(state == '%'){
 481:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 485:	75 c4                	jne    44b <s_printf+0x49>
      if(c == 'd'){
 487:	83 f8 64             	cmp    $0x64,%eax
 48a:	74 6e                	je     4fa <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 48c:	83 f8 78             	cmp    $0x78,%eax
 48f:	0f 94 c1             	sete   %cl
 492:	83 f8 70             	cmp    $0x70,%eax
 495:	0f 94 c2             	sete   %dl
 498:	08 d1                	or     %dl,%cl
 49a:	0f 85 8e 00 00 00    	jne    52e <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4a0:	83 f8 73             	cmp    $0x73,%eax
 4a3:	0f 84 b9 00 00 00    	je     562 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 4a9:	83 f8 63             	cmp    $0x63,%eax
 4ac:	0f 84 1a 01 00 00    	je     5cc <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 4b2:	83 f8 25             	cmp    $0x25,%eax
 4b5:	0f 84 44 01 00 00    	je     5ff <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 4bb:	8d 43 01             	lea    0x1(%ebx),%eax
 4be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4c1:	83 ec 0c             	sub    $0xc,%esp
 4c4:	6a 25                	push   $0x25
 4c6:	53                   	push   %ebx
 4c7:	56                   	push   %esi
 4c8:	ff 75 d0             	pushl  -0x30(%ebp)
 4cb:	ff 75 d4             	pushl  -0x2c(%ebp)
 4ce:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4d1:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 4d3:	83 c3 02             	add    $0x2,%ebx
 4d6:	83 c4 14             	add    $0x14,%esp
 4d9:	ff 75 dc             	pushl  -0x24(%ebp)
 4dc:	ff 75 e4             	pushl  -0x1c(%ebp)
 4df:	56                   	push   %esi
 4e0:	ff 75 d0             	pushl  -0x30(%ebp)
 4e3:	ff 75 d4             	pushl  -0x2c(%ebp)
 4e6:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4e9:	ff d0                	call   *%eax
 4eb:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 4ee:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4f5:	e9 51 ff ff ff       	jmp    44b <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 4fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4fd:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 500:	6a 01                	push   $0x1
 502:	6a 0a                	push   $0xa
 504:	8b 45 10             	mov    0x10(%ebp),%eax
 507:	ff 30                	pushl  (%eax)
 509:	89 f0                	mov    %esi,%eax
 50b:	29 d8                	sub    %ebx,%eax
 50d:	50                   	push   %eax
 50e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 511:	8b 45 d8             	mov    -0x28(%ebp),%eax
 514:	e8 7f fe ff ff       	call   398 <s_printint>
 519:	01 c3                	add    %eax,%ebx
        ap++;
 51b:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 51f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 522:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 529:	e9 1d ff ff ff       	jmp    44b <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 52e:	8b 45 d0             	mov    -0x30(%ebp),%eax
 531:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 534:	6a 00                	push   $0x0
 536:	6a 10                	push   $0x10
 538:	8b 45 10             	mov    0x10(%ebp),%eax
 53b:	ff 30                	pushl  (%eax)
 53d:	89 f0                	mov    %esi,%eax
 53f:	29 d8                	sub    %ebx,%eax
 541:	50                   	push   %eax
 542:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 545:	8b 45 d8             	mov    -0x28(%ebp),%eax
 548:	e8 4b fe ff ff       	call   398 <s_printint>
 54d:	01 c3                	add    %eax,%ebx
        ap++;
 54f:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 553:	83 c4 10             	add    $0x10,%esp
      state = 0;
 556:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 55d:	e9 e9 fe ff ff       	jmp    44b <s_printf+0x49>
        s = (char*)*ap;
 562:	8b 45 10             	mov    0x10(%ebp),%eax
 565:	8b 00                	mov    (%eax),%eax
        ap++;
 567:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 56b:	85 c0                	test   %eax,%eax
 56d:	75 4e                	jne    5bd <s_printf+0x1bb>
          s = "(null)";
 56f:	b8 dc 06 00 00       	mov    $0x6dc,%eax
 574:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 577:	89 da                	mov    %ebx,%edx
 579:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 57c:	89 75 e0             	mov    %esi,-0x20(%ebp)
 57f:	89 c6                	mov    %eax,%esi
 581:	eb 1f                	jmp    5a2 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 583:	8d 7a 01             	lea    0x1(%edx),%edi
 586:	83 ec 0c             	sub    $0xc,%esp
 589:	0f be c0             	movsbl %al,%eax
 58c:	50                   	push   %eax
 58d:	52                   	push   %edx
 58e:	53                   	push   %ebx
 58f:	ff 75 d0             	pushl  -0x30(%ebp)
 592:	ff 75 d4             	pushl  -0x2c(%ebp)
 595:	8b 45 d8             	mov    -0x28(%ebp),%eax
 598:	ff d0                	call   *%eax
          s++;
 59a:	83 c6 01             	add    $0x1,%esi
 59d:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 5a0:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 5a2:	0f b6 06             	movzbl (%esi),%eax
 5a5:	84 c0                	test   %al,%al
 5a7:	75 da                	jne    583 <s_printf+0x181>
 5a9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ac:	89 d3                	mov    %edx,%ebx
 5ae:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 5b1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5b8:	e9 8e fe ff ff       	jmp    44b <s_printf+0x49>
 5bd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5c0:	89 da                	mov    %ebx,%edx
 5c2:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 5c5:	89 75 e0             	mov    %esi,-0x20(%ebp)
 5c8:	89 c6                	mov    %eax,%esi
 5ca:	eb d6                	jmp    5a2 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 5cc:	8d 43 01             	lea    0x1(%ebx),%eax
 5cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5d2:	83 ec 0c             	sub    $0xc,%esp
 5d5:	8b 55 10             	mov    0x10(%ebp),%edx
 5d8:	0f be 02             	movsbl (%edx),%eax
 5db:	50                   	push   %eax
 5dc:	53                   	push   %ebx
 5dd:	56                   	push   %esi
 5de:	ff 75 d0             	pushl  -0x30(%ebp)
 5e1:	ff 75 d4             	pushl  -0x2c(%ebp)
 5e4:	8b 55 d8             	mov    -0x28(%ebp),%edx
 5e7:	ff d2                	call   *%edx
        ap++;
 5e9:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 5ed:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 5f0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 5f3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5fa:	e9 4c fe ff ff       	jmp    44b <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 5ff:	8d 43 01             	lea    0x1(%ebx),%eax
 602:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 605:	83 ec 0c             	sub    $0xc,%esp
 608:	ff 75 dc             	pushl  -0x24(%ebp)
 60b:	53                   	push   %ebx
 60c:	56                   	push   %esi
 60d:	ff 75 d0             	pushl  -0x30(%ebp)
 610:	ff 75 d4             	pushl  -0x2c(%ebp)
 613:	8b 55 d8             	mov    -0x28(%ebp),%edx
 616:	ff d2                	call   *%edx
 618:	83 c4 20             	add    $0x20,%esp
 61b:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 61e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 625:	e9 21 fe ff ff       	jmp    44b <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 62a:	89 da                	mov    %ebx,%edx
 62c:	89 f0                	mov    %esi,%eax
 62e:	e8 5f fd ff ff       	call   392 <s_min>
}
 633:	8d 65 f4             	lea    -0xc(%ebp),%esp
 636:	5b                   	pop    %ebx
 637:	5e                   	pop    %esi
 638:	5f                   	pop    %edi
 639:	5d                   	pop    %ebp
 63a:	c3                   	ret    

0000063b <s_putc>:
{
 63b:	f3 0f 1e fb          	endbr32 
 63f:	55                   	push   %ebp
 640:	89 e5                	mov    %esp,%ebp
 642:	83 ec 1c             	sub    $0x1c,%esp
 645:	8b 45 18             	mov    0x18(%ebp),%eax
 648:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 64b:	6a 01                	push   $0x1
 64d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 650:	50                   	push   %eax
 651:	ff 75 08             	pushl  0x8(%ebp)
 654:	e8 e3 fb ff ff       	call   23c <write>
}
 659:	83 c4 10             	add    $0x10,%esp
 65c:	c9                   	leave  
 65d:	c3                   	ret    

0000065e <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 65e:	f3 0f 1e fb          	endbr32 
 662:	55                   	push   %ebp
 663:	89 e5                	mov    %esp,%ebp
 665:	56                   	push   %esi
 666:	53                   	push   %ebx
 667:	8b 75 08             	mov    0x8(%ebp),%esi
 66a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 66d:	83 ec 04             	sub    $0x4,%esp
 670:	8d 45 14             	lea    0x14(%ebp),%eax
 673:	50                   	push   %eax
 674:	ff 75 10             	pushl  0x10(%ebp)
 677:	53                   	push   %ebx
 678:	89 f1                	mov    %esi,%ecx
 67a:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 67f:	b8 ec 02 00 00       	mov    $0x2ec,%eax
 684:	e8 79 fd ff ff       	call   402 <s_printf>
  if(count < n) {
 689:	83 c4 10             	add    $0x10,%esp
 68c:	39 c3                	cmp    %eax,%ebx
 68e:	76 04                	jbe    694 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 690:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 694:	8d 65 f8             	lea    -0x8(%ebp),%esp
 697:	5b                   	pop    %ebx
 698:	5e                   	pop    %esi
 699:	5d                   	pop    %ebp
 69a:	c3                   	ret    

0000069b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 69b:	f3 0f 1e fb          	endbr32 
 69f:	55                   	push   %ebp
 6a0:	89 e5                	mov    %esp,%ebp
 6a2:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 6a5:	8d 45 10             	lea    0x10(%ebp),%eax
 6a8:	50                   	push   %eax
 6a9:	ff 75 0c             	pushl  0xc(%ebp)
 6ac:	68 00 00 00 40       	push   $0x40000000
 6b1:	b9 00 00 00 00       	mov    $0x0,%ecx
 6b6:	8b 55 08             	mov    0x8(%ebp),%edx
 6b9:	b8 3b 06 00 00       	mov    $0x63b,%eax
 6be:	e8 3f fd ff ff       	call   402 <s_printf>
}
 6c3:	83 c4 10             	add    $0x10,%esp
 6c6:	c9                   	leave  
 6c7:	c3                   	ret    
