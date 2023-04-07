
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
  2e:	68 7c 07 00 00       	push   $0x77c
  33:	6a 01                	push   $0x1
  35:	e8 12 07 00 00       	call   74c <printf>
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
  6f:	68 8f 07 00 00       	push   $0x78f
  74:	6a 01                	push   $0x1
  76:	e8 d1 06 00 00       	call   74c <printf>

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
  c7:	68 99 07 00 00       	push   $0x799
  cc:	6a 01                	push   $0x1
  ce:	e8 79 06 00 00       	call   74c <printf>

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
 395:	b8 1b 00 00 00       	mov    $0x1b,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 39d:	f3 0f 1e fb          	endbr32 
 3a1:	55                   	push   %ebp
 3a2:	89 e5                	mov    %esp,%ebp
 3a4:	8b 45 14             	mov    0x14(%ebp),%eax
 3a7:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 3aa:	3b 45 10             	cmp    0x10(%ebp),%eax
 3ad:	73 06                	jae    3b5 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 3af:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3b2:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    

000003b7 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 3b7:	55                   	push   %ebp
 3b8:	89 e5                	mov    %esp,%ebp
 3ba:	57                   	push   %edi
 3bb:	56                   	push   %esi
 3bc:	53                   	push   %ebx
 3bd:	83 ec 08             	sub    $0x8,%esp
 3c0:	89 c6                	mov    %eax,%esi
 3c2:	89 d3                	mov    %edx,%ebx
 3c4:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3c7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3cb:	0f 95 c2             	setne  %dl
 3ce:	89 c8                	mov    %ecx,%eax
 3d0:	c1 e8 1f             	shr    $0x1f,%eax
 3d3:	84 c2                	test   %al,%dl
 3d5:	74 33                	je     40a <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 3d7:	89 c8                	mov    %ecx,%eax
 3d9:	f7 d8                	neg    %eax
    neg = 1;
 3db:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3e2:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 3e7:	8d 4f 01             	lea    0x1(%edi),%ecx
 3ea:	89 ca                	mov    %ecx,%edx
 3ec:	39 d9                	cmp    %ebx,%ecx
 3ee:	73 26                	jae    416 <s_getReverseDigits+0x5f>
 3f0:	85 c0                	test   %eax,%eax
 3f2:	74 22                	je     416 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 3f4:	ba 00 00 00 00       	mov    $0x0,%edx
 3f9:	f7 75 08             	divl   0x8(%ebp)
 3fc:	0f b6 92 a8 07 00 00 	movzbl 0x7a8(%edx),%edx
 403:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 406:	89 cf                	mov    %ecx,%edi
 408:	eb dd                	jmp    3e7 <s_getReverseDigits+0x30>
    x = xx;
 40a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 40d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 414:	eb cc                	jmp    3e2 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 416:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 41a:	75 0a                	jne    426 <s_getReverseDigits+0x6f>
 41c:	39 da                	cmp    %ebx,%edx
 41e:	73 06                	jae    426 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 420:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 424:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 426:	89 fa                	mov    %edi,%edx
 428:	39 df                	cmp    %ebx,%edi
 42a:	0f 92 c0             	setb   %al
 42d:	84 45 ec             	test   %al,-0x14(%ebp)
 430:	74 07                	je     439 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 432:	83 c7 01             	add    $0x1,%edi
 435:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 439:	89 f8                	mov    %edi,%eax
 43b:	83 c4 08             	add    $0x8,%esp
 43e:	5b                   	pop    %ebx
 43f:	5e                   	pop    %esi
 440:	5f                   	pop    %edi
 441:	5d                   	pop    %ebp
 442:	c3                   	ret    

00000443 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 443:	39 c2                	cmp    %eax,%edx
 445:	0f 46 c2             	cmovbe %edx,%eax
}
 448:	c3                   	ret    

