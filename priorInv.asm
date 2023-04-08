
_priorInv:     file format elf32-i386


Disassembly of section .text:

00000000 <runHP>:

int fd = 1;


void runHP()
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 ec 10             	sub    $0x10,%esp
    printf(1, "Starting High Priority\n");
   a:	68 04 06 00 00       	push   $0x604
   f:	6a 01                	push   $0x1
  11:	e8 bf 05 00 00       	call   5d5 <printf>
    sleep(500);
  16:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
  1d:	e8 c4 01 00 00       	call   1e6 <sleep>
    printf(1, "High got lock %d\n", fd);
  22:	83 c4 0c             	add    $0xc,%esp
  25:	ff 35 98 06 00 00    	pushl  0x698
  2b:	68 1c 06 00 00       	push   $0x61c
  30:	6a 01                	push   $0x1
  32:	e8 9e 05 00 00       	call   5d5 <printf>
    funlock(fd);   
  37:	83 c4 04             	add    $0x4,%esp
  3a:	ff 35 98 06 00 00    	pushl  0x698
  40:	e8 d9 01 00 00       	call   21e <funlock>
    exit();
  45:	e8 0c 01 00 00       	call   156 <exit>

0000004a <startHP>:
}

void startHP()
{
  4a:	f3 0f 1e fb          	endbr32 
  4e:	55                   	push   %ebp
  4f:	89 e5                	mov    %esp,%ebp
  51:	83 ec 08             	sub    $0x8,%esp
    int pid = fork();
  54:	e8 f5 00 00 00       	call   14e <fork>
    if (pid < 0)
    {
        // error
    }
    if (pid == 0)
  59:	85 c0                	test   %eax,%eax
  5b:	74 10                	je     6d <startHP+0x23>
    }
    else
    {
        // this is the parent process
        // we incriment to make the child process the highest priority
        nice(pid, 10);  
  5d:	83 ec 08             	sub    $0x8,%esp
  60:	6a 0a                	push   $0xa
  62:	50                   	push   %eax
  63:	e8 a6 01 00 00       	call   20e <nice>
    }        
    
}
  68:	83 c4 10             	add    $0x10,%esp
  6b:	c9                   	leave  
  6c:	c3                   	ret    
        runHP();
  6d:	e8 8e ff ff ff       	call   0 <runHP>

00000072 <main>:

