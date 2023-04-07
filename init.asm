
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  13:	83 ec 08             	sub    $0x8,%esp
  16:	6a 02                	push   $0x2
  18:	68 88 05 00 00       	push   $0x588
  1d:	e8 07 01 00 00       	call   129 <open>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	78 59                	js     82 <main+0x82>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 2e 01 00 00       	call   161 <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 22 01 00 00       	call   161 <dup>
  3f:	83 c4 10             	add    $0x10,%esp

  for(;;){
    printf(1, "init: starting sh\n");
  42:	83 ec 08             	sub    $0x8,%esp
  45:	68 90 05 00 00       	push   $0x590
  4a:	6a 01                	push   $0x1
  4c:	e8 07 05 00 00       	call   558 <printf>
    pid = fork();
  51:	e8 8b 00 00 00       	call   e1 <fork>
  56:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  58:	83 c4 10             	add    $0x10,%esp
  5b:	85 c0                	test   %eax,%eax
  5d:	78 48                	js     a7 <main+0xa7>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  5f:	74 5a                	je     bb <main+0xbb>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  61:	e8 8b 00 00 00       	call   f1 <wait>
  66:	85 c0                	test   %eax,%eax
  68:	78 d8                	js     42 <main+0x42>
  6a:	39 c3                	cmp    %eax,%ebx
  6c:	74 d4                	je     42 <main+0x42>
      printf(1, "zombie!\n");
  6e:	83 ec 08             	sub    $0x8,%esp
  71:	68 cf 05 00 00       	push   $0x5cf
  76:	6a 01                	push   $0x1
  78:	e8 db 04 00 00       	call   558 <printf>
  7d:	83 c4 10             	add    $0x10,%esp
  80:	eb df                	jmp    61 <main+0x61>
    mknod("console", 1, 1);
  82:	83 ec 04             	sub    $0x4,%esp
  85:	6a 01                	push   $0x1
  87:	6a 01                	push   $0x1
  89:	68 88 05 00 00       	push   $0x588
  8e:	e8 9e 00 00 00       	call   131 <mknod>
    open("console", O_RDWR);
  93:	83 c4 08             	add    $0x8,%esp
  96:	6a 02                	push   $0x2
  98:	68 88 05 00 00       	push   $0x588
  9d:	e8 87 00 00 00       	call   129 <open>
  a2:	83 c4 10             	add    $0x10,%esp
  a5:	eb 82                	jmp    29 <main+0x29>
      printf(1, "init: fork failed\n");
  a7:	83 ec 08             	sub    $0x8,%esp
  aa:	68 a3 05 00 00       	push   $0x5a3
  af:	6a 01                	push   $0x1
  b1:	e8 a2 04 00 00       	call   558 <printf>
      exit();
  b6:	e8 2e 00 00 00       	call   e9 <exit>
      exec("sh", argv);
  bb:	83 ec 08             	sub    $0x8,%esp
  be:	68 f4 05 00 00       	push   $0x5f4
  c3:	68 b6 05 00 00       	push   $0x5b6
  c8:	e8 54 00 00 00       	call   121 <exec>
      printf(1, "init: exec sh failed\n");
  cd:	83 c4 08             	add    $0x8,%esp
  d0:	68 b9 05 00 00       	push   $0x5b9
  d5:	6a 01                	push   $0x1
  d7:	e8 7c 04 00 00       	call   558 <printf>
      exit();
  dc:	e8 08 00 00 00       	call   e9 <exit>

000000e1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
  e1:	b8 01 00 00 00       	mov    $0x1,%eax
  e6:	cd 40                	int    $0x40
  e8:	c3                   	ret    

000000e9 <exit>:
SYSCALL(exit)
  e9:	b8 02 00 00 00       	mov    $0x2,%eax
  ee:	cd 40                	int    $0x40
  f0:	c3                   	ret    

000000f1 <wait>:
SYSCALL(wait)
  f1:	b8 03 00 00 00       	mov    $0x3,%eax
  f6:	cd 40                	int    $0x40
  f8:	c3                   	ret    

000000f9 <pipe>:
SYSCALL(pipe)
  f9:	b8 04 00 00 00       	mov    $0x4,%eax
  fe:	cd 40                	int    $0x40
 100:	c3                   	ret    

00000101 <read>:
SYSCALL(read)
 101:	b8 05 00 00 00       	mov    $0x5,%eax
 106:	cd 40                	int    $0x40
 108:	c3                   	ret    

00000109 <write>:
SYSCALL(write)
 109:	b8 10 00 00 00       	mov    $0x10,%eax
 10e:	cd 40                	int    $0x40
 110:	c3                   	ret    

00000111 <close>:
SYSCALL(close)
 111:	b8 15 00 00 00       	mov    $0x15,%eax
 116:	cd 40                	int    $0x40
 118:	c3                   	ret    

00000119 <kill>:
SYSCALL(kill)
 119:	b8 06 00 00 00       	mov    $0x6,%eax
 11e:	cd 40                	int    $0x40
 120:	c3                   	ret    

00000121 <exec>:
SYSCALL(exec)
 121:	b8 07 00 00 00       	mov    $0x7,%eax
 126:	cd 40                	int    $0x40
 128:	c3                   	ret    

00000129 <open>:
SYSCALL(open)
 129:	b8 0f 00 00 00       	mov    $0xf,%eax
 12e:	cd 40                	int    $0x40
 130:	c3                   	ret    

00000131 <mknod>:
SYSCALL(mknod)
 131:	b8 11 00 00 00       	mov    $0x11,%eax
 136:	cd 40                	int    $0x40
 138:	c3                   	ret    

00000139 <unlink>:
SYSCALL(unlink)
 139:	b8 12 00 00 00       	mov    $0x12,%eax
 13e:	cd 40                	int    $0x40
 140:	c3                   	ret    

00000141 <fstat>:
SYSCALL(fstat)
 141:	b8 08 00 00 00       	mov    $0x8,%eax
 146:	cd 40                	int    $0x40
 148:	c3                   	ret    

00000149 <link>:
SYSCALL(link)
 149:	b8 13 00 00 00       	mov    $0x13,%eax
 14e:	cd 40                	int    $0x40
 150:	c3                   	ret    

00000151 <mkdir>:
SYSCALL(mkdir)
 151:	b8 14 00 00 00       	mov    $0x14,%eax
 156:	cd 40                	int    $0x40
 158:	c3                   	ret    

00000159 <chdir>:
SYSCALL(chdir)
 159:	b8 09 00 00 00       	mov    $0x9,%eax
 15e:	cd 40                	int    $0x40
 160:	c3                   	ret    

00000161 <dup>:
SYSCALL(dup)
 161:	b8 0a 00 00 00       	mov    $0xa,%eax
 166:	cd 40                	int    $0x40
 168:	c3                   	ret    

00000169 <getpid>:
SYSCALL(getpid)
 169:	b8 0b 00 00 00       	mov    $0xb,%eax
 16e:	cd 40                	int    $0x40
 170:	c3                   	ret    

00000171 <sbrk>:
SYSCALL(sbrk)
 171:	b8 0c 00 00 00       	mov    $0xc,%eax
 176:	cd 40                	int    $0x40
 178:	c3                   	ret    

00000179 <sleep>:
SYSCALL(sleep)
 179:	b8 0d 00 00 00       	mov    $0xd,%eax
 17e:	cd 40                	int    $0x40
 180:	c3                   	ret    

00000181 <uptime>:
SYSCALL(uptime)
 181:	b8 0e 00 00 00       	mov    $0xe,%eax
 186:	cd 40                	int    $0x40
 188:	c3                   	ret    

00000189 <yield>:
SYSCALL(yield)
 189:	b8 16 00 00 00       	mov    $0x16,%eax
 18e:	cd 40                	int    $0x40
 190:	c3                   	ret    

00000191 <shutdown>:
SYSCALL(shutdown)
 191:	b8 17 00 00 00       	mov    $0x17,%eax
 196:	cd 40                	int    $0x40
 198:	c3                   	ret    

00000199 <ps>:
SYSCALL(ps)
 199:	b8 18 00 00 00       	mov    $0x18,%eax
 19e:	cd 40                	int    $0x40
 1a0:	c3                   	ret    

000001a1 <nice>:
 1a1:	b8 1b 00 00 00       	mov    $0x1b,%eax
 1a6:	cd 40                	int    $0x40
 1a8:	c3                   	ret    

000001a9 <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 1a9:	f3 0f 1e fb          	endbr32 
 1ad:	55                   	push   %ebp
 1ae:	89 e5                	mov    %esp,%ebp
 1b0:	8b 45 14             	mov    0x14(%ebp),%eax
 1b3:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 1b6:	3b 45 10             	cmp    0x10(%ebp),%eax
 1b9:	73 06                	jae    1c1 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 1bb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1be:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    

000001c3 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 1c3:	55                   	push   %ebp
 1c4:	89 e5                	mov    %esp,%ebp
 1c6:	57                   	push   %edi
 1c7:	56                   	push   %esi
 1c8:	53                   	push   %ebx
 1c9:	83 ec 08             	sub    $0x8,%esp
 1cc:	89 c6                	mov    %eax,%esi
 1ce:	89 d3                	mov    %edx,%ebx
 1d0:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 1d3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 1d7:	0f 95 c2             	setne  %dl
 1da:	89 c8                	mov    %ecx,%eax
 1dc:	c1 e8 1f             	shr    $0x1f,%eax
 1df:	84 c2                	test   %al,%dl
 1e1:	74 33                	je     216 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 1e3:	89 c8                	mov    %ecx,%eax
 1e5:	f7 d8                	neg    %eax
    neg = 1;
 1e7:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 1ee:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 1f3:	8d 4f 01             	lea    0x1(%edi),%ecx
 1f6:	89 ca                	mov    %ecx,%edx
 1f8:	39 d9                	cmp    %ebx,%ecx
 1fa:	73 26                	jae    222 <s_getReverseDigits+0x5f>
 1fc:	85 c0                	test   %eax,%eax
 1fe:	74 22                	je     222 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 200:	ba 00 00 00 00       	mov    $0x0,%edx
 205:	f7 75 08             	divl   0x8(%ebp)
 208:	0f b6 92 e0 05 00 00 	movzbl 0x5e0(%edx),%edx
 20f:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 212:	89 cf                	mov    %ecx,%edi
 214:	eb dd                	jmp    1f3 <s_getReverseDigits+0x30>
    x = xx;
 216:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 219:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 220:	eb cc                	jmp    1ee <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 222:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 226:	75 0a                	jne    232 <s_getReverseDigits+0x6f>
 228:	39 da                	cmp    %ebx,%edx
 22a:	73 06                	jae    232 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 22c:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 230:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 232:	89 fa                	mov    %edi,%edx
 234:	39 df                	cmp    %ebx,%edi
 236:	0f 92 c0             	setb   %al
 239:	84 45 ec             	test   %al,-0x14(%ebp)
 23c:	74 07                	je     245 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 23e:	83 c7 01             	add    $0x1,%edi
 241:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 245:	89 f8                	mov    %edi,%eax
 247:	83 c4 08             	add    $0x8,%esp
 24a:	5b                   	pop    %ebx
 24b:	5e                   	pop    %esi
 24c:	5f                   	pop    %edi
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    

0000024f <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 24f:	39 c2                	cmp    %eax,%edx
 251:	0f 46 c2             	cmovbe %edx,%eax
}
 254:	c3                   	ret    