00000449 <s_printint>:
{
 449:	55                   	push   %ebp
 44a:	89 e5                	mov    %esp,%ebp
 44c:	57                   	push   %edi
 44d:	56                   	push   %esi
 44e:	53                   	push   %ebx
 44f:	83 ec 2c             	sub    $0x2c,%esp
 452:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 455:	89 55 d0             	mov    %edx,-0x30(%ebp)
 458:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 45b:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 45e:	ff 75 14             	pushl  0x14(%ebp)
 461:	ff 75 10             	pushl  0x10(%ebp)
 464:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 467:	ba 10 00 00 00       	mov    $0x10,%edx
 46c:	8d 45 d8             	lea    -0x28(%ebp),%eax
 46f:	e8 43 ff ff ff       	call   3b7 <s_getReverseDigits>
 474:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 477:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 479:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 47c:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 481:	83 eb 01             	sub    $0x1,%ebx
 484:	78 22                	js     4a8 <s_printint+0x5f>
 486:	39 fe                	cmp    %edi,%esi
 488:	73 1e                	jae    4a8 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 48a:	83 ec 0c             	sub    $0xc,%esp
 48d:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 492:	50                   	push   %eax
 493:	56                   	push   %esi
 494:	57                   	push   %edi
 495:	ff 75 cc             	pushl  -0x34(%ebp)
 498:	ff 75 d0             	pushl  -0x30(%ebp)
 49b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 49e:	ff d0                	call   *%eax
    j++;
 4a0:	83 c6 01             	add    $0x1,%esi
 4a3:	83 c4 20             	add    $0x20,%esp
 4a6:	eb d9                	jmp    481 <s_printint+0x38>
}
 4a8:	8b 45 c8             	mov    -0x38(%ebp),%eax
 4ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ae:	5b                   	pop    %ebx
 4af:	5e                   	pop    %esi
 4b0:	5f                   	pop    %edi
 4b1:	5d                   	pop    %ebp
 4b2:	c3                   	ret    