int main(int argc, const char *argv[])
{
  72:	f3 0f 1e fb          	endbr32 
  76:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  7a:	83 e4 f0             	and    $0xfffffff0,%esp
  7d:	ff 71 fc             	pushl  -0x4(%ecx)
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	56                   	push   %esi
  84:	53                   	push   %ebx
  85:	51                   	push   %ecx
  86:	83 ec 18             	sub    $0x18,%esp
    // aquire lock
    flock(fd);
  89:	ff 35 98 06 00 00    	pushl  0x698
  8f:	e8 82 01 00 00       	call   216 <flock>
    printf(1, "Low got lock %d\n", fd);
  94:	83 c4 0c             	add    $0xc,%esp
  97:	ff 35 98 06 00 00    	pushl  0x698
  9d:	68 2e 06 00 00       	push   $0x62e
  a2:	6a 01                	push   $0x1
  a4:	e8 2c 05 00 00       	call   5d5 <printf>

    // start child processes
    startHP();
  a9:	e8 9c ff ff ff       	call   4a <startHP>
    startHP();
  ae:	e8 97 ff ff ff       	call   4a <startHP>
    startHP();
  b3:	e8 92 ff ff ff       	call   4a <startHP>

    sleep(10);
  b8:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  bf:	e8 22 01 00 00       	call   1e6 <sleep>
    int counter = 6;
    // lower priority process running
    while (counter > 0)
  c4:	83 c4 10             	add    $0x10,%esp
    int counter = 6;
  c7:	bb 06 00 00 00       	mov    $0x6,%ebx
    while (counter > 0)
  cc:	85 db                	test   %ebx,%ebx
  ce:	7e 23                	jle    f3 <main+0x81>
    {
        printf(1, "...Low priority running...\n");
  d0:	83 ec 08             	sub    $0x8,%esp
  d3:	68 3f 06 00 00       	push   $0x63f
  d8:	6a 01                	push   $0x1
  da:	e8 f6 04 00 00       	call   5d5 <printf>
        sleep(50);
  df:	c7 04 24 32 00 00 00 	movl   $0x32,(%esp)
  e6:	e8 fb 00 00 00       	call   1e6 <sleep>
        counter -= 1;
  eb:	83 eb 01             	sub    $0x1,%ebx
  ee:	83 c4 10             	add    $0x10,%esp
  f1:	eb d9                	jmp    cc <main+0x5a>
    }
    printf(1, "Low releasing lock %d\n", fd);
  f3:	83 ec 04             	sub    $0x4,%esp
  f6:	ff 35 98 06 00 00    	pushl  0x698
  fc:	68 5b 06 00 00       	push   $0x65b
 101:	6a 01                	push   $0x1
 103:	e8 cd 04 00 00       	call   5d5 <printf>
    funlock(fd);
 108:	83 c4 04             	add    $0x4,%esp
 10b:	ff 35 98 06 00 00    	pushl  0x698
 111:	e8 08 01 00 00       	call   21e <funlock>

    // wait on the child processes as to not create zombies
    int pidOne = wait();
 116:	e8 43 00 00 00       	call   15e <wait>
 11b:	89 c6                	mov    %eax,%esi
    int pidTwo = wait();
 11d:	e8 3c 00 00 00       	call   15e <wait>
 122:	89 c3                	mov    %eax,%ebx
    printf(1, "%d exited\n", pidOne);
 124:	83 c4 0c             	add    $0xc,%esp
 127:	56                   	push   %esi
 128:	68 72 06 00 00       	push   $0x672
 12d:	6a 01                	push   $0x1
 12f:	e8 a1 04 00 00       	call   5d5 <printf>
    printf(1, "%d exited\n", pidTwo);
 134:	83 c4 0c             	add    $0xc,%esp
 137:	53                   	push   %ebx
 138:	68 72 06 00 00       	push   $0x672
 13d:	6a 01                	push   $0x1
 13f:	e8 91 04 00 00       	call   5d5 <printf>

    // wait before exit just to be safe
    wait();
 144:	e8 15 00 00 00       	call   15e <wait>
    exit();
 149:	e8 08 00 00 00       	call   156 <exit>

0000014e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 14e:	b8 01 00 00 00       	mov    $0x1,%eax
 153:	cd 40                	int    $0x40
 155:	c3                   	ret    

00000156 <exit>:
SYSCALL(exit)
 156:	b8 02 00 00 00       	mov    $0x2,%eax
 15b:	cd 40                	int    $0x40
 15d:	c3                   	ret    

0000015e <wait>:
SYSCALL(wait)
 15e:	b8 03 00 00 00       	mov    $0x3,%eax
 163:	cd 40                	int    $0x40
 165:	c3                   	ret    

00000166 <pipe>:
SYSCALL(pipe)
 166:	b8 04 00 00 00       	mov    $0x4,%eax
 16b:	cd 40                	int    $0x40
 16d:	c3                   	ret    

0000016e <read>:
SYSCALL(read)
 16e:	b8 05 00 00 00       	mov    $0x5,%eax
 173:	cd 40                	int    $0x40
 175:	c3                   	ret    

00000176 <write>:
SYSCALL(write)
 176:	b8 10 00 00 00       	mov    $0x10,%eax
 17b:	cd 40                	int    $0x40
 17d:	c3                   	ret    

0000017e <close>:
SYSCALL(close)
 17e:	b8 15 00 00 00       	mov    $0x15,%eax
 183:	cd 40                	int    $0x40
 185:	c3                   	ret    

00000186 <kill>:
SYSCALL(kill)
 186:	b8 06 00 00 00       	mov    $0x6,%eax
 18b:	cd 40                	int    $0x40
 18d:	c3                   	ret    

0000018e <exec>:
SYSCALL(exec)
 18e:	b8 07 00 00 00       	mov    $0x7,%eax
 193:	cd 40                	int    $0x40
 195:	c3                   	ret    

00000196 <open>:
SYSCALL(open)
 196:	b8 0f 00 00 00       	mov    $0xf,%eax
 19b:	cd 40                	int    $0x40
 19d:	c3                   	ret    

0000019e <mknod>:
SYSCALL(mknod)
 19e:	b8 11 00 00 00       	mov    $0x11,%eax
 1a3:	cd 40                	int    $0x40
 1a5:	c3                   	ret    

000001a6 <unlink>:
SYSCALL(unlink)
 1a6:	b8 12 00 00 00       	mov    $0x12,%eax
 1ab:	cd 40                	int    $0x40
 1ad:	c3                   	ret    

000001ae <fstat>:
SYSCALL(fstat)
 1ae:	b8 08 00 00 00       	mov    $0x8,%eax
 1b3:	cd 40                	int    $0x40
 1b5:	c3                   	ret    

000001b6 <link>:
SYSCALL(link)
 1b6:	b8 13 00 00 00       	mov    $0x13,%eax
 1bb:	cd 40                	int    $0x40
 1bd:	c3                   	ret    

000001be <mkdir>:
SYSCALL(mkdir)
 1be:	b8 14 00 00 00       	mov    $0x14,%eax
 1c3:	cd 40                	int    $0x40
 1c5:	c3                   	ret    

000001c6 <chdir>:
SYSCALL(chdir)
 1c6:	b8 09 00 00 00       	mov    $0x9,%eax
 1cb:	cd 40                	int    $0x40
 1cd:	c3                   	ret    

000001ce <dup>:
SYSCALL(dup)
 1ce:	b8 0a 00 00 00       	mov    $0xa,%eax
 1d3:	cd 40                	int    $0x40
 1d5:	c3                   	ret    

000001d6 <getpid>:
SYSCALL(getpid)
 1d6:	b8 0b 00 00 00       	mov    $0xb,%eax
 1db:	cd 40                	int    $0x40
 1dd:	c3                   	ret    

000001de <sbrk>:
SYSCALL(sbrk)
 1de:	b8 0c 00 00 00       	mov    $0xc,%eax
 1e3:	cd 40                	int    $0x40
 1e5:	c3                   	ret    

000001e6 <sleep>:
SYSCALL(sleep)
 1e6:	b8 0d 00 00 00       	mov    $0xd,%eax
 1eb:	cd 40                	int    $0x40
 1ed:	c3                   	ret    

000001ee <uptime>:
SYSCALL(uptime)
 1ee:	b8 0e 00 00 00       	mov    $0xe,%eax
 1f3:	cd 40                	int    $0x40
 1f5:	c3                   	ret    

000001f6 <yield>:
SYSCALL(yield)
 1f6:	b8 16 00 00 00       	mov    $0x16,%eax
 1fb:	cd 40                	int    $0x40
 1fd:	c3                   	ret    

000001fe <shutdown>:
SYSCALL(shutdown)
 1fe:	b8 17 00 00 00       	mov    $0x17,%eax
 203:	cd 40                	int    $0x40
 205:	c3                   	ret    

00000206 <ps>:
SYSCALL(ps)
 206:	b8 18 00 00 00       	mov    $0x18,%eax
 20b:	cd 40                	int    $0x40
 20d:	c3                   	ret    

0000020e <nice>:
SYSCALL(nice)
 20e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 213:	cd 40                	int    $0x40
 215:	c3                   	ret    

00000216 <flock>:
SYSCALL(flock)
 216:	b8 19 00 00 00       	mov    $0x19,%eax
 21b:	cd 40                	int    $0x40
 21d:	c3                   	ret    

0000021e <funlock>:
 21e:	b8 1a 00 00 00       	mov    $0x1a,%eax
 223:	cd 40                	int    $0x40
 225:	c3                   	ret    

00000226 <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 226:	f3 0f 1e fb          	endbr32 
 22a:	55                   	push   %ebp
 22b:	89 e5                	mov    %esp,%ebp
 22d:	8b 45 14             	mov    0x14(%ebp),%eax
 230:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 233:	3b 45 10             	cmp    0x10(%ebp),%eax
 236:	73 06                	jae    23e <s_sputc+0x18>
  {
    outbuffer[index] = c;
 238:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 23b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    

00000240 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
 245:	53                   	push   %ebx
 246:	83 ec 08             	sub    $0x8,%esp
 249:	89 c6                	mov    %eax,%esi
 24b:	89 d3                	mov    %edx,%ebx
 24d:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 250:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 254:	0f 95 c2             	setne  %dl
 257:	89 c8                	mov    %ecx,%eax
 259:	c1 e8 1f             	shr    $0x1f,%eax
 25c:	84 c2                	test   %al,%dl
 25e:	74 33                	je     293 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 260:	89 c8                	mov    %ecx,%eax
 262:	f7 d8                	neg    %eax
    neg = 1;
 264:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 26b:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 270:	8d 4f 01             	lea    0x1(%edi),%ecx
 273:	89 ca                	mov    %ecx,%edx
 275:	39 d9                	cmp    %ebx,%ecx
 277:	73 26                	jae    29f <s_getReverseDigits+0x5f>
 279:	85 c0                	test   %eax,%eax
 27b:	74 22                	je     29f <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 27d:	ba 00 00 00 00       	mov    $0x0,%edx
 282:	f7 75 08             	divl   0x8(%ebp)
 285:	0f b6 92 84 06 00 00 	movzbl 0x684(%edx),%edx
 28c:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 28f:	89 cf                	mov    %ecx,%edi
 291:	eb dd                	jmp    270 <s_getReverseDigits+0x30>
    x = xx;
 293:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 296:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 29d:	eb cc                	jmp    26b <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 29f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2a3:	75 0a                	jne    2af <s_getReverseDigits+0x6f>
 2a5:	39 da                	cmp    %ebx,%edx
 2a7:	73 06                	jae    2af <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 2a9:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 2ad:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 2af:	89 fa                	mov    %edi,%edx
 2b1:	39 df                	cmp    %ebx,%edi
 2b3:	0f 92 c0             	setb   %al
 2b6:	84 45 ec             	test   %al,-0x14(%ebp)
 2b9:	74 07                	je     2c2 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 2bb:	83 c7 01             	add    $0x1,%edi
 2be:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 2c2:	89 f8                	mov    %edi,%eax
 2c4:	83 c4 08             	add    $0x8,%esp
 2c7:	5b                   	pop    %ebx
 2c8:	5e                   	pop    %esi
 2c9:	5f                   	pop    %edi
 2ca:	5d                   	pop    %ebp
 2cb:	c3                   	ret    

000002cc <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 2cc:	39 c2                	cmp    %eax,%edx
 2ce:	0f 46 c2             	cmovbe %edx,%eax
}
 2d1:	c3                   	ret    

000002d2 <s_printint>:
{
 2d2:	55                   	push   %ebp
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	57                   	push   %edi
 2d6:	56                   	push   %esi
 2d7:	53                   	push   %ebx
 2d8:	83 ec 2c             	sub    $0x2c,%esp
 2db:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 2de:	89 55 d0             	mov    %edx,-0x30(%ebp)
 2e1:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 2e4:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 2e7:	ff 75 14             	pushl  0x14(%ebp)
 2ea:	ff 75 10             	pushl  0x10(%ebp)
 2ed:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2f0:	ba 10 00 00 00       	mov    $0x10,%edx
 2f5:	8d 45 d8             	lea    -0x28(%ebp),%eax
 2f8:	e8 43 ff ff ff       	call   240 <s_getReverseDigits>
 2fd:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 300:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 302:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 305:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 30a:	83 eb 01             	sub    $0x1,%ebx
 30d:	78 22                	js     331 <s_printint+0x5f>
 30f:	39 fe                	cmp    %edi,%esi
 311:	73 1e                	jae    331 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 313:	83 ec 0c             	sub    $0xc,%esp
 316:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 31b:	50                   	push   %eax
 31c:	56                   	push   %esi
 31d:	57                   	push   %edi
 31e:	ff 75 cc             	pushl  -0x34(%ebp)
 321:	ff 75 d0             	pushl  -0x30(%ebp)
 324:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 327:	ff d0                	call   *%eax
    j++;
 329:	83 c6 01             	add    $0x1,%esi
 32c:	83 c4 20             	add    $0x20,%esp
 32f:	eb d9                	jmp    30a <s_printint+0x38>
}
 331:	8b 45 c8             	mov    -0x38(%ebp),%eax
 334:	8d 65 f4             	lea    -0xc(%ebp),%esp
 337:	5b                   	pop    %ebx
 338:	5e                   	pop    %esi
 339:	5f                   	pop    %edi
 33a:	5d                   	pop    %ebp
 33b:	c3                   	ret    

0000033c <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 33c:	55                   	push   %ebp
 33d:	89 e5                	mov    %esp,%ebp
 33f:	57                   	push   %edi
 340:	56                   	push   %esi
 341:	53                   	push   %ebx
 342:	83 ec 2c             	sub    $0x2c,%esp
 345:	89 45 d8             	mov    %eax,-0x28(%ebp)
 348:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 34b:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 34e:	8b 45 08             	mov    0x8(%ebp),%eax
 351:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 354:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 35b:	bb 00 00 00 00       	mov    $0x0,%ebx
 360:	89 f8                	mov    %edi,%eax
 362:	89 df                	mov    %ebx,%edi
 364:	89 c6                	mov    %eax,%esi
 366:	eb 20                	jmp    388 <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 368:	8d 43 01             	lea    0x1(%ebx),%eax
 36b:	89 45 e0             	mov    %eax,-0x20(%ebp)
 36e:	83 ec 0c             	sub    $0xc,%esp
 371:	51                   	push   %ecx
 372:	53                   	push   %ebx
 373:	56                   	push   %esi
 374:	ff 75 d0             	pushl  -0x30(%ebp)
 377:	ff 75 d4             	pushl  -0x2c(%ebp)
 37a:	8b 55 d8             	mov    -0x28(%ebp),%edx
 37d:	ff d2                	call   *%edx
 37f:	83 c4 20             	add    $0x20,%esp
 382:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 385:	83 c7 01             	add    $0x1,%edi
 388:	8b 45 0c             	mov    0xc(%ebp),%eax
 38b:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 38f:	84 c0                	test   %al,%al
 391:	0f 84 cd 01 00 00    	je     564 <s_printf+0x228>
 397:	89 75 e0             	mov    %esi,-0x20(%ebp)
 39a:	39 de                	cmp    %ebx,%esi
 39c:	0f 86 c2 01 00 00    	jbe    564 <s_printf+0x228>
    c = fmt[i] & 0xff;
 3a2:	0f be c8             	movsbl %al,%ecx
 3a5:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 3a8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3ab:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 3af:	75 0a                	jne    3bb <s_printf+0x7f>
      if(c == '%') {
 3b1:	83 f8 25             	cmp    $0x25,%eax
 3b4:	75 b2                	jne    368 <s_printf+0x2c>
        state = '%';
 3b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 3b9:	eb ca                	jmp    385 <s_printf+0x49>
      }
    } else if(state == '%'){
 3bb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 3bf:	75 c4                	jne    385 <s_printf+0x49>
      if(c == 'd'){
 3c1:	83 f8 64             	cmp    $0x64,%eax
 3c4:	74 6e                	je     434 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3c6:	83 f8 78             	cmp    $0x78,%eax
 3c9:	0f 94 c1             	sete   %cl
 3cc:	83 f8 70             	cmp    $0x70,%eax
 3cf:	0f 94 c2             	sete   %dl
 3d2:	08 d1                	or     %dl,%cl
 3d4:	0f 85 8e 00 00 00    	jne    468 <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 3da:	83 f8 73             	cmp    $0x73,%eax
 3dd:	0f 84 b9 00 00 00    	je     49c <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 3e3:	83 f8 63             	cmp    $0x63,%eax
 3e6:	0f 84 1a 01 00 00    	je     506 <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 3ec:	83 f8 25             	cmp    $0x25,%eax
 3ef:	0f 84 44 01 00 00    	je     539 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 3f5:	8d 43 01             	lea    0x1(%ebx),%eax
 3f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 3fb:	83 ec 0c             	sub    $0xc,%esp
 3fe:	6a 25                	push   $0x25
 400:	53                   	push   %ebx
 401:	56                   	push   %esi
 402:	ff 75 d0             	pushl  -0x30(%ebp)
 405:	ff 75 d4             	pushl  -0x2c(%ebp)
 408:	8b 45 d8             	mov    -0x28(%ebp),%eax
 40b:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 40d:	83 c3 02             	add    $0x2,%ebx
 410:	83 c4 14             	add    $0x14,%esp
 413:	ff 75 dc             	pushl  -0x24(%ebp)
 416:	ff 75 e4             	pushl  -0x1c(%ebp)
 419:	56                   	push   %esi
 41a:	ff 75 d0             	pushl  -0x30(%ebp)
 41d:	ff 75 d4             	pushl  -0x2c(%ebp)
 420:	8b 45 d8             	mov    -0x28(%ebp),%eax
 423:	ff d0                	call   *%eax
 425:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 428:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 42f:	e9 51 ff ff ff       	jmp    385 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 434:	8b 45 d0             	mov    -0x30(%ebp),%eax
 437:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 43a:	6a 01                	push   $0x1
 43c:	6a 0a                	push   $0xa
 43e:	8b 45 10             	mov    0x10(%ebp),%eax
 441:	ff 30                	pushl  (%eax)
 443:	89 f0                	mov    %esi,%eax
 445:	29 d8                	sub    %ebx,%eax
 447:	50                   	push   %eax
 448:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 44b:	8b 45 d8             	mov    -0x28(%ebp),%eax
 44e:	e8 7f fe ff ff       	call   2d2 <s_printint>
 453:	01 c3                	add    %eax,%ebx
        ap++;
 455:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 459:	83 c4 10             	add    $0x10,%esp
      state = 0;
 45c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 463:	e9 1d ff ff ff       	jmp    385 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 468:	8b 45 d0             	mov    -0x30(%ebp),%eax
 46b:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 46e:	6a 00                	push   $0x0
 470:	6a 10                	push   $0x10
 472:	8b 45 10             	mov    0x10(%ebp),%eax
 475:	ff 30                	pushl  (%eax)
 477:	89 f0                	mov    %esi,%eax
 479:	29 d8                	sub    %ebx,%eax
 47b:	50                   	push   %eax
 47c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 47f:	8b 45 d8             	mov    -0x28(%ebp),%eax
 482:	e8 4b fe ff ff       	call   2d2 <s_printint>
 487:	01 c3                	add    %eax,%ebx
        ap++;
 489:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 48d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 490:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 497:	e9 e9 fe ff ff       	jmp    385 <s_printf+0x49>
        s = (char*)*ap;
 49c:	8b 45 10             	mov    0x10(%ebp),%eax
 49f:	8b 00                	mov    (%eax),%eax
        ap++;
 4a1:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 4a5:	85 c0                	test   %eax,%eax
 4a7:	75 4e                	jne    4f7 <s_printf+0x1bb>
          s = "(null)";
 4a9:	b8 7d 06 00 00       	mov    $0x67d,%eax
 4ae:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4b1:	89 da                	mov    %ebx,%edx
 4b3:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 4b6:	89 75 e0             	mov    %esi,-0x20(%ebp)
 4b9:	89 c6                	mov    %eax,%esi
 4bb:	eb 1f                	jmp    4dc <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 4bd:	8d 7a 01             	lea    0x1(%edx),%edi
 4c0:	83 ec 0c             	sub    $0xc,%esp
 4c3:	0f be c0             	movsbl %al,%eax
 4c6:	50                   	push   %eax
 4c7:	52                   	push   %edx
 4c8:	53                   	push   %ebx
 4c9:	ff 75 d0             	pushl  -0x30(%ebp)
 4cc:	ff 75 d4             	pushl  -0x2c(%ebp)
 4cf:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4d2:	ff d0                	call   *%eax
          s++;
 4d4:	83 c6 01             	add    $0x1,%esi
 4d7:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 4da:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 4dc:	0f b6 06             	movzbl (%esi),%eax
 4df:	84 c0                	test   %al,%al
 4e1:	75 da                	jne    4bd <s_printf+0x181>
 4e3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e6:	89 d3                	mov    %edx,%ebx
 4e8:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 4eb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4f2:	e9 8e fe ff ff       	jmp    385 <s_printf+0x49>
 4f7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4fa:	89 da                	mov    %ebx,%edx
 4fc:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 4ff:	89 75 e0             	mov    %esi,-0x20(%ebp)
 502:	89 c6                	mov    %eax,%esi
 504:	eb d6                	jmp    4dc <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 506:	8d 43 01             	lea    0x1(%ebx),%eax
 509:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 50c:	83 ec 0c             	sub    $0xc,%esp
 50f:	8b 55 10             	mov    0x10(%ebp),%edx
 512:	0f be 02             	movsbl (%edx),%eax
 515:	50                   	push   %eax
 516:	53                   	push   %ebx
 517:	56                   	push   %esi
 518:	ff 75 d0             	pushl  -0x30(%ebp)
 51b:	ff 75 d4             	pushl  -0x2c(%ebp)
 51e:	8b 55 d8             	mov    -0x28(%ebp),%edx
 521:	ff d2                	call   *%edx
        ap++;
 523:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 527:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 52a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 52d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 534:	e9 4c fe ff ff       	jmp    385 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 539:	8d 43 01             	lea    0x1(%ebx),%eax
 53c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 53f:	83 ec 0c             	sub    $0xc,%esp
 542:	ff 75 dc             	pushl  -0x24(%ebp)
 545:	53                   	push   %ebx
 546:	56                   	push   %esi
 547:	ff 75 d0             	pushl  -0x30(%ebp)
 54a:	ff 75 d4             	pushl  -0x2c(%ebp)
 54d:	8b 55 d8             	mov    -0x28(%ebp),%edx
 550:	ff d2                	call   *%edx
 552:	83 c4 20             	add    $0x20,%esp
 555:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 558:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 55f:	e9 21 fe ff ff       	jmp    385 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 564:	89 da                	mov    %ebx,%edx
 566:	89 f0                	mov    %esi,%eax
 568:	e8 5f fd ff ff       	call   2cc <s_min>
}
 56d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 570:	5b                   	pop    %ebx
 571:	5e                   	pop    %esi
 572:	5f                   	pop    %edi
 573:	5d                   	pop    %ebp
 574:	c3                   	ret    

00000575 <s_putc>:
{
 575:	f3 0f 1e fb          	endbr32 
 579:	55                   	push   %ebp
 57a:	89 e5                	mov    %esp,%ebp
 57c:	83 ec 1c             	sub    $0x1c,%esp
 57f:	8b 45 18             	mov    0x18(%ebp),%eax
 582:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 585:	6a 01                	push   $0x1
 587:	8d 45 f4             	lea    -0xc(%ebp),%eax
 58a:	50                   	push   %eax
 58b:	ff 75 08             	pushl  0x8(%ebp)
 58e:	e8 e3 fb ff ff       	call   176 <write>
}
 593:	83 c4 10             	add    $0x10,%esp
 596:	c9                   	leave  
 597:	c3                   	ret    

00000598 <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 598:	f3 0f 1e fb          	endbr32 
 59c:	55                   	push   %ebp
 59d:	89 e5                	mov    %esp,%ebp
 59f:	56                   	push   %esi
 5a0:	53                   	push   %ebx
 5a1:	8b 75 08             	mov    0x8(%ebp),%esi
 5a4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 5a7:	83 ec 04             	sub    $0x4,%esp
 5aa:	8d 45 14             	lea    0x14(%ebp),%eax
 5ad:	50                   	push   %eax
 5ae:	ff 75 10             	pushl  0x10(%ebp)
 5b1:	53                   	push   %ebx
 5b2:	89 f1                	mov    %esi,%ecx
 5b4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 5b9:	b8 26 02 00 00       	mov    $0x226,%eax
 5be:	e8 79 fd ff ff       	call   33c <s_printf>
  if(count < n) {
 5c3:	83 c4 10             	add    $0x10,%esp
 5c6:	39 c3                	cmp    %eax,%ebx
 5c8:	76 04                	jbe    5ce <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 5ca:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 5ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5d1:	5b                   	pop    %ebx
 5d2:	5e                   	pop    %esi
 5d3:	5d                   	pop    %ebp
 5d4:	c3                   	ret    

000005d5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d5:	f3 0f 1e fb          	endbr32 
 5d9:	55                   	push   %ebp
 5da:	89 e5                	mov    %esp,%ebp
 5dc:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 5df:	8d 45 10             	lea    0x10(%ebp),%eax
 5e2:	50                   	push   %eax
 5e3:	ff 75 0c             	pushl  0xc(%ebp)
 5e6:	68 00 00 00 40       	push   $0x40000000
 5eb:	b9 00 00 00 00       	mov    $0x0,%ecx
 5f0:	8b 55 08             	mov    0x8(%ebp),%edx
 5f3:	b8 75 05 00 00       	mov    $0x575,%eax
 5f8:	e8 3f fd ff ff       	call   33c <s_printf>
}
 5fd:	83 c4 10             	add    $0x10,%esp
 600:	c9                   	leave  
 601:	c3                   	ret    