00000255 <s_printint>:
{
 255:	55                   	push   %ebp
 256:	89 e5                	mov    %esp,%ebp
 258:	57                   	push   %edi
 259:	56                   	push   %esi
 25a:	53                   	push   %ebx
 25b:	83 ec 2c             	sub    $0x2c,%esp
 25e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 261:	89 55 d0             	mov    %edx,-0x30(%ebp)
 264:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 267:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 26a:	ff 75 14             	pushl  0x14(%ebp)
 26d:	ff 75 10             	pushl  0x10(%ebp)
 270:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 273:	ba 10 00 00 00       	mov    $0x10,%edx
 278:	8d 45 d8             	lea    -0x28(%ebp),%eax
 27b:	e8 43 ff ff ff       	call   1c3 <s_getReverseDigits>
 280:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 283:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 285:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 288:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 28d:	83 eb 01             	sub    $0x1,%ebx
 290:	78 22                	js     2b4 <s_printint+0x5f>
 292:	39 fe                	cmp    %edi,%esi
 294:	73 1e                	jae    2b4 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 296:	83 ec 0c             	sub    $0xc,%esp
 299:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 29e:	50                   	push   %eax
 29f:	56                   	push   %esi
 2a0:	57                   	push   %edi
 2a1:	ff 75 cc             	pushl  -0x34(%ebp)
 2a4:	ff 75 d0             	pushl  -0x30(%ebp)
 2a7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 2aa:	ff d0                	call   *%eax
    j++;
 2ac:	83 c6 01             	add    $0x1,%esi
 2af:	83 c4 20             	add    $0x20,%esp
 2b2:	eb d9                	jmp    28d <s_printint+0x38>
}
 2b4:	8b 45 c8             	mov    -0x38(%ebp),%eax
 2b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ba:	5b                   	pop    %ebx
 2bb:	5e                   	pop    %esi
 2bc:	5f                   	pop    %edi
 2bd:	5d                   	pop    %ebp
 2be:	c3                   	ret    

