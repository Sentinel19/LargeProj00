
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	57                   	push   %edi
   8:	56                   	push   %esi
   9:	53                   	push   %ebx
   a:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
   d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  14:	be 00 00 00 00       	mov    $0x0,%esi
  19:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  20:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  27:	83 ec 04             	sub    $0x4,%esp
  2a:	68 00 02 00 00       	push   $0x200
  2f:	68 40 08 00 00       	push   $0x840
  34:	ff 75 08             	pushl  0x8(%ebp)
  37:	e8 03 03 00 00       	call   33f <read>
  3c:	89 c7                	mov    %eax,%edi
  3e:	83 c4 10             	add    $0x10,%esp
  41:	85 c0                	test   %eax,%eax
  43:	7e 54                	jle    99 <wc+0x99>
    for(i=0; i<n; i++){
  45:	bb 00 00 00 00       	mov    $0x0,%ebx
  4a:	eb 22                	jmp    6e <wc+0x6e>
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  4c:	83 ec 08             	sub    $0x8,%esp
  4f:	0f be c0             	movsbl %al,%eax
  52:	50                   	push   %eax
  53:	68 d4 07 00 00       	push   $0x7d4
  58:	e8 98 01 00 00       	call   1f5 <strchr>
  5d:	83 c4 10             	add    $0x10,%esp
  60:	85 c0                	test   %eax,%eax
  62:	74 22                	je     86 <wc+0x86>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	39 fb                	cmp    %edi,%ebx
  70:	7d b5                	jge    27 <wc+0x27>
      c++;
  72:	83 c6 01             	add    $0x1,%esi
      if(buf[i] == '\n')
  75:	0f b6 83 40 08 00 00 	movzbl 0x840(%ebx),%eax
  7c:	3c 0a                	cmp    $0xa,%al
  7e:	75 cc                	jne    4c <wc+0x4c>
        l++;
  80:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  84:	eb c6                	jmp    4c <wc+0x4c>
      else if(!inword){
  86:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8a:	75 df                	jne    6b <wc+0x6b>
        w++;
  8c:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
  90:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  97:	eb d2                	jmp    6b <wc+0x6b>
      }
    }
  }
  if(n < 0){
  99:	78 24                	js     bf <wc+0xbf>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  9b:	83 ec 08             	sub    $0x8,%esp
  9e:	ff 75 0c             	pushl  0xc(%ebp)
  a1:	56                   	push   %esi
  a2:	ff 75 dc             	pushl  -0x24(%ebp)
  a5:	ff 75 e0             	pushl  -0x20(%ebp)
  a8:	68 ea 07 00 00       	push   $0x7ea
  ad:	6a 01                	push   $0x1
  af:	e8 f2 06 00 00       	call   7a6 <printf>
}
  b4:	83 c4 20             	add    $0x20,%esp
  b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ba:	5b                   	pop    %ebx
  bb:	5e                   	pop    %esi
  bc:	5f                   	pop    %edi
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    
    printf(1, "wc: read error\n");
  bf:	83 ec 08             	sub    $0x8,%esp
  c2:	68 da 07 00 00       	push   $0x7da
  c7:	6a 01                	push   $0x1
  c9:	e8 d8 06 00 00       	call   7a6 <printf>
    exit();
  ce:	e8 54 02 00 00       	call   327 <exit>

000000d3 <main>:

int
main(int argc, char *argv[])
{
  d3:	f3 0f 1e fb          	endbr32 
  d7:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  db:	83 e4 f0             	and    $0xfffffff0,%esp
  de:	ff 71 fc             	pushl  -0x4(%ecx)
  e1:	55                   	push   %ebp
  e2:	89 e5                	mov    %esp,%ebp
  e4:	57                   	push   %edi
  e5:	56                   	push   %esi
  e6:	53                   	push   %ebx
  e7:	51                   	push   %ecx
  e8:	83 ec 18             	sub    $0x18,%esp
  eb:	8b 01                	mov    (%ecx),%eax
  ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  f0:	8b 51 04             	mov    0x4(%ecx),%edx
  f3:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  f6:	83 f8 01             	cmp    $0x1,%eax
  f9:	7e 40                	jle    13b <main+0x68>
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  fb:	be 01 00 00 00       	mov    $0x1,%esi
 100:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 103:	7d 60                	jge    165 <main+0x92>
    if((fd = open(argv[i], 0)) < 0){
 105:	8b 45 e0             	mov    -0x20(%ebp),%eax
 108:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 10b:	83 ec 08             	sub    $0x8,%esp
 10e:	6a 00                	push   $0x0
 110:	ff 37                	pushl  (%edi)
 112:	e8 50 02 00 00       	call   367 <open>
 117:	89 c3                	mov    %eax,%ebx
 119:	83 c4 10             	add    $0x10,%esp
 11c:	85 c0                	test   %eax,%eax
 11e:	78 2f                	js     14f <main+0x7c>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 120:	83 ec 08             	sub    $0x8,%esp
 123:	ff 37                	pushl  (%edi)
 125:	50                   	push   %eax
 126:	e8 d5 fe ff ff       	call   0 <wc>
    close(fd);
 12b:	89 1c 24             	mov    %ebx,(%esp)
 12e:	e8 1c 02 00 00       	call   34f <close>
  for(i = 1; i < argc; i++){
 133:	83 c6 01             	add    $0x1,%esi
 136:	83 c4 10             	add    $0x10,%esp
 139:	eb c5                	jmp    100 <main+0x2d>
    wc(0, "");
 13b:	83 ec 08             	sub    $0x8,%esp
 13e:	68 e9 07 00 00       	push   $0x7e9
 143:	6a 00                	push   $0x0
 145:	e8 b6 fe ff ff       	call   0 <wc>
    exit();
 14a:	e8 d8 01 00 00       	call   327 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
 14f:	83 ec 04             	sub    $0x4,%esp
 152:	ff 37                	pushl  (%edi)
 154:	68 f7 07 00 00       	push   $0x7f7
 159:	6a 01                	push   $0x1
 15b:	e8 46 06 00 00       	call   7a6 <printf>
      exit();
 160:	e8 c2 01 00 00       	call   327 <exit>
  }
  exit();
 165:	e8 bd 01 00 00       	call   327 <exit>

0000016a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 16a:	f3 0f 1e fb          	endbr32 
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	56                   	push   %esi
 172:	53                   	push   %ebx
 173:	8b 75 08             	mov    0x8(%ebp),%esi
 176:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 179:	89 f0                	mov    %esi,%eax
 17b:	89 d1                	mov    %edx,%ecx
 17d:	83 c2 01             	add    $0x1,%edx
 180:	89 c3                	mov    %eax,%ebx
 182:	83 c0 01             	add    $0x1,%eax
 185:	0f b6 09             	movzbl (%ecx),%ecx
 188:	88 0b                	mov    %cl,(%ebx)
 18a:	84 c9                	test   %cl,%cl
 18c:	75 ed                	jne    17b <strcpy+0x11>
    ;
  return os;
}
 18e:	89 f0                	mov    %esi,%eax
 190:	5b                   	pop    %ebx
 191:	5e                   	pop    %esi
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    

00000194 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 194:	f3 0f 1e fb          	endbr32 
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1a1:	0f b6 01             	movzbl (%ecx),%eax
 1a4:	84 c0                	test   %al,%al
 1a6:	74 0c                	je     1b4 <strcmp+0x20>
 1a8:	3a 02                	cmp    (%edx),%al
 1aa:	75 08                	jne    1b4 <strcmp+0x20>
    p++, q++;
 1ac:	83 c1 01             	add    $0x1,%ecx
 1af:	83 c2 01             	add    $0x1,%edx
 1b2:	eb ed                	jmp    1a1 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 1b4:	0f b6 c0             	movzbl %al,%eax
 1b7:	0f b6 12             	movzbl (%edx),%edx
 1ba:	29 d0                	sub    %edx,%eax
}
 1bc:	5d                   	pop    %ebp
 1bd:	c3                   	ret    

000001be <strlen>:

uint
strlen(const char *s)
{
 1be:	f3 0f 1e fb          	endbr32 
 1c2:	55                   	push   %ebp
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c8:	b8 00 00 00 00       	mov    $0x0,%eax
 1cd:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1d1:	74 05                	je     1d8 <strlen+0x1a>
 1d3:	83 c0 01             	add    $0x1,%eax
 1d6:	eb f5                	jmp    1cd <strlen+0xf>
    ;
  return n;
}
 1d8:	5d                   	pop    %ebp
 1d9:	c3                   	ret    

000001da <memset>:

void*
memset(void *dst, int c, uint n)
{
 1da:	f3 0f 1e fb          	endbr32 
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	57                   	push   %edi
 1e2:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e5:	89 d7                	mov    %edx,%edi
 1e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	fc                   	cld    
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f0:	89 d0                	mov    %edx,%eax
 1f2:	5f                   	pop    %edi
 1f3:	5d                   	pop    %ebp
 1f4:	c3                   	ret    

000001f5 <strchr>:

char*
strchr(const char *s, char c)
{
 1f5:	f3 0f 1e fb          	endbr32 
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 203:	0f b6 10             	movzbl (%eax),%edx
 206:	84 d2                	test   %dl,%dl
 208:	74 09                	je     213 <strchr+0x1e>
    if(*s == c)
 20a:	38 ca                	cmp    %cl,%dl
 20c:	74 0a                	je     218 <strchr+0x23>
  for(; *s; s++)
 20e:	83 c0 01             	add    $0x1,%eax
 211:	eb f0                	jmp    203 <strchr+0xe>
      return (char*)s;
  return 0;
 213:	b8 00 00 00 00       	mov    $0x0,%eax
}
 218:	5d                   	pop    %ebp
 219:	c3                   	ret    

0000021a <gets>:

char*
gets(char *buf, int max)
{
 21a:	f3 0f 1e fb          	endbr32 
 21e:	55                   	push   %ebp
 21f:	89 e5                	mov    %esp,%ebp
 221:	57                   	push   %edi
 222:	56                   	push   %esi
 223:	53                   	push   %ebx
 224:	83 ec 1c             	sub    $0x1c,%esp
 227:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22a:	bb 00 00 00 00       	mov    $0x0,%ebx
 22f:	89 de                	mov    %ebx,%esi
 231:	83 c3 01             	add    $0x1,%ebx
 234:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 237:	7d 2e                	jge    267 <gets+0x4d>
    cc = read(0, &c, 1);
 239:	83 ec 04             	sub    $0x4,%esp
 23c:	6a 01                	push   $0x1
 23e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 241:	50                   	push   %eax
 242:	6a 00                	push   $0x0
 244:	e8 f6 00 00 00       	call   33f <read>
    if(cc < 1)
 249:	83 c4 10             	add    $0x10,%esp
 24c:	85 c0                	test   %eax,%eax
 24e:	7e 17                	jle    267 <gets+0x4d>
      break;
    buf[i++] = c;
 250:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 254:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 257:	3c 0a                	cmp    $0xa,%al
 259:	0f 94 c2             	sete   %dl
 25c:	3c 0d                	cmp    $0xd,%al
 25e:	0f 94 c0             	sete   %al
 261:	08 c2                	or     %al,%dl
 263:	74 ca                	je     22f <gets+0x15>
    buf[i++] = c;
 265:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 267:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 26b:	89 f8                	mov    %edi,%eax
 26d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 270:	5b                   	pop    %ebx
 271:	5e                   	pop    %esi
 272:	5f                   	pop    %edi
 273:	5d                   	pop    %ebp
 274:	c3                   	ret    

00000275 <stat>:

int
stat(const char *n, struct stat *st)
{
 275:	f3 0f 1e fb          	endbr32 
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
 27c:	56                   	push   %esi
 27d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 27e:	83 ec 08             	sub    $0x8,%esp
 281:	6a 00                	push   $0x0
 283:	ff 75 08             	pushl  0x8(%ebp)
 286:	e8 dc 00 00 00       	call   367 <open>
  if(fd < 0)
 28b:	83 c4 10             	add    $0x10,%esp
 28e:	85 c0                	test   %eax,%eax
 290:	78 24                	js     2b6 <stat+0x41>
 292:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 294:	83 ec 08             	sub    $0x8,%esp
 297:	ff 75 0c             	pushl  0xc(%ebp)
 29a:	50                   	push   %eax
 29b:	e8 df 00 00 00       	call   37f <fstat>
 2a0:	89 c6                	mov    %eax,%esi
  close(fd);
 2a2:	89 1c 24             	mov    %ebx,(%esp)
 2a5:	e8 a5 00 00 00       	call   34f <close>
  return r;
 2aa:	83 c4 10             	add    $0x10,%esp
}
 2ad:	89 f0                	mov    %esi,%eax
 2af:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b2:	5b                   	pop    %ebx
 2b3:	5e                   	pop    %esi
 2b4:	5d                   	pop    %ebp
 2b5:	c3                   	ret    
    return -1;
 2b6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2bb:	eb f0                	jmp    2ad <stat+0x38>

000002bd <atoi>:

int
atoi(const char *s)
{
 2bd:	f3 0f 1e fb          	endbr32 
 2c1:	55                   	push   %ebp
 2c2:	89 e5                	mov    %esp,%ebp
 2c4:	53                   	push   %ebx
 2c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2c8:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2cd:	0f b6 01             	movzbl (%ecx),%eax
 2d0:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d3:	80 fb 09             	cmp    $0x9,%bl
 2d6:	77 12                	ja     2ea <atoi+0x2d>
    n = n*10 + *s++ - '0';
 2d8:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2db:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2de:	83 c1 01             	add    $0x1,%ecx
 2e1:	0f be c0             	movsbl %al,%eax
 2e4:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 2e8:	eb e3                	jmp    2cd <atoi+0x10>
  return n;
}
 2ea:	89 d0                	mov    %edx,%eax
 2ec:	5b                   	pop    %ebx
 2ed:	5d                   	pop    %ebp
 2ee:	c3                   	ret    

000002ef <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2ef:	f3 0f 1e fb          	endbr32 
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	56                   	push   %esi
 2f7:	53                   	push   %ebx
 2f8:	8b 75 08             	mov    0x8(%ebp),%esi
 2fb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2fe:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 301:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 303:	8d 58 ff             	lea    -0x1(%eax),%ebx
 306:	85 c0                	test   %eax,%eax
 308:	7e 0f                	jle    319 <memmove+0x2a>
    *dst++ = *src++;
 30a:	0f b6 01             	movzbl (%ecx),%eax
 30d:	88 02                	mov    %al,(%edx)
 30f:	8d 49 01             	lea    0x1(%ecx),%ecx
 312:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 315:	89 d8                	mov    %ebx,%eax
 317:	eb ea                	jmp    303 <memmove+0x14>
  return vdst;
}
 319:	89 f0                	mov    %esi,%eax
 31b:	5b                   	pop    %ebx
 31c:	5e                   	pop    %esi
 31d:	5d                   	pop    %ebp
 31e:	c3                   	ret    

0000031f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 31f:	b8 01 00 00 00       	mov    $0x1,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <exit>:
SYSCALL(exit)
 327:	b8 02 00 00 00       	mov    $0x2,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <wait>:
SYSCALL(wait)
 32f:	b8 03 00 00 00       	mov    $0x3,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <pipe>:
SYSCALL(pipe)
 337:	b8 04 00 00 00       	mov    $0x4,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <read>:
SYSCALL(read)
 33f:	b8 05 00 00 00       	mov    $0x5,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <write>:
SYSCALL(write)
 347:	b8 10 00 00 00       	mov    $0x10,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <close>:
SYSCALL(close)
 34f:	b8 15 00 00 00       	mov    $0x15,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <kill>:
SYSCALL(kill)
 357:	b8 06 00 00 00       	mov    $0x6,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <exec>:
SYSCALL(exec)
 35f:	b8 07 00 00 00       	mov    $0x7,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <open>:
SYSCALL(open)
 367:	b8 0f 00 00 00       	mov    $0xf,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <mknod>:
SYSCALL(mknod)
 36f:	b8 11 00 00 00       	mov    $0x11,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <unlink>:
SYSCALL(unlink)
 377:	b8 12 00 00 00       	mov    $0x12,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <fstat>:
SYSCALL(fstat)
 37f:	b8 08 00 00 00       	mov    $0x8,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <link>:
SYSCALL(link)
 387:	b8 13 00 00 00       	mov    $0x13,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <mkdir>:
SYSCALL(mkdir)
 38f:	b8 14 00 00 00       	mov    $0x14,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <chdir>:
SYSCALL(chdir)
 397:	b8 09 00 00 00       	mov    $0x9,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <dup>:
SYSCALL(dup)
 39f:	b8 0a 00 00 00       	mov    $0xa,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <getpid>:
SYSCALL(getpid)
 3a7:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <sbrk>:
SYSCALL(sbrk)
 3af:	b8 0c 00 00 00       	mov    $0xc,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <sleep>:
SYSCALL(sleep)
 3b7:	b8 0d 00 00 00       	mov    $0xd,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <uptime>:
SYSCALL(uptime)
 3bf:	b8 0e 00 00 00       	mov    $0xe,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <yield>:
SYSCALL(yield)
 3c7:	b8 16 00 00 00       	mov    $0x16,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <shutdown>:
SYSCALL(shutdown)
 3cf:	b8 17 00 00 00       	mov    $0x17,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <ps>:
SYSCALL(ps)
 3d7:	b8 18 00 00 00       	mov    $0x18,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <nice>:
SYSCALL(nice)
 3df:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <flock>:
SYSCALL(flock)
 3e7:	b8 19 00 00 00       	mov    $0x19,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <funlock>:
 3ef:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 3f7:	f3 0f 1e fb          	endbr32 
 3fb:	55                   	push   %ebp
 3fc:	89 e5                	mov    %esp,%ebp
 3fe:	8b 45 14             	mov    0x14(%ebp),%eax
 401:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 404:	3b 45 10             	cmp    0x10(%ebp),%eax
 407:	73 06                	jae    40f <s_sputc+0x18>
  {
    outbuffer[index] = c;
 409:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 40c:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    

00000411 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 411:	55                   	push   %ebp
 412:	89 e5                	mov    %esp,%ebp
 414:	57                   	push   %edi
 415:	56                   	push   %esi
 416:	53                   	push   %ebx
 417:	83 ec 08             	sub    $0x8,%esp
 41a:	89 c6                	mov    %eax,%esi
 41c:	89 d3                	mov    %edx,%ebx
 41e:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 421:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 425:	0f 95 c2             	setne  %dl
 428:	89 c8                	mov    %ecx,%eax
 42a:	c1 e8 1f             	shr    $0x1f,%eax
 42d:	84 c2                	test   %al,%dl
 42f:	74 33                	je     464 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 431:	89 c8                	mov    %ecx,%eax
 433:	f7 d8                	neg    %eax
    neg = 1;
 435:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 43c:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 441:	8d 4f 01             	lea    0x1(%edi),%ecx
 444:	89 ca                	mov    %ecx,%edx
 446:	39 d9                	cmp    %ebx,%ecx
 448:	73 26                	jae    470 <s_getReverseDigits+0x5f>
 44a:	85 c0                	test   %eax,%eax
 44c:	74 22                	je     470 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 44e:	ba 00 00 00 00       	mov    $0x0,%edx
 453:	f7 75 08             	divl   0x8(%ebp)
 456:	0f b6 92 14 08 00 00 	movzbl 0x814(%edx),%edx
 45d:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 460:	89 cf                	mov    %ecx,%edi
 462:	eb dd                	jmp    441 <s_getReverseDigits+0x30>
    x = xx;
 464:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 467:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 46e:	eb cc                	jmp    43c <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 470:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 474:	75 0a                	jne    480 <s_getReverseDigits+0x6f>
 476:	39 da                	cmp    %ebx,%edx
 478:	73 06                	jae    480 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 47a:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 47e:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 480:	89 fa                	mov    %edi,%edx
 482:	39 df                	cmp    %ebx,%edi
 484:	0f 92 c0             	setb   %al
 487:	84 45 ec             	test   %al,-0x14(%ebp)
 48a:	74 07                	je     493 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 48c:	83 c7 01             	add    $0x1,%edi
 48f:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 493:	89 f8                	mov    %edi,%eax
 495:	83 c4 08             	add    $0x8,%esp
 498:	5b                   	pop    %ebx
 499:	5e                   	pop    %esi
 49a:	5f                   	pop    %edi
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    

0000049d <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 49d:	39 c2                	cmp    %eax,%edx
 49f:	0f 46 c2             	cmovbe %edx,%eax
}
 4a2:	c3                   	ret    

000004a3 <s_printint>:
{
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
 4a6:	57                   	push   %edi
 4a7:	56                   	push   %esi
 4a8:	53                   	push   %ebx
 4a9:	83 ec 2c             	sub    $0x2c,%esp
 4ac:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4af:	89 55 d0             	mov    %edx,-0x30(%ebp)
 4b2:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 4b5:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 4b8:	ff 75 14             	pushl  0x14(%ebp)
 4bb:	ff 75 10             	pushl  0x10(%ebp)
 4be:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4c1:	ba 10 00 00 00       	mov    $0x10,%edx
 4c6:	8d 45 d8             	lea    -0x28(%ebp),%eax
 4c9:	e8 43 ff ff ff       	call   411 <s_getReverseDigits>
 4ce:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 4d1:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 4d3:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 4d6:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 4db:	83 eb 01             	sub    $0x1,%ebx
 4de:	78 22                	js     502 <s_printint+0x5f>
 4e0:	39 fe                	cmp    %edi,%esi
 4e2:	73 1e                	jae    502 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 4e4:	83 ec 0c             	sub    $0xc,%esp
 4e7:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 4ec:	50                   	push   %eax
 4ed:	56                   	push   %esi
 4ee:	57                   	push   %edi
 4ef:	ff 75 cc             	pushl  -0x34(%ebp)
 4f2:	ff 75 d0             	pushl  -0x30(%ebp)
 4f5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4f8:	ff d0                	call   *%eax
    j++;
 4fa:	83 c6 01             	add    $0x1,%esi
 4fd:	83 c4 20             	add    $0x20,%esp
 500:	eb d9                	jmp    4db <s_printint+0x38>
}
 502:	8b 45 c8             	mov    -0x38(%ebp),%eax
 505:	8d 65 f4             	lea    -0xc(%ebp),%esp
 508:	5b                   	pop    %ebx
 509:	5e                   	pop    %esi
 50a:	5f                   	pop    %edi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    

0000050d <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 50d:	55                   	push   %ebp
 50e:	89 e5                	mov    %esp,%ebp
 510:	57                   	push   %edi
 511:	56                   	push   %esi
 512:	53                   	push   %ebx
 513:	83 ec 2c             	sub    $0x2c,%esp
 516:	89 45 d8             	mov    %eax,-0x28(%ebp)
 519:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 51c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 51f:	8b 45 08             	mov    0x8(%ebp),%eax
 522:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 525:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 52c:	bb 00 00 00 00       	mov    $0x0,%ebx
 531:	89 f8                	mov    %edi,%eax
 533:	89 df                	mov    %ebx,%edi
 535:	89 c6                	mov    %eax,%esi
 537:	eb 20                	jmp    559 <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 539:	8d 43 01             	lea    0x1(%ebx),%eax
 53c:	89 45 e0             	mov    %eax,-0x20(%ebp)
 53f:	83 ec 0c             	sub    $0xc,%esp
 542:	51                   	push   %ecx
 543:	53                   	push   %ebx
 544:	56                   	push   %esi
 545:	ff 75 d0             	pushl  -0x30(%ebp)
 548:	ff 75 d4             	pushl  -0x2c(%ebp)
 54b:	8b 55 d8             	mov    -0x28(%ebp),%edx
 54e:	ff d2                	call   *%edx
 550:	83 c4 20             	add    $0x20,%esp
 553:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 556:	83 c7 01             	add    $0x1,%edi
 559:	8b 45 0c             	mov    0xc(%ebp),%eax
 55c:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 560:	84 c0                	test   %al,%al
 562:	0f 84 cd 01 00 00    	je     735 <s_printf+0x228>
 568:	89 75 e0             	mov    %esi,-0x20(%ebp)
 56b:	39 de                	cmp    %ebx,%esi
 56d:	0f 86 c2 01 00 00    	jbe    735 <s_printf+0x228>
    c = fmt[i] & 0xff;
 573:	0f be c8             	movsbl %al,%ecx
 576:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 579:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 57c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 580:	75 0a                	jne    58c <s_printf+0x7f>
      if(c == '%') {
 582:	83 f8 25             	cmp    $0x25,%eax
 585:	75 b2                	jne    539 <s_printf+0x2c>
        state = '%';
 587:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 58a:	eb ca                	jmp    556 <s_printf+0x49>
      }
    } else if(state == '%'){
 58c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 590:	75 c4                	jne    556 <s_printf+0x49>
      if(c == 'd'){
 592:	83 f8 64             	cmp    $0x64,%eax
 595:	74 6e                	je     605 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 597:	83 f8 78             	cmp    $0x78,%eax
 59a:	0f 94 c1             	sete   %cl
 59d:	83 f8 70             	cmp    $0x70,%eax
 5a0:	0f 94 c2             	sete   %dl
 5a3:	08 d1                	or     %dl,%cl
 5a5:	0f 85 8e 00 00 00    	jne    639 <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5ab:	83 f8 73             	cmp    $0x73,%eax
 5ae:	0f 84 b9 00 00 00    	je     66d <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 5b4:	83 f8 63             	cmp    $0x63,%eax
 5b7:	0f 84 1a 01 00 00    	je     6d7 <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 5bd:	83 f8 25             	cmp    $0x25,%eax
 5c0:	0f 84 44 01 00 00    	je     70a <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 5c6:	8d 43 01             	lea    0x1(%ebx),%eax
 5c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5cc:	83 ec 0c             	sub    $0xc,%esp
 5cf:	6a 25                	push   $0x25
 5d1:	53                   	push   %ebx
 5d2:	56                   	push   %esi
 5d3:	ff 75 d0             	pushl  -0x30(%ebp)
 5d6:	ff 75 d4             	pushl  -0x2c(%ebp)
 5d9:	8b 45 d8             	mov    -0x28(%ebp),%eax
 5dc:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 5de:	83 c3 02             	add    $0x2,%ebx
 5e1:	83 c4 14             	add    $0x14,%esp
 5e4:	ff 75 dc             	pushl  -0x24(%ebp)
 5e7:	ff 75 e4             	pushl  -0x1c(%ebp)
 5ea:	56                   	push   %esi
 5eb:	ff 75 d0             	pushl  -0x30(%ebp)
 5ee:	ff 75 d4             	pushl  -0x2c(%ebp)
 5f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
 5f4:	ff d0                	call   *%eax
 5f6:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 5f9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 600:	e9 51 ff ff ff       	jmp    556 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 605:	8b 45 d0             	mov    -0x30(%ebp),%eax
 608:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 60b:	6a 01                	push   $0x1
 60d:	6a 0a                	push   $0xa
 60f:	8b 45 10             	mov    0x10(%ebp),%eax
 612:	ff 30                	pushl  (%eax)
 614:	89 f0                	mov    %esi,%eax
 616:	29 d8                	sub    %ebx,%eax
 618:	50                   	push   %eax
 619:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 61c:	8b 45 d8             	mov    -0x28(%ebp),%eax
 61f:	e8 7f fe ff ff       	call   4a3 <s_printint>
 624:	01 c3                	add    %eax,%ebx
        ap++;
 626:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 62a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 62d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 634:	e9 1d ff ff ff       	jmp    556 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 639:	8b 45 d0             	mov    -0x30(%ebp),%eax
 63c:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 63f:	6a 00                	push   $0x0
 641:	6a 10                	push   $0x10
 643:	8b 45 10             	mov    0x10(%ebp),%eax
 646:	ff 30                	pushl  (%eax)
 648:	89 f0                	mov    %esi,%eax
 64a:	29 d8                	sub    %ebx,%eax
 64c:	50                   	push   %eax
 64d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 650:	8b 45 d8             	mov    -0x28(%ebp),%eax
 653:	e8 4b fe ff ff       	call   4a3 <s_printint>
 658:	01 c3                	add    %eax,%ebx
        ap++;
 65a:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 65e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 661:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 668:	e9 e9 fe ff ff       	jmp    556 <s_printf+0x49>
        s = (char*)*ap;
 66d:	8b 45 10             	mov    0x10(%ebp),%eax
 670:	8b 00                	mov    (%eax),%eax
        ap++;
 672:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 676:	85 c0                	test   %eax,%eax
 678:	75 4e                	jne    6c8 <s_printf+0x1bb>
          s = "(null)";
 67a:	b8 0b 08 00 00       	mov    $0x80b,%eax
 67f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 682:	89 da                	mov    %ebx,%edx
 684:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 687:	89 75 e0             	mov    %esi,-0x20(%ebp)
 68a:	89 c6                	mov    %eax,%esi
 68c:	eb 1f                	jmp    6ad <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 68e:	8d 7a 01             	lea    0x1(%edx),%edi
 691:	83 ec 0c             	sub    $0xc,%esp
 694:	0f be c0             	movsbl %al,%eax
 697:	50                   	push   %eax
 698:	52                   	push   %edx
 699:	53                   	push   %ebx
 69a:	ff 75 d0             	pushl  -0x30(%ebp)
 69d:	ff 75 d4             	pushl  -0x2c(%ebp)
 6a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
 6a3:	ff d0                	call   *%eax
          s++;
 6a5:	83 c6 01             	add    $0x1,%esi
 6a8:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 6ab:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 6ad:	0f b6 06             	movzbl (%esi),%eax
 6b0:	84 c0                	test   %al,%al
 6b2:	75 da                	jne    68e <s_printf+0x181>
 6b4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b7:	89 d3                	mov    %edx,%ebx
 6b9:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 6bc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 6c3:	e9 8e fe ff ff       	jmp    556 <s_printf+0x49>
 6c8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6cb:	89 da                	mov    %ebx,%edx
 6cd:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 6d0:	89 75 e0             	mov    %esi,-0x20(%ebp)
 6d3:	89 c6                	mov    %eax,%esi
 6d5:	eb d6                	jmp    6ad <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 6d7:	8d 43 01             	lea    0x1(%ebx),%eax
 6da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6dd:	83 ec 0c             	sub    $0xc,%esp
 6e0:	8b 55 10             	mov    0x10(%ebp),%edx
 6e3:	0f be 02             	movsbl (%edx),%eax
 6e6:	50                   	push   %eax
 6e7:	53                   	push   %ebx
 6e8:	56                   	push   %esi
 6e9:	ff 75 d0             	pushl  -0x30(%ebp)
 6ec:	ff 75 d4             	pushl  -0x2c(%ebp)
 6ef:	8b 55 d8             	mov    -0x28(%ebp),%edx
 6f2:	ff d2                	call   *%edx
        ap++;
 6f4:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 6f8:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 6fb:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 6fe:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 705:	e9 4c fe ff ff       	jmp    556 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 70a:	8d 43 01             	lea    0x1(%ebx),%eax
 70d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	ff 75 dc             	pushl  -0x24(%ebp)
 716:	53                   	push   %ebx
 717:	56                   	push   %esi
 718:	ff 75 d0             	pushl  -0x30(%ebp)
 71b:	ff 75 d4             	pushl  -0x2c(%ebp)
 71e:	8b 55 d8             	mov    -0x28(%ebp),%edx
 721:	ff d2                	call   *%edx
 723:	83 c4 20             	add    $0x20,%esp
 726:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 729:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 730:	e9 21 fe ff ff       	jmp    556 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 735:	89 da                	mov    %ebx,%edx
 737:	89 f0                	mov    %esi,%eax
 739:	e8 5f fd ff ff       	call   49d <s_min>
}
 73e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 741:	5b                   	pop    %ebx
 742:	5e                   	pop    %esi
 743:	5f                   	pop    %edi
 744:	5d                   	pop    %ebp
 745:	c3                   	ret    

00000746 <s_putc>:
{
 746:	f3 0f 1e fb          	endbr32 
 74a:	55                   	push   %ebp
 74b:	89 e5                	mov    %esp,%ebp
 74d:	83 ec 1c             	sub    $0x1c,%esp
 750:	8b 45 18             	mov    0x18(%ebp),%eax
 753:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 756:	6a 01                	push   $0x1
 758:	8d 45 f4             	lea    -0xc(%ebp),%eax
 75b:	50                   	push   %eax
 75c:	ff 75 08             	pushl  0x8(%ebp)
 75f:	e8 e3 fb ff ff       	call   347 <write>
}
 764:	83 c4 10             	add    $0x10,%esp
 767:	c9                   	leave  
 768:	c3                   	ret    

00000769 <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 769:	f3 0f 1e fb          	endbr32 
 76d:	55                   	push   %ebp
 76e:	89 e5                	mov    %esp,%ebp
 770:	56                   	push   %esi
 771:	53                   	push   %ebx
 772:	8b 75 08             	mov    0x8(%ebp),%esi
 775:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 778:	83 ec 04             	sub    $0x4,%esp
 77b:	8d 45 14             	lea    0x14(%ebp),%eax
 77e:	50                   	push   %eax
 77f:	ff 75 10             	pushl  0x10(%ebp)
 782:	53                   	push   %ebx
 783:	89 f1                	mov    %esi,%ecx
 785:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 78a:	b8 f7 03 00 00       	mov    $0x3f7,%eax
 78f:	e8 79 fd ff ff       	call   50d <s_printf>
  if(count < n) {
 794:	83 c4 10             	add    $0x10,%esp
 797:	39 c3                	cmp    %eax,%ebx
 799:	76 04                	jbe    79f <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 79b:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 79f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 7a2:	5b                   	pop    %ebx
 7a3:	5e                   	pop    %esi
 7a4:	5d                   	pop    %ebp
 7a5:	c3                   	ret    

000007a6 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7a6:	f3 0f 1e fb          	endbr32 
 7aa:	55                   	push   %ebp
 7ab:	89 e5                	mov    %esp,%ebp
 7ad:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 7b0:	8d 45 10             	lea    0x10(%ebp),%eax
 7b3:	50                   	push   %eax
 7b4:	ff 75 0c             	pushl  0xc(%ebp)
 7b7:	68 00 00 00 40       	push   $0x40000000
 7bc:	b9 00 00 00 00       	mov    $0x0,%ecx
 7c1:	8b 55 08             	mov    0x8(%ebp),%edx
 7c4:	b8 46 07 00 00       	mov    $0x746,%eax
 7c9:	e8 3f fd ff ff       	call   50d <s_printf>
}
 7ce:	83 c4 10             	add    $0x10,%esp
 7d1:	c9                   	leave  
 7d2:	c3                   	ret    
