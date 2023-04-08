
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
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
  14:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  1a:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  21:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  28:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2e:	68 8c 07 00 00       	push   $0x78c
  33:	6a 01                	push   $0x1
  35:	e8 22 07 00 00       	call   75c <printf>
  memset(data, 'a', sizeof(data));
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 00 02 00 00       	push   $0x200
  42:	6a 61                	push   $0x61
  44:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  4a:	50                   	push   %eax
  4b:	e8 40 01 00 00       	call   190 <memset>

  for(i = 0; i < 4; i++)
  50:	83 c4 10             	add    $0x10,%esp
  53:	bb 00 00 00 00       	mov    $0x0,%ebx
  58:	83 fb 03             	cmp    $0x3,%ebx
  5b:	7f 0e                	jg     6b <main+0x6b>
    if(fork() > 0)
  5d:	e8 73 02 00 00       	call   2d5 <fork>
  62:	85 c0                	test   %eax,%eax
  64:	7f 05                	jg     6b <main+0x6b>
  for(i = 0; i < 4; i++)
  66:	83 c3 01             	add    $0x1,%ebx
  69:	eb ed                	jmp    58 <main+0x58>
      break;

  printf(1, "write %d\n", i);
  6b:	83 ec 04             	sub    $0x4,%esp
  6e:	53                   	push   %ebx
  6f:	68 9f 07 00 00       	push   $0x79f
  74:	6a 01                	push   $0x1
  76:	e8 e1 06 00 00       	call   75c <printf>

  path[8] += i;
  7b:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7e:	83 c4 08             	add    $0x8,%esp
  81:	68 02 02 00 00       	push   $0x202
  86:	8d 45 de             	lea    -0x22(%ebp),%eax
  89:	50                   	push   %eax
  8a:	e8 8e 02 00 00       	call   31d <open>
  8f:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  91:	83 c4 10             	add    $0x10,%esp
  94:	bb 00 00 00 00       	mov    $0x0,%ebx
  99:	eb 1b                	jmp    b6 <main+0xb6>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  9b:	83 ec 04             	sub    $0x4,%esp
  9e:	68 00 02 00 00       	push   $0x200
  a3:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a9:	50                   	push   %eax
  aa:	56                   	push   %esi
  ab:	e8 4d 02 00 00       	call   2fd <write>
  for(i = 0; i < 20; i++)
  b0:	83 c3 01             	add    $0x1,%ebx
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	83 fb 13             	cmp    $0x13,%ebx
  b9:	7e e0                	jle    9b <main+0x9b>
  close(fd);
  bb:	83 ec 0c             	sub    $0xc,%esp
  be:	56                   	push   %esi
  bf:	e8 41 02 00 00       	call   305 <close>

  printf(1, "read\n");
  c4:	83 c4 08             	add    $0x8,%esp
  c7:	68 a9 07 00 00       	push   $0x7a9
  cc:	6a 01                	push   $0x1
  ce:	e8 89 06 00 00       	call   75c <printf>

  fd = open(path, O_RDONLY);
  d3:	83 c4 08             	add    $0x8,%esp
  d6:	6a 00                	push   $0x0
  d8:	8d 45 de             	lea    -0x22(%ebp),%eax
  db:	50                   	push   %eax
  dc:	e8 3c 02 00 00       	call   31d <open>
  e1:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  e3:	83 c4 10             	add    $0x10,%esp
  e6:	bb 00 00 00 00       	mov    $0x0,%ebx
  eb:	eb 1b                	jmp    108 <main+0x108>
    read(fd, data, sizeof(data));
  ed:	83 ec 04             	sub    $0x4,%esp
  f0:	68 00 02 00 00       	push   $0x200
  f5:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  fb:	50                   	push   %eax
  fc:	56                   	push   %esi
  fd:	e8 f3 01 00 00       	call   2f5 <read>
  for (i = 0; i < 20; i++)
 102:	83 c3 01             	add    $0x1,%ebx
 105:	83 c4 10             	add    $0x10,%esp
 108:	83 fb 13             	cmp    $0x13,%ebx
 10b:	7e e0                	jle    ed <main+0xed>
  close(fd);
 10d:	83 ec 0c             	sub    $0xc,%esp
 110:	56                   	push   %esi
 111:	e8 ef 01 00 00       	call   305 <close>

  wait();
 116:	e8 ca 01 00 00       	call   2e5 <wait>

  exit();
 11b:	e8 bd 01 00 00       	call   2dd <exit>

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	56                   	push   %esi
 128:	53                   	push   %ebx
 129:	8b 75 08             	mov    0x8(%ebp),%esi
 12c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 12f:	89 f0                	mov    %esi,%eax
 131:	89 d1                	mov    %edx,%ecx
 133:	83 c2 01             	add    $0x1,%edx
 136:	89 c3                	mov    %eax,%ebx
 138:	83 c0 01             	add    $0x1,%eax
 13b:	0f b6 09             	movzbl (%ecx),%ecx
 13e:	88 0b                	mov    %cl,(%ebx)
 140:	84 c9                	test   %cl,%cl
 142:	75 ed                	jne    131 <strcpy+0x11>
    ;
  return os;
}
 144:	89 f0                	mov    %esi,%eax
 146:	5b                   	pop    %ebx
 147:	5e                   	pop    %esi
 148:	5d                   	pop    %ebp
 149:	c3                   	ret    

