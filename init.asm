
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
  18:	68 98 05 00 00       	push   $0x598
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
  45:	68 a0 05 00 00       	push   $0x5a0
  4a:	6a 01                	push   $0x1
  4c:	e8 17 05 00 00       	call   568 <printf>
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
  71:	68 df 05 00 00       	push   $0x5df
  76:	6a 01                	push   $0x1
  78:	e8 eb 04 00 00       	call   568 <printf>
  7d:	83 c4 10             	add    $0x10,%esp
  80:	eb df                	jmp    61 <main+0x61>
    mknod("console", 1, 1);
  82:	83 ec 04             	sub    $0x4,%esp
  85:	6a 01                	push   $0x1
  87:	6a 01                	push   $0x1
  89:	68 98 05 00 00       	push   $0x598
  8e:	e8 9e 00 00 00       	call   131 <mknod>
    open("console", O_RDWR);
  93:	83 c4 08             	add    $0x8,%esp
  96:	6a 02                	push   $0x2
  98:	68 98 05 00 00       	push   $0x598
  9d:	e8 87 00 00 00       	call   129 <open>
  a2:	83 c4 10             	add    $0x10,%esp
  a5:	eb 82                	jmp    29 <main+0x29>
      printf(1, "init: fork failed\n");
  a7:	83 ec 08             	sub    $0x8,%esp
  aa:	68 b3 05 00 00       	push   $0x5b3
  af:	6a 01                	push   $0x1
  b1:	e8 b2 04 00 00       	call   568 <printf>
      exit();
  b6:	e8 2e 00 00 00       	call   e9 <exit>
      exec("sh", argv);
  bb:	83 ec 08             	sub    $0x8,%esp
  be:	68 04 06 00 00       	push   $0x604
  c3:	68 c6 05 00 00       	push   $0x5c6
  c8:	e8 54 00 00 00       	call   121 <exec>
      printf(1, "init: exec sh failed\n");
  cd:	83 c4 08             	add    $0x8,%esp
  d0:	68 c9 05 00 00       	push   $0x5c9
  d5:	6a 01                	push   $0x1
  d7:	e8 8c 04 00 00       	call   568 <printf>
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
SYSCALL(nice)
 1a1:	b8 1b 00 00 00       	mov    $0x1b,%eax
 1a6:	cd 40                	int    $0x40
 1a8:	c3                   	ret    

000001a9 <flock>:
SYSCALL(flock)
 1a9:	b8 19 00 00 00       	mov    $0x19,%eax
 1ae:	cd 40                	int    $0x40
 1b0:	c3                   	ret    

000001b1 <funlock>:
 1b1:	b8 1a 00 00 00       	mov    $0x1a,%eax
 1b6:	cd 40                	int    $0x40
 1b8:	c3                   	ret    

000001b9 <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 1b9:	f3 0f 1e fb          	endbr32 
 1bd:	55                   	push   %ebp
 1be:	89 e5                	mov    %esp,%ebp
 1c0:	8b 45 14             	mov    0x14(%ebp),%eax
 1c3:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 1c6:	3b 45 10             	cmp    0x10(%ebp),%eax
 1c9:	73 06                	jae    1d1 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 1cb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1ce:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 1d1:	5d                   	pop    %ebp
 1d2:	c3                   	ret    

