
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
  2c:	68 b8 06 00 00       	push   $0x6b8
  31:	6a 02                	push   $0x2
  33:	e8 53 06 00 00       	call   68b <printf>
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
 2d4:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 2dc:	f3 0f 1e fb          	endbr32 
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 45 14             	mov    0x14(%ebp),%eax
 2e6:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 2e9:	3b 45 10             	cmp    0x10(%ebp),%eax
 2ec:	73 06                	jae    2f4 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 2ee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2f1:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 2f4:	5d                   	pop    %ebp
 2f5:	c3                   	ret    

000002f6 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 2f6:	55                   	push   %ebp
 2f7:	89 e5                	mov    %esp,%ebp
 2f9:	57                   	push   %edi
 2fa:	56                   	push   %esi
 2fb:	53                   	push   %ebx
 2fc:	83 ec 08             	sub    $0x8,%esp
 2ff:	89 c6                	mov    %eax,%esi
 301:	89 d3                	mov    %edx,%ebx
 303:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 306:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 30a:	0f 95 c2             	setne  %dl
 30d:	89 c8                	mov    %ecx,%eax
 30f:	c1 e8 1f             	shr    $0x1f,%eax
 312:	84 c2                	test   %al,%dl
 314:	74 33                	je     349 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 316:	89 c8                	mov    %ecx,%eax
 318:	f7 d8                	neg    %eax
    neg = 1;
 31a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 321:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 326:	8d 4f 01             	lea    0x1(%edi),%ecx
 329:	89 ca                	mov    %ecx,%edx
 32b:	39 d9                	cmp    %ebx,%ecx
 32d:	73 26                	jae    355 <s_getReverseDigits+0x5f>
 32f:	85 c0                	test   %eax,%eax
 331:	74 22                	je     355 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 333:	ba 00 00 00 00       	mov    $0x0,%edx
 338:	f7 75 08             	divl   0x8(%ebp)
 33b:	0f b6 92 d4 06 00 00 	movzbl 0x6d4(%edx),%edx
 342:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 345:	89 cf                	mov    %ecx,%edi
 347:	eb dd                	jmp    326 <s_getReverseDigits+0x30>
    x = xx;
 349:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 34c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 353:	eb cc                	jmp    321 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 355:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 359:	75 0a                	jne    365 <s_getReverseDigits+0x6f>
 35b:	39 da                	cmp    %ebx,%edx
 35d:	73 06                	jae    365 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 35f:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 363:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 365:	89 fa                	mov    %edi,%edx
 367:	39 df                	cmp    %ebx,%edi
 369:	0f 92 c0             	setb   %al
 36c:	84 45 ec             	test   %al,-0x14(%ebp)
 36f:	74 07                	je     378 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 371:	83 c7 01             	add    $0x1,%edi
 374:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 378:	89 f8                	mov    %edi,%eax
 37a:	83 c4 08             	add    $0x8,%esp
 37d:	5b                   	pop    %ebx
 37e:	5e                   	pop    %esi
 37f:	5f                   	pop    %edi
 380:	5d                   	pop    %ebp
 381:	c3                   	ret    

00000382 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 382:	39 c2                	cmp    %eax,%edx
 384:	0f 46 c2             	cmovbe %edx,%eax
}
 387:	c3                   	ret    

00000388 <s_printint>:
{
 388:	55                   	push   %ebp
 389:	89 e5                	mov    %esp,%ebp
 38b:	57                   	push   %edi
 38c:	56                   	push   %esi
 38d:	53                   	push   %ebx
 38e:	83 ec 2c             	sub    $0x2c,%esp
 391:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 394:	89 55 d0             	mov    %edx,-0x30(%ebp)
 397:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 39a:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 39d:	ff 75 14             	pushl  0x14(%ebp)
 3a0:	ff 75 10             	pushl  0x10(%ebp)
 3a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3a6:	ba 10 00 00 00       	mov    $0x10,%edx
 3ab:	8d 45 d8             	lea    -0x28(%ebp),%eax
 3ae:	e8 43 ff ff ff       	call   2f6 <s_getReverseDigits>
 3b3:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 3b6:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 3b8:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 3bb:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 3c0:	83 eb 01             	sub    $0x1,%ebx
 3c3:	78 22                	js     3e7 <s_printint+0x5f>
 3c5:	39 fe                	cmp    %edi,%esi
 3c7:	73 1e                	jae    3e7 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 3c9:	83 ec 0c             	sub    $0xc,%esp
 3cc:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 3d1:	50                   	push   %eax
 3d2:	56                   	push   %esi
 3d3:	57                   	push   %edi
 3d4:	ff 75 cc             	pushl  -0x34(%ebp)
 3d7:	ff 75 d0             	pushl  -0x30(%ebp)
 3da:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 3dd:	ff d0                	call   *%eax
    j++;
 3df:	83 c6 01             	add    $0x1,%esi
 3e2:	83 c4 20             	add    $0x20,%esp
 3e5:	eb d9                	jmp    3c0 <s_printint+0x38>
}
 3e7:	8b 45 c8             	mov    -0x38(%ebp),%eax
 3ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ed:	5b                   	pop    %ebx
 3ee:	5e                   	pop    %esi
 3ef:	5f                   	pop    %edi
 3f0:	5d                   	pop    %ebp
 3f1:	c3                   	ret    