0000014a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 14a:	f3 0f 1e fb          	endbr32 
 14e:	55                   	push   %ebp
 14f:	89 e5                	mov    %esp,%ebp
 151:	8b 4d 08             	mov    0x8(%ebp),%ecx
 154:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 157:	0f b6 01             	movzbl (%ecx),%eax
 15a:	84 c0                	test   %al,%al
 15c:	74 0c                	je     16a <strcmp+0x20>
 15e:	3a 02                	cmp    (%edx),%al
 160:	75 08                	jne    16a <strcmp+0x20>
    p++, q++;
 162:	83 c1 01             	add    $0x1,%ecx
 165:	83 c2 01             	add    $0x1,%edx
 168:	eb ed                	jmp    157 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 16a:	0f b6 c0             	movzbl %al,%eax
 16d:	0f b6 12             	movzbl (%edx),%edx
 170:	29 d0                	sub    %edx,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    

00000174 <strlen>:

uint
strlen(const char *s)
{
 174:	f3 0f 1e fb          	endbr32 
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 17e:	b8 00 00 00 00       	mov    $0x0,%eax
 183:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 187:	74 05                	je     18e <strlen+0x1a>
 189:	83 c0 01             	add    $0x1,%eax
 18c:	eb f5                	jmp    183 <strlen+0xf>
    ;
  return n;
}
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    

00000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 19b:	89 d7                	mov    %edx,%edi
 19d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a3:	fc                   	cld    
 1a4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1a6:	89 d0                	mov    %edx,%eax
 1a8:	5f                   	pop    %edi
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    

000001ab <strchr>:

char*
strchr(const char *s, char c)
{
 1ab:	f3 0f 1e fb          	endbr32 
 1af:	55                   	push   %ebp
 1b0:	89 e5                	mov    %esp,%ebp
 1b2:	8b 45 08             	mov    0x8(%ebp),%eax
 1b5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1b9:	0f b6 10             	movzbl (%eax),%edx
 1bc:	84 d2                	test   %dl,%dl
 1be:	74 09                	je     1c9 <strchr+0x1e>
    if(*s == c)
 1c0:	38 ca                	cmp    %cl,%dl
 1c2:	74 0a                	je     1ce <strchr+0x23>
  for(; *s; s++)
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	eb f0                	jmp    1b9 <strchr+0xe>
      return (char*)s;
  return 0;
 1c9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	56                   	push   %esi
 1d9:	53                   	push   %ebx
 1da:	83 ec 1c             	sub    $0x1c,%esp
 1dd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e0:	bb 00 00 00 00       	mov    $0x0,%ebx
 1e5:	89 de                	mov    %ebx,%esi
 1e7:	83 c3 01             	add    $0x1,%ebx
 1ea:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ed:	7d 2e                	jge    21d <gets+0x4d>
    cc = read(0, &c, 1);
 1ef:	83 ec 04             	sub    $0x4,%esp
 1f2:	6a 01                	push   $0x1
 1f4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1f7:	50                   	push   %eax
 1f8:	6a 00                	push   $0x0
 1fa:	e8 f6 00 00 00       	call   2f5 <read>
    if(cc < 1)
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	85 c0                	test   %eax,%eax
 204:	7e 17                	jle    21d <gets+0x4d>
      break;
    buf[i++] = c;
 206:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 20a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 20d:	3c 0a                	cmp    $0xa,%al
 20f:	0f 94 c2             	sete   %dl
 212:	3c 0d                	cmp    $0xd,%al
 214:	0f 94 c0             	sete   %al
 217:	08 c2                	or     %al,%dl
 219:	74 ca                	je     1e5 <gets+0x15>
    buf[i++] = c;
 21b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 21d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 221:	89 f8                	mov    %edi,%eax
 223:	8d 65 f4             	lea    -0xc(%ebp),%esp
 226:	5b                   	pop    %ebx
 227:	5e                   	pop    %esi
 228:	5f                   	pop    %edi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    

0000022b <stat>:

int
stat(const char *n, struct stat *st)
{
 22b:	f3 0f 1e fb          	endbr32 
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	56                   	push   %esi
 233:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 234:	83 ec 08             	sub    $0x8,%esp
 237:	6a 00                	push   $0x0
 239:	ff 75 08             	pushl  0x8(%ebp)
 23c:	e8 dc 00 00 00       	call   31d <open>
  if(fd < 0)
 241:	83 c4 10             	add    $0x10,%esp
 244:	85 c0                	test   %eax,%eax
 246:	78 24                	js     26c <stat+0x41>
 248:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 24a:	83 ec 08             	sub    $0x8,%esp
 24d:	ff 75 0c             	pushl  0xc(%ebp)
 250:	50                   	push   %eax
 251:	e8 df 00 00 00       	call   335 <fstat>
 256:	89 c6                	mov    %eax,%esi
  close(fd);
 258:	89 1c 24             	mov    %ebx,(%esp)
 25b:	e8 a5 00 00 00       	call   305 <close>
  return r;
 260:	83 c4 10             	add    $0x10,%esp
}
 263:	89 f0                	mov    %esi,%eax
 265:	8d 65 f8             	lea    -0x8(%ebp),%esp
 268:	5b                   	pop    %ebx
 269:	5e                   	pop    %esi
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret    
    return -1;
 26c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 271:	eb f0                	jmp    263 <stat+0x38>

00000273 <atoi>:

int
atoi(const char *s)
{
 273:	f3 0f 1e fb          	endbr32 
 277:	55                   	push   %ebp
 278:	89 e5                	mov    %esp,%ebp
 27a:	53                   	push   %ebx
 27b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 27e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 283:	0f b6 01             	movzbl (%ecx),%eax
 286:	8d 58 d0             	lea    -0x30(%eax),%ebx
 289:	80 fb 09             	cmp    $0x9,%bl
 28c:	77 12                	ja     2a0 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 28e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 291:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 294:	83 c1 01             	add    $0x1,%ecx
 297:	0f be c0             	movsbl %al,%eax
 29a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 29e:	eb e3                	jmp    283 <atoi+0x10>
  return n;
}
 2a0:	89 d0                	mov    %edx,%eax
 2a2:	5b                   	pop    %ebx
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    

000002a5 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a5:	f3 0f 1e fb          	endbr32 
 2a9:	55                   	push   %ebp
 2aa:	89 e5                	mov    %esp,%ebp
 2ac:	56                   	push   %esi
 2ad:	53                   	push   %ebx
 2ae:	8b 75 08             	mov    0x8(%ebp),%esi
 2b1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2b4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2b7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2b9:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2bc:	85 c0                	test   %eax,%eax
 2be:	7e 0f                	jle    2cf <memmove+0x2a>
    *dst++ = *src++;
 2c0:	0f b6 01             	movzbl (%ecx),%eax
 2c3:	88 02                	mov    %al,(%edx)
 2c5:	8d 49 01             	lea    0x1(%ecx),%ecx
 2c8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2cb:	89 d8                	mov    %ebx,%eax
 2cd:	eb ea                	jmp    2b9 <memmove+0x14>
  return vdst;
}
 2cf:	89 f0                	mov    %esi,%eax
 2d1:	5b                   	pop    %ebx
 2d2:	5e                   	pop    %esi
 2d3:	5d                   	pop    %ebp
 2d4:	c3                   	ret    

