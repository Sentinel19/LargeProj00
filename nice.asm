
_nice:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

 

int main(int argc, const char *argv[])

{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	8b 59 04             	mov    0x4(%ecx),%ebx

    if (3 != argc)
  1a:	83 39 03             	cmpl   $0x3,(%ecx)
  1d:	74 17                	je     36 <main+0x36>

    {

        printf(1, "Usage: nice pid priority\n");
  1f:	83 ec 08             	sub    $0x8,%esp
  22:	68 c8 06 00 00       	push   $0x6c8
  27:	6a 01                	push   $0x1
  29:	e8 6b 06 00 00       	call   699 <printf>
  2e:	83 c4 10             	add    $0x10,%esp

               oldPriority, priority);

    }

    exit();
  31:	e8 f4 01 00 00       	call   22a <exit>
        int pid = atoi(argv[1]);
  36:	83 ec 0c             	sub    $0xc,%esp
  39:	ff 73 04             	pushl  0x4(%ebx)
  3c:	e8 7f 01 00 00       	call   1c0 <atoi>
  41:	89 c6                	mov    %eax,%esi
        int priority = atoi(argv[2]);
  43:	83 c4 04             	add    $0x4,%esp
  46:	ff 73 08             	pushl  0x8(%ebx)
  49:	e8 72 01 00 00       	call   1c0 <atoi>
  4e:	89 c3                	mov    %eax,%ebx
        int oldPriority = nice(pid, priority);
  50:	83 c4 08             	add    $0x8,%esp
  53:	50                   	push   %eax
  54:	56                   	push   %esi
  55:	e8 88 02 00 00       	call   2e2 <nice>
        printf(1, "Old priority: %d. New priority: %d\n",
  5a:	53                   	push   %ebx
  5b:	50                   	push   %eax
  5c:	68 e4 06 00 00       	push   $0x6e4
  61:	6a 01                	push   $0x1
  63:	e8 31 06 00 00       	call   699 <printf>
  68:	83 c4 20             	add    $0x20,%esp
  6b:	eb c4                	jmp    31 <main+0x31>

0000006d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  6d:	f3 0f 1e fb          	endbr32 
  71:	55                   	push   %ebp
  72:	89 e5                	mov    %esp,%ebp
  74:	56                   	push   %esi
  75:	53                   	push   %ebx
  76:	8b 75 08             	mov    0x8(%ebp),%esi
  79:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7c:	89 f0                	mov    %esi,%eax
  7e:	89 d1                	mov    %edx,%ecx
  80:	83 c2 01             	add    $0x1,%edx
  83:	89 c3                	mov    %eax,%ebx
  85:	83 c0 01             	add    $0x1,%eax
  88:	0f b6 09             	movzbl (%ecx),%ecx
  8b:	88 0b                	mov    %cl,(%ebx)
  8d:	84 c9                	test   %cl,%cl
  8f:	75 ed                	jne    7e <strcpy+0x11>
    ;
  return os;
}
  91:	89 f0                	mov    %esi,%eax
  93:	5b                   	pop    %ebx
  94:	5e                   	pop    %esi
  95:	5d                   	pop    %ebp
  96:	c3                   	ret    

00000097 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  97:	f3 0f 1e fb          	endbr32 
  9b:	55                   	push   %ebp
  9c:	89 e5                	mov    %esp,%ebp
  9e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  a4:	0f b6 01             	movzbl (%ecx),%eax
  a7:	84 c0                	test   %al,%al
  a9:	74 0c                	je     b7 <strcmp+0x20>
  ab:	3a 02                	cmp    (%edx),%al
  ad:	75 08                	jne    b7 <strcmp+0x20>
    p++, q++;
  af:	83 c1 01             	add    $0x1,%ecx
  b2:	83 c2 01             	add    $0x1,%edx
  b5:	eb ed                	jmp    a4 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  b7:	0f b6 c0             	movzbl %al,%eax
  ba:	0f b6 12             	movzbl (%edx),%edx
  bd:	29 d0                	sub    %edx,%eax
}
  bf:	5d                   	pop    %ebp
  c0:	c3                   	ret    

