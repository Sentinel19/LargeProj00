
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
  22:	68 ec 06 00 00       	push   $0x6ec
  27:	68 00 02 00 00       	push   $0x200
  2c:	68 60 07 00 00       	push   $0x760
  31:	e8 4b 06 00 00       	call   681 <snprintf>
  printf(1, "%s", buf);
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 60 07 00 00       	push   $0x760
  3e:	68 fa 06 00 00       	push   $0x6fa
  43:	6a 01                	push   $0x1
  45:	e8 74 06 00 00       	call   6be <printf>
  snprintf(buf, bufferSizeBytes, "%d\n", argc);
  4a:	57                   	push   %edi
  4b:	68 05 07 00 00       	push   $0x705
  50:	68 00 02 00 00       	push   $0x200
  55:	68 60 07 00 00       	push   $0x760
  5a:	e8 22 06 00 00       	call   681 <snprintf>
  printf(1, "%s", buf);
  5f:	83 c4 1c             	add    $0x1c,%esp
  62:	68 60 07 00 00       	push   $0x760
  67:	68 fa 06 00 00       	push   $0x6fa
  6c:	6a 01                	push   $0x1
  6e:	e8 4b 06 00 00       	call   6be <printf>
  snprintf(buf, bufferSizeBytes, "%x\n", argc);
  73:	57                   	push   %edi
  74:	68 00 07 00 00       	push   $0x700
  79:	68 00 02 00 00       	push   $0x200
  7e:	68 60 07 00 00       	push   $0x760
  83:	e8 f9 05 00 00       	call   681 <snprintf>
  printf(1, "%s", buf);
  88:	83 c4 1c             	add    $0x1c,%esp
  8b:	68 60 07 00 00       	push   $0x760
  90:	68 fa 06 00 00       	push   $0x6fa
  95:	6a 01                	push   $0x1
  97:	e8 22 06 00 00       	call   6be <printf>
  snprintf(buf, 6, "Hello, World\n");
  9c:	83 c4 0c             	add    $0xc,%esp
  9f:	68 ec 06 00 00       	push   $0x6ec
  a4:	6a 06                	push   $0x6
  a6:	68 60 07 00 00       	push   $0x760
  ab:	e8 d1 05 00 00       	call   681 <snprintf>
  printf(1, "%s", buf);
  b0:	83 c4 0c             	add    $0xc,%esp
  b3:	68 60 07 00 00       	push   $0x760
  b8:	68 fa 06 00 00       	push   $0x6fa
  bd:	6a 01                	push   $0x1
  bf:	e8 fa 05 00 00       	call   6be <printf>
  snprintf(buf, 12, "\n0x%x\n", 0xcafebabe);
  c4:	68 be ba fe ca       	push   $0xcafebabe
  c9:	68 fd 06 00 00       	push   $0x6fd
  ce:	6a 0c                	push   $0xc
  d0:	68 60 07 00 00       	push   $0x760
  d5:	e8 a7 05 00 00       	call   681 <snprintf>
  printf(1, "%s", buf);
  da:	83 c4 1c             	add    $0x1c,%esp
  dd:	68 60 07 00 00       	push   $0x760
  e2:	68 fa 06 00 00       	push   $0x6fa
  e7:	6a 01                	push   $0x1
  e9:	e8 d0 05 00 00       	call   6be <printf>
  snprintf(buf, 6, "\n0x%x\n", 0xcafebabe);
  ee:	68 be ba fe ca       	push   $0xcafebabe
  f3:	68 fd 06 00 00       	push   $0x6fd
  f8:	6a 06                	push   $0x6
  fa:	68 60 07 00 00       	push   $0x760
  ff:	e8 7d 05 00 00       	call   681 <snprintf>
  printf(1, "%s", buf);
 104:	83 c4 1c             	add    $0x1c,%esp
 107:	68 60 07 00 00       	push   $0x760
 10c:	68 fa 06 00 00       	push   $0x6fa
 111:	6a 01                	push   $0x1
 113:	e8 a6 05 00 00       	call   6be <printf>
  snprintf(buf, 0, "\n0x%x\n", 0xdeadbeef);
 118:	68 ef be ad de       	push   $0xdeadbeef
 11d:	68 fd 06 00 00       	push   $0x6fd
 122:	6a 00                	push   $0x0
 124:	68 60 07 00 00       	push   $0x760
 129:	e8 53 05 00 00       	call   681 <snprintf>
  printf(1, "%s", buf);
 12e:	83 c4 1c             	add    $0x1c,%esp
 131:	68 60 07 00 00       	push   $0x760
 136:	68 fa 06 00 00       	push   $0x6fa
 13b:	6a 01                	push   $0x1
 13d:	e8 7c 05 00 00       	call   6be <printf>
  snprintf(buf, bufferSizeBytes, "\n%d\n", 0xdeadbeef);
 142:	68 ef be ad de       	push   $0xdeadbeef
 147:	68 04 07 00 00       	push   $0x704
 14c:	68 00 02 00 00       	push   $0x200
 151:	68 60 07 00 00       	push   $0x760
 156:	e8 26 05 00 00       	call   681 <snprintf>
  printf(1, "%s", buf);
 15b:	83 c4 1c             	add    $0x1c,%esp
 15e:	68 60 07 00 00       	push   $0x760
 163:	68 fa 06 00 00       	push   $0x6fa
 168:	6a 01                	push   $0x1
 16a:	e8 4f 05 00 00       	call   6be <printf>

  snprintf(buf, bufferSizeBytes, "\nprogram is <%s>\n", argv[0]);
 16f:	ff 36                	pushl  (%esi)
 171:	68 09 07 00 00       	push   $0x709
 176:	68 00 02 00 00       	push   $0x200
 17b:	68 60 07 00 00       	push   $0x760
 180:	e8 fc 04 00 00       	call   681 <snprintf>
  printf(1, "%s", buf);
 185:	83 c4 1c             	add    $0x1c,%esp
 188:	68 60 07 00 00       	push   $0x760
 18d:	68 fa 06 00 00       	push   $0x6fa
 192:	6a 01                	push   $0x1
 194:	e8 25 05 00 00       	call   6be <printf>

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
 1b0:	68 15 07 00 00       	push   $0x715
 1b5:	b8 00 02 00 00       	mov    $0x200,%eax
 1ba:	29 f0                	sub    %esi,%eax
 1bc:	50                   	push   %eax
 1bd:	8d 86 60 07 00 00    	lea    0x760(%esi),%eax
 1c3:	50                   	push   %eax
 1c4:	e8 b8 04 00 00       	call   681 <snprintf>
 1c9:	01 c6                	add    %eax,%esi
  for(int i = 1; i < argc; i++) {
 1cb:	83 c3 01             	add    $0x1,%ebx
 1ce:	83 c4 10             	add    $0x10,%esp
 1d1:	eb d3                	jmp    1a6 <main+0x1a6>
  }
  printf(1, "%s", buf);
 1d3:	83 ec 04             	sub    $0x4,%esp
 1d6:	68 60 07 00 00       	push   $0x760
 1db:	68 fa 06 00 00       	push   $0x6fa
 1e0:	6a 01                	push   $0x1
 1e2:	e8 d7 04 00 00       	call   6be <printf>

  for(int i = 1; i < argc; i++) {
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	bb 01 00 00 00       	mov    $0x1,%ebx
 1ef:	39 fb                	cmp    %edi,%ebx
 1f1:	7d 1b                	jge    20e <main+0x20e>
    printf(1, "<%d>\n", i - 3);
 1f3:	83 ec 04             	sub    $0x4,%esp
 1f6:	8d 43 fd             	lea    -0x3(%ebx),%eax
 1f9:	50                   	push   %eax
 1fa:	68 1b 07 00 00       	push   $0x71b
 1ff:	6a 01                	push   $0x1
 201:	e8 b8 04 00 00       	call   6be <printf>
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
 21c:	68 21 07 00 00       	push   $0x721
 221:	6a 01                	push   $0x1
 223:	e8 96 04 00 00       	call   6be <printf>
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
SYSCALL(nice)
 2f7:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <flock>:
SYSCALL(flock)
 2ff:	b8 19 00 00 00       	mov    $0x19,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <funlock>:
 307:	b8 1a 00 00 00       	mov    $0x1a,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 30f:	f3 0f 1e fb          	endbr32 
 313:	55                   	push   %ebp
 314:	89 e5                	mov    %esp,%ebp
 316:	8b 45 14             	mov    0x14(%ebp),%eax
 319:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 31c:	3b 45 10             	cmp    0x10(%ebp),%eax
 31f:	73 06                	jae    327 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 321:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 324:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 327:	5d                   	pop    %ebp
 328:	c3                   	ret    

00000329 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 329:	55                   	push   %ebp
 32a:	89 e5                	mov    %esp,%ebp
 32c:	57                   	push   %edi
 32d:	56                   	push   %esi
 32e:	53                   	push   %ebx
 32f:	83 ec 08             	sub    $0x8,%esp
 332:	89 c6                	mov    %eax,%esi
 334:	89 d3                	mov    %edx,%ebx
 336:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 339:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 33d:	0f 95 c2             	setne  %dl
 340:	89 c8                	mov    %ecx,%eax
 342:	c1 e8 1f             	shr    $0x1f,%eax
 345:	84 c2                	test   %al,%dl
 347:	74 33                	je     37c <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 349:	89 c8                	mov    %ecx,%eax
 34b:	f7 d8                	neg    %eax
    neg = 1;
 34d:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 354:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 359:	8d 4f 01             	lea    0x1(%edi),%ecx
 35c:	89 ca                	mov    %ecx,%edx
 35e:	39 d9                	cmp    %ebx,%ecx
 360:	73 26                	jae    388 <s_getReverseDigits+0x5f>
 362:	85 c0                	test   %eax,%eax
 364:	74 22                	je     388 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 366:	ba 00 00 00 00       	mov    $0x0,%edx
 36b:	f7 75 08             	divl   0x8(%ebp)
 36e:	0f b6 92 30 07 00 00 	movzbl 0x730(%edx),%edx
 375:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 378:	89 cf                	mov    %ecx,%edi
 37a:	eb dd                	jmp    359 <s_getReverseDigits+0x30>
    x = xx;
 37c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 37f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 386:	eb cc                	jmp    354 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 388:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 38c:	75 0a                	jne    398 <s_getReverseDigits+0x6f>
 38e:	39 da                	cmp    %ebx,%edx
 390:	73 06                	jae    398 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 392:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 396:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 398:	89 fa                	mov    %edi,%edx
 39a:	39 df                	cmp    %ebx,%edi
 39c:	0f 92 c0             	setb   %al
 39f:	84 45 ec             	test   %al,-0x14(%ebp)
 3a2:	74 07                	je     3ab <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 3a4:	83 c7 01             	add    $0x1,%edi
 3a7:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 3ab:	89 f8                	mov    %edi,%eax
 3ad:	83 c4 08             	add    $0x8,%esp
 3b0:	5b                   	pop    %ebx
 3b1:	5e                   	pop    %esi
 3b2:	5f                   	pop    %edi
 3b3:	5d                   	pop    %ebp
 3b4:	c3                   	ret    

000003b5 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 3b5:	39 c2                	cmp    %eax,%edx
 3b7:	0f 46 c2             	cmovbe %edx,%eax
}
 3ba:	c3                   	ret    