000003f2 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	57                   	push   %edi
 3f6:	56                   	push   %esi
 3f7:	53                   	push   %ebx
 3f8:	83 ec 2c             	sub    $0x2c,%esp
 3fb:	89 45 d8             	mov    %eax,-0x28(%ebp)
 3fe:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 401:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 404:	8b 45 08             	mov    0x8(%ebp),%eax
 407:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 40a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 411:	bb 00 00 00 00       	mov    $0x0,%ebx
 416:	89 f8                	mov    %edi,%eax
 418:	89 df                	mov    %ebx,%edi
 41a:	89 c6                	mov    %eax,%esi
 41c:	eb 20                	jmp    43e <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 41e:	8d 43 01             	lea    0x1(%ebx),%eax
 421:	89 45 e0             	mov    %eax,-0x20(%ebp)
 424:	83 ec 0c             	sub    $0xc,%esp
 427:	51                   	push   %ecx
 428:	53                   	push   %ebx
 429:	56                   	push   %esi
 42a:	ff 75 d0             	pushl  -0x30(%ebp)
 42d:	ff 75 d4             	pushl  -0x2c(%ebp)
 430:	8b 55 d8             	mov    -0x28(%ebp),%edx
 433:	ff d2                	call   *%edx
 435:	83 c4 20             	add    $0x20,%esp
 438:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 43b:	83 c7 01             	add    $0x1,%edi
 43e:	8b 45 0c             	mov    0xc(%ebp),%eax
 441:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 445:	84 c0                	test   %al,%al
 447:	0f 84 cd 01 00 00    	je     61a <s_printf+0x228>
 44d:	89 75 e0             	mov    %esi,-0x20(%ebp)
 450:	39 de                	cmp    %ebx,%esi
 452:	0f 86 c2 01 00 00    	jbe    61a <s_printf+0x228>
    c = fmt[i] & 0xff;
 458:	0f be c8             	movsbl %al,%ecx
 45b:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 45e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 461:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 465:	75 0a                	jne    471 <s_printf+0x7f>
      if(c == '%') {
 467:	83 f8 25             	cmp    $0x25,%eax
 46a:	75 b2                	jne    41e <s_printf+0x2c>
        state = '%';
 46c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 46f:	eb ca                	jmp    43b <s_printf+0x49>
      }
    } else if(state == '%'){
 471:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 475:	75 c4                	jne    43b <s_printf+0x49>
      if(c == 'd'){
 477:	83 f8 64             	cmp    $0x64,%eax
 47a:	74 6e                	je     4ea <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 47c:	83 f8 78             	cmp    $0x78,%eax
 47f:	0f 94 c1             	sete   %cl
 482:	83 f8 70             	cmp    $0x70,%eax
 485:	0f 94 c2             	sete   %dl
 488:	08 d1                	or     %dl,%cl
 48a:	0f 85 8e 00 00 00    	jne    51e <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 490:	83 f8 73             	cmp    $0x73,%eax
 493:	0f 84 b9 00 00 00    	je     552 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 499:	83 f8 63             	cmp    $0x63,%eax
 49c:	0f 84 1a 01 00 00    	je     5bc <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 4a2:	83 f8 25             	cmp    $0x25,%eax
 4a5:	0f 84 44 01 00 00    	je     5ef <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 4ab:	8d 43 01             	lea    0x1(%ebx),%eax
 4ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4b1:	83 ec 0c             	sub    $0xc,%esp
 4b4:	6a 25                	push   $0x25
 4b6:	53                   	push   %ebx
 4b7:	56                   	push   %esi
 4b8:	ff 75 d0             	pushl  -0x30(%ebp)
 4bb:	ff 75 d4             	pushl  -0x2c(%ebp)
 4be:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4c1:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 4c3:	83 c3 02             	add    $0x2,%ebx
 4c6:	83 c4 14             	add    $0x14,%esp
 4c9:	ff 75 dc             	pushl  -0x24(%ebp)
 4cc:	ff 75 e4             	pushl  -0x1c(%ebp)
 4cf:	56                   	push   %esi
 4d0:	ff 75 d0             	pushl  -0x30(%ebp)
 4d3:	ff 75 d4             	pushl  -0x2c(%ebp)
 4d6:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4d9:	ff d0                	call   *%eax
 4db:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 4de:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4e5:	e9 51 ff ff ff       	jmp    43b <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 4ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4ed:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 4f0:	6a 01                	push   $0x1
 4f2:	6a 0a                	push   $0xa
 4f4:	8b 45 10             	mov    0x10(%ebp),%eax
 4f7:	ff 30                	pushl  (%eax)
 4f9:	89 f0                	mov    %esi,%eax
 4fb:	29 d8                	sub    %ebx,%eax
 4fd:	50                   	push   %eax
 4fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 501:	8b 45 d8             	mov    -0x28(%ebp),%eax
 504:	e8 7f fe ff ff       	call   388 <s_printint>
 509:	01 c3                	add    %eax,%ebx
        ap++;
 50b:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 50f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 512:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 519:	e9 1d ff ff ff       	jmp    43b <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 51e:	8b 45 d0             	mov    -0x30(%ebp),%eax
 521:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 524:	6a 00                	push   $0x0
 526:	6a 10                	push   $0x10
 528:	8b 45 10             	mov    0x10(%ebp),%eax
 52b:	ff 30                	pushl  (%eax)
 52d:	89 f0                	mov    %esi,%eax
 52f:	29 d8                	sub    %ebx,%eax
 531:	50                   	push   %eax
 532:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 535:	8b 45 d8             	mov    -0x28(%ebp),%eax
 538:	e8 4b fe ff ff       	call   388 <s_printint>
 53d:	01 c3                	add    %eax,%ebx
        ap++;
 53f:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 543:	83 c4 10             	add    $0x10,%esp
      state = 0;
 546:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 54d:	e9 e9 fe ff ff       	jmp    43b <s_printf+0x49>
        s = (char*)*ap;
 552:	8b 45 10             	mov    0x10(%ebp),%eax
 555:	8b 00                	mov    (%eax),%eax
        ap++;
 557:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 55b:	85 c0                	test   %eax,%eax
 55d:	75 4e                	jne    5ad <s_printf+0x1bb>
          s = "(null)";
 55f:	b8 cc 06 00 00       	mov    $0x6cc,%eax
 564:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 567:	89 da                	mov    %ebx,%edx
 569:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 56c:	89 75 e0             	mov    %esi,-0x20(%ebp)
 56f:	89 c6                	mov    %eax,%esi
 571:	eb 1f                	jmp    592 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 573:	8d 7a 01             	lea    0x1(%edx),%edi
 576:	83 ec 0c             	sub    $0xc,%esp
 579:	0f be c0             	movsbl %al,%eax
 57c:	50                   	push   %eax
 57d:	52                   	push   %edx
 57e:	53                   	push   %ebx
 57f:	ff 75 d0             	pushl  -0x30(%ebp)
 582:	ff 75 d4             	pushl  -0x2c(%ebp)
 585:	8b 45 d8             	mov    -0x28(%ebp),%eax
 588:	ff d0                	call   *%eax
          s++;
 58a:	83 c6 01             	add    $0x1,%esi
 58d:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 590:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 592:	0f b6 06             	movzbl (%esi),%eax
 595:	84 c0                	test   %al,%al
 597:	75 da                	jne    573 <s_printf+0x181>
 599:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 59c:	89 d3                	mov    %edx,%ebx
 59e:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 5a1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5a8:	e9 8e fe ff ff       	jmp    43b <s_printf+0x49>
 5ad:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5b0:	89 da                	mov    %ebx,%edx
 5b2:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 5b5:	89 75 e0             	mov    %esi,-0x20(%ebp)
 5b8:	89 c6                	mov    %eax,%esi
 5ba:	eb d6                	jmp    592 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 5bc:	8d 43 01             	lea    0x1(%ebx),%eax
 5bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5c2:	83 ec 0c             	sub    $0xc,%esp
 5c5:	8b 55 10             	mov    0x10(%ebp),%edx
 5c8:	0f be 02             	movsbl (%edx),%eax
 5cb:	50                   	push   %eax
 5cc:	53                   	push   %ebx
 5cd:	56                   	push   %esi
 5ce:	ff 75 d0             	pushl  -0x30(%ebp)
 5d1:	ff 75 d4             	pushl  -0x2c(%ebp)
 5d4:	8b 55 d8             	mov    -0x28(%ebp),%edx
 5d7:	ff d2                	call   *%edx
        ap++;
 5d9:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 5dd:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 5e0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 5e3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5ea:	e9 4c fe ff ff       	jmp    43b <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 5ef:	8d 43 01             	lea    0x1(%ebx),%eax
 5f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5f5:	83 ec 0c             	sub    $0xc,%esp
 5f8:	ff 75 dc             	pushl  -0x24(%ebp)
 5fb:	53                   	push   %ebx
 5fc:	56                   	push   %esi
 5fd:	ff 75 d0             	pushl  -0x30(%ebp)
 600:	ff 75 d4             	pushl  -0x2c(%ebp)
 603:	8b 55 d8             	mov    -0x28(%ebp),%edx
 606:	ff d2                	call   *%edx
 608:	83 c4 20             	add    $0x20,%esp
 60b:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 60e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 615:	e9 21 fe ff ff       	jmp    43b <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 61a:	89 da                	mov    %ebx,%edx
 61c:	89 f0                	mov    %esi,%eax
 61e:	e8 5f fd ff ff       	call   382 <s_min>
}
 623:	8d 65 f4             	lea    -0xc(%ebp),%esp
 626:	5b                   	pop    %ebx
 627:	5e                   	pop    %esi
 628:	5f                   	pop    %edi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    

0000062b <s_putc>:
{
 62b:	f3 0f 1e fb          	endbr32 
 62f:	55                   	push   %ebp
 630:	89 e5                	mov    %esp,%ebp
 632:	83 ec 1c             	sub    $0x1c,%esp
 635:	8b 45 18             	mov    0x18(%ebp),%eax
 638:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 63b:	6a 01                	push   $0x1
 63d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 640:	50                   	push   %eax
 641:	ff 75 08             	pushl  0x8(%ebp)
 644:	e8 f3 fb ff ff       	call   23c <write>
}
 649:	83 c4 10             	add    $0x10,%esp
 64c:	c9                   	leave  
 64d:	c3                   	ret    

0000064e <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 64e:	f3 0f 1e fb          	endbr32 
 652:	55                   	push   %ebp
 653:	89 e5                	mov    %esp,%ebp
 655:	56                   	push   %esi
 656:	53                   	push   %ebx
 657:	8b 75 08             	mov    0x8(%ebp),%esi
 65a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 65d:	83 ec 04             	sub    $0x4,%esp
 660:	8d 45 14             	lea    0x14(%ebp),%eax
 663:	50                   	push   %eax
 664:	ff 75 10             	pushl  0x10(%ebp)
 667:	53                   	push   %ebx
 668:	89 f1                	mov    %esi,%ecx
 66a:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 66f:	b8 dc 02 00 00       	mov    $0x2dc,%eax
 674:	e8 79 fd ff ff       	call   3f2 <s_printf>
  if(count < n) {
 679:	83 c4 10             	add    $0x10,%esp
 67c:	39 c3                	cmp    %eax,%ebx
 67e:	76 04                	jbe    684 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 680:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 684:	8d 65 f8             	lea    -0x8(%ebp),%esp
 687:	5b                   	pop    %ebx
 688:	5e                   	pop    %esi
 689:	5d                   	pop    %ebp
 68a:	c3                   	ret    

0000068b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 68b:	f3 0f 1e fb          	endbr32 
 68f:	55                   	push   %ebp
 690:	89 e5                	mov    %esp,%ebp
 692:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 695:	8d 45 10             	lea    0x10(%ebp),%eax
 698:	50                   	push   %eax
 699:	ff 75 0c             	pushl  0xc(%ebp)
 69c:	68 00 00 00 40       	push   $0x40000000
 6a1:	b9 00 00 00 00       	mov    $0x0,%ecx
 6a6:	8b 55 08             	mov    0x8(%ebp),%edx
 6a9:	b8 2b 06 00 00       	mov    $0x62b,%eax
 6ae:	e8 3f fd ff ff       	call   3f2 <s_printf>
}
 6b3:	83 c4 10             	add    $0x10,%esp
 6b6:	c9                   	leave  
 6b7:	c3                   	ret    