000000c1 <strlen>:

uint
strlen(const char *s)
{
  c1:	f3 0f 1e fb          	endbr32 
  c5:	55                   	push   %ebp
  c6:	89 e5                	mov    %esp,%ebp
  c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  cb:	b8 00 00 00 00       	mov    $0x0,%eax
  d0:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  d4:	74 05                	je     db <strlen+0x1a>
  d6:	83 c0 01             	add    $0x1,%eax
  d9:	eb f5                	jmp    d0 <strlen+0xf>
    ;
  return n;
}
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    

000000dd <memset>:

void*
memset(void *dst, int c, uint n)
{
  dd:	f3 0f 1e fb          	endbr32 
  e1:	55                   	push   %ebp
  e2:	89 e5                	mov    %esp,%ebp
  e4:	57                   	push   %edi
  e5:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  e8:	89 d7                	mov    %edx,%edi
  ea:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  f0:	fc                   	cld    
  f1:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  f3:	89 d0                	mov    %edx,%eax
  f5:	5f                   	pop    %edi
  f6:	5d                   	pop    %ebp
  f7:	c3                   	ret    

000000f8 <strchr>:

char*
strchr(const char *s, char c)
{
  f8:	f3 0f 1e fb          	endbr32 
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	8b 45 08             	mov    0x8(%ebp),%eax
 102:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 106:	0f b6 10             	movzbl (%eax),%edx
 109:	84 d2                	test   %dl,%dl
 10b:	74 09                	je     116 <strchr+0x1e>
    if(*s == c)
 10d:	38 ca                	cmp    %cl,%dl
 10f:	74 0a                	je     11b <strchr+0x23>
  for(; *s; s++)
 111:	83 c0 01             	add    $0x1,%eax
 114:	eb f0                	jmp    106 <strchr+0xe>
      return (char*)s;
  return 0;
 116:	b8 00 00 00 00       	mov    $0x0,%eax
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    

0000011d <gets>:

char*
gets(char *buf, int max)
{
 11d:	f3 0f 1e fb          	endbr32 
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
 124:	57                   	push   %edi
 125:	56                   	push   %esi
 126:	53                   	push   %ebx
 127:	83 ec 1c             	sub    $0x1c,%esp
 12a:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 12d:	bb 00 00 00 00       	mov    $0x0,%ebx
 132:	89 de                	mov    %ebx,%esi
 134:	83 c3 01             	add    $0x1,%ebx
 137:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 13a:	7d 2e                	jge    16a <gets+0x4d>
    cc = read(0, &c, 1);
 13c:	83 ec 04             	sub    $0x4,%esp
 13f:	6a 01                	push   $0x1
 141:	8d 45 e7             	lea    -0x19(%ebp),%eax
 144:	50                   	push   %eax
 145:	6a 00                	push   $0x0
 147:	e8 f6 00 00 00       	call   242 <read>
    if(cc < 1)
 14c:	83 c4 10             	add    $0x10,%esp
 14f:	85 c0                	test   %eax,%eax
 151:	7e 17                	jle    16a <gets+0x4d>
      break;
    buf[i++] = c;
 153:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 157:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 15a:	3c 0a                	cmp    $0xa,%al
 15c:	0f 94 c2             	sete   %dl
 15f:	3c 0d                	cmp    $0xd,%al
 161:	0f 94 c0             	sete   %al
 164:	08 c2                	or     %al,%dl
 166:	74 ca                	je     132 <gets+0x15>
    buf[i++] = c;
 168:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 16a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 16e:	89 f8                	mov    %edi,%eax
 170:	8d 65 f4             	lea    -0xc(%ebp),%esp
 173:	5b                   	pop    %ebx
 174:	5e                   	pop    %esi
 175:	5f                   	pop    %edi
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    

00000178 <stat>:

int
stat(const char *n, struct stat *st)
{
 178:	f3 0f 1e fb          	endbr32 
 17c:	55                   	push   %ebp
 17d:	89 e5                	mov    %esp,%ebp
 17f:	56                   	push   %esi
 180:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 181:	83 ec 08             	sub    $0x8,%esp
 184:	6a 00                	push   $0x0
 186:	ff 75 08             	pushl  0x8(%ebp)
 189:	e8 dc 00 00 00       	call   26a <open>
  if(fd < 0)
 18e:	83 c4 10             	add    $0x10,%esp
 191:	85 c0                	test   %eax,%eax
 193:	78 24                	js     1b9 <stat+0x41>
 195:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 197:	83 ec 08             	sub    $0x8,%esp
 19a:	ff 75 0c             	pushl  0xc(%ebp)
 19d:	50                   	push   %eax
 19e:	e8 df 00 00 00       	call   282 <fstat>
 1a3:	89 c6                	mov    %eax,%esi
  close(fd);
 1a5:	89 1c 24             	mov    %ebx,(%esp)
 1a8:	e8 a5 00 00 00       	call   252 <close>
  return r;
 1ad:	83 c4 10             	add    $0x10,%esp
}
 1b0:	89 f0                	mov    %esi,%eax
 1b2:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b5:	5b                   	pop    %ebx
 1b6:	5e                   	pop    %esi
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
    return -1;
 1b9:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1be:	eb f0                	jmp    1b0 <stat+0x38>

000001c0 <atoi>:

int
atoi(const char *s)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	53                   	push   %ebx
 1c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1cb:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1d0:	0f b6 01             	movzbl (%ecx),%eax
 1d3:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1d6:	80 fb 09             	cmp    $0x9,%bl
 1d9:	77 12                	ja     1ed <atoi+0x2d>
    n = n*10 + *s++ - '0';
 1db:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1de:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1e1:	83 c1 01             	add    $0x1,%ecx
 1e4:	0f be c0             	movsbl %al,%eax
 1e7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 1eb:	eb e3                	jmp    1d0 <atoi+0x10>
  return n;
}
 1ed:	89 d0                	mov    %edx,%eax
 1ef:	5b                   	pop    %ebx
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret    

000001f2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1f2:	f3 0f 1e fb          	endbr32 
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	56                   	push   %esi
 1fa:	53                   	push   %ebx
 1fb:	8b 75 08             	mov    0x8(%ebp),%esi
 1fe:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 201:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 204:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 206:	8d 58 ff             	lea    -0x1(%eax),%ebx
 209:	85 c0                	test   %eax,%eax
 20b:	7e 0f                	jle    21c <memmove+0x2a>
    *dst++ = *src++;
 20d:	0f b6 01             	movzbl (%ecx),%eax
 210:	88 02                	mov    %al,(%edx)
 212:	8d 49 01             	lea    0x1(%ecx),%ecx
 215:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 218:	89 d8                	mov    %ebx,%eax
 21a:	eb ea                	jmp    206 <memmove+0x14>
  return vdst;
}
 21c:	89 f0                	mov    %esi,%eax
 21e:	5b                   	pop    %ebx
 21f:	5e                   	pop    %esi
 220:	5d                   	pop    %ebp
 221:	c3                   	ret    

00000222 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 222:	b8 01 00 00 00       	mov    $0x1,%eax
 227:	cd 40                	int    $0x40
 229:	c3                   	ret    

0000022a <exit>:
SYSCALL(exit)
 22a:	b8 02 00 00 00       	mov    $0x2,%eax
 22f:	cd 40                	int    $0x40
 231:	c3                   	ret    

00000232 <wait>:
SYSCALL(wait)
 232:	b8 03 00 00 00       	mov    $0x3,%eax
 237:	cd 40                	int    $0x40
 239:	c3                   	ret    

0000023a <pipe>:
SYSCALL(pipe)
 23a:	b8 04 00 00 00       	mov    $0x4,%eax
 23f:	cd 40                	int    $0x40
 241:	c3                   	ret    

00000242 <read>:
SYSCALL(read)
 242:	b8 05 00 00 00       	mov    $0x5,%eax
 247:	cd 40                	int    $0x40
 249:	c3                   	ret    

0000024a <write>:
SYSCALL(write)
 24a:	b8 10 00 00 00       	mov    $0x10,%eax
 24f:	cd 40                	int    $0x40
 251:	c3                   	ret    

00000252 <close>:
SYSCALL(close)
 252:	b8 15 00 00 00       	mov    $0x15,%eax
 257:	cd 40                	int    $0x40
 259:	c3                   	ret    

0000025a <kill>:
SYSCALL(kill)
 25a:	b8 06 00 00 00       	mov    $0x6,%eax
 25f:	cd 40                	int    $0x40
 261:	c3                   	ret    

00000262 <exec>:
SYSCALL(exec)
 262:	b8 07 00 00 00       	mov    $0x7,%eax
 267:	cd 40                	int    $0x40
 269:	c3                   	ret    

0000026a <open>:
SYSCALL(open)
 26a:	b8 0f 00 00 00       	mov    $0xf,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <mknod>:
SYSCALL(mknod)
 272:	b8 11 00 00 00       	mov    $0x11,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <unlink>:
SYSCALL(unlink)
 27a:	b8 12 00 00 00       	mov    $0x12,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <fstat>:
SYSCALL(fstat)
 282:	b8 08 00 00 00       	mov    $0x8,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <link>:
SYSCALL(link)
 28a:	b8 13 00 00 00       	mov    $0x13,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <mkdir>:
SYSCALL(mkdir)
 292:	b8 14 00 00 00       	mov    $0x14,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <chdir>:
SYSCALL(chdir)
 29a:	b8 09 00 00 00       	mov    $0x9,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <dup>:
SYSCALL(dup)
 2a2:	b8 0a 00 00 00       	mov    $0xa,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <getpid>:
SYSCALL(getpid)
 2aa:	b8 0b 00 00 00       	mov    $0xb,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <sbrk>:
SYSCALL(sbrk)
 2b2:	b8 0c 00 00 00       	mov    $0xc,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <sleep>:
SYSCALL(sleep)
 2ba:	b8 0d 00 00 00       	mov    $0xd,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <uptime>:
SYSCALL(uptime)
 2c2:	b8 0e 00 00 00       	mov    $0xe,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <yield>:
SYSCALL(yield)
 2ca:	b8 16 00 00 00       	mov    $0x16,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <shutdown>:
SYSCALL(shutdown)
 2d2:	b8 17 00 00 00       	mov    $0x17,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <ps>:
SYSCALL(ps)
 2da:	b8 18 00 00 00       	mov    $0x18,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <nice>:
 2e2:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 2ea:	f3 0f 1e fb          	endbr32 
 2ee:	55                   	push   %ebp
 2ef:	89 e5                	mov    %esp,%ebp
 2f1:	8b 45 14             	mov    0x14(%ebp),%eax
 2f4:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 2f7:	3b 45 10             	cmp    0x10(%ebp),%eax
 2fa:	73 06                	jae    302 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 2fc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ff:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	57                   	push   %edi
 308:	56                   	push   %esi
 309:	53                   	push   %ebx
 30a:	83 ec 08             	sub    $0x8,%esp
 30d:	89 c6                	mov    %eax,%esi
 30f:	89 d3                	mov    %edx,%ebx
 311:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 314:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 318:	0f 95 c2             	setne  %dl
 31b:	89 c8                	mov    %ecx,%eax
 31d:	c1 e8 1f             	shr    $0x1f,%eax
 320:	84 c2                	test   %al,%dl
 322:	74 33                	je     357 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 324:	89 c8                	mov    %ecx,%eax
 326:	f7 d8                	neg    %eax
    neg = 1;
 328:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 32f:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 334:	8d 4f 01             	lea    0x1(%edi),%ecx
 337:	89 ca                	mov    %ecx,%edx
 339:	39 d9                	cmp    %ebx,%ecx
 33b:	73 26                	jae    363 <s_getReverseDigits+0x5f>
 33d:	85 c0                	test   %eax,%eax
 33f:	74 22                	je     363 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 341:	ba 00 00 00 00       	mov    $0x0,%edx
 346:	f7 75 08             	divl   0x8(%ebp)
 349:	0f b6 92 10 07 00 00 	movzbl 0x710(%edx),%edx
 350:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 353:	89 cf                	mov    %ecx,%edi
 355:	eb dd                	jmp    334 <s_getReverseDigits+0x30>
    x = xx;
 357:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 35a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 361:	eb cc                	jmp    32f <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 363:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 367:	75 0a                	jne    373 <s_getReverseDigits+0x6f>
 369:	39 da                	cmp    %ebx,%edx
 36b:	73 06                	jae    373 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 36d:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 371:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 373:	89 fa                	mov    %edi,%edx
 375:	39 df                	cmp    %ebx,%edi
 377:	0f 92 c0             	setb   %al
 37a:	84 45 ec             	test   %al,-0x14(%ebp)
 37d:	74 07                	je     386 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 37f:	83 c7 01             	add    $0x1,%edi
 382:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 386:	89 f8                	mov    %edi,%eax
 388:	83 c4 08             	add    $0x8,%esp
 38b:	5b                   	pop    %ebx
 38c:	5e                   	pop    %esi
 38d:	5f                   	pop    %edi
 38e:	5d                   	pop    %ebp
 38f:	c3                   	ret    

00000390 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 390:	39 c2                	cmp    %eax,%edx
 392:	0f 46 c2             	cmovbe %edx,%eax
}
 395:	c3                   	ret    

