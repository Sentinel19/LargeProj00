
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
  14:	68 00 06 00 00       	push   $0x600
  19:	56                   	push   %esi
  1a:	e8 01 01 00 00       	call   120 <read>
  1f:	89 c3                	mov    %eax,%ebx
  21:	83 c4 10             	add    $0x10,%esp
  24:	85 c0                	test   %eax,%eax
  26:	7e 2b                	jle    53 <cat+0x53>
    if (write(1, buf, n) != n) {
  28:	83 ec 04             	sub    $0x4,%esp
  2b:	53                   	push   %ebx
  2c:	68 00 06 00 00       	push   $0x600
  31:	6a 01                	push   $0x1
  33:	e8 f0 00 00 00       	call   128 <write>
  38:	83 c4 10             	add    $0x10,%esp
  3b:	39 d8                	cmp    %ebx,%eax
  3d:	74 cd                	je     c <cat+0xc>
      printf(1, "cat: write error\n");
  3f:	83 ec 08             	sub    $0x8,%esp
  42:	68 a4 05 00 00       	push   $0x5a4
  47:	6a 01                	push   $0x1
  49:	e8 29 05 00 00       	call   577 <printf>
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
  5f:	68 b6 05 00 00       	push   $0x5b6
  64:	6a 01                	push   $0x1
  66:	e8 0c 05 00 00       	call   577 <printf>
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
  ea:	68 c7 05 00 00       	push   $0x5c7
  ef:	6a 01                	push   $0x1
  f1:	e8 81 04 00 00       	call   577 <printf>
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
 1c0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 1c5:	cd 40                	int    $0x40
 1c7:	c3                   	ret    

000001c8 <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 1c8:	f3 0f 1e fb          	endbr32 
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
 1cf:	8b 45 14             	mov    0x14(%ebp),%eax
 1d2:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 1d5:	3b 45 10             	cmp    0x10(%ebp),%eax
 1d8:	73 06                	jae    1e0 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 1da:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1dd:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 1e0:	5d                   	pop    %ebp
 1e1:	c3                   	ret    

000001e2 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 1e2:	55                   	push   %ebp
 1e3:	89 e5                	mov    %esp,%ebp
 1e5:	57                   	push   %edi
 1e6:	56                   	push   %esi
 1e7:	53                   	push   %ebx
 1e8:	83 ec 08             	sub    $0x8,%esp
 1eb:	89 c6                	mov    %eax,%esi
 1ed:	89 d3                	mov    %edx,%ebx
 1ef:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 1f2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 1f6:	0f 95 c2             	setne  %dl
 1f9:	89 c8                	mov    %ecx,%eax
 1fb:	c1 e8 1f             	shr    $0x1f,%eax
 1fe:	84 c2                	test   %al,%dl
 200:	74 33                	je     235 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 202:	89 c8                	mov    %ecx,%eax
 204:	f7 d8                	neg    %eax
    neg = 1;
 206:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 20d:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 212:	8d 4f 01             	lea    0x1(%edi),%ecx
 215:	89 ca                	mov    %ecx,%edx
 217:	39 d9                	cmp    %ebx,%ecx
 219:	73 26                	jae    241 <s_getReverseDigits+0x5f>
 21b:	85 c0                	test   %eax,%eax
 21d:	74 22                	je     241 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 21f:	ba 00 00 00 00       	mov    $0x0,%edx
 224:	f7 75 08             	divl   0x8(%ebp)
 227:	0f b6 92 e4 05 00 00 	movzbl 0x5e4(%edx),%edx
 22e:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 231:	89 cf                	mov    %ecx,%edi
 233:	eb dd                	jmp    212 <s_getReverseDigits+0x30>
    x = xx;
 235:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 238:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 23f:	eb cc                	jmp    20d <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 241:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 245:	75 0a                	jne    251 <s_getReverseDigits+0x6f>
 247:	39 da                	cmp    %ebx,%edx
 249:	73 06                	jae    251 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 24b:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 24f:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 251:	89 fa                	mov    %edi,%edx
 253:	39 df                	cmp    %ebx,%edi
 255:	0f 92 c0             	setb   %al
 258:	84 45 ec             	test   %al,-0x14(%ebp)
 25b:	74 07                	je     264 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 25d:	83 c7 01             	add    $0x1,%edi
 260:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 264:	89 f8                	mov    %edi,%eax
 266:	83 c4 08             	add    $0x8,%esp
 269:	5b                   	pop    %ebx
 26a:	5e                   	pop    %esi
 26b:	5f                   	pop    %edi
 26c:	5d                   	pop    %ebp
 26d:	c3                   	ret    

0000026e <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 26e:	39 c2                	cmp    %eax,%edx
 270:	0f 46 c2             	cmovbe %edx,%eax
}
 273:	c3                   	ret    