000002d5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2d5:	b8 01 00 00 00       	mov    $0x1,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <exit>:
SYSCALL(exit)
 2dd:	b8 02 00 00 00       	mov    $0x2,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <wait>:
SYSCALL(wait)
 2e5:	b8 03 00 00 00       	mov    $0x3,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <pipe>:
SYSCALL(pipe)
 2ed:	b8 04 00 00 00       	mov    $0x4,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <read>:
SYSCALL(read)
 2f5:	b8 05 00 00 00       	mov    $0x5,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <write>:
SYSCALL(write)
 2fd:	b8 10 00 00 00       	mov    $0x10,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <close>:
SYSCALL(close)
 305:	b8 15 00 00 00       	mov    $0x15,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <kill>:
SYSCALL(kill)
 30d:	b8 06 00 00 00       	mov    $0x6,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <exec>:
SYSCALL(exec)
 315:	b8 07 00 00 00       	mov    $0x7,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <open>:
SYSCALL(open)
 31d:	b8 0f 00 00 00       	mov    $0xf,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <mknod>:
SYSCALL(mknod)
 325:	b8 11 00 00 00       	mov    $0x11,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <unlink>:
SYSCALL(unlink)
 32d:	b8 12 00 00 00       	mov    $0x12,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <fstat>:
SYSCALL(fstat)
 335:	b8 08 00 00 00       	mov    $0x8,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <link>:
SYSCALL(link)
 33d:	b8 13 00 00 00       	mov    $0x13,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <mkdir>:
SYSCALL(mkdir)
 345:	b8 14 00 00 00       	mov    $0x14,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <chdir>:
SYSCALL(chdir)
 34d:	b8 09 00 00 00       	mov    $0x9,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <dup>:
SYSCALL(dup)
 355:	b8 0a 00 00 00       	mov    $0xa,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <getpid>:
SYSCALL(getpid)
 35d:	b8 0b 00 00 00       	mov    $0xb,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <sbrk>:
SYSCALL(sbrk)
 365:	b8 0c 00 00 00       	mov    $0xc,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <sleep>:
SYSCALL(sleep)
 36d:	b8 0d 00 00 00       	mov    $0xd,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <uptime>:
SYSCALL(uptime)
 375:	b8 0e 00 00 00       	mov    $0xe,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <yield>:
SYSCALL(yield)
 37d:	b8 16 00 00 00       	mov    $0x16,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <shutdown>:
SYSCALL(shutdown)
 385:	b8 17 00 00 00       	mov    $0x17,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <ps>:
SYSCALL(ps)
 38d:	b8 18 00 00 00       	mov    $0x18,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <nice>:
SYSCALL(nice)
 395:	b8 1b 00 00 00       	mov    $0x1b,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <flock>:
SYSCALL(flock)
 39d:	b8 19 00 00 00       	mov    $0x19,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <funlock>:
 3a5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 3ad:	f3 0f 1e fb          	endbr32 
 3b1:	55                   	push   %ebp
 3b2:	89 e5                	mov    %esp,%ebp
 3b4:	8b 45 14             	mov    0x14(%ebp),%eax
 3b7:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 3ba:	3b 45 10             	cmp    0x10(%ebp),%eax
 3bd:	73 06                	jae    3c5 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 3bf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3c2:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    