00000396 <s_printint>:
{
 396:	55                   	push   %ebp
 397:	89 e5                	mov    %esp,%ebp
 399:	57                   	push   %edi
 39a:	56                   	push   %esi
 39b:	53                   	push   %ebx
 39c:	83 ec 2c             	sub    $0x2c,%esp
 39f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3a2:	89 55 d0             	mov    %edx,-0x30(%ebp)
 3a5:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 3a8:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 3ab:	ff 75 14             	pushl  0x14(%ebp)
 3ae:	ff 75 10             	pushl  0x10(%ebp)
 3b1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3b4:	ba 10 00 00 00       	mov    $0x10,%edx
 3b9:	8d 45 d8             	lea    -0x28(%ebp),%eax
 3bc:	e8 43 ff ff ff       	call   304 <s_getReverseDigits>
 3c1:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 3c4:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 3c6:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 3c9:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 3ce:	83 eb 01             	sub    $0x1,%ebx
 3d1:	78 22                	js     3f5 <s_printint+0x5f>
 3d3:	39 fe                	cmp    %edi,%esi
 3d5:	73 1e                	jae    3f5 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 3d7:	83 ec 0c             	sub    $0xc,%esp
 3da:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 3df:	50                   	push   %eax
 3e0:	56                   	push   %esi
 3e1:	57                   	push   %edi
 3e2:	ff 75 cc             	pushl  -0x34(%ebp)
 3e5:	ff 75 d0             	pushl  -0x30(%ebp)
 3e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 3eb:	ff d0                	call   *%eax
    j++;
 3ed:	83 c6 01             	add    $0x1,%esi
 3f0:	83 c4 20             	add    $0x20,%esp
 3f3:	eb d9                	jmp    3ce <s_printint+0x38>
}
 3f5:	8b 45 c8             	mov    -0x38(%ebp),%eax
 3f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fb:	5b                   	pop    %ebx
 3fc:	5e                   	pop    %esi
 3fd:	5f                   	pop    %edi
 3fe:	5d                   	pop    %ebp
 3ff:	c3                   	ret    