000003bb <s_printint>:
{
 3bb:	55                   	push   %ebp
 3bc:	89 e5                	mov    %esp,%ebp
 3be:	57                   	push   %edi
 3bf:	56                   	push   %esi
 3c0:	53                   	push   %ebx
 3c1:	83 ec 2c             	sub    $0x2c,%esp
 3c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3c7:	89 55 d0             	mov    %edx,-0x30(%ebp)
 3ca:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 3cd:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 3d0:	ff 75 14             	pushl  0x14(%ebp)
 3d3:	ff 75 10             	pushl  0x10(%ebp)
 3d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d9:	ba 10 00 00 00       	mov    $0x10,%edx
 3de:	8d 45 d8             	lea    -0x28(%ebp),%eax
 3e1:	e8 43 ff ff ff       	call   329 <s_getReverseDigits>
 3e6:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 3e9:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 3eb:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 3ee:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 3f3:	83 eb 01             	sub    $0x1,%ebx
 3f6:	78 22                	js     41a <s_printint+0x5f>
 3f8:	39 fe                	cmp    %edi,%esi
 3fa:	73 1e                	jae    41a <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 3fc:	83 ec 0c             	sub    $0xc,%esp
 3ff:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 404:	50                   	push   %eax
 405:	56                   	push   %esi
 406:	57                   	push   %edi
 407:	ff 75 cc             	pushl  -0x34(%ebp)
 40a:	ff 75 d0             	pushl  -0x30(%ebp)
 40d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 410:	ff d0                	call   *%eax
    j++;
 412:	83 c6 01             	add    $0x1,%esi
 415:	83 c4 20             	add    $0x20,%esp
 418:	eb d9                	jmp    3f3 <s_printint+0x38>
}
 41a:	8b 45 c8             	mov    -0x38(%ebp),%eax
 41d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 420:	5b                   	pop    %ebx
 421:	5e                   	pop    %esi
 422:	5f                   	pop    %edi
 423:	5d                   	pop    %ebp
 424:	c3                   	ret    

