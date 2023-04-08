
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	56                   	push   %esi
   8:	53                   	push   %ebx
   9:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   c:	83 ec 04             	sub    $0x4,%esp
   f:	68 00 02 00 00       	push   $0x200
  14:	68 20 06 00 00       	push   $0x620
  19:	56                   	push   %esi
  1a:	e8 01 01 00 00       	call   120 <read>
  1f:	89 c3                	mov    %eax,%ebx
  21:	83 c4 10             	add    $0x10,%esp
  24:	85 c0                	test   %eax,%eax
  26:	7e 2b                	jle    53 <cat+0x53>
    if (write(1, buf, n) != n) {
  28:	83 ec 04             	sub    $0x4,%esp
  2b:	53                   	push   %ebx
  2c:	68 20 06 00 00       	push   $0x620
  31:	6a 01                	push   $0x1
  33:	e8 f0 00 00 00       	call   128 <write>
  38:	83 c4 10             	add    $0x10,%esp
  3b:	39 d8                	cmp    %ebx,%eax
  3d:	74 cd                	je     c <cat+0xc>
      printf(1, "cat: write error\n");
  3f:	83 ec 08             	sub    $0x8,%esp
  42:	68 b4 05 00 00       	push   $0x5b4
  47:	6a 01                	push   $0x1
  49:	e8 39 05 00 00       	call   587 <printf>
      exit();
  4e:	e8 b5 00 00 00       	call   108 <exit>
    }
  }
  if(n < 0){
  53:	78 07                	js     5c <cat+0x5c>
    printf(1, "cat: read error\n");
    exit();
  }
}
  55:	8d 65 f8             	lea    -0x8(%ebp),%esp
  58:	5b                   	pop    %ebx
  59:	5e                   	pop    %esi
  5a:	5d                   	pop    %ebp
  5b:	c3                   	ret    
    printf(1, "cat: read error\n");
  5c:	83 ec 08             	sub    $0x8,%esp
  5f:	68 c6 05 00 00       	push   $0x5c6
  64:	6a 01                	push   $0x1
  66:	e8 1c 05 00 00       	call   587 <printf>
    exit();
  6b:	e8 98 00 00 00       	call   108 <exit>

00000070 <main>:

int
main(int argc, char *argv[])
{
  70:	f3 0f 1e fb          	endbr32 
  74:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  78:	83 e4 f0             	and    $0xfffffff0,%esp
  7b:	ff 71 fc             	pushl  -0x4(%ecx)
  7e:	55                   	push   %ebp
  7f:	89 e5                	mov    %esp,%ebp
  81:	57                   	push   %edi
  82:	56                   	push   %esi
  83:	53                   	push   %ebx
  84:	51                   	push   %ecx
  85:	83 ec 18             	sub    $0x18,%esp
  88:	8b 01                	mov    (%ecx),%eax
  8a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8d:	8b 51 04             	mov    0x4(%ecx),%edx
  90:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  93:	83 f8 01             	cmp    $0x1,%eax
  96:	7e 3e                	jle    d6 <main+0x66>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  98:	be 01 00 00 00       	mov    $0x1,%esi
  9d:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  a0:	7d 59                	jge    fb <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  a5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  a8:	83 ec 08             	sub    $0x8,%esp
  ab:	6a 00                	push   $0x0
  ad:	ff 37                	pushl  (%edi)
  af:	e8 94 00 00 00       	call   148 <open>
  b4:	89 c3                	mov    %eax,%ebx
  b6:	83 c4 10             	add    $0x10,%esp
  b9:	85 c0                	test   %eax,%eax
  bb:	78 28                	js     e5 <main+0x75>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  bd:	83 ec 0c             	sub    $0xc,%esp
  c0:	50                   	push   %eax
  c1:	e8 3a ff ff ff       	call   0 <cat>
    close(fd);
  c6:	89 1c 24             	mov    %ebx,(%esp)
  c9:	e8 62 00 00 00       	call   130 <close>
  for(i = 1; i < argc; i++){
  ce:	83 c6 01             	add    $0x1,%esi
  d1:	83 c4 10             	add    $0x10,%esp
  d4:	eb c7                	jmp    9d <main+0x2d>
    cat(0);
  d6:	83 ec 0c             	sub    $0xc,%esp
  d9:	6a 00                	push   $0x0
  db:	e8 20 ff ff ff       	call   0 <cat>
    exit();
  e0:	e8 23 00 00 00       	call   108 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  e5:	83 ec 04             	sub    $0x4,%esp
  e8:	ff 37                	pushl  (%edi)
  ea:	68 d7 05 00 00       	push   $0x5d7
  ef:	6a 01                	push   $0x1
  f1:	e8 91 04 00 00       	call   587 <printf>
      exit();
  f6:	e8 0d 00 00 00       	call   108 <exit>
  }
  exit();
  fb:	e8 08 00 00 00       	call   108 <exit>

00000100 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 100:	b8 01 00 00 00       	mov    $0x1,%eax
 105:	cd 40                	int    $0x40
 107:	c3                   	ret    

00000108 <exit>:
SYSCALL(exit)
 108:	b8 02 00 00 00       	mov    $0x2,%eax
 10d:	cd 40                	int    $0x40
 10f:	c3                   	ret    

00000110 <wait>:
SYSCALL(wait)
 110:	b8 03 00 00 00       	mov    $0x3,%eax
 115:	cd 40                	int    $0x40
 117:	c3                   	ret    

00000118 <pipe>:
SYSCALL(pipe)
 118:	b8 04 00 00 00       	mov    $0x4,%eax
 11d:	cd 40                	int    $0x40
 11f:	c3                   	ret    

00000120 <read>:
SYSCALL(read)
 120:	b8 05 00 00 00       	mov    $0x5,%eax
 125:	cd 40                	int    $0x40
 127:	c3                   	ret    

00000128 <write>:
SYSCALL(write)
 128:	b8 10 00 00 00       	mov    $0x10,%eax
 12d:	cd 40                	int    $0x40
 12f:	c3                   	ret    

00000130 <close>:
SYSCALL(close)
 130:	b8 15 00 00 00       	mov    $0x15,%eax
 135:	cd 40                	int    $0x40
 137:	c3                   	ret    

00000138 <kill>:
SYSCALL(kill)
 138:	b8 06 00 00 00       	mov    $0x6,%eax
 13d:	cd 40                	int    $0x40
 13f:	c3                   	ret    

00000140 <exec>:
SYSCALL(exec)
 140:	b8 07 00 00 00       	mov    $0x7,%eax
 145:	cd 40                	int    $0x40
 147:	c3                   	ret    

00000148 <open>:
SYSCALL(open)
 148:	b8 0f 00 00 00       	mov    $0xf,%eax
 14d:	cd 40                	int    $0x40
 14f:	c3                   	ret    

00000150 <mknod>:
SYSCALL(mknod)
 150:	b8 11 00 00 00       	mov    $0x11,%eax
 155:	cd 40                	int    $0x40
 157:	c3                   	ret    

00000158 <unlink>:
SYSCALL(unlink)
 158:	b8 12 00 00 00       	mov    $0x12,%eax
 15d:	cd 40                	int    $0x40
 15f:	c3                   	ret    

00000160 <fstat>:
SYSCALL(fstat)
 160:	b8 08 00 00 00       	mov    $0x8,%eax
 165:	cd 40                	int    $0x40
 167:	c3                   	ret    

00000168 <link>:
SYSCALL(link)
 168:	b8 13 00 00 00       	mov    $0x13,%eax
 16d:	cd 40                	int    $0x40
 16f:	c3                   	ret    

00000170 <mkdir>:
SYSCALL(mkdir)
 170:	b8 14 00 00 00       	mov    $0x14,%eax
 175:	cd 40                	int    $0x40
 177:	c3                   	ret    

00000178 <chdir>:
SYSCALL(chdir)
 178:	b8 09 00 00 00       	mov    $0x9,%eax
 17d:	cd 40                	int    $0x40
 17f:	c3                   	ret    

00000180 <dup>:
SYSCALL(dup)
 180:	b8 0a 00 00 00       	mov    $0xa,%eax
 185:	cd 40                	int    $0x40
 187:	c3                   	ret    

00000188 <getpid>:
SYSCALL(getpid)
 188:	b8 0b 00 00 00       	mov    $0xb,%eax
 18d:	cd 40                	int    $0x40
 18f:	c3                   	ret    

00000190 <sbrk>:
SYSCALL(sbrk)
 190:	b8 0c 00 00 00       	mov    $0xc,%eax
 195:	cd 40                	int    $0x40
 197:	c3                   	ret    

00000198 <sleep>:
SYSCALL(sleep)
 198:	b8 0d 00 00 00       	mov    $0xd,%eax
 19d:	cd 40                	int    $0x40
 19f:	c3                   	ret    

000001a0 <uptime>:
SYSCALL(uptime)
 1a0:	b8 0e 00 00 00       	mov    $0xe,%eax
 1a5:	cd 40                	int    $0x40
 1a7:	c3                   	ret    

000001a8 <yield>:
SYSCALL(yield)
 1a8:	b8 16 00 00 00       	mov    $0x16,%eax
 1ad:	cd 40                	int    $0x40
 1af:	c3                   	ret    

000001b0 <shutdown>:
SYSCALL(shutdown)
 1b0:	b8 17 00 00 00       	mov    $0x17,%eax
 1b5:	cd 40                	int    $0x40
 1b7:	c3                   	ret    

000001b8 <ps>:
SYSCALL(ps)
 1b8:	b8 18 00 00 00       	mov    $0x18,%eax
 1bd:	cd 40                	int    $0x40
 1bf:	c3                   	ret    

000001c0 <nice>:
SYSCALL(nice)
 1c0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 1c5:	cd 40                	int    $0x40
 1c7:	c3                   	ret    

000001c8 <flock>:
SYSCALL(flock)
 1c8:	b8 19 00 00 00       	mov    $0x19,%eax
 1cd:	cd 40                	int    $0x40
 1cf:	c3                   	ret    

000001d0 <funlock>:
 1d0:	b8 1a 00 00 00       	mov    $0x1a,%eax
 1d5:	cd 40                	int    $0x40
 1d7:	c3                   	ret    

000001d8 <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 1d8:	f3 0f 1e fb          	endbr32 
 1dc:	55                   	push   %ebp
 1dd:	89 e5                	mov    %esp,%ebp
 1df:	8b 45 14             	mov    0x14(%ebp),%eax
 1e2:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 1e5:	3b 45 10             	cmp    0x10(%ebp),%eax
 1e8:	73 06                	jae    1f0 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 1ea:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1ed:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret    

000001f2 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 1f2:	55                   	push   %ebp
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	57                   	push   %edi
 1f6:	56                   	push   %esi
 1f7:	53                   	push   %ebx
 1f8:	83 ec 08             	sub    $0x8,%esp
 1fb:	89 c6                	mov    %eax,%esi
 1fd:	89 d3                	mov    %edx,%ebx
 1ff:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 202:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 206:	0f 95 c2             	setne  %dl
 209:	89 c8                	mov    %ecx,%eax
 20b:	c1 e8 1f             	shr    $0x1f,%eax
 20e:	84 c2                	test   %al,%dl
 210:	74 33                	je     245 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 212:	89 c8                	mov    %ecx,%eax
 214:	f7 d8                	neg    %eax
    neg = 1;
 216:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 21d:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 222:	8d 4f 01             	lea    0x1(%edi),%ecx
 225:	89 ca                	mov    %ecx,%edx
 227:	39 d9                	cmp    %ebx,%ecx
 229:	73 26                	jae    251 <s_getReverseDigits+0x5f>
 22b:	85 c0                	test   %eax,%eax
 22d:	74 22                	je     251 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 22f:	ba 00 00 00 00       	mov    $0x0,%edx
 234:	f7 75 08             	divl   0x8(%ebp)
 237:	0f b6 92 f4 05 00 00 	movzbl 0x5f4(%edx),%edx
 23e:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 241:	89 cf                	mov    %ecx,%edi
 243:	eb dd                	jmp    222 <s_getReverseDigits+0x30>
    x = xx;
 245:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 248:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 24f:	eb cc                	jmp    21d <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 251:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 255:	75 0a                	jne    261 <s_getReverseDigits+0x6f>
 257:	39 da                	cmp    %ebx,%edx
 259:	73 06                	jae    261 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 25b:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 25f:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 261:	89 fa                	mov    %edi,%edx
 263:	39 df                	cmp    %ebx,%edi
 265:	0f 92 c0             	setb   %al
 268:	84 45 ec             	test   %al,-0x14(%ebp)
 26b:	74 07                	je     274 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 26d:	83 c7 01             	add    $0x1,%edi
 270:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 274:	89 f8                	mov    %edi,%eax
 276:	83 c4 08             	add    $0x8,%esp
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5f                   	pop    %edi
 27c:	5d                   	pop    %ebp
 27d:	c3                   	ret    

0000027e <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 27e:	39 c2                	cmp    %eax,%edx
 280:	0f 46 c2             	cmovbe %edx,%eax
}
 283:	c3                   	ret    