000001d3 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 1d3:	55                   	push   %ebp
 1d4:	89 e5                	mov    %esp,%ebp
 1d6:	57                   	push   %edi
 1d7:	56                   	push   %esi
 1d8:	53                   	push   %ebx
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	89 c6                	mov    %eax,%esi
 1de:	89 d3                	mov    %edx,%ebx
 1e0:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 1e3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 1e7:	0f 95 c2             	setne  %dl
 1ea:	89 c8                	mov    %ecx,%eax
 1ec:	c1 e8 1f             	shr    $0x1f,%eax
 1ef:	84 c2                	test   %al,%dl
 1f1:	74 33                	je     226 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	f7 d8                	neg    %eax
    neg = 1;
 1f7:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 1fe:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 203:	8d 4f 01             	lea    0x1(%edi),%ecx
 206:	89 ca                	mov    %ecx,%edx
 208:	39 d9                	cmp    %ebx,%ecx
 20a:	73 26                	jae    232 <s_getReverseDigits+0x5f>
 20c:	85 c0                	test   %eax,%eax
 20e:	74 22                	je     232 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 210:	ba 00 00 00 00       	mov    $0x0,%edx
 215:	f7 75 08             	divl   0x8(%ebp)
 218:	0f b6 92 f0 05 00 00 	movzbl 0x5f0(%edx),%edx
 21f:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 222:	89 cf                	mov    %ecx,%edi
 224:	eb dd                	jmp    203 <s_getReverseDigits+0x30>
    x = xx;
 226:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 229:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 230:	eb cc                	jmp    1fe <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 232:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 236:	75 0a                	jne    242 <s_getReverseDigits+0x6f>
 238:	39 da                	cmp    %ebx,%edx
 23a:	73 06                	jae    242 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 23c:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 240:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 242:	89 fa                	mov    %edi,%edx
 244:	39 df                	cmp    %ebx,%edi
 246:	0f 92 c0             	setb   %al
 249:	84 45 ec             	test   %al,-0x14(%ebp)
 24c:	74 07                	je     255 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 24e:	83 c7 01             	add    $0x1,%edi
 251:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 255:	89 f8                	mov    %edi,%eax
 257:	83 c4 08             	add    $0x8,%esp
 25a:	5b                   	pop    %ebx
 25b:	5e                   	pop    %esi
 25c:	5f                   	pop    %edi
 25d:	5d                   	pop    %ebp
 25e:	c3                   	ret    

0000025f <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 25f:	39 c2                	cmp    %eax,%edx
 261:	0f 46 c2             	cmovbe %edx,%eax
}
 264:	c3                   	ret    

00000265 <s_printint>:
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	57                   	push   %edi
 269:	56                   	push   %esi
 26a:	53                   	push   %ebx
 26b:	83 ec 2c             	sub    $0x2c,%esp
 26e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 271:	89 55 d0             	mov    %edx,-0x30(%ebp)
 274:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 277:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 27a:	ff 75 14             	pushl  0x14(%ebp)
 27d:	ff 75 10             	pushl  0x10(%ebp)
 280:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 283:	ba 10 00 00 00       	mov    $0x10,%edx
 288:	8d 45 d8             	lea    -0x28(%ebp),%eax
 28b:	e8 43 ff ff ff       	call   1d3 <s_getReverseDigits>
 290:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 293:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 295:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 298:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 29d:	83 eb 01             	sub    $0x1,%ebx
 2a0:	78 22                	js     2c4 <s_printint+0x5f>
 2a2:	39 fe                	cmp    %edi,%esi
 2a4:	73 1e                	jae    2c4 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 2a6:	83 ec 0c             	sub    $0xc,%esp
 2a9:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 2ae:	50                   	push   %eax
 2af:	56                   	push   %esi
 2b0:	57                   	push   %edi
 2b1:	ff 75 cc             	pushl  -0x34(%ebp)
 2b4:	ff 75 d0             	pushl  -0x30(%ebp)
 2b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 2ba:	ff d0                	call   *%eax
    j++;
 2bc:	83 c6 01             	add    $0x1,%esi
 2bf:	83 c4 20             	add    $0x20,%esp
 2c2:	eb d9                	jmp    29d <s_printint+0x38>
}
 2c4:	8b 45 c8             	mov    -0x38(%ebp),%eax
 2c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ca:	5b                   	pop    %ebx
 2cb:	5e                   	pop    %esi
 2cc:	5f                   	pop    %edi
 2cd:	5d                   	pop    %ebp
 2ce:	c3                   	ret    