00000400 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 2c             	sub    $0x2c,%esp
 409:	89 45 d8             	mov    %eax,-0x28(%ebp)
 40c:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 40f:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 412:	8b 45 08             	mov    0x8(%ebp),%eax
 415:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 418:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 41f:	bb 00 00 00 00       	mov    $0x0,%ebx
 424:	89 f8                	mov    %edi,%eax
 426:	89 df                	mov    %ebx,%edi
 428:	89 c6                	mov    %eax,%esi
 42a:	eb 20                	jmp    44c <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 42c:	8d 43 01             	lea    0x1(%ebx),%eax
 42f:	89 45 e0             	mov    %eax,-0x20(%ebp)
 432:	83 ec 0c             	sub    $0xc,%esp
 435:	51                   	push   %ecx
 436:	53                   	push   %ebx
 437:	56                   	push   %esi
 438:	ff 75 d0             	pushl  -0x30(%ebp)
 43b:	ff 75 d4             	pushl  -0x2c(%ebp)
 43e:	8b 55 d8             	mov    -0x28(%ebp),%edx
 441:	ff d2                	call   *%edx
 443:	83 c4 20             	add    $0x20,%esp
 446:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 449:	83 c7 01             	add    $0x1,%edi
 44c:	8b 45 0c             	mov    0xc(%ebp),%eax
 44f:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 453:	84 c0                	test   %al,%al
 455:	0f 84 cd 01 00 00    	je     628 <s_printf+0x228>
 45b:	89 75 e0             	mov    %esi,-0x20(%ebp)
 45e:	39 de                	cmp    %ebx,%esi
 460:	0f 86 c2 01 00 00    	jbe    628 <s_printf+0x228>
    c = fmt[i] & 0xff;
 466:	0f be c8             	movsbl %al,%ecx
 469:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 46c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 46f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 473:	75 0a                	jne    47f <s_printf+0x7f>
      if(c == '%') {
 475:	83 f8 25             	cmp    $0x25,%eax
 478:	75 b2                	jne    42c <s_printf+0x2c>
        state = '%';
 47a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 47d:	eb ca                	jmp    449 <s_printf+0x49>
      }
    } else if(state == '%'){
 47f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 483:	75 c4                	jne    449 <s_printf+0x49>
      if(c == 'd'){
 485:	83 f8 64             	cmp    $0x64,%eax
 488:	74 6e                	je     4f8 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 48a:	83 f8 78             	cmp    $0x78,%eax
 48d:	0f 94 c1             	sete   %cl
 490:	83 f8 70             	cmp    $0x70,%eax
 493:	0f 94 c2             	sete   %dl
 496:	08 d1                	or     %dl,%cl
 498:	0f 85 8e 00 00 00    	jne    52c <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 49e:	83 f8 73             	cmp    $0x73,%eax
 4a1:	0f 84 b9 00 00 00    	je     560 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 4a7:	83 f8 63             	cmp    $0x63,%eax
 4aa:	0f 84 1a 01 00 00    	je     5ca <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 4b0:	83 f8 25             	cmp    $0x25,%eax
 4b3:	0f 84 44 01 00 00    	je     5fd <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 4b9:	8d 43 01             	lea    0x1(%ebx),%eax
 4bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4bf:	83 ec 0c             	sub    $0xc,%esp
 4c2:	6a 25                	push   $0x25
 4c4:	53                   	push   %ebx
 4c5:	56                   	push   %esi
 4c6:	ff 75 d0             	pushl  -0x30(%ebp)
 4c9:	ff 75 d4             	pushl  -0x2c(%ebp)
 4cc:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4cf:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 4d1:	83 c3 02             	add    $0x2,%ebx
 4d4:	83 c4 14             	add    $0x14,%esp
 4d7:	ff 75 dc             	pushl  -0x24(%ebp)
 4da:	ff 75 e4             	pushl  -0x1c(%ebp)
 4dd:	56                   	push   %esi
 4de:	ff 75 d0             	pushl  -0x30(%ebp)
 4e1:	ff 75 d4             	pushl  -0x2c(%ebp)
 4e4:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4e7:	ff d0                	call   *%eax
 4e9:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 4ec:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4f3:	e9 51 ff ff ff       	jmp    449 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 4f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4fb:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 4fe:	6a 01                	push   $0x1
 500:	6a 0a                	push   $0xa
 502:	8b 45 10             	mov    0x10(%ebp),%eax
 505:	ff 30                	pushl  (%eax)
 507:	89 f0                	mov    %esi,%eax
 509:	29 d8                	sub    %ebx,%eax
 50b:	50                   	push   %eax
 50c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 50f:	8b 45 d8             	mov    -0x28(%ebp),%eax
 512:	e8 7f fe ff ff       	call   396 <s_printint>
 517:	01 c3                	add    %eax,%ebx
        ap++;
 519:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 51d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 520:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 527:	e9 1d ff ff ff       	jmp    449 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 52c:	8b 45 d0             	mov    -0x30(%ebp),%eax
 52f:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 532:	6a 00                	push   $0x0
 534:	6a 10                	push   $0x10
 536:	8b 45 10             	mov    0x10(%ebp),%eax
 539:	ff 30                	pushl  (%eax)
 53b:	89 f0                	mov    %esi,%eax
 53d:	29 d8                	sub    %ebx,%eax
 53f:	50                   	push   %eax
 540:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 543:	8b 45 d8             	mov    -0x28(%ebp),%eax
 546:	e8 4b fe ff ff       	call   396 <s_printint>
 54b:	01 c3                	add    %eax,%ebx
        ap++;
 54d:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 551:	83 c4 10             	add    $0x10,%esp
      state = 0;
 554:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 55b:	e9 e9 fe ff ff       	jmp    449 <s_printf+0x49>
        s = (char*)*ap;
 560:	8b 45 10             	mov    0x10(%ebp),%eax
 563:	8b 00                	mov    (%eax),%eax
        ap++;
 565:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 569:	85 c0                	test   %eax,%eax
 56b:	75 4e                	jne    5bb <s_printf+0x1bb>
          s = "(null)";
 56d:	b8 08 07 00 00       	mov    $0x708,%eax
 572:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 575:	89 da                	mov    %ebx,%edx
 577:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 57a:	89 75 e0             	mov    %esi,-0x20(%ebp)
 57d:	89 c6                	mov    %eax,%esi
 57f:	eb 1f                	jmp    5a0 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 581:	8d 7a 01             	lea    0x1(%edx),%edi
 584:	83 ec 0c             	sub    $0xc,%esp
 587:	0f be c0             	movsbl %al,%eax
 58a:	50                   	push   %eax
 58b:	52                   	push   %edx
 58c:	53                   	push   %ebx
 58d:	ff 75 d0             	pushl  -0x30(%ebp)
 590:	ff 75 d4             	pushl  -0x2c(%ebp)
 593:	8b 45 d8             	mov    -0x28(%ebp),%eax
 596:	ff d0                	call   *%eax
          s++;
 598:	83 c6 01             	add    $0x1,%esi
 59b:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 59e:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 5a0:	0f b6 06             	movzbl (%esi),%eax
 5a3:	84 c0                	test   %al,%al
 5a5:	75 da                	jne    581 <s_printf+0x181>
 5a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5aa:	89 d3                	mov    %edx,%ebx
 5ac:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 5af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5b6:	e9 8e fe ff ff       	jmp    449 <s_printf+0x49>
 5bb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5be:	89 da                	mov    %ebx,%edx
 5c0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 5c3:	89 75 e0             	mov    %esi,-0x20(%ebp)
 5c6:	89 c6                	mov    %eax,%esi
 5c8:	eb d6                	jmp    5a0 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 5ca:	8d 43 01             	lea    0x1(%ebx),%eax
 5cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	8b 55 10             	mov    0x10(%ebp),%edx
 5d6:	0f be 02             	movsbl (%edx),%eax
 5d9:	50                   	push   %eax
 5da:	53                   	push   %ebx
 5db:	56                   	push   %esi
 5dc:	ff 75 d0             	pushl  -0x30(%ebp)
 5df:	ff 75 d4             	pushl  -0x2c(%ebp)
 5e2:	8b 55 d8             	mov    -0x28(%ebp),%edx
 5e5:	ff d2                	call   *%edx
        ap++;
 5e7:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 5eb:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 5ee:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 5f1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5f8:	e9 4c fe ff ff       	jmp    449 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 5fd:	8d 43 01             	lea    0x1(%ebx),%eax
 600:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 603:	83 ec 0c             	sub    $0xc,%esp
 606:	ff 75 dc             	pushl  -0x24(%ebp)
 609:	53                   	push   %ebx
 60a:	56                   	push   %esi
 60b:	ff 75 d0             	pushl  -0x30(%ebp)
 60e:	ff 75 d4             	pushl  -0x2c(%ebp)
 611:	8b 55 d8             	mov    -0x28(%ebp),%edx
 614:	ff d2                	call   *%edx
 616:	83 c4 20             	add    $0x20,%esp
 619:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 61c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 623:	e9 21 fe ff ff       	jmp    449 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 628:	89 da                	mov    %ebx,%edx
 62a:	89 f0                	mov    %esi,%eax
 62c:	e8 5f fd ff ff       	call   390 <s_min>
}
 631:	8d 65 f4             	lea    -0xc(%ebp),%esp
 634:	5b                   	pop    %ebx
 635:	5e                   	pop    %esi
 636:	5f                   	pop    %edi
 637:	5d                   	pop    %ebp
 638:	c3                   	ret    

00000639 <s_putc>:
{
 639:	f3 0f 1e fb          	endbr32 
 63d:	55                   	push   %ebp
 63e:	89 e5                	mov    %esp,%ebp
 640:	83 ec 1c             	sub    $0x1c,%esp
 643:	8b 45 18             	mov    0x18(%ebp),%eax
 646:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 649:	6a 01                	push   $0x1
 64b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 64e:	50                   	push   %eax
 64f:	ff 75 08             	pushl  0x8(%ebp)
 652:	e8 f3 fb ff ff       	call   24a <write>
}
 657:	83 c4 10             	add    $0x10,%esp
 65a:	c9                   	leave  
 65b:	c3                   	ret    

0000065c <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 65c:	f3 0f 1e fb          	endbr32 
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	56                   	push   %esi
 664:	53                   	push   %ebx
 665:	8b 75 08             	mov    0x8(%ebp),%esi
 668:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 66b:	83 ec 04             	sub    $0x4,%esp
 66e:	8d 45 14             	lea    0x14(%ebp),%eax
 671:	50                   	push   %eax
 672:	ff 75 10             	pushl  0x10(%ebp)
 675:	53                   	push   %ebx
 676:	89 f1                	mov    %esi,%ecx
 678:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 67d:	b8 ea 02 00 00       	mov    $0x2ea,%eax
 682:	e8 79 fd ff ff       	call   400 <s_printf>
  if(count < n) {
 687:	83 c4 10             	add    $0x10,%esp
 68a:	39 c3                	cmp    %eax,%ebx
 68c:	76 04                	jbe    692 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 68e:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 692:	8d 65 f8             	lea    -0x8(%ebp),%esp
 695:	5b                   	pop    %ebx
 696:	5e                   	pop    %esi
 697:	5d                   	pop    %ebp
 698:	c3                   	ret    

00000699 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 699:	f3 0f 1e fb          	endbr32 
 69d:	55                   	push   %ebp
 69e:	89 e5                	mov    %esp,%ebp
 6a0:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 6a3:	8d 45 10             	lea    0x10(%ebp),%eax
 6a6:	50                   	push   %eax
 6a7:	ff 75 0c             	pushl  0xc(%ebp)
 6aa:	68 00 00 00 40       	push   $0x40000000
 6af:	b9 00 00 00 00       	mov    $0x0,%ecx
 6b4:	8b 55 08             	mov    0x8(%ebp),%edx
 6b7:	b8 39 06 00 00       	mov    $0x639,%eax
 6bc:	e8 3f fd ff ff       	call   400 <s_printf>
}
 6c1:	83 c4 10             	add    $0x10,%esp
 6c4:	c9                   	leave  
 6c5:	c3                   	ret    