00000284 <s_printint>:
{
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	57                   	push   %edi
 288:	56                   	push   %esi
 289:	53                   	push   %ebx
 28a:	83 ec 2c             	sub    $0x2c,%esp
 28d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 290:	89 55 d0             	mov    %edx,-0x30(%ebp)
 293:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 296:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 299:	ff 75 14             	pushl  0x14(%ebp)
 29c:	ff 75 10             	pushl  0x10(%ebp)
 29f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2a2:	ba 10 00 00 00       	mov    $0x10,%edx
 2a7:	8d 45 d8             	lea    -0x28(%ebp),%eax
 2aa:	e8 43 ff ff ff       	call   1f2 <s_getReverseDigits>
 2af:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 2b2:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 2b4:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 2b7:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 2bc:	83 eb 01             	sub    $0x1,%ebx
 2bf:	78 22                	js     2e3 <s_printint+0x5f>
 2c1:	39 fe                	cmp    %edi,%esi
 2c3:	73 1e                	jae    2e3 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 2c5:	83 ec 0c             	sub    $0xc,%esp
 2c8:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 2cd:	50                   	push   %eax
 2ce:	56                   	push   %esi
 2cf:	57                   	push   %edi
 2d0:	ff 75 cc             	pushl  -0x34(%ebp)
 2d3:	ff 75 d0             	pushl  -0x30(%ebp)
 2d6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 2d9:	ff d0                	call   *%eax
    j++;
 2db:	83 c6 01             	add    $0x1,%esi
 2de:	83 c4 20             	add    $0x20,%esp
 2e1:	eb d9                	jmp    2bc <s_printint+0x38>
}
 2e3:	8b 45 c8             	mov    -0x38(%ebp),%eax
 2e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e9:	5b                   	pop    %ebx
 2ea:	5e                   	pop    %esi
 2eb:	5f                   	pop    %edi
 2ec:	5d                   	pop    %ebp
 2ed:	c3                   	ret    