000002cf <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 2cf:	55                   	push   %ebp
 2d0:	89 e5                	mov    %esp,%ebp
 2d2:	57                   	push   %edi
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
 2d5:	83 ec 2c             	sub    $0x2c,%esp
 2d8:	89 45 d8             	mov    %eax,-0x28(%ebp)
 2db:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 2de:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 2e7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 2ee:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f3:	89 f8                	mov    %edi,%eax
 2f5:	89 df                	mov    %ebx,%edi
 2f7:	89 c6                	mov    %eax,%esi
 2f9:	eb 20                	jmp    31b <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 2fb:	8d 43 01             	lea    0x1(%ebx),%eax
 2fe:	89 45 e0             	mov    %eax,-0x20(%ebp)
 301:	83 ec 0c             	sub    $0xc,%esp
 304:	51                   	push   %ecx
 305:	53                   	push   %ebx
 306:	56                   	push   %esi
 307:	ff 75 d0             	pushl  -0x30(%ebp)
 30a:	ff 75 d4             	pushl  -0x2c(%ebp)
 30d:	8b 55 d8             	mov    -0x28(%ebp),%edx
 310:	ff d2                	call   *%edx
 312:	83 c4 20             	add    $0x20,%esp
 315:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 318:	83 c7 01             	add    $0x1,%edi
 31b:	8b 45 0c             	mov    0xc(%ebp),%eax
 31e:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 322:	84 c0                	test   %al,%al
 324:	0f 84 cd 01 00 00    	je     4f7 <s_printf+0x228>
 32a:	89 75 e0             	mov    %esi,-0x20(%ebp)
 32d:	39 de                	cmp    %ebx,%esi
 32f:	0f 86 c2 01 00 00    	jbe    4f7 <s_printf+0x228>
    c = fmt[i] & 0xff;
 335:	0f be c8             	movsbl %al,%ecx
 338:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 33b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 33e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 342:	75 0a                	jne    34e <s_printf+0x7f>
      if(c == '%') {
 344:	83 f8 25             	cmp    $0x25,%eax
 347:	75 b2                	jne    2fb <s_printf+0x2c>
        state = '%';
 349:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 34c:	eb ca                	jmp    318 <s_printf+0x49>
      }
    } else if(state == '%'){
 34e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 352:	75 c4                	jne    318 <s_printf+0x49>
      if(c == 'd'){
 354:	83 f8 64             	cmp    $0x64,%eax
 357:	74 6e                	je     3c7 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 359:	83 f8 78             	cmp    $0x78,%eax
 35c:	0f 94 c1             	sete   %cl
 35f:	83 f8 70             	cmp    $0x70,%eax
 362:	0f 94 c2             	sete   %dl
 365:	08 d1                	or     %dl,%cl
 367:	0f 85 8e 00 00 00    	jne    3fb <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 36d:	83 f8 73             	cmp    $0x73,%eax
 370:	0f 84 b9 00 00 00    	je     42f <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 376:	83 f8 63             	cmp    $0x63,%eax
 379:	0f 84 1a 01 00 00    	je     499 <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 37f:	83 f8 25             	cmp    $0x25,%eax
 382:	0f 84 44 01 00 00    	je     4cc <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 388:	8d 43 01             	lea    0x1(%ebx),%eax
 38b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 38e:	83 ec 0c             	sub    $0xc,%esp
 391:	6a 25                	push   $0x25
 393:	53                   	push   %ebx
 394:	56                   	push   %esi
 395:	ff 75 d0             	pushl  -0x30(%ebp)
 398:	ff 75 d4             	pushl  -0x2c(%ebp)
 39b:	8b 45 d8             	mov    -0x28(%ebp),%eax
 39e:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 3a0:	83 c3 02             	add    $0x2,%ebx
 3a3:	83 c4 14             	add    $0x14,%esp
 3a6:	ff 75 dc             	pushl  -0x24(%ebp)
 3a9:	ff 75 e4             	pushl  -0x1c(%ebp)
 3ac:	56                   	push   %esi
 3ad:	ff 75 d0             	pushl  -0x30(%ebp)
 3b0:	ff 75 d4             	pushl  -0x2c(%ebp)
 3b3:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3b6:	ff d0                	call   *%eax
 3b8:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 3bb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3c2:	e9 51 ff ff ff       	jmp    318 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 3c7:	8b 45 d0             	mov    -0x30(%ebp),%eax
 3ca:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 3cd:	6a 01                	push   $0x1
 3cf:	6a 0a                	push   $0xa
 3d1:	8b 45 10             	mov    0x10(%ebp),%eax
 3d4:	ff 30                	pushl  (%eax)
 3d6:	89 f0                	mov    %esi,%eax
 3d8:	29 d8                	sub    %ebx,%eax
 3da:	50                   	push   %eax
 3db:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 3de:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3e1:	e8 7f fe ff ff       	call   265 <s_printint>
 3e6:	01 c3                	add    %eax,%ebx
        ap++;
 3e8:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 3ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3ef:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3f6:	e9 1d ff ff ff       	jmp    318 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 3fb:	8b 45 d0             	mov    -0x30(%ebp),%eax
 3fe:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 401:	6a 00                	push   $0x0
 403:	6a 10                	push   $0x10
 405:	8b 45 10             	mov    0x10(%ebp),%eax
 408:	ff 30                	pushl  (%eax)
 40a:	89 f0                	mov    %esi,%eax
 40c:	29 d8                	sub    %ebx,%eax
 40e:	50                   	push   %eax
 40f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 412:	8b 45 d8             	mov    -0x28(%ebp),%eax
 415:	e8 4b fe ff ff       	call   265 <s_printint>
 41a:	01 c3                	add    %eax,%ebx
        ap++;
 41c:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 420:	83 c4 10             	add    $0x10,%esp
      state = 0;
 423:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 42a:	e9 e9 fe ff ff       	jmp    318 <s_printf+0x49>
        s = (char*)*ap;
 42f:	8b 45 10             	mov    0x10(%ebp),%eax
 432:	8b 00                	mov    (%eax),%eax
        ap++;
 434:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 438:	85 c0                	test   %eax,%eax
 43a:	75 4e                	jne    48a <s_printf+0x1bb>
          s = "(null)";
 43c:	b8 e8 05 00 00       	mov    $0x5e8,%eax
 441:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 444:	89 da                	mov    %ebx,%edx
 446:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 449:	89 75 e0             	mov    %esi,-0x20(%ebp)
 44c:	89 c6                	mov    %eax,%esi
 44e:	eb 1f                	jmp    46f <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 450:	8d 7a 01             	lea    0x1(%edx),%edi
 453:	83 ec 0c             	sub    $0xc,%esp
 456:	0f be c0             	movsbl %al,%eax
 459:	50                   	push   %eax
 45a:	52                   	push   %edx
 45b:	53                   	push   %ebx
 45c:	ff 75 d0             	pushl  -0x30(%ebp)
 45f:	ff 75 d4             	pushl  -0x2c(%ebp)
 462:	8b 45 d8             	mov    -0x28(%ebp),%eax
 465:	ff d0                	call   *%eax
          s++;
 467:	83 c6 01             	add    $0x1,%esi
 46a:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 46d:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 46f:	0f b6 06             	movzbl (%esi),%eax
 472:	84 c0                	test   %al,%al
 474:	75 da                	jne    450 <s_printf+0x181>
 476:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 479:	89 d3                	mov    %edx,%ebx
 47b:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 47e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 485:	e9 8e fe ff ff       	jmp    318 <s_printf+0x49>
 48a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 48d:	89 da                	mov    %ebx,%edx
 48f:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 492:	89 75 e0             	mov    %esi,-0x20(%ebp)
 495:	89 c6                	mov    %eax,%esi
 497:	eb d6                	jmp    46f <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 499:	8d 43 01             	lea    0x1(%ebx),%eax
 49c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 49f:	83 ec 0c             	sub    $0xc,%esp
 4a2:	8b 55 10             	mov    0x10(%ebp),%edx
 4a5:	0f be 02             	movsbl (%edx),%eax
 4a8:	50                   	push   %eax
 4a9:	53                   	push   %ebx
 4aa:	56                   	push   %esi
 4ab:	ff 75 d0             	pushl  -0x30(%ebp)
 4ae:	ff 75 d4             	pushl  -0x2c(%ebp)
 4b1:	8b 55 d8             	mov    -0x28(%ebp),%edx
 4b4:	ff d2                	call   *%edx
        ap++;
 4b6:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 4ba:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 4bd:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 4c0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4c7:	e9 4c fe ff ff       	jmp    318 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 4cc:	8d 43 01             	lea    0x1(%ebx),%eax
 4cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4d2:	83 ec 0c             	sub    $0xc,%esp
 4d5:	ff 75 dc             	pushl  -0x24(%ebp)
 4d8:	53                   	push   %ebx
 4d9:	56                   	push   %esi
 4da:	ff 75 d0             	pushl  -0x30(%ebp)
 4dd:	ff 75 d4             	pushl  -0x2c(%ebp)
 4e0:	8b 55 d8             	mov    -0x28(%ebp),%edx
 4e3:	ff d2                	call   *%edx
 4e5:	83 c4 20             	add    $0x20,%esp
 4e8:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 4eb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4f2:	e9 21 fe ff ff       	jmp    318 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 4f7:	89 da                	mov    %ebx,%edx
 4f9:	89 f0                	mov    %esi,%eax
 4fb:	e8 5f fd ff ff       	call   25f <s_min>
}
 500:	8d 65 f4             	lea    -0xc(%ebp),%esp
 503:	5b                   	pop    %ebx
 504:	5e                   	pop    %esi
 505:	5f                   	pop    %edi
 506:	5d                   	pop    %ebp
 507:	c3                   	ret    

00000508 <s_putc>:
{
 508:	f3 0f 1e fb          	endbr32 
 50c:	55                   	push   %ebp
 50d:	89 e5                	mov    %esp,%ebp
 50f:	83 ec 1c             	sub    $0x1c,%esp
 512:	8b 45 18             	mov    0x18(%ebp),%eax
 515:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 518:	6a 01                	push   $0x1
 51a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 51d:	50                   	push   %eax
 51e:	ff 75 08             	pushl  0x8(%ebp)
 521:	e8 e3 fb ff ff       	call   109 <write>
}
 526:	83 c4 10             	add    $0x10,%esp
 529:	c9                   	leave  
 52a:	c3                   	ret    

0000052b <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 52b:	f3 0f 1e fb          	endbr32 
 52f:	55                   	push   %ebp
 530:	89 e5                	mov    %esp,%ebp
 532:	56                   	push   %esi
 533:	53                   	push   %ebx
 534:	8b 75 08             	mov    0x8(%ebp),%esi
 537:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 53a:	83 ec 04             	sub    $0x4,%esp
 53d:	8d 45 14             	lea    0x14(%ebp),%eax
 540:	50                   	push   %eax
 541:	ff 75 10             	pushl  0x10(%ebp)
 544:	53                   	push   %ebx
 545:	89 f1                	mov    %esi,%ecx
 547:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 54c:	b8 b9 01 00 00       	mov    $0x1b9,%eax
 551:	e8 79 fd ff ff       	call   2cf <s_printf>
  if(count < n) {
 556:	83 c4 10             	add    $0x10,%esp
 559:	39 c3                	cmp    %eax,%ebx
 55b:	76 04                	jbe    561 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 55d:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 561:	8d 65 f8             	lea    -0x8(%ebp),%esp
 564:	5b                   	pop    %ebx
 565:	5e                   	pop    %esi
 566:	5d                   	pop    %ebp
 567:	c3                   	ret    

00000568 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 568:	f3 0f 1e fb          	endbr32 
 56c:	55                   	push   %ebp
 56d:	89 e5                	mov    %esp,%ebp
 56f:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 572:	8d 45 10             	lea    0x10(%ebp),%eax
 575:	50                   	push   %eax
 576:	ff 75 0c             	pushl  0xc(%ebp)
 579:	68 00 00 00 40       	push   $0x40000000
 57e:	b9 00 00 00 00       	mov    $0x0,%ecx
 583:	8b 55 08             	mov    0x8(%ebp),%edx
 586:	b8 08 05 00 00       	mov    $0x508,%eax
 58b:	e8 3f fd ff ff       	call   2cf <s_printf>
}
 590:	83 c4 10             	add    $0x10,%esp
 593:	c9                   	leave  
 594:	c3                   	ret    