00000274 <s_printint>:
{
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	57                   	push   %edi
 278:	56                   	push   %esi
 279:	53                   	push   %ebx
 27a:	83 ec 2c             	sub    $0x2c,%esp
 27d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 280:	89 55 d0             	mov    %edx,-0x30(%ebp)
 283:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 286:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 289:	ff 75 14             	pushl  0x14(%ebp)
 28c:	ff 75 10             	pushl  0x10(%ebp)
 28f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 292:	ba 10 00 00 00       	mov    $0x10,%edx
 297:	8d 45 d8             	lea    -0x28(%ebp),%eax
 29a:	e8 43 ff ff ff       	call   1e2 <s_getReverseDigits>
 29f:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 2a2:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 2a4:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 2a7:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 2ac:	83 eb 01             	sub    $0x1,%ebx
 2af:	78 22                	js     2d3 <s_printint+0x5f>
 2b1:	39 fe                	cmp    %edi,%esi
 2b3:	73 1e                	jae    2d3 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 2b5:	83 ec 0c             	sub    $0xc,%esp
 2b8:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 2bd:	50                   	push   %eax
 2be:	56                   	push   %esi
 2bf:	57                   	push   %edi
 2c0:	ff 75 cc             	pushl  -0x34(%ebp)
 2c3:	ff 75 d0             	pushl  -0x30(%ebp)
 2c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 2c9:	ff d0                	call   *%eax
    j++;
 2cb:	83 c6 01             	add    $0x1,%esi
 2ce:	83 c4 20             	add    $0x20,%esp
 2d1:	eb d9                	jmp    2ac <s_printint+0x38>
}
 2d3:	8b 45 c8             	mov    -0x38(%ebp),%eax
 2d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5f                   	pop    %edi
 2dc:	5d                   	pop    %ebp
 2dd:	c3                   	ret    