000003c7 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	57                   	push   %edi
 3cb:	56                   	push   %esi
 3cc:	53                   	push   %ebx
 3cd:	83 ec 08             	sub    $0x8,%esp
 3d0:	89 c6                	mov    %eax,%esi
 3d2:	89 d3                	mov    %edx,%ebx
 3d4:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3d7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3db:	0f 95 c2             	setne  %dl
 3de:	89 c8                	mov    %ecx,%eax
 3e0:	c1 e8 1f             	shr    $0x1f,%eax
 3e3:	84 c2                	test   %al,%dl
 3e5:	74 33                	je     41a <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 3e7:	89 c8                	mov    %ecx,%eax
 3e9:	f7 d8                	neg    %eax
    neg = 1;
 3eb:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3f2:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 3f7:	8d 4f 01             	lea    0x1(%edi),%ecx
 3fa:	89 ca                	mov    %ecx,%edx
 3fc:	39 d9                	cmp    %ebx,%ecx
 3fe:	73 26                	jae    426 <s_getReverseDigits+0x5f>
 400:	85 c0                	test   %eax,%eax
 402:	74 22                	je     426 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 404:	ba 00 00 00 00       	mov    $0x0,%edx
 409:	f7 75 08             	divl   0x8(%ebp)
 40c:	0f b6 92 b8 07 00 00 	movzbl 0x7b8(%edx),%edx
 413:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 416:	89 cf                	mov    %ecx,%edi
 418:	eb dd                	jmp    3f7 <s_getReverseDigits+0x30>
    x = xx;
 41a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 41d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 424:	eb cc                	jmp    3f2 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 426:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 42a:	75 0a                	jne    436 <s_getReverseDigits+0x6f>
 42c:	39 da                	cmp    %ebx,%edx
 42e:	73 06                	jae    436 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 430:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 434:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 436:	89 fa                	mov    %edi,%edx
 438:	39 df                	cmp    %ebx,%edi
 43a:	0f 92 c0             	setb   %al
 43d:	84 45 ec             	test   %al,-0x14(%ebp)
 440:	74 07                	je     449 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 442:	83 c7 01             	add    $0x1,%edi
 445:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 449:	89 f8                	mov    %edi,%eax
 44b:	83 c4 08             	add    $0x8,%esp
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5f                   	pop    %edi
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    

00000453 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 453:	39 c2                	cmp    %eax,%edx
 455:	0f 46 c2             	cmovbe %edx,%eax
}
 458:	c3                   	ret    

00000459 <s_printint>:
{
 459:	55                   	push   %ebp
 45a:	89 e5                	mov    %esp,%ebp
 45c:	57                   	push   %edi
 45d:	56                   	push   %esi
 45e:	53                   	push   %ebx
 45f:	83 ec 2c             	sub    $0x2c,%esp
 462:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 465:	89 55 d0             	mov    %edx,-0x30(%ebp)
 468:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 46b:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 46e:	ff 75 14             	pushl  0x14(%ebp)
 471:	ff 75 10             	pushl  0x10(%ebp)
 474:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 477:	ba 10 00 00 00       	mov    $0x10,%edx
 47c:	8d 45 d8             	lea    -0x28(%ebp),%eax
 47f:	e8 43 ff ff ff       	call   3c7 <s_getReverseDigits>
 484:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 487:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 489:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 48c:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 491:	83 eb 01             	sub    $0x1,%ebx
 494:	78 22                	js     4b8 <s_printint+0x5f>
 496:	39 fe                	cmp    %edi,%esi
 498:	73 1e                	jae    4b8 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 49a:	83 ec 0c             	sub    $0xc,%esp
 49d:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 4a2:	50                   	push   %eax
 4a3:	56                   	push   %esi
 4a4:	57                   	push   %edi
 4a5:	ff 75 cc             	pushl  -0x34(%ebp)
 4a8:	ff 75 d0             	pushl  -0x30(%ebp)
 4ab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4ae:	ff d0                	call   *%eax
    j++;
 4b0:	83 c6 01             	add    $0x1,%esi
 4b3:	83 c4 20             	add    $0x20,%esp
 4b6:	eb d9                	jmp    491 <s_printint+0x38>
}
 4b8:	8b 45 c8             	mov    -0x38(%ebp),%eax
 4bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4be:	5b                   	pop    %ebx
 4bf:	5e                   	pop    %esi
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    