000002bf <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 2bf:	55                   	push   %ebp
 2c0:	89 e5                	mov    %esp,%ebp
 2c2:	57                   	push   %edi
 2c3:	56                   	push   %esi
 2c4:	53                   	push   %ebx
 2c5:	83 ec 2c             	sub    $0x2c,%esp
 2c8:	89 45 d8             	mov    %eax,-0x28(%ebp)
 2cb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 2ce:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 2d7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 2de:	bb 00 00 00 00       	mov    $0x0,%ebx
 2e3:	89 f8                	mov    %edi,%eax
 2e5:	89 df                	mov    %ebx,%edi
 2e7:	89 c6                	mov    %eax,%esi
 2e9:	eb 20                	jmp    30b <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 2eb:	8d 43 01             	lea    0x1(%ebx),%eax
 2ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
 2f1:	83 ec 0c             	sub    $0xc,%esp
 2f4:	51                   	push   %ecx
 2f5:	53                   	push   %ebx
 2f6:	56                   	push   %esi
 2f7:	ff 75 d0             	pushl  -0x30(%ebp)
 2fa:	ff 75 d4             	pushl  -0x2c(%ebp)
 2fd:	8b 55 d8             	mov    -0x28(%ebp),%edx
 300:	ff d2                	call   *%edx
 302:	83 c4 20             	add    $0x20,%esp
 305:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 308:	83 c7 01             	add    $0x1,%edi
 30b:	8b 45 0c             	mov    0xc(%ebp),%eax
 30e:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 312:	84 c0                	test   %al,%al
 314:	0f 84 cd 01 00 00    	je     4e7 <s_printf+0x228>
 31a:	89 75 e0             	mov    %esi,-0x20(%ebp)
 31d:	39 de                	cmp    %ebx,%esi
 31f:	0f 86 c2 01 00 00    	jbe    4e7 <s_printf+0x228>
    c = fmt[i] & 0xff;
 325:	0f be c8             	movsbl %al,%ecx
 328:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 32b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 32e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 332:	75 0a                	jne    33e <s_printf+0x7f>
      if(c == '%') {
 334:	83 f8 25             	cmp    $0x25,%eax
 337:	75 b2                	jne    2eb <s_printf+0x2c>
        state = '%';
 339:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 33c:	eb ca                	jmp    308 <s_printf+0x49>
      }
    } else if(state == '%'){
 33e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 342:	75 c4                	jne    308 <s_printf+0x49>
      if(c == 'd'){
 344:	83 f8 64             	cmp    $0x64,%eax
 347:	74 6e                	je     3b7 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 349:	83 f8 78             	cmp    $0x78,%eax
 34c:	0f 94 c1             	sete   %cl
 34f:	83 f8 70             	cmp    $0x70,%eax
 352:	0f 94 c2             	sete   %dl
 355:	08 d1                	or     %dl,%cl
 357:	0f 85 8e 00 00 00    	jne    3eb <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 35d:	83 f8 73             	cmp    $0x73,%eax
 360:	0f 84 b9 00 00 00    	je     41f <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 366:	83 f8 63             	cmp    $0x63,%eax
 369:	0f 84 1a 01 00 00    	je     489 <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 36f:	83 f8 25             	cmp    $0x25,%eax
 372:	0f 84 44 01 00 00    	je     4bc <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 378:	8d 43 01             	lea    0x1(%ebx),%eax
 37b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 37e:	83 ec 0c             	sub    $0xc,%esp
 381:	6a 25                	push   $0x25
 383:	53                   	push   %ebx
 384:	56                   	push   %esi
 385:	ff 75 d0             	pushl  -0x30(%ebp)
 388:	ff 75 d4             	pushl  -0x2c(%ebp)
 38b:	8b 45 d8             	mov    -0x28(%ebp),%eax
 38e:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 390:	83 c3 02             	add    $0x2,%ebx
 393:	83 c4 14             	add    $0x14,%esp
 396:	ff 75 dc             	pushl  -0x24(%ebp)
 399:	ff 75 e4             	pushl  -0x1c(%ebp)
 39c:	56                   	push   %esi
 39d:	ff 75 d0             	pushl  -0x30(%ebp)
 3a0:	ff 75 d4             	pushl  -0x2c(%ebp)
 3a3:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3a6:	ff d0                	call   *%eax
 3a8:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 3ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3b2:	e9 51 ff ff ff       	jmp    308 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 3b7:	8b 45 d0             	mov    -0x30(%ebp),%eax
 3ba:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 3bd:	6a 01                	push   $0x1
 3bf:	6a 0a                	push   $0xa
 3c1:	8b 45 10             	mov    0x10(%ebp),%eax
 3c4:	ff 30                	pushl  (%eax)
 3c6:	89 f0                	mov    %esi,%eax
 3c8:	29 d8                	sub    %ebx,%eax
 3ca:	50                   	push   %eax
 3cb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 3ce:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3d1:	e8 7f fe ff ff       	call   255 <s_printint>
 3d6:	01 c3                	add    %eax,%ebx
        ap++;
 3d8:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 3dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3df:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3e6:	e9 1d ff ff ff       	jmp    308 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 3eb:	8b 45 d0             	mov    -0x30(%ebp),%eax
 3ee:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 3f1:	6a 00                	push   $0x0
 3f3:	6a 10                	push   $0x10
 3f5:	8b 45 10             	mov    0x10(%ebp),%eax
 3f8:	ff 30                	pushl  (%eax)
 3fa:	89 f0                	mov    %esi,%eax
 3fc:	29 d8                	sub    %ebx,%eax
 3fe:	50                   	push   %eax
 3ff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 402:	8b 45 d8             	mov    -0x28(%ebp),%eax
 405:	e8 4b fe ff ff       	call   255 <s_printint>
 40a:	01 c3                	add    %eax,%ebx
        ap++;
 40c:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 410:	83 c4 10             	add    $0x10,%esp
      state = 0;
 413:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 41a:	e9 e9 fe ff ff       	jmp    308 <s_printf+0x49>
        s = (char*)*ap;
 41f:	8b 45 10             	mov    0x10(%ebp),%eax
 422:	8b 00                	mov    (%eax),%eax
        ap++;
 424:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 428:	85 c0                	test   %eax,%eax
 42a:	75 4e                	jne    47a <s_printf+0x1bb>
          s = "(null)";
 42c:	b8 d8 05 00 00       	mov    $0x5d8,%eax
 431:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 434:	89 da                	mov    %ebx,%edx
 436:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 439:	89 75 e0             	mov    %esi,-0x20(%ebp)
 43c:	89 c6                	mov    %eax,%esi
 43e:	eb 1f                	jmp    45f <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 440:	8d 7a 01             	lea    0x1(%edx),%edi
 443:	83 ec 0c             	sub    $0xc,%esp
 446:	0f be c0             	movsbl %al,%eax
 449:	50                   	push   %eax
 44a:	52                   	push   %edx
 44b:	53                   	push   %ebx
 44c:	ff 75 d0             	pushl  -0x30(%ebp)
 44f:	ff 75 d4             	pushl  -0x2c(%ebp)
 452:	8b 45 d8             	mov    -0x28(%ebp),%eax
 455:	ff d0                	call   *%eax
          s++;
 457:	83 c6 01             	add    $0x1,%esi
 45a:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 45d:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 45f:	0f b6 06             	movzbl (%esi),%eax
 462:	84 c0                	test   %al,%al
 464:	75 da                	jne    440 <s_printf+0x181>
 466:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 469:	89 d3                	mov    %edx,%ebx
 46b:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 46e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 475:	e9 8e fe ff ff       	jmp    308 <s_printf+0x49>
 47a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 47d:	89 da                	mov    %ebx,%edx
 47f:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 482:	89 75 e0             	mov    %esi,-0x20(%ebp)
 485:	89 c6                	mov    %eax,%esi
 487:	eb d6                	jmp    45f <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 489:	8d 43 01             	lea    0x1(%ebx),%eax
 48c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 48f:	83 ec 0c             	sub    $0xc,%esp
 492:	8b 55 10             	mov    0x10(%ebp),%edx
 495:	0f be 02             	movsbl (%edx),%eax
 498:	50                   	push   %eax
 499:	53                   	push   %ebx
 49a:	56                   	push   %esi
 49b:	ff 75 d0             	pushl  -0x30(%ebp)
 49e:	ff 75 d4             	pushl  -0x2c(%ebp)
 4a1:	8b 55 d8             	mov    -0x28(%ebp),%edx
 4a4:	ff d2                	call   *%edx
        ap++;
 4a6:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 4aa:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 4ad:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 4b0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4b7:	e9 4c fe ff ff       	jmp    308 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 4bc:	8d 43 01             	lea    0x1(%ebx),%eax
 4bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4c2:	83 ec 0c             	sub    $0xc,%esp
 4c5:	ff 75 dc             	pushl  -0x24(%ebp)
 4c8:	53                   	push   %ebx
 4c9:	56                   	push   %esi
 4ca:	ff 75 d0             	pushl  -0x30(%ebp)
 4cd:	ff 75 d4             	pushl  -0x2c(%ebp)
 4d0:	8b 55 d8             	mov    -0x28(%ebp),%edx
 4d3:	ff d2                	call   *%edx
 4d5:	83 c4 20             	add    $0x20,%esp
 4d8:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 4db:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4e2:	e9 21 fe ff ff       	jmp    308 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 4e7:	89 da                	mov    %ebx,%edx
 4e9:	89 f0                	mov    %esi,%eax
 4eb:	e8 5f fd ff ff       	call   24f <s_min>
}
 4f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f3:	5b                   	pop    %ebx
 4f4:	5e                   	pop    %esi
 4f5:	5f                   	pop    %edi
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    

000004f8 <s_putc>:
{
 4f8:	f3 0f 1e fb          	endbr32 
 4fc:	55                   	push   %ebp
 4fd:	89 e5                	mov    %esp,%ebp
 4ff:	83 ec 1c             	sub    $0x1c,%esp
 502:	8b 45 18             	mov    0x18(%ebp),%eax
 505:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 508:	6a 01                	push   $0x1
 50a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 50d:	50                   	push   %eax
 50e:	ff 75 08             	pushl  0x8(%ebp)
 511:	e8 f3 fb ff ff       	call   109 <write>
}
 516:	83 c4 10             	add    $0x10,%esp
 519:	c9                   	leave  
 51a:	c3                   	ret    

0000051b <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 51b:	f3 0f 1e fb          	endbr32 
 51f:	55                   	push   %ebp
 520:	89 e5                	mov    %esp,%ebp
 522:	56                   	push   %esi
 523:	53                   	push   %ebx
 524:	8b 75 08             	mov    0x8(%ebp),%esi
 527:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 52a:	83 ec 04             	sub    $0x4,%esp
 52d:	8d 45 14             	lea    0x14(%ebp),%eax
 530:	50                   	push   %eax
 531:	ff 75 10             	pushl  0x10(%ebp)
 534:	53                   	push   %ebx
 535:	89 f1                	mov    %esi,%ecx
 537:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 53c:	b8 a9 01 00 00       	mov    $0x1a9,%eax
 541:	e8 79 fd ff ff       	call   2bf <s_printf>
  if(count < n) {
 546:	83 c4 10             	add    $0x10,%esp
 549:	39 c3                	cmp    %eax,%ebx
 54b:	76 04                	jbe    551 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 54d:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 551:	8d 65 f8             	lea    -0x8(%ebp),%esp
 554:	5b                   	pop    %ebx
 555:	5e                   	pop    %esi
 556:	5d                   	pop    %ebp
 557:	c3                   	ret    

00000558 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 558:	f3 0f 1e fb          	endbr32 
 55c:	55                   	push   %ebp
 55d:	89 e5                	mov    %esp,%ebp
 55f:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 562:	8d 45 10             	lea    0x10(%ebp),%eax
 565:	50                   	push   %eax
 566:	ff 75 0c             	pushl  0xc(%ebp)
 569:	68 00 00 00 40       	push   $0x40000000
 56e:	b9 00 00 00 00       	mov    $0x0,%ecx
 573:	8b 55 08             	mov    0x8(%ebp),%edx
 576:	b8 f8 04 00 00       	mov    $0x4f8,%eax
 57b:	e8 3f fd ff ff       	call   2bf <s_printf>
}
 580:	83 c4 10             	add    $0x10,%esp
 583:	c9                   	leave  
 584:	c3                   	ret    
