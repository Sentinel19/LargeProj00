
_snprintftest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#define bufferSizeBytes (512)
static char buf[bufferSizeBytes];

int
main(int argc, char *argv[])
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
  15:	83 ec 1c             	sub    $0x1c,%esp
  18:	8b 39                	mov    (%ecx),%edi
  1a:	8b 41 04             	mov    0x4(%ecx),%eax
  1d:	89 c6                	mov    %eax,%esi
  1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  snprintf(buf, bufferSizeBytes, "Hello, World\n");
  22:	68 dc 06 00 00       	push   $0x6dc
  27:	68 00 02 00 00       	push   $0x200
  2c:	68 40 07 00 00       	push   $0x740
  31:	e8 3b 06 00 00       	call   671 <snprintf>
  printf(1, "%s", buf);
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 40 07 00 00       	push   $0x740
  3e:	68 ea 06 00 00       	push   $0x6ea
  43:	6a 01                	push   $0x1
  45:	e8 64 06 00 00       	call   6ae <printf>
  snprintf(buf, bufferSizeBytes, "%d\n", argc);
  4a:	57                   	push   %edi
  4b:	68 f5 06 00 00       	push   $0x6f5
  50:	68 00 02 00 00       	push   $0x200
  55:	68 40 07 00 00       	push   $0x740
  5a:	e8 12 06 00 00       	call   671 <snprintf>
  printf(1, "%s", buf);
  5f:	83 c4 1c             	add    $0x1c,%esp
  62:	68 40 07 00 00       	push   $0x740
  67:	68 ea 06 00 00       	push   $0x6ea
  6c:	6a 01                	push   $0x1
  6e:	e8 3b 06 00 00       	call   6ae <printf>
  snprintf(buf, bufferSizeBytes, "%x\n", argc);
  73:	57                   	push   %edi
  74:	68 f0 06 00 00       	push   $0x6f0
  79:	68 00 02 00 00       	push   $0x200
  7e:	68 40 07 00 00       	push   $0x740
  83:	e8 e9 05 00 00       	call   671 <snprintf>
  printf(1, "%s", buf);
  88:	83 c4 1c             	add    $0x1c,%esp
  8b:	68 40 07 00 00       	push   $0x740
  90:	68 ea 06 00 00       	push   $0x6ea
  95:	6a 01                	push   $0x1
  97:	e8 12 06 00 00       	call   6ae <printf>
  snprintf(buf, 6, "Hello, World\n");
  9c:	83 c4 0c             	add    $0xc,%esp
  9f:	68 dc 06 00 00       	push   $0x6dc
  a4:	6a 06                	push   $0x6
  a6:	68 40 07 00 00       	push   $0x740
  ab:	e8 c1 05 00 00       	call   671 <snprintf>
  printf(1, "%s", buf);
  b0:	83 c4 0c             	add    $0xc,%esp
  b3:	68 40 07 00 00       	push   $0x740
  b8:	68 ea 06 00 00       	push   $0x6ea
  bd:	6a 01                	push   $0x1
  bf:	e8 ea 05 00 00       	call   6ae <printf>
  snprintf(buf, 12, "\n0x%x\n", 0xcafebabe);
  c4:	68 be ba fe ca       	push   $0xcafebabe
  c9:	68 ed 06 00 00       	push   $0x6ed
  ce:	6a 0c                	push   $0xc
  d0:	68 40 07 00 00       	push   $0x740
  d5:	e8 97 05 00 00       	call   671 <snprintf>
  printf(1, "%s", buf);
  da:	83 c4 1c             	add    $0x1c,%esp
  dd:	68 40 07 00 00       	push   $0x740
  e2:	68 ea 06 00 00       	push   $0x6ea
  e7:	6a 01                	push   $0x1
  e9:	e8 c0 05 00 00       	call   6ae <printf>
  snprintf(buf, 6, "\n0x%x\n", 0xcafebabe);
  ee:	68 be ba fe ca       	push   $0xcafebabe
  f3:	68 ed 06 00 00       	push   $0x6ed
  f8:	6a 06                	push   $0x6
  fa:	68 40 07 00 00       	push   $0x740
  ff:	e8 6d 05 00 00       	call   671 <snprintf>
  printf(1, "%s", buf);
 104:	83 c4 1c             	add    $0x1c,%esp
 107:	68 40 07 00 00       	push   $0x740
 10c:	68 ea 06 00 00       	push   $0x6ea
 111:	6a 01                	push   $0x1
 113:	e8 96 05 00 00       	call   6ae <printf>
  snprintf(buf, 0, "\n0x%x\n", 0xdeadbeef);
 118:	68 ef be ad de       	push   $0xdeadbeef
 11d:	68 ed 06 00 00       	push   $0x6ed
 122:	6a 00                	push   $0x0
 124:	68 40 07 00 00       	push   $0x740
 129:	e8 43 05 00 00       	call   671 <snprintf>
  printf(1, "%s", buf);
 12e:	83 c4 1c             	add    $0x1c,%esp
 131:	68 40 07 00 00       	push   $0x740
 136:	68 ea 06 00 00       	push   $0x6ea
 13b:	6a 01                	push   $0x1
 13d:	e8 6c 05 00 00       	call   6ae <printf>
  snprintf(buf, bufferSizeBytes, "\n%d\n", 0xdeadbeef);
 142:	68 ef be ad de       	push   $0xdeadbeef
 147:	68 f4 06 00 00       	push   $0x6f4
 14c:	68 00 02 00 00       	push   $0x200
 151:	68 40 07 00 00       	push   $0x740
 156:	e8 16 05 00 00       	call   671 <snprintf>
  printf(1, "%s", buf);
 15b:	83 c4 1c             	add    $0x1c,%esp
 15e:	68 40 07 00 00       	push   $0x740
 163:	68 ea 06 00 00       	push   $0x6ea
 168:	6a 01                	push   $0x1
 16a:	e8 3f 05 00 00       	call   6ae <printf>

  snprintf(buf, bufferSizeBytes, "\nprogram is <%s>\n", argv[0]);
 16f:	ff 36                	pushl  (%esi)
 171:	68 f9 06 00 00       	push   $0x6f9
 176:	68 00 02 00 00       	push   $0x200
 17b:	68 40 07 00 00       	push   $0x740
 180:	e8 ec 04 00 00       	call   671 <snprintf>
  printf(1, "%s", buf);
 185:	83 c4 1c             	add    $0x1c,%esp
 188:	68 40 07 00 00       	push   $0x740
 18d:	68 ea 06 00 00       	push   $0x6ea
 192:	6a 01                	push   $0x1
 194:	e8 15 05 00 00       	call   6ae <printf>

  int index = 0;
  for(int i = 1; i < argc; i++) {
 199:	83 c4 10             	add    $0x10,%esp
 19c:	bb 01 00 00 00       	mov    $0x1,%ebx
  int index = 0;
 1a1:	be 00 00 00 00       	mov    $0x0,%esi
  for(int i = 1; i < argc; i++) {
 1a6:	39 fb                	cmp    %edi,%ebx
 1a8:	7d 29                	jge    1d3 <main+0x1d3>
    index += snprintf(&buf[index], bufferSizeBytes - index, "<%s>\n", argv[i]);
 1aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 1ad:	ff 34 98             	pushl  (%eax,%ebx,4)
 1b0:	68 05 07 00 00       	push   $0x705
 1b5:	b8 00 02 00 00       	mov    $0x200,%eax
 1ba:	29 f0                	sub    %esi,%eax
 1bc:	50                   	push   %eax
 1bd:	8d 86 40 07 00 00    	lea    0x740(%esi),%eax
 1c3:	50                   	push   %eax
 1c4:	e8 a8 04 00 00       	call   671 <snprintf>
 1c9:	01 c6                	add    %eax,%esi
  for(int i = 1; i < argc; i++) {
 1cb:	83 c3 01             	add    $0x1,%ebx
 1ce:	83 c4 10             	add    $0x10,%esp
 1d1:	eb d3                	jmp    1a6 <main+0x1a6>
  }
  printf(1, "%s", buf);
 1d3:	83 ec 04             	sub    $0x4,%esp
 1d6:	68 40 07 00 00       	push   $0x740
 1db:	68 ea 06 00 00       	push   $0x6ea
 1e0:	6a 01                	push   $0x1
 1e2:	e8 c7 04 00 00       	call   6ae <printf>

  for(int i = 1; i < argc; i++) {
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	bb 01 00 00 00       	mov    $0x1,%ebx
 1ef:	39 fb                	cmp    %edi,%ebx
 1f1:	7d 1b                	jge    20e <main+0x20e>
    printf(1, "<%d>\n", i - 3);
 1f3:	83 ec 04             	sub    $0x4,%esp
 1f6:	8d 43 fd             	lea    -0x3(%ebx),%eax
 1f9:	50                   	push   %eax
 1fa:	68 0b 07 00 00       	push   $0x70b
 1ff:	6a 01                	push   $0x1
 201:	e8 a8 04 00 00       	call   6ae <printf>
  for(int i = 1; i < argc; i++) {
 206:	83 c3 01             	add    $0x1,%ebx
 209:	83 c4 10             	add    $0x10,%esp
 20c:	eb e1                	jmp    1ef <main+0x1ef>
  }
  for(int i = 1; i < argc; i++) {
 20e:	bb 01 00 00 00       	mov    $0x1,%ebx
 213:	eb 19                	jmp    22e <main+0x22e>
    printf(1, "<%x>\n", i - 3);
 215:	83 ec 04             	sub    $0x4,%esp
 218:	8d 43 fd             	lea    -0x3(%ebx),%eax
 21b:	50                   	push   %eax
 21c:	68 11 07 00 00       	push   $0x711
 221:	6a 01                	push   $0x1
 223:	e8 86 04 00 00       	call   6ae <printf>
  for(int i = 1; i < argc; i++) {
 228:	83 c3 01             	add    $0x1,%ebx
 22b:	83 c4 10             	add    $0x10,%esp
 22e:	39 fb                	cmp    %edi,%ebx
 230:	7c e3                	jl     215 <main+0x215>
  }
  
  exit();
 232:	e8 08 00 00 00       	call   23f <exit>

00000237 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 237:	b8 01 00 00 00       	mov    $0x1,%eax
 23c:	cd 40                	int    $0x40
 23e:	c3                   	ret    

0000023f <exit>:
SYSCALL(exit)
 23f:	b8 02 00 00 00       	mov    $0x2,%eax
 244:	cd 40                	int    $0x40
 246:	c3                   	ret    

00000247 <wait>:
SYSCALL(wait)
 247:	b8 03 00 00 00       	mov    $0x3,%eax
 24c:	cd 40                	int    $0x40
 24e:	c3                   	ret    

0000024f <pipe>:
SYSCALL(pipe)
 24f:	b8 04 00 00 00       	mov    $0x4,%eax
 254:	cd 40                	int    $0x40
 256:	c3                   	ret    

00000257 <read>:
SYSCALL(read)
 257:	b8 05 00 00 00       	mov    $0x5,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <write>:
SYSCALL(write)
 25f:	b8 10 00 00 00       	mov    $0x10,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <close>:
SYSCALL(close)
 267:	b8 15 00 00 00       	mov    $0x15,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <kill>:
SYSCALL(kill)
 26f:	b8 06 00 00 00       	mov    $0x6,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <exec>:
SYSCALL(exec)
 277:	b8 07 00 00 00       	mov    $0x7,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <open>:
SYSCALL(open)
 27f:	b8 0f 00 00 00       	mov    $0xf,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <mknod>:
SYSCALL(mknod)
 287:	b8 11 00 00 00       	mov    $0x11,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <unlink>:
SYSCALL(unlink)
 28f:	b8 12 00 00 00       	mov    $0x12,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <fstat>:
SYSCALL(fstat)
 297:	b8 08 00 00 00       	mov    $0x8,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <link>:
SYSCALL(link)
 29f:	b8 13 00 00 00       	mov    $0x13,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <mkdir>:
SYSCALL(mkdir)
 2a7:	b8 14 00 00 00       	mov    $0x14,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <chdir>:
SYSCALL(chdir)
 2af:	b8 09 00 00 00       	mov    $0x9,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <dup>:
SYSCALL(dup)
 2b7:	b8 0a 00 00 00       	mov    $0xa,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <getpid>:
SYSCALL(getpid)
 2bf:	b8 0b 00 00 00       	mov    $0xb,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <sbrk>:
SYSCALL(sbrk)
 2c7:	b8 0c 00 00 00       	mov    $0xc,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <sleep>:
SYSCALL(sleep)
 2cf:	b8 0d 00 00 00       	mov    $0xd,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <uptime>:
SYSCALL(uptime)
 2d7:	b8 0e 00 00 00       	mov    $0xe,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <yield>:
SYSCALL(yield)
 2df:	b8 16 00 00 00       	mov    $0x16,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <shutdown>:
SYSCALL(shutdown)
 2e7:	b8 17 00 00 00       	mov    $0x17,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <ps>:
SYSCALL(ps)
 2ef:	b8 18 00 00 00       	mov    $0x18,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <nice>:
 2f7:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 2ff:	f3 0f 1e fb          	endbr32 
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	8b 45 14             	mov    0x14(%ebp),%eax
 309:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 30c:	3b 45 10             	cmp    0x10(%ebp),%eax
 30f:	73 06                	jae    317 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 311:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 314:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 317:	5d                   	pop    %ebp
 318:	c3                   	ret    

00000319 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 319:	55                   	push   %ebp
 31a:	89 e5                	mov    %esp,%ebp
 31c:	57                   	push   %edi
 31d:	56                   	push   %esi
 31e:	53                   	push   %ebx
 31f:	83 ec 08             	sub    $0x8,%esp
 322:	89 c6                	mov    %eax,%esi
 324:	89 d3                	mov    %edx,%ebx
 326:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 329:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 32d:	0f 95 c2             	setne  %dl
 330:	89 c8                	mov    %ecx,%eax
 332:	c1 e8 1f             	shr    $0x1f,%eax
 335:	84 c2                	test   %al,%dl
 337:	74 33                	je     36c <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 339:	89 c8                	mov    %ecx,%eax
 33b:	f7 d8                	neg    %eax
    neg = 1;
 33d:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 344:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 349:	8d 4f 01             	lea    0x1(%edi),%ecx
 34c:	89 ca                	mov    %ecx,%edx
 34e:	39 d9                	cmp    %ebx,%ecx
 350:	73 26                	jae    378 <s_getReverseDigits+0x5f>
 352:	85 c0                	test   %eax,%eax
 354:	74 22                	je     378 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 356:	ba 00 00 00 00       	mov    $0x0,%edx
 35b:	f7 75 08             	divl   0x8(%ebp)
 35e:	0f b6 92 20 07 00 00 	movzbl 0x720(%edx),%edx
 365:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 368:	89 cf                	mov    %ecx,%edi
 36a:	eb dd                	jmp    349 <s_getReverseDigits+0x30>
    x = xx;
 36c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 36f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 376:	eb cc                	jmp    344 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 378:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 37c:	75 0a                	jne    388 <s_getReverseDigits+0x6f>
 37e:	39 da                	cmp    %ebx,%edx
 380:	73 06                	jae    388 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 382:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 386:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 388:	89 fa                	mov    %edi,%edx
 38a:	39 df                	cmp    %ebx,%edi
 38c:	0f 92 c0             	setb   %al
 38f:	84 45 ec             	test   %al,-0x14(%ebp)
 392:	74 07                	je     39b <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 394:	83 c7 01             	add    $0x1,%edi
 397:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 39b:	89 f8                	mov    %edi,%eax
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	5b                   	pop    %ebx
 3a1:	5e                   	pop    %esi
 3a2:	5f                   	pop    %edi
 3a3:	5d                   	pop    %ebp
 3a4:	c3                   	ret    

000003a5 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 3a5:	39 c2                	cmp    %eax,%edx
 3a7:	0f 46 c2             	cmovbe %edx,%eax
}
 3aa:	c3                   	ret    

000003ab <s_printint>:
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	57                   	push   %edi
 3af:	56                   	push   %esi
 3b0:	53                   	push   %ebx
 3b1:	83 ec 2c             	sub    $0x2c,%esp
 3b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3b7:	89 55 d0             	mov    %edx,-0x30(%ebp)
 3ba:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 3bd:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 3c0:	ff 75 14             	pushl  0x14(%ebp)
 3c3:	ff 75 10             	pushl  0x10(%ebp)
 3c6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3c9:	ba 10 00 00 00       	mov    $0x10,%edx
 3ce:	8d 45 d8             	lea    -0x28(%ebp),%eax
 3d1:	e8 43 ff ff ff       	call   319 <s_getReverseDigits>
 3d6:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 3d9:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 3db:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 3de:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 3e3:	83 eb 01             	sub    $0x1,%ebx
 3e6:	78 22                	js     40a <s_printint+0x5f>
 3e8:	39 fe                	cmp    %edi,%esi
 3ea:	73 1e                	jae    40a <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 3ec:	83 ec 0c             	sub    $0xc,%esp
 3ef:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 3f4:	50                   	push   %eax
 3f5:	56                   	push   %esi
 3f6:	57                   	push   %edi
 3f7:	ff 75 cc             	pushl  -0x34(%ebp)
 3fa:	ff 75 d0             	pushl  -0x30(%ebp)
 3fd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 400:	ff d0                	call   *%eax
    j++;
 402:	83 c6 01             	add    $0x1,%esi
 405:	83 c4 20             	add    $0x20,%esp
 408:	eb d9                	jmp    3e3 <s_printint+0x38>
}
 40a:	8b 45 c8             	mov    -0x38(%ebp),%eax
 40d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 410:	5b                   	pop    %ebx
 411:	5e                   	pop    %esi
 412:	5f                   	pop    %edi
 413:	5d                   	pop    %ebp
 414:	c3                   	ret    

00000415 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 415:	55                   	push   %ebp
 416:	89 e5                	mov    %esp,%ebp
 418:	57                   	push   %edi
 419:	56                   	push   %esi
 41a:	53                   	push   %ebx
 41b:	83 ec 2c             	sub    $0x2c,%esp
 41e:	89 45 d8             	mov    %eax,-0x28(%ebp)
 421:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 424:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 42d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 434:	bb 00 00 00 00       	mov    $0x0,%ebx
 439:	89 f8                	mov    %edi,%eax
 43b:	89 df                	mov    %ebx,%edi
 43d:	89 c6                	mov    %eax,%esi
 43f:	eb 20                	jmp    461 <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 441:	8d 43 01             	lea    0x1(%ebx),%eax
 444:	89 45 e0             	mov    %eax,-0x20(%ebp)
 447:	83 ec 0c             	sub    $0xc,%esp
 44a:	51                   	push   %ecx
 44b:	53                   	push   %ebx
 44c:	56                   	push   %esi
 44d:	ff 75 d0             	pushl  -0x30(%ebp)
 450:	ff 75 d4             	pushl  -0x2c(%ebp)
 453:	8b 55 d8             	mov    -0x28(%ebp),%edx
 456:	ff d2                	call   *%edx
 458:	83 c4 20             	add    $0x20,%esp
 45b:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 45e:	83 c7 01             	add    $0x1,%edi
 461:	8b 45 0c             	mov    0xc(%ebp),%eax
 464:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 468:	84 c0                	test   %al,%al
 46a:	0f 84 cd 01 00 00    	je     63d <s_printf+0x228>
 470:	89 75 e0             	mov    %esi,-0x20(%ebp)
 473:	39 de                	cmp    %ebx,%esi
 475:	0f 86 c2 01 00 00    	jbe    63d <s_printf+0x228>
    c = fmt[i] & 0xff;
 47b:	0f be c8             	movsbl %al,%ecx
 47e:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 481:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 484:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 488:	75 0a                	jne    494 <s_printf+0x7f>
      if(c == '%') {
 48a:	83 f8 25             	cmp    $0x25,%eax
 48d:	75 b2                	jne    441 <s_printf+0x2c>
        state = '%';
 48f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 492:	eb ca                	jmp    45e <s_printf+0x49>
      }
    } else if(state == '%'){
 494:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 498:	75 c4                	jne    45e <s_printf+0x49>
      if(c == 'd'){
 49a:	83 f8 64             	cmp    $0x64,%eax
 49d:	74 6e                	je     50d <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 49f:	83 f8 78             	cmp    $0x78,%eax
 4a2:	0f 94 c1             	sete   %cl
 4a5:	83 f8 70             	cmp    $0x70,%eax
 4a8:	0f 94 c2             	sete   %dl
 4ab:	08 d1                	or     %dl,%cl
 4ad:	0f 85 8e 00 00 00    	jne    541 <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4b3:	83 f8 73             	cmp    $0x73,%eax
 4b6:	0f 84 b9 00 00 00    	je     575 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 4bc:	83 f8 63             	cmp    $0x63,%eax
 4bf:	0f 84 1a 01 00 00    	je     5df <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 4c5:	83 f8 25             	cmp    $0x25,%eax
 4c8:	0f 84 44 01 00 00    	je     612 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 4ce:	8d 43 01             	lea    0x1(%ebx),%eax
 4d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4d4:	83 ec 0c             	sub    $0xc,%esp
 4d7:	6a 25                	push   $0x25
 4d9:	53                   	push   %ebx
 4da:	56                   	push   %esi
 4db:	ff 75 d0             	pushl  -0x30(%ebp)
 4de:	ff 75 d4             	pushl  -0x2c(%ebp)
 4e1:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4e4:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 4e6:	83 c3 02             	add    $0x2,%ebx
 4e9:	83 c4 14             	add    $0x14,%esp
 4ec:	ff 75 dc             	pushl  -0x24(%ebp)
 4ef:	ff 75 e4             	pushl  -0x1c(%ebp)
 4f2:	56                   	push   %esi
 4f3:	ff 75 d0             	pushl  -0x30(%ebp)
 4f6:	ff 75 d4             	pushl  -0x2c(%ebp)
 4f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4fc:	ff d0                	call   *%eax
 4fe:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 501:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 508:	e9 51 ff ff ff       	jmp    45e <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 50d:	8b 45 d0             	mov    -0x30(%ebp),%eax
 510:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 513:	6a 01                	push   $0x1
 515:	6a 0a                	push   $0xa
 517:	8b 45 10             	mov    0x10(%ebp),%eax
 51a:	ff 30                	pushl  (%eax)
 51c:	89 f0                	mov    %esi,%eax
 51e:	29 d8                	sub    %ebx,%eax
 520:	50                   	push   %eax
 521:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 524:	8b 45 d8             	mov    -0x28(%ebp),%eax
 527:	e8 7f fe ff ff       	call   3ab <s_printint>
 52c:	01 c3                	add    %eax,%ebx
        ap++;
 52e:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 532:	83 c4 10             	add    $0x10,%esp
      state = 0;
 535:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 53c:	e9 1d ff ff ff       	jmp    45e <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 541:	8b 45 d0             	mov    -0x30(%ebp),%eax
 544:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 547:	6a 00                	push   $0x0
 549:	6a 10                	push   $0x10
 54b:	8b 45 10             	mov    0x10(%ebp),%eax
 54e:	ff 30                	pushl  (%eax)
 550:	89 f0                	mov    %esi,%eax
 552:	29 d8                	sub    %ebx,%eax
 554:	50                   	push   %eax
 555:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 558:	8b 45 d8             	mov    -0x28(%ebp),%eax
 55b:	e8 4b fe ff ff       	call   3ab <s_printint>
 560:	01 c3                	add    %eax,%ebx
        ap++;
 562:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 566:	83 c4 10             	add    $0x10,%esp
      state = 0;
 569:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 570:	e9 e9 fe ff ff       	jmp    45e <s_printf+0x49>
        s = (char*)*ap;
 575:	8b 45 10             	mov    0x10(%ebp),%eax
 578:	8b 00                	mov    (%eax),%eax
        ap++;
 57a:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 57e:	85 c0                	test   %eax,%eax
 580:	75 4e                	jne    5d0 <s_printf+0x1bb>
          s = "(null)";
 582:	b8 17 07 00 00       	mov    $0x717,%eax
 587:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 58a:	89 da                	mov    %ebx,%edx
 58c:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 58f:	89 75 e0             	mov    %esi,-0x20(%ebp)
 592:	89 c6                	mov    %eax,%esi
 594:	eb 1f                	jmp    5b5 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 596:	8d 7a 01             	lea    0x1(%edx),%edi
 599:	83 ec 0c             	sub    $0xc,%esp
 59c:	0f be c0             	movsbl %al,%eax
 59f:	50                   	push   %eax
 5a0:	52                   	push   %edx
 5a1:	53                   	push   %ebx
 5a2:	ff 75 d0             	pushl  -0x30(%ebp)
 5a5:	ff 75 d4             	pushl  -0x2c(%ebp)
 5a8:	8b 45 d8             	mov    -0x28(%ebp),%eax
 5ab:	ff d0                	call   *%eax
          s++;
 5ad:	83 c6 01             	add    $0x1,%esi
 5b0:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 5b3:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 5b5:	0f b6 06             	movzbl (%esi),%eax
 5b8:	84 c0                	test   %al,%al
 5ba:	75 da                	jne    596 <s_printf+0x181>
 5bc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5bf:	89 d3                	mov    %edx,%ebx
 5c1:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 5c4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5cb:	e9 8e fe ff ff       	jmp    45e <s_printf+0x49>
 5d0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5d3:	89 da                	mov    %ebx,%edx
 5d5:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 5d8:	89 75 e0             	mov    %esi,-0x20(%ebp)
 5db:	89 c6                	mov    %eax,%esi
 5dd:	eb d6                	jmp    5b5 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 5df:	8d 43 01             	lea    0x1(%ebx),%eax
 5e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5e5:	83 ec 0c             	sub    $0xc,%esp
 5e8:	8b 55 10             	mov    0x10(%ebp),%edx
 5eb:	0f be 02             	movsbl (%edx),%eax
 5ee:	50                   	push   %eax
 5ef:	53                   	push   %ebx
 5f0:	56                   	push   %esi
 5f1:	ff 75 d0             	pushl  -0x30(%ebp)
 5f4:	ff 75 d4             	pushl  -0x2c(%ebp)
 5f7:	8b 55 d8             	mov    -0x28(%ebp),%edx
 5fa:	ff d2                	call   *%edx
        ap++;
 5fc:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 600:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 603:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 606:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 60d:	e9 4c fe ff ff       	jmp    45e <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 612:	8d 43 01             	lea    0x1(%ebx),%eax
 615:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 618:	83 ec 0c             	sub    $0xc,%esp
 61b:	ff 75 dc             	pushl  -0x24(%ebp)
 61e:	53                   	push   %ebx
 61f:	56                   	push   %esi
 620:	ff 75 d0             	pushl  -0x30(%ebp)
 623:	ff 75 d4             	pushl  -0x2c(%ebp)
 626:	8b 55 d8             	mov    -0x28(%ebp),%edx
 629:	ff d2                	call   *%edx
 62b:	83 c4 20             	add    $0x20,%esp
 62e:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 631:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 638:	e9 21 fe ff ff       	jmp    45e <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 63d:	89 da                	mov    %ebx,%edx
 63f:	89 f0                	mov    %esi,%eax
 641:	e8 5f fd ff ff       	call   3a5 <s_min>
}
 646:	8d 65 f4             	lea    -0xc(%ebp),%esp
 649:	5b                   	pop    %ebx
 64a:	5e                   	pop    %esi
 64b:	5f                   	pop    %edi
 64c:	5d                   	pop    %ebp
 64d:	c3                   	ret    

0000064e <s_putc>:
{
 64e:	f3 0f 1e fb          	endbr32 
 652:	55                   	push   %ebp
 653:	89 e5                	mov    %esp,%ebp
 655:	83 ec 1c             	sub    $0x1c,%esp
 658:	8b 45 18             	mov    0x18(%ebp),%eax
 65b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 65e:	6a 01                	push   $0x1
 660:	8d 45 f4             	lea    -0xc(%ebp),%eax
 663:	50                   	push   %eax
 664:	ff 75 08             	pushl  0x8(%ebp)
 667:	e8 f3 fb ff ff       	call   25f <write>
}
 66c:	83 c4 10             	add    $0x10,%esp
 66f:	c9                   	leave  
 670:	c3                   	ret    

00000671 <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 671:	f3 0f 1e fb          	endbr32 
 675:	55                   	push   %ebp
 676:	89 e5                	mov    %esp,%ebp
 678:	56                   	push   %esi
 679:	53                   	push   %ebx
 67a:	8b 75 08             	mov    0x8(%ebp),%esi
 67d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 680:	83 ec 04             	sub    $0x4,%esp
 683:	8d 45 14             	lea    0x14(%ebp),%eax
 686:	50                   	push   %eax
 687:	ff 75 10             	pushl  0x10(%ebp)
 68a:	53                   	push   %ebx
 68b:	89 f1                	mov    %esi,%ecx
 68d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 692:	b8 ff 02 00 00       	mov    $0x2ff,%eax
 697:	e8 79 fd ff ff       	call   415 <s_printf>
  if(count < n) {
 69c:	83 c4 10             	add    $0x10,%esp
 69f:	39 c3                	cmp    %eax,%ebx
 6a1:	76 04                	jbe    6a7 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 6a3:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 6a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6aa:	5b                   	pop    %ebx
 6ab:	5e                   	pop    %esi
 6ac:	5d                   	pop    %ebp
 6ad:	c3                   	ret    

000006ae <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6ae:	f3 0f 1e fb          	endbr32 
 6b2:	55                   	push   %ebp
 6b3:	89 e5                	mov    %esp,%ebp
 6b5:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 6b8:	8d 45 10             	lea    0x10(%ebp),%eax
 6bb:	50                   	push   %eax
 6bc:	ff 75 0c             	pushl  0xc(%ebp)
 6bf:	68 00 00 00 40       	push   $0x40000000
 6c4:	b9 00 00 00 00       	mov    $0x0,%ecx
 6c9:	8b 55 08             	mov    0x8(%ebp),%edx
 6cc:	b8 4e 06 00 00       	mov    $0x64e,%eax
 6d1:	e8 3f fd ff ff       	call   415 <s_printf>
}
 6d6:	83 c4 10             	add    $0x10,%esp
 6d9:	c9                   	leave  
 6da:	c3                   	ret    