00000425 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
 428:	57                   	push   %edi
 429:	56                   	push   %esi
 42a:	53                   	push   %ebx
 42b:	83 ec 2c             	sub    $0x2c,%esp
 42e:	89 45 d8             	mov    %eax,-0x28(%ebp)
 431:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 434:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 437:	8b 45 08             	mov    0x8(%ebp),%eax
 43a:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 43d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 444:	bb 00 00 00 00       	mov    $0x0,%ebx
 449:	89 f8                	mov    %edi,%eax
 44b:	89 df                	mov    %ebx,%edi
 44d:	89 c6                	mov    %eax,%esi
 44f:	eb 20                	jmp    471 <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 451:	8d 43 01             	lea    0x1(%ebx),%eax
 454:	89 45 e0             	mov    %eax,-0x20(%ebp)
 457:	83 ec 0c             	sub    $0xc,%esp
 45a:	51                   	push   %ecx
 45b:	53                   	push   %ebx
 45c:	56                   	push   %esi
 45d:	ff 75 d0             	pushl  -0x30(%ebp)
 460:	ff 75 d4             	pushl  -0x2c(%ebp)
 463:	8b 55 d8             	mov    -0x28(%ebp),%edx
 466:	ff d2                	call   *%edx
 468:	83 c4 20             	add    $0x20,%esp
 46b:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 46e:	83 c7 01             	add    $0x1,%edi
 471:	8b 45 0c             	mov    0xc(%ebp),%eax
 474:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 478:	84 c0                	test   %al,%al
 47a:	0f 84 cd 01 00 00    	je     64d <s_printf+0x228>
 480:	89 75 e0             	mov    %esi,-0x20(%ebp)
 483:	39 de                	cmp    %ebx,%esi
 485:	0f 86 c2 01 00 00    	jbe    64d <s_printf+0x228>
    c = fmt[i] & 0xff;
 48b:	0f be c8             	movsbl %al,%ecx
 48e:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 491:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 494:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 498:	75 0a                	jne    4a4 <s_printf+0x7f>
      if(c == '%') {
 49a:	83 f8 25             	cmp    $0x25,%eax
 49d:	75 b2                	jne    451 <s_printf+0x2c>
        state = '%';
 49f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4a2:	eb ca                	jmp    46e <s_printf+0x49>
      }
    } else if(state == '%'){
 4a4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4a8:	75 c4                	jne    46e <s_printf+0x49>
      if(c == 'd'){
 4aa:	83 f8 64             	cmp    $0x64,%eax
 4ad:	74 6e                	je     51d <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4af:	83 f8 78             	cmp    $0x78,%eax
 4b2:	0f 94 c1             	sete   %cl
 4b5:	83 f8 70             	cmp    $0x70,%eax
 4b8:	0f 94 c2             	sete   %dl
 4bb:	08 d1                	or     %dl,%cl
 4bd:	0f 85 8e 00 00 00    	jne    551 <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4c3:	83 f8 73             	cmp    $0x73,%eax
 4c6:	0f 84 b9 00 00 00    	je     585 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 4cc:	83 f8 63             	cmp    $0x63,%eax
 4cf:	0f 84 1a 01 00 00    	je     5ef <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 4d5:	83 f8 25             	cmp    $0x25,%eax
 4d8:	0f 84 44 01 00 00    	je     622 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 4de:	8d 43 01             	lea    0x1(%ebx),%eax
 4e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4e4:	83 ec 0c             	sub    $0xc,%esp
 4e7:	6a 25                	push   $0x25
 4e9:	53                   	push   %ebx
 4ea:	56                   	push   %esi
 4eb:	ff 75 d0             	pushl  -0x30(%ebp)
 4ee:	ff 75 d4             	pushl  -0x2c(%ebp)
 4f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4f4:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 4f6:	83 c3 02             	add    $0x2,%ebx
 4f9:	83 c4 14             	add    $0x14,%esp
 4fc:	ff 75 dc             	pushl  -0x24(%ebp)
 4ff:	ff 75 e4             	pushl  -0x1c(%ebp)
 502:	56                   	push   %esi
 503:	ff 75 d0             	pushl  -0x30(%ebp)
 506:	ff 75 d4             	pushl  -0x2c(%ebp)
 509:	8b 45 d8             	mov    -0x28(%ebp),%eax
 50c:	ff d0                	call   *%eax
 50e:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 511:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 518:	e9 51 ff ff ff       	jmp    46e <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 51d:	8b 45 d0             	mov    -0x30(%ebp),%eax
 520:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 523:	6a 01                	push   $0x1
 525:	6a 0a                	push   $0xa
 527:	8b 45 10             	mov    0x10(%ebp),%eax
 52a:	ff 30                	pushl  (%eax)
 52c:	89 f0                	mov    %esi,%eax
 52e:	29 d8                	sub    %ebx,%eax
 530:	50                   	push   %eax
 531:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 534:	8b 45 d8             	mov    -0x28(%ebp),%eax
 537:	e8 7f fe ff ff       	call   3bb <s_printint>
 53c:	01 c3                	add    %eax,%ebx
        ap++;
 53e:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 542:	83 c4 10             	add    $0x10,%esp
      state = 0;
 545:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 54c:	e9 1d ff ff ff       	jmp    46e <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 551:	8b 45 d0             	mov    -0x30(%ebp),%eax
 554:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 557:	6a 00                	push   $0x0
 559:	6a 10                	push   $0x10
 55b:	8b 45 10             	mov    0x10(%ebp),%eax
 55e:	ff 30                	pushl  (%eax)
 560:	89 f0                	mov    %esi,%eax
 562:	29 d8                	sub    %ebx,%eax
 564:	50                   	push   %eax
 565:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 568:	8b 45 d8             	mov    -0x28(%ebp),%eax
 56b:	e8 4b fe ff ff       	call   3bb <s_printint>
 570:	01 c3                	add    %eax,%ebx
        ap++;
 572:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 576:	83 c4 10             	add    $0x10,%esp
      state = 0;
 579:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 580:	e9 e9 fe ff ff       	jmp    46e <s_printf+0x49>
        s = (char*)*ap;
 585:	8b 45 10             	mov    0x10(%ebp),%eax
 588:	8b 00                	mov    (%eax),%eax
        ap++;
 58a:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 58e:	85 c0                	test   %eax,%eax
 590:	75 4e                	jne    5e0 <s_printf+0x1bb>
          s = "(null)";
 592:	b8 27 07 00 00       	mov    $0x727,%eax
 597:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 59a:	89 da                	mov    %ebx,%edx
 59c:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 59f:	89 75 e0             	mov    %esi,-0x20(%ebp)
 5a2:	89 c6                	mov    %eax,%esi
 5a4:	eb 1f                	jmp    5c5 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 5a6:	8d 7a 01             	lea    0x1(%edx),%edi
 5a9:	83 ec 0c             	sub    $0xc,%esp
 5ac:	0f be c0             	movsbl %al,%eax
 5af:	50                   	push   %eax
 5b0:	52                   	push   %edx
 5b1:	53                   	push   %ebx
 5b2:	ff 75 d0             	pushl  -0x30(%ebp)
 5b5:	ff 75 d4             	pushl  -0x2c(%ebp)
 5b8:	8b 45 d8             	mov    -0x28(%ebp),%eax
 5bb:	ff d0                	call   *%eax
          s++;
 5bd:	83 c6 01             	add    $0x1,%esi
 5c0:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 5c3:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 5c5:	0f b6 06             	movzbl (%esi),%eax
 5c8:	84 c0                	test   %al,%al
 5ca:	75 da                	jne    5a6 <s_printf+0x181>
 5cc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5cf:	89 d3                	mov    %edx,%ebx
 5d1:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 5d4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5db:	e9 8e fe ff ff       	jmp    46e <s_printf+0x49>
 5e0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5e3:	89 da                	mov    %ebx,%edx
 5e5:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 5e8:	89 75 e0             	mov    %esi,-0x20(%ebp)
 5eb:	89 c6                	mov    %eax,%esi
 5ed:	eb d6                	jmp    5c5 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 5ef:	8d 43 01             	lea    0x1(%ebx),%eax
 5f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5f5:	83 ec 0c             	sub    $0xc,%esp
 5f8:	8b 55 10             	mov    0x10(%ebp),%edx
 5fb:	0f be 02             	movsbl (%edx),%eax
 5fe:	50                   	push   %eax
 5ff:	53                   	push   %ebx
 600:	56                   	push   %esi
 601:	ff 75 d0             	pushl  -0x30(%ebp)
 604:	ff 75 d4             	pushl  -0x2c(%ebp)
 607:	8b 55 d8             	mov    -0x28(%ebp),%edx
 60a:	ff d2                	call   *%edx
        ap++;
 60c:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 610:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 613:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 616:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 61d:	e9 4c fe ff ff       	jmp    46e <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 622:	8d 43 01             	lea    0x1(%ebx),%eax
 625:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 628:	83 ec 0c             	sub    $0xc,%esp
 62b:	ff 75 dc             	pushl  -0x24(%ebp)
 62e:	53                   	push   %ebx
 62f:	56                   	push   %esi
 630:	ff 75 d0             	pushl  -0x30(%ebp)
 633:	ff 75 d4             	pushl  -0x2c(%ebp)
 636:	8b 55 d8             	mov    -0x28(%ebp),%edx
 639:	ff d2                	call   *%edx
 63b:	83 c4 20             	add    $0x20,%esp
 63e:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 641:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 648:	e9 21 fe ff ff       	jmp    46e <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 64d:	89 da                	mov    %ebx,%edx
 64f:	89 f0                	mov    %esi,%eax
 651:	e8 5f fd ff ff       	call   3b5 <s_min>
}
 656:	8d 65 f4             	lea    -0xc(%ebp),%esp
 659:	5b                   	pop    %ebx
 65a:	5e                   	pop    %esi
 65b:	5f                   	pop    %edi
 65c:	5d                   	pop    %ebp
 65d:	c3                   	ret    

0000065e <s_putc>:
{
 65e:	f3 0f 1e fb          	endbr32 
 662:	55                   	push   %ebp
 663:	89 e5                	mov    %esp,%ebp
 665:	83 ec 1c             	sub    $0x1c,%esp
 668:	8b 45 18             	mov    0x18(%ebp),%eax
 66b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 66e:	6a 01                	push   $0x1
 670:	8d 45 f4             	lea    -0xc(%ebp),%eax
 673:	50                   	push   %eax
 674:	ff 75 08             	pushl  0x8(%ebp)
 677:	e8 e3 fb ff ff       	call   25f <write>
}
 67c:	83 c4 10             	add    $0x10,%esp
 67f:	c9                   	leave  
 680:	c3                   	ret    

00000681 <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 681:	f3 0f 1e fb          	endbr32 
 685:	55                   	push   %ebp
 686:	89 e5                	mov    %esp,%ebp
 688:	56                   	push   %esi
 689:	53                   	push   %ebx
 68a:	8b 75 08             	mov    0x8(%ebp),%esi
 68d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 690:	83 ec 04             	sub    $0x4,%esp
 693:	8d 45 14             	lea    0x14(%ebp),%eax
 696:	50                   	push   %eax
 697:	ff 75 10             	pushl  0x10(%ebp)
 69a:	53                   	push   %ebx
 69b:	89 f1                	mov    %esi,%ecx
 69d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 6a2:	b8 0f 03 00 00       	mov    $0x30f,%eax
 6a7:	e8 79 fd ff ff       	call   425 <s_printf>
  if(count < n) {
 6ac:	83 c4 10             	add    $0x10,%esp
 6af:	39 c3                	cmp    %eax,%ebx
 6b1:	76 04                	jbe    6b7 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 6b3:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 6b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6ba:	5b                   	pop    %ebx
 6bb:	5e                   	pop    %esi
 6bc:	5d                   	pop    %ebp
 6bd:	c3                   	ret    

000006be <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6be:	f3 0f 1e fb          	endbr32 
 6c2:	55                   	push   %ebp
 6c3:	89 e5                	mov    %esp,%ebp
 6c5:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 6c8:	8d 45 10             	lea    0x10(%ebp),%eax
 6cb:	50                   	push   %eax
 6cc:	ff 75 0c             	pushl  0xc(%ebp)
 6cf:	68 00 00 00 40       	push   $0x40000000
 6d4:	b9 00 00 00 00       	mov    $0x0,%ecx
 6d9:	8b 55 08             	mov    0x8(%ebp),%edx
 6dc:	b8 5e 06 00 00       	mov    $0x65e,%eax
 6e1:	e8 3f fd ff ff       	call   425 <s_printf>
}
 6e6:	83 c4 10             	add    $0x10,%esp
 6e9:	c9                   	leave  
 6ea:	c3                   	ret    