000004b3 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 4b3:	55                   	push   %ebp
 4b4:	89 e5                	mov    %esp,%ebp
 4b6:	57                   	push   %edi
 4b7:	56                   	push   %esi
 4b8:	53                   	push   %ebx
 4b9:	83 ec 2c             	sub    $0x2c,%esp
 4bc:	89 45 d8             	mov    %eax,-0x28(%ebp)
 4bf:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4c2:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 4c5:	8b 45 08             	mov    0x8(%ebp),%eax
 4c8:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 4cb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 4d2:	bb 00 00 00 00       	mov    $0x0,%ebx
 4d7:	89 f8                	mov    %edi,%eax
 4d9:	89 df                	mov    %ebx,%edi
 4db:	89 c6                	mov    %eax,%esi
 4dd:	eb 20                	jmp    4ff <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 4df:	8d 43 01             	lea    0x1(%ebx),%eax
 4e2:	89 45 e0             	mov    %eax,-0x20(%ebp)
 4e5:	83 ec 0c             	sub    $0xc,%esp
 4e8:	51                   	push   %ecx
 4e9:	53                   	push   %ebx
 4ea:	56                   	push   %esi
 4eb:	ff 75 d0             	pushl  -0x30(%ebp)
 4ee:	ff 75 d4             	pushl  -0x2c(%ebp)
 4f1:	8b 55 d8             	mov    -0x28(%ebp),%edx
 4f4:	ff d2                	call   *%edx
 4f6:	83 c4 20             	add    $0x20,%esp
 4f9:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 4fc:	83 c7 01             	add    $0x1,%edi
 4ff:	8b 45 0c             	mov    0xc(%ebp),%eax
 502:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 506:	84 c0                	test   %al,%al
 508:	0f 84 cd 01 00 00    	je     6db <s_printf+0x228>
 50e:	89 75 e0             	mov    %esi,-0x20(%ebp)
 511:	39 de                	cmp    %ebx,%esi
 513:	0f 86 c2 01 00 00    	jbe    6db <s_printf+0x228>
    c = fmt[i] & 0xff;
 519:	0f be c8             	movsbl %al,%ecx
 51c:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 51f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 522:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 526:	75 0a                	jne    532 <s_printf+0x7f>
      if(c == '%') {
 528:	83 f8 25             	cmp    $0x25,%eax
 52b:	75 b2                	jne    4df <s_printf+0x2c>
        state = '%';
 52d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 530:	eb ca                	jmp    4fc <s_printf+0x49>
      }
    } else if(state == '%'){
 532:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 536:	75 c4                	jne    4fc <s_printf+0x49>
      if(c == 'd'){
 538:	83 f8 64             	cmp    $0x64,%eax
 53b:	74 6e                	je     5ab <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 53d:	83 f8 78             	cmp    $0x78,%eax
 540:	0f 94 c1             	sete   %cl
 543:	83 f8 70             	cmp    $0x70,%eax
 546:	0f 94 c2             	sete   %dl
 549:	08 d1                	or     %dl,%cl
 54b:	0f 85 8e 00 00 00    	jne    5df <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 551:	83 f8 73             	cmp    $0x73,%eax
 554:	0f 84 b9 00 00 00    	je     613 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 55a:	83 f8 63             	cmp    $0x63,%eax
 55d:	0f 84 1a 01 00 00    	je     67d <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 563:	83 f8 25             	cmp    $0x25,%eax
 566:	0f 84 44 01 00 00    	je     6b0 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 56c:	8d 43 01             	lea    0x1(%ebx),%eax
 56f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 572:	83 ec 0c             	sub    $0xc,%esp
 575:	6a 25                	push   $0x25
 577:	53                   	push   %ebx
 578:	56                   	push   %esi
 579:	ff 75 d0             	pushl  -0x30(%ebp)
 57c:	ff 75 d4             	pushl  -0x2c(%ebp)
 57f:	8b 45 d8             	mov    -0x28(%ebp),%eax
 582:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 584:	83 c3 02             	add    $0x2,%ebx
 587:	83 c4 14             	add    $0x14,%esp
 58a:	ff 75 dc             	pushl  -0x24(%ebp)
 58d:	ff 75 e4             	pushl  -0x1c(%ebp)
 590:	56                   	push   %esi
 591:	ff 75 d0             	pushl  -0x30(%ebp)
 594:	ff 75 d4             	pushl  -0x2c(%ebp)
 597:	8b 45 d8             	mov    -0x28(%ebp),%eax
 59a:	ff d0                	call   *%eax
 59c:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 59f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5a6:	e9 51 ff ff ff       	jmp    4fc <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 5ab:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5ae:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 5b1:	6a 01                	push   $0x1
 5b3:	6a 0a                	push   $0xa
 5b5:	8b 45 10             	mov    0x10(%ebp),%eax
 5b8:	ff 30                	pushl  (%eax)
 5ba:	89 f0                	mov    %esi,%eax
 5bc:	29 d8                	sub    %ebx,%eax
 5be:	50                   	push   %eax
 5bf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5c2:	8b 45 d8             	mov    -0x28(%ebp),%eax
 5c5:	e8 7f fe ff ff       	call   449 <s_printint>
 5ca:	01 c3                	add    %eax,%ebx
        ap++;
 5cc:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 5d0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5d3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5da:	e9 1d ff ff ff       	jmp    4fc <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 5df:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5e2:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 5e5:	6a 00                	push   $0x0
 5e7:	6a 10                	push   $0x10
 5e9:	8b 45 10             	mov    0x10(%ebp),%eax
 5ec:	ff 30                	pushl  (%eax)
 5ee:	89 f0                	mov    %esi,%eax
 5f0:	29 d8                	sub    %ebx,%eax
 5f2:	50                   	push   %eax
 5f3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5f6:	8b 45 d8             	mov    -0x28(%ebp),%eax
 5f9:	e8 4b fe ff ff       	call   449 <s_printint>
 5fe:	01 c3                	add    %eax,%ebx
        ap++;
 600:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 604:	83 c4 10             	add    $0x10,%esp
      state = 0;
 607:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 60e:	e9 e9 fe ff ff       	jmp    4fc <s_printf+0x49>
        s = (char*)*ap;
 613:	8b 45 10             	mov    0x10(%ebp),%eax
 616:	8b 00                	mov    (%eax),%eax
        ap++;
 618:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 61c:	85 c0                	test   %eax,%eax
 61e:	75 4e                	jne    66e <s_printf+0x1bb>
          s = "(null)";
 620:	b8 9f 07 00 00       	mov    $0x79f,%eax
 625:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 628:	89 da                	mov    %ebx,%edx
 62a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 62d:	89 75 e0             	mov    %esi,-0x20(%ebp)
 630:	89 c6                	mov    %eax,%esi
 632:	eb 1f                	jmp    653 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 634:	8d 7a 01             	lea    0x1(%edx),%edi
 637:	83 ec 0c             	sub    $0xc,%esp
 63a:	0f be c0             	movsbl %al,%eax
 63d:	50                   	push   %eax
 63e:	52                   	push   %edx
 63f:	53                   	push   %ebx
 640:	ff 75 d0             	pushl  -0x30(%ebp)
 643:	ff 75 d4             	pushl  -0x2c(%ebp)
 646:	8b 45 d8             	mov    -0x28(%ebp),%eax
 649:	ff d0                	call   *%eax
          s++;
 64b:	83 c6 01             	add    $0x1,%esi
 64e:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 651:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 653:	0f b6 06             	movzbl (%esi),%eax
 656:	84 c0                	test   %al,%al
 658:	75 da                	jne    634 <s_printf+0x181>
 65a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 65d:	89 d3                	mov    %edx,%ebx
 65f:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 662:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 669:	e9 8e fe ff ff       	jmp    4fc <s_printf+0x49>
 66e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 671:	89 da                	mov    %ebx,%edx
 673:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 676:	89 75 e0             	mov    %esi,-0x20(%ebp)
 679:	89 c6                	mov    %eax,%esi
 67b:	eb d6                	jmp    653 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 67d:	8d 43 01             	lea    0x1(%ebx),%eax
 680:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 683:	83 ec 0c             	sub    $0xc,%esp
 686:	8b 55 10             	mov    0x10(%ebp),%edx
 689:	0f be 02             	movsbl (%edx),%eax
 68c:	50                   	push   %eax
 68d:	53                   	push   %ebx
 68e:	56                   	push   %esi
 68f:	ff 75 d0             	pushl  -0x30(%ebp)
 692:	ff 75 d4             	pushl  -0x2c(%ebp)
 695:	8b 55 d8             	mov    -0x28(%ebp),%edx
 698:	ff d2                	call   *%edx
        ap++;
 69a:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 69e:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 6a1:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 6a4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 6ab:	e9 4c fe ff ff       	jmp    4fc <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 6b0:	8d 43 01             	lea    0x1(%ebx),%eax
 6b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6b6:	83 ec 0c             	sub    $0xc,%esp
 6b9:	ff 75 dc             	pushl  -0x24(%ebp)
 6bc:	53                   	push   %ebx
 6bd:	56                   	push   %esi
 6be:	ff 75 d0             	pushl  -0x30(%ebp)
 6c1:	ff 75 d4             	pushl  -0x2c(%ebp)
 6c4:	8b 55 d8             	mov    -0x28(%ebp),%edx
 6c7:	ff d2                	call   *%edx
 6c9:	83 c4 20             	add    $0x20,%esp
 6cc:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 6cf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 6d6:	e9 21 fe ff ff       	jmp    4fc <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 6db:	89 da                	mov    %ebx,%edx
 6dd:	89 f0                	mov    %esi,%eax
 6df:	e8 5f fd ff ff       	call   443 <s_min>
}
 6e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6e7:	5b                   	pop    %ebx
 6e8:	5e                   	pop    %esi
 6e9:	5f                   	pop    %edi
 6ea:	5d                   	pop    %ebp
 6eb:	c3                   	ret    

000006ec <s_putc>:
{
 6ec:	f3 0f 1e fb          	endbr32 
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	83 ec 1c             	sub    $0x1c,%esp
 6f6:	8b 45 18             	mov    0x18(%ebp),%eax
 6f9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 6fc:	6a 01                	push   $0x1
 6fe:	8d 45 f4             	lea    -0xc(%ebp),%eax
 701:	50                   	push   %eax
 702:	ff 75 08             	pushl  0x8(%ebp)
 705:	e8 f3 fb ff ff       	call   2fd <write>
}
 70a:	83 c4 10             	add    $0x10,%esp
 70d:	c9                   	leave  
 70e:	c3                   	ret    

0000070f <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 70f:	f3 0f 1e fb          	endbr32 
 713:	55                   	push   %ebp
 714:	89 e5                	mov    %esp,%ebp
 716:	56                   	push   %esi
 717:	53                   	push   %ebx
 718:	8b 75 08             	mov    0x8(%ebp),%esi
 71b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 71e:	83 ec 04             	sub    $0x4,%esp
 721:	8d 45 14             	lea    0x14(%ebp),%eax
 724:	50                   	push   %eax
 725:	ff 75 10             	pushl  0x10(%ebp)
 728:	53                   	push   %ebx
 729:	89 f1                	mov    %esi,%ecx
 72b:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 730:	b8 9d 03 00 00       	mov    $0x39d,%eax
 735:	e8 79 fd ff ff       	call   4b3 <s_printf>
  if(count < n) {
 73a:	83 c4 10             	add    $0x10,%esp
 73d:	39 c3                	cmp    %eax,%ebx
 73f:	76 04                	jbe    745 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 741:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 745:	8d 65 f8             	lea    -0x8(%ebp),%esp
 748:	5b                   	pop    %ebx
 749:	5e                   	pop    %esi
 74a:	5d                   	pop    %ebp
 74b:	c3                   	ret    

0000074c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 74c:	f3 0f 1e fb          	endbr32 
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 756:	8d 45 10             	lea    0x10(%ebp),%eax
 759:	50                   	push   %eax
 75a:	ff 75 0c             	pushl  0xc(%ebp)
 75d:	68 00 00 00 40       	push   $0x40000000
 762:	b9 00 00 00 00       	mov    $0x0,%ecx
 767:	8b 55 08             	mov    0x8(%ebp),%edx
 76a:	b8 ec 06 00 00       	mov    $0x6ec,%eax
 76f:	e8 3f fd ff ff       	call   4b3 <s_printf>
}
 774:	83 c4 10             	add    $0x10,%esp
 777:	c9                   	leave  
 778:	c3                   	ret    