000002ee <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 2ee:	55                   	push   %ebp
 2ef:	89 e5                	mov    %esp,%ebp
 2f1:	57                   	push   %edi
 2f2:	56                   	push   %esi
 2f3:	53                   	push   %ebx
 2f4:	83 ec 2c             	sub    $0x2c,%esp
 2f7:	89 45 d8             	mov    %eax,-0x28(%ebp)
 2fa:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 2fd:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 300:	8b 45 08             	mov    0x8(%ebp),%eax
 303:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 306:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 30d:	bb 00 00 00 00       	mov    $0x0,%ebx
 312:	89 f8                	mov    %edi,%eax
 314:	89 df                	mov    %ebx,%edi
 316:	89 c6                	mov    %eax,%esi
 318:	eb 20                	jmp    33a <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 31a:	8d 43 01             	lea    0x1(%ebx),%eax
 31d:	89 45 e0             	mov    %eax,-0x20(%ebp)
 320:	83 ec 0c             	sub    $0xc,%esp
 323:	51                   	push   %ecx
 324:	53                   	push   %ebx
 325:	56                   	push   %esi
 326:	ff 75 d0             	pushl  -0x30(%ebp)
 329:	ff 75 d4             	pushl  -0x2c(%ebp)
 32c:	8b 55 d8             	mov    -0x28(%ebp),%edx
 32f:	ff d2                	call   *%edx
 331:	83 c4 20             	add    $0x20,%esp
 334:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 337:	83 c7 01             	add    $0x1,%edi
 33a:	8b 45 0c             	mov    0xc(%ebp),%eax
 33d:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 341:	84 c0                	test   %al,%al
 343:	0f 84 cd 01 00 00    	je     516 <s_printf+0x228>
 349:	89 75 e0             	mov    %esi,-0x20(%ebp)
 34c:	39 de                	cmp    %ebx,%esi
 34e:	0f 86 c2 01 00 00    	jbe    516 <s_printf+0x228>
    c = fmt[i] & 0xff;
 354:	0f be c8             	movsbl %al,%ecx
 357:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 35a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 35d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 361:	75 0a                	jne    36d <s_printf+0x7f>
      if(c == '%') {
 363:	83 f8 25             	cmp    $0x25,%eax
 366:	75 b2                	jne    31a <s_printf+0x2c>
        state = '%';
 368:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 36b:	eb ca                	jmp    337 <s_printf+0x49>
      }
    } else if(state == '%'){
 36d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 371:	75 c4                	jne    337 <s_printf+0x49>
      if(c == 'd'){
 373:	83 f8 64             	cmp    $0x64,%eax
 376:	74 6e                	je     3e6 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 378:	83 f8 78             	cmp    $0x78,%eax
 37b:	0f 94 c1             	sete   %cl
 37e:	83 f8 70             	cmp    $0x70,%eax
 381:	0f 94 c2             	sete   %dl
 384:	08 d1                	or     %dl,%cl
 386:	0f 85 8e 00 00 00    	jne    41a <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 38c:	83 f8 73             	cmp    $0x73,%eax
 38f:	0f 84 b9 00 00 00    	je     44e <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 395:	83 f8 63             	cmp    $0x63,%eax
 398:	0f 84 1a 01 00 00    	je     4b8 <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 39e:	83 f8 25             	cmp    $0x25,%eax
 3a1:	0f 84 44 01 00 00    	je     4eb <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 3a7:	8d 43 01             	lea    0x1(%ebx),%eax
 3aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 3ad:	83 ec 0c             	sub    $0xc,%esp
 3b0:	6a 25                	push   $0x25
 3b2:	53                   	push   %ebx
 3b3:	56                   	push   %esi
 3b4:	ff 75 d0             	pushl  -0x30(%ebp)
 3b7:	ff 75 d4             	pushl  -0x2c(%ebp)
 3ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3bd:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 3bf:	83 c3 02             	add    $0x2,%ebx
 3c2:	83 c4 14             	add    $0x14,%esp
 3c5:	ff 75 dc             	pushl  -0x24(%ebp)
 3c8:	ff 75 e4             	pushl  -0x1c(%ebp)
 3cb:	56                   	push   %esi
 3cc:	ff 75 d0             	pushl  -0x30(%ebp)
 3cf:	ff 75 d4             	pushl  -0x2c(%ebp)
 3d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3d5:	ff d0                	call   *%eax
 3d7:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 3da:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3e1:	e9 51 ff ff ff       	jmp    337 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 3e6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 3e9:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 3ec:	6a 01                	push   $0x1
 3ee:	6a 0a                	push   $0xa
 3f0:	8b 45 10             	mov    0x10(%ebp),%eax
 3f3:	ff 30                	pushl  (%eax)
 3f5:	89 f0                	mov    %esi,%eax
 3f7:	29 d8                	sub    %ebx,%eax
 3f9:	50                   	push   %eax
 3fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 3fd:	8b 45 d8             	mov    -0x28(%ebp),%eax
 400:	e8 7f fe ff ff       	call   284 <s_printint>
 405:	01 c3                	add    %eax,%ebx
        ap++;
 407:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 40b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 40e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 415:	e9 1d ff ff ff       	jmp    337 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 41a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 41d:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 420:	6a 00                	push   $0x0
 422:	6a 10                	push   $0x10
 424:	8b 45 10             	mov    0x10(%ebp),%eax
 427:	ff 30                	pushl  (%eax)
 429:	89 f0                	mov    %esi,%eax
 42b:	29 d8                	sub    %ebx,%eax
 42d:	50                   	push   %eax
 42e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 431:	8b 45 d8             	mov    -0x28(%ebp),%eax
 434:	e8 4b fe ff ff       	call   284 <s_printint>
 439:	01 c3                	add    %eax,%ebx
        ap++;
 43b:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 43f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 442:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 449:	e9 e9 fe ff ff       	jmp    337 <s_printf+0x49>
        s = (char*)*ap;
 44e:	8b 45 10             	mov    0x10(%ebp),%eax
 451:	8b 00                	mov    (%eax),%eax
        ap++;
 453:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 457:	85 c0                	test   %eax,%eax
 459:	75 4e                	jne    4a9 <s_printf+0x1bb>
          s = "(null)";
 45b:	b8 ec 05 00 00       	mov    $0x5ec,%eax
 460:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 463:	89 da                	mov    %ebx,%edx
 465:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 468:	89 75 e0             	mov    %esi,-0x20(%ebp)
 46b:	89 c6                	mov    %eax,%esi
 46d:	eb 1f                	jmp    48e <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 46f:	8d 7a 01             	lea    0x1(%edx),%edi
 472:	83 ec 0c             	sub    $0xc,%esp
 475:	0f be c0             	movsbl %al,%eax
 478:	50                   	push   %eax
 479:	52                   	push   %edx
 47a:	53                   	push   %ebx
 47b:	ff 75 d0             	pushl  -0x30(%ebp)
 47e:	ff 75 d4             	pushl  -0x2c(%ebp)
 481:	8b 45 d8             	mov    -0x28(%ebp),%eax
 484:	ff d0                	call   *%eax
          s++;
 486:	83 c6 01             	add    $0x1,%esi
 489:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 48c:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 48e:	0f b6 06             	movzbl (%esi),%eax
 491:	84 c0                	test   %al,%al
 493:	75 da                	jne    46f <s_printf+0x181>
 495:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 498:	89 d3                	mov    %edx,%ebx
 49a:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 49d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4a4:	e9 8e fe ff ff       	jmp    337 <s_printf+0x49>
 4a9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4ac:	89 da                	mov    %ebx,%edx
 4ae:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 4b1:	89 75 e0             	mov    %esi,-0x20(%ebp)
 4b4:	89 c6                	mov    %eax,%esi
 4b6:	eb d6                	jmp    48e <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 4b8:	8d 43 01             	lea    0x1(%ebx),%eax
 4bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4be:	83 ec 0c             	sub    $0xc,%esp
 4c1:	8b 55 10             	mov    0x10(%ebp),%edx
 4c4:	0f be 02             	movsbl (%edx),%eax
 4c7:	50                   	push   %eax
 4c8:	53                   	push   %ebx
 4c9:	56                   	push   %esi
 4ca:	ff 75 d0             	pushl  -0x30(%ebp)
 4cd:	ff 75 d4             	pushl  -0x2c(%ebp)
 4d0:	8b 55 d8             	mov    -0x28(%ebp),%edx
 4d3:	ff d2                	call   *%edx
        ap++;
 4d5:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 4d9:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 4dc:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 4df:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4e6:	e9 4c fe ff ff       	jmp    337 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 4eb:	8d 43 01             	lea    0x1(%ebx),%eax
 4ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4f1:	83 ec 0c             	sub    $0xc,%esp
 4f4:	ff 75 dc             	pushl  -0x24(%ebp)
 4f7:	53                   	push   %ebx
 4f8:	56                   	push   %esi
 4f9:	ff 75 d0             	pushl  -0x30(%ebp)
 4fc:	ff 75 d4             	pushl  -0x2c(%ebp)
 4ff:	8b 55 d8             	mov    -0x28(%ebp),%edx
 502:	ff d2                	call   *%edx
 504:	83 c4 20             	add    $0x20,%esp
 507:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 50a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 511:	e9 21 fe ff ff       	jmp    337 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 516:	89 da                	mov    %ebx,%edx
 518:	89 f0                	mov    %esi,%eax
 51a:	e8 5f fd ff ff       	call   27e <s_min>
}
 51f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 522:	5b                   	pop    %ebx
 523:	5e                   	pop    %esi
 524:	5f                   	pop    %edi
 525:	5d                   	pop    %ebp
 526:	c3                   	ret    

00000527 <s_putc>:
{
 527:	f3 0f 1e fb          	endbr32 
 52b:	55                   	push   %ebp
 52c:	89 e5                	mov    %esp,%ebp
 52e:	83 ec 1c             	sub    $0x1c,%esp
 531:	8b 45 18             	mov    0x18(%ebp),%eax
 534:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 537:	6a 01                	push   $0x1
 539:	8d 45 f4             	lea    -0xc(%ebp),%eax
 53c:	50                   	push   %eax
 53d:	ff 75 08             	pushl  0x8(%ebp)
 540:	e8 e3 fb ff ff       	call   128 <write>
}
 545:	83 c4 10             	add    $0x10,%esp
 548:	c9                   	leave  
 549:	c3                   	ret    

0000054a <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 54a:	f3 0f 1e fb          	endbr32 
 54e:	55                   	push   %ebp
 54f:	89 e5                	mov    %esp,%ebp
 551:	56                   	push   %esi
 552:	53                   	push   %ebx
 553:	8b 75 08             	mov    0x8(%ebp),%esi
 556:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 559:	83 ec 04             	sub    $0x4,%esp
 55c:	8d 45 14             	lea    0x14(%ebp),%eax
 55f:	50                   	push   %eax
 560:	ff 75 10             	pushl  0x10(%ebp)
 563:	53                   	push   %ebx
 564:	89 f1                	mov    %esi,%ecx
 566:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 56b:	b8 d8 01 00 00       	mov    $0x1d8,%eax
 570:	e8 79 fd ff ff       	call   2ee <s_printf>
  if(count < n) {
 575:	83 c4 10             	add    $0x10,%esp
 578:	39 c3                	cmp    %eax,%ebx
 57a:	76 04                	jbe    580 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 57c:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 580:	8d 65 f8             	lea    -0x8(%ebp),%esp
 583:	5b                   	pop    %ebx
 584:	5e                   	pop    %esi
 585:	5d                   	pop    %ebp
 586:	c3                   	ret    

00000587 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 587:	f3 0f 1e fb          	endbr32 
 58b:	55                   	push   %ebp
 58c:	89 e5                	mov    %esp,%ebp
 58e:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 591:	8d 45 10             	lea    0x10(%ebp),%eax
 594:	50                   	push   %eax
 595:	ff 75 0c             	pushl  0xc(%ebp)
 598:	68 00 00 00 40       	push   $0x40000000
 59d:	b9 00 00 00 00       	mov    $0x0,%ecx
 5a2:	8b 55 08             	mov    0x8(%ebp),%edx
 5a5:	b8 27 05 00 00       	mov    $0x527,%eax
 5aa:	e8 3f fd ff ff       	call   2ee <s_printf>
}
 5af:	83 c4 10             	add    $0x10,%esp
 5b2:	c9                   	leave  
 5b3:	c3                   	ret    