000002de <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	57                   	push   %edi
 2e2:	56                   	push   %esi
 2e3:	53                   	push   %ebx
 2e4:	83 ec 2c             	sub    $0x2c,%esp
 2e7:	89 45 d8             	mov    %eax,-0x28(%ebp)
 2ea:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 2ed:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
 2f3:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 2f6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 2fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 302:	89 f8                	mov    %edi,%eax
 304:	89 df                	mov    %ebx,%edi
 306:	89 c6                	mov    %eax,%esi
 308:	eb 20                	jmp    32a <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 30a:	8d 43 01             	lea    0x1(%ebx),%eax
 30d:	89 45 e0             	mov    %eax,-0x20(%ebp)
 310:	83 ec 0c             	sub    $0xc,%esp
 313:	51                   	push   %ecx
 314:	53                   	push   %ebx
 315:	56                   	push   %esi
 316:	ff 75 d0             	pushl  -0x30(%ebp)
 319:	ff 75 d4             	pushl  -0x2c(%ebp)
 31c:	8b 55 d8             	mov    -0x28(%ebp),%edx
 31f:	ff d2                	call   *%edx
 321:	83 c4 20             	add    $0x20,%esp
 324:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 327:	83 c7 01             	add    $0x1,%edi
 32a:	8b 45 0c             	mov    0xc(%ebp),%eax
 32d:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 331:	84 c0                	test   %al,%al
 333:	0f 84 cd 01 00 00    	je     506 <s_printf+0x228>
 339:	89 75 e0             	mov    %esi,-0x20(%ebp)
 33c:	39 de                	cmp    %ebx,%esi
 33e:	0f 86 c2 01 00 00    	jbe    506 <s_printf+0x228>
    c = fmt[i] & 0xff;
 344:	0f be c8             	movsbl %al,%ecx
 347:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 34a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 34d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 351:	75 0a                	jne    35d <s_printf+0x7f>
      if(c == '%') {
 353:	83 f8 25             	cmp    $0x25,%eax
 356:	75 b2                	jne    30a <s_printf+0x2c>
        state = '%';
 358:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 35b:	eb ca                	jmp    327 <s_printf+0x49>
      }
    } else if(state == '%'){
 35d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 361:	75 c4                	jne    327 <s_printf+0x49>
      if(c == 'd'){
 363:	83 f8 64             	cmp    $0x64,%eax
 366:	74 6e                	je     3d6 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 368:	83 f8 78             	cmp    $0x78,%eax
 36b:	0f 94 c1             	sete   %cl
 36e:	83 f8 70             	cmp    $0x70,%eax
 371:	0f 94 c2             	sete   %dl
 374:	08 d1                	or     %dl,%cl
 376:	0f 85 8e 00 00 00    	jne    40a <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 37c:	83 f8 73             	cmp    $0x73,%eax
 37f:	0f 84 b9 00 00 00    	je     43e <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 385:	83 f8 63             	cmp    $0x63,%eax
 388:	0f 84 1a 01 00 00    	je     4a8 <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 38e:	83 f8 25             	cmp    $0x25,%eax
 391:	0f 84 44 01 00 00    	je     4db <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 397:	8d 43 01             	lea    0x1(%ebx),%eax
 39a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 39d:	83 ec 0c             	sub    $0xc,%esp
 3a0:	6a 25                	push   $0x25
 3a2:	53                   	push   %ebx
 3a3:	56                   	push   %esi
 3a4:	ff 75 d0             	pushl  -0x30(%ebp)
 3a7:	ff 75 d4             	pushl  -0x2c(%ebp)
 3aa:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3ad:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 3af:	83 c3 02             	add    $0x2,%ebx
 3b2:	83 c4 14             	add    $0x14,%esp
 3b5:	ff 75 dc             	pushl  -0x24(%ebp)
 3b8:	ff 75 e4             	pushl  -0x1c(%ebp)
 3bb:	56                   	push   %esi
 3bc:	ff 75 d0             	pushl  -0x30(%ebp)
 3bf:	ff 75 d4             	pushl  -0x2c(%ebp)
 3c2:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3c5:	ff d0                	call   *%eax
 3c7:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 3ca:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3d1:	e9 51 ff ff ff       	jmp    327 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 3d6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 3d9:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 3dc:	6a 01                	push   $0x1
 3de:	6a 0a                	push   $0xa
 3e0:	8b 45 10             	mov    0x10(%ebp),%eax
 3e3:	ff 30                	pushl  (%eax)
 3e5:	89 f0                	mov    %esi,%eax
 3e7:	29 d8                	sub    %ebx,%eax
 3e9:	50                   	push   %eax
 3ea:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 3ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3f0:	e8 7f fe ff ff       	call   274 <s_printint>
 3f5:	01 c3                	add    %eax,%ebx
        ap++;
 3f7:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 3fb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3fe:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 405:	e9 1d ff ff ff       	jmp    327 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 40a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 40d:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 410:	6a 00                	push   $0x0
 412:	6a 10                	push   $0x10
 414:	8b 45 10             	mov    0x10(%ebp),%eax
 417:	ff 30                	pushl  (%eax)
 419:	89 f0                	mov    %esi,%eax
 41b:	29 d8                	sub    %ebx,%eax
 41d:	50                   	push   %eax
 41e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 421:	8b 45 d8             	mov    -0x28(%ebp),%eax
 424:	e8 4b fe ff ff       	call   274 <s_printint>
 429:	01 c3                	add    %eax,%ebx
        ap++;
 42b:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 42f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 432:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 439:	e9 e9 fe ff ff       	jmp    327 <s_printf+0x49>
        s = (char*)*ap;
 43e:	8b 45 10             	mov    0x10(%ebp),%eax
 441:	8b 00                	mov    (%eax),%eax
        ap++;
 443:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 447:	85 c0                	test   %eax,%eax
 449:	75 4e                	jne    499 <s_printf+0x1bb>
          s = "(null)";
 44b:	b8 dc 05 00 00       	mov    $0x5dc,%eax
 450:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 453:	89 da                	mov    %ebx,%edx
 455:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 458:	89 75 e0             	mov    %esi,-0x20(%ebp)
 45b:	89 c6                	mov    %eax,%esi
 45d:	eb 1f                	jmp    47e <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 45f:	8d 7a 01             	lea    0x1(%edx),%edi
 462:	83 ec 0c             	sub    $0xc,%esp
 465:	0f be c0             	movsbl %al,%eax
 468:	50                   	push   %eax
 469:	52                   	push   %edx
 46a:	53                   	push   %ebx
 46b:	ff 75 d0             	pushl  -0x30(%ebp)
 46e:	ff 75 d4             	pushl  -0x2c(%ebp)
 471:	8b 45 d8             	mov    -0x28(%ebp),%eax
 474:	ff d0                	call   *%eax
          s++;
 476:	83 c6 01             	add    $0x1,%esi
 479:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 47c:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 47e:	0f b6 06             	movzbl (%esi),%eax
 481:	84 c0                	test   %al,%al
 483:	75 da                	jne    45f <s_printf+0x181>
 485:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 488:	89 d3                	mov    %edx,%ebx
 48a:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 48d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 494:	e9 8e fe ff ff       	jmp    327 <s_printf+0x49>
 499:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 49c:	89 da                	mov    %ebx,%edx
 49e:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 4a1:	89 75 e0             	mov    %esi,-0x20(%ebp)
 4a4:	89 c6                	mov    %eax,%esi
 4a6:	eb d6                	jmp    47e <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 4a8:	8d 43 01             	lea    0x1(%ebx),%eax
 4ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4ae:	83 ec 0c             	sub    $0xc,%esp
 4b1:	8b 55 10             	mov    0x10(%ebp),%edx
 4b4:	0f be 02             	movsbl (%edx),%eax
 4b7:	50                   	push   %eax
 4b8:	53                   	push   %ebx
 4b9:	56                   	push   %esi
 4ba:	ff 75 d0             	pushl  -0x30(%ebp)
 4bd:	ff 75 d4             	pushl  -0x2c(%ebp)
 4c0:	8b 55 d8             	mov    -0x28(%ebp),%edx
 4c3:	ff d2                	call   *%edx
        ap++;
 4c5:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 4c9:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 4cc:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 4cf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4d6:	e9 4c fe ff ff       	jmp    327 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 4db:	8d 43 01             	lea    0x1(%ebx),%eax
 4de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4e1:	83 ec 0c             	sub    $0xc,%esp
 4e4:	ff 75 dc             	pushl  -0x24(%ebp)
 4e7:	53                   	push   %ebx
 4e8:	56                   	push   %esi
 4e9:	ff 75 d0             	pushl  -0x30(%ebp)
 4ec:	ff 75 d4             	pushl  -0x2c(%ebp)
 4ef:	8b 55 d8             	mov    -0x28(%ebp),%edx
 4f2:	ff d2                	call   *%edx
 4f4:	83 c4 20             	add    $0x20,%esp
 4f7:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 4fa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 501:	e9 21 fe ff ff       	jmp    327 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 506:	89 da                	mov    %ebx,%edx
 508:	89 f0                	mov    %esi,%eax
 50a:	e8 5f fd ff ff       	call   26e <s_min>
}
 50f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 512:	5b                   	pop    %ebx
 513:	5e                   	pop    %esi
 514:	5f                   	pop    %edi
 515:	5d                   	pop    %ebp
 516:	c3                   	ret    

00000517 <s_putc>:
{
 517:	f3 0f 1e fb          	endbr32 
 51b:	55                   	push   %ebp
 51c:	89 e5                	mov    %esp,%ebp
 51e:	83 ec 1c             	sub    $0x1c,%esp
 521:	8b 45 18             	mov    0x18(%ebp),%eax
 524:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 527:	6a 01                	push   $0x1
 529:	8d 45 f4             	lea    -0xc(%ebp),%eax
 52c:	50                   	push   %eax
 52d:	ff 75 08             	pushl  0x8(%ebp)
 530:	e8 f3 fb ff ff       	call   128 <write>
}
 535:	83 c4 10             	add    $0x10,%esp
 538:	c9                   	leave  
 539:	c3                   	ret    

0000053a <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 53a:	f3 0f 1e fb          	endbr32 
 53e:	55                   	push   %ebp
 53f:	89 e5                	mov    %esp,%ebp
 541:	56                   	push   %esi
 542:	53                   	push   %ebx
 543:	8b 75 08             	mov    0x8(%ebp),%esi
 546:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 549:	83 ec 04             	sub    $0x4,%esp
 54c:	8d 45 14             	lea    0x14(%ebp),%eax
 54f:	50                   	push   %eax
 550:	ff 75 10             	pushl  0x10(%ebp)
 553:	53                   	push   %ebx
 554:	89 f1                	mov    %esi,%ecx
 556:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 55b:	b8 c8 01 00 00       	mov    $0x1c8,%eax
 560:	e8 79 fd ff ff       	call   2de <s_printf>
  if(count < n) {
 565:	83 c4 10             	add    $0x10,%esp
 568:	39 c3                	cmp    %eax,%ebx
 56a:	76 04                	jbe    570 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 56c:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 570:	8d 65 f8             	lea    -0x8(%ebp),%esp
 573:	5b                   	pop    %ebx
 574:	5e                   	pop    %esi
 575:	5d                   	pop    %ebp
 576:	c3                   	ret    

00000577 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 577:	f3 0f 1e fb          	endbr32 
 57b:	55                   	push   %ebp
 57c:	89 e5                	mov    %esp,%ebp
 57e:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 581:	8d 45 10             	lea    0x10(%ebp),%eax
 584:	50                   	push   %eax
 585:	ff 75 0c             	pushl  0xc(%ebp)
 588:	68 00 00 00 40       	push   $0x40000000
 58d:	b9 00 00 00 00       	mov    $0x0,%ecx
 592:	8b 55 08             	mov    0x8(%ebp),%edx
 595:	b8 17 05 00 00       	mov    $0x517,%eax
 59a:	e8 3f fd ff ff       	call   2de <s_printf>
}
 59f:	83 c4 10             	add    $0x10,%esp
 5a2:	c9                   	leave  
 5a3:	c3                   	ret    