000004c3 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 4c3:	55                   	push   %ebp
 4c4:	89 e5                	mov    %esp,%ebp
 4c6:	57                   	push   %edi
 4c7:	56                   	push   %esi
 4c8:	53                   	push   %ebx
 4c9:	83 ec 2c             	sub    $0x2c,%esp
 4cc:	89 45 d8             	mov    %eax,-0x28(%ebp)
 4cf:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4d2:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 4d5:	8b 45 08             	mov    0x8(%ebp),%eax
 4d8:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 4db:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 4e2:	bb 00 00 00 00       	mov    $0x0,%ebx
 4e7:	89 f8                	mov    %edi,%eax
 4e9:	89 df                	mov    %ebx,%edi
 4eb:	89 c6                	mov    %eax,%esi
 4ed:	eb 20                	jmp    50f <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 4ef:	8d 43 01             	lea    0x1(%ebx),%eax
 4f2:	89 45 e0             	mov    %eax,-0x20(%ebp)
 4f5:	83 ec 0c             	sub    $0xc,%esp
 4f8:	51                   	push   %ecx
 4f9:	53                   	push   %ebx
 4fa:	56                   	push   %esi
 4fb:	ff 75 d0             	pushl  -0x30(%ebp)
 4fe:	ff 75 d4             	pushl  -0x2c(%ebp)
 501:	8b 55 d8             	mov    -0x28(%ebp),%edx
 504:	ff d2                	call   *%edx
 506:	83 c4 20             	add    $0x20,%esp
 509:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 50c:	83 c7 01             	add    $0x1,%edi
 50f:	8b 45 0c             	mov    0xc(%ebp),%eax
 512:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 516:	84 c0                	test   %al,%al
 518:	0f 84 cd 01 00 00    	je     6eb <s_printf+0x228>
 51e:	89 75 e0             	mov    %esi,-0x20(%ebp)
 521:	39 de                	cmp    %ebx,%esi
 523:	0f 86 c2 01 00 00    	jbe    6eb <s_printf+0x228>
    c = fmt[i] & 0xff;
 529:	0f be c8             	movsbl %al,%ecx
 52c:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 52f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 532:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 536:	75 0a                	jne    542 <s_printf+0x7f>
      if(c == '%') {
 538:	83 f8 25             	cmp    $0x25,%eax
 53b:	75 b2                	jne    4ef <s_printf+0x2c>
        state = '%';
 53d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 540:	eb ca                	jmp    50c <s_printf+0x49>
      }
    } else if(state == '%'){
 542:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 546:	75 c4                	jne    50c <s_printf+0x49>
      if(c == 'd'){
 548:	83 f8 64             	cmp    $0x64,%eax
 54b:	74 6e                	je     5bb <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 54d:	83 f8 78             	cmp    $0x78,%eax
 550:	0f 94 c1             	sete   %cl
 553:	83 f8 70             	cmp    $0x70,%eax
 556:	0f 94 c2             	sete   %dl
 559:	08 d1                	or     %dl,%cl
 55b:	0f 85 8e 00 00 00    	jne    5ef <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 561:	83 f8 73             	cmp    $0x73,%eax
 564:	0f 84 b9 00 00 00    	je     623 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 56a:	83 f8 63             	cmp    $0x63,%eax
 56d:	0f 84 1a 01 00 00    	je     68d <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 573:	83 f8 25             	cmp    $0x25,%eax
 576:	0f 84 44 01 00 00    	je     6c0 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 57c:	8d 43 01             	lea    0x1(%ebx),%eax
 57f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 582:	83 ec 0c             	sub    $0xc,%esp
 585:	6a 25                	push   $0x25
 587:	53                   	push   %ebx
 588:	56                   	push   %esi
 589:	ff 75 d0             	pushl  -0x30(%ebp)
 58c:	ff 75 d4             	pushl  -0x2c(%ebp)
 58f:	8b 45 d8             	mov    -0x28(%ebp),%eax
 592:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 594:	83 c3 02             	add    $0x2,%ebx
 597:	83 c4 14             	add    $0x14,%esp
 59a:	ff 75 dc             	pushl  -0x24(%ebp)
 59d:	ff 75 e4             	pushl  -0x1c(%ebp)
 5a0:	56                   	push   %esi
 5a1:	ff 75 d0             	pushl  -0x30(%ebp)
 5a4:	ff 75 d4             	pushl  -0x2c(%ebp)
 5a7:	8b 45 d8             	mov    -0x28(%ebp),%eax
 5aa:	ff d0                	call   *%eax
 5ac:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 5af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5b6:	e9 51 ff ff ff       	jmp    50c <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 5bb:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5be:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 5c1:	6a 01                	push   $0x1
 5c3:	6a 0a                	push   $0xa
 5c5:	8b 45 10             	mov    0x10(%ebp),%eax
 5c8:	ff 30                	pushl  (%eax)
 5ca:	89 f0                	mov    %esi,%eax
 5cc:	29 d8                	sub    %ebx,%eax
 5ce:	50                   	push   %eax
 5cf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
 5d5:	e8 7f fe ff ff       	call   459 <s_printint>
 5da:	01 c3                	add    %eax,%ebx
        ap++;
 5dc:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 5e0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5e3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5ea:	e9 1d ff ff ff       	jmp    50c <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 5ef:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5f2:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 5f5:	6a 00                	push   $0x0
 5f7:	6a 10                	push   $0x10
 5f9:	8b 45 10             	mov    0x10(%ebp),%eax
 5fc:	ff 30                	pushl  (%eax)
 5fe:	89 f0                	mov    %esi,%eax
 600:	29 d8                	sub    %ebx,%eax
 602:	50                   	push   %eax
 603:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 606:	8b 45 d8             	mov    -0x28(%ebp),%eax
 609:	e8 4b fe ff ff       	call   459 <s_printint>
 60e:	01 c3                	add    %eax,%ebx
        ap++;
 610:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 614:	83 c4 10             	add    $0x10,%esp
      state = 0;
 617:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 61e:	e9 e9 fe ff ff       	jmp    50c <s_printf+0x49>
        s = (char*)*ap;
 623:	8b 45 10             	mov    0x10(%ebp),%eax
 626:	8b 00                	mov    (%eax),%eax
        ap++;
 628:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 62c:	85 c0                	test   %eax,%eax
 62e:	75 4e                	jne    67e <s_printf+0x1bb>
          s = "(null)";
 630:	b8 af 07 00 00       	mov    $0x7af,%eax
 635:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 638:	89 da                	mov    %ebx,%edx
 63a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 63d:	89 75 e0             	mov    %esi,-0x20(%ebp)
 640:	89 c6                	mov    %eax,%esi
 642:	eb 1f                	jmp    663 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 644:	8d 7a 01             	lea    0x1(%edx),%edi
 647:	83 ec 0c             	sub    $0xc,%esp
 64a:	0f be c0             	movsbl %al,%eax
 64d:	50                   	push   %eax
 64e:	52                   	push   %edx
 64f:	53                   	push   %ebx
 650:	ff 75 d0             	pushl  -0x30(%ebp)
 653:	ff 75 d4             	pushl  -0x2c(%ebp)
 656:	8b 45 d8             	mov    -0x28(%ebp),%eax
 659:	ff d0                	call   *%eax
          s++;
 65b:	83 c6 01             	add    $0x1,%esi
 65e:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 661:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 663:	0f b6 06             	movzbl (%esi),%eax
 666:	84 c0                	test   %al,%al
 668:	75 da                	jne    644 <s_printf+0x181>
 66a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 66d:	89 d3                	mov    %edx,%ebx
 66f:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 672:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 679:	e9 8e fe ff ff       	jmp    50c <s_printf+0x49>
 67e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 681:	89 da                	mov    %ebx,%edx
 683:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 686:	89 75 e0             	mov    %esi,-0x20(%ebp)
 689:	89 c6                	mov    %eax,%esi
 68b:	eb d6                	jmp    663 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 68d:	8d 43 01             	lea    0x1(%ebx),%eax
 690:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 693:	83 ec 0c             	sub    $0xc,%esp
 696:	8b 55 10             	mov    0x10(%ebp),%edx
 699:	0f be 02             	movsbl (%edx),%eax
 69c:	50                   	push   %eax
 69d:	53                   	push   %ebx
 69e:	56                   	push   %esi
 69f:	ff 75 d0             	pushl  -0x30(%ebp)
 6a2:	ff 75 d4             	pushl  -0x2c(%ebp)
 6a5:	8b 55 d8             	mov    -0x28(%ebp),%edx
 6a8:	ff d2                	call   *%edx
        ap++;
 6aa:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 6ae:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 6b1:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 6b4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 6bb:	e9 4c fe ff ff       	jmp    50c <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 6c0:	8d 43 01             	lea    0x1(%ebx),%eax
 6c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6c6:	83 ec 0c             	sub    $0xc,%esp
 6c9:	ff 75 dc             	pushl  -0x24(%ebp)
 6cc:	53                   	push   %ebx
 6cd:	56                   	push   %esi
 6ce:	ff 75 d0             	pushl  -0x30(%ebp)
 6d1:	ff 75 d4             	pushl  -0x2c(%ebp)
 6d4:	8b 55 d8             	mov    -0x28(%ebp),%edx
 6d7:	ff d2                	call   *%edx
 6d9:	83 c4 20             	add    $0x20,%esp
 6dc:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 6df:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 6e6:	e9 21 fe ff ff       	jmp    50c <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 6eb:	89 da                	mov    %ebx,%edx
 6ed:	89 f0                	mov    %esi,%eax
 6ef:	e8 5f fd ff ff       	call   453 <s_min>
}
 6f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6f7:	5b                   	pop    %ebx
 6f8:	5e                   	pop    %esi
 6f9:	5f                   	pop    %edi
 6fa:	5d                   	pop    %ebp
 6fb:	c3                   	ret    

000006fc <s_putc>:
{
 6fc:	f3 0f 1e fb          	endbr32 
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	83 ec 1c             	sub    $0x1c,%esp
 706:	8b 45 18             	mov    0x18(%ebp),%eax
 709:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 70c:	6a 01                	push   $0x1
 70e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 711:	50                   	push   %eax
 712:	ff 75 08             	pushl  0x8(%ebp)
 715:	e8 e3 fb ff ff       	call   2fd <write>
}
 71a:	83 c4 10             	add    $0x10,%esp
 71d:	c9                   	leave  
 71e:	c3                   	ret    

0000071f <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 71f:	f3 0f 1e fb          	endbr32 
 723:	55                   	push   %ebp
 724:	89 e5                	mov    %esp,%ebp
 726:	56                   	push   %esi
 727:	53                   	push   %ebx
 728:	8b 75 08             	mov    0x8(%ebp),%esi
 72b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 72e:	83 ec 04             	sub    $0x4,%esp
 731:	8d 45 14             	lea    0x14(%ebp),%eax
 734:	50                   	push   %eax
 735:	ff 75 10             	pushl  0x10(%ebp)
 738:	53                   	push   %ebx
 739:	89 f1                	mov    %esi,%ecx
 73b:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 740:	b8 ad 03 00 00       	mov    $0x3ad,%eax
 745:	e8 79 fd ff ff       	call   4c3 <s_printf>
  if(count < n) {
 74a:	83 c4 10             	add    $0x10,%esp
 74d:	39 c3                	cmp    %eax,%ebx
 74f:	76 04                	jbe    755 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 751:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 755:	8d 65 f8             	lea    -0x8(%ebp),%esp
 758:	5b                   	pop    %ebx
 759:	5e                   	pop    %esi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    

0000075c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 75c:	f3 0f 1e fb          	endbr32 
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 766:	8d 45 10             	lea    0x10(%ebp),%eax
 769:	50                   	push   %eax
 76a:	ff 75 0c             	pushl  0xc(%ebp)
 76d:	68 00 00 00 40       	push   $0x40000000
 772:	b9 00 00 00 00       	mov    $0x0,%ecx
 777:	8b 55 08             	mov    0x8(%ebp),%edx
 77a:	b8 fc 06 00 00       	mov    $0x6fc,%eax
 77f:	e8 3f fd ff ff       	call   4c3 <s_printf>
}
 784:	83 c4 10             	add    $0x10,%esp
 787:	c9                   	leave  
 788:	c3                   	ret    
