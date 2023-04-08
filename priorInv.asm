
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
    printf(1, "Starting High Priority Process\n");
   a:	68 14 06 00 00       	push   $0x614
   f:	6a 01                	push   $0x1
  11:	e8 ce 05 00 00       	call   5e4 <printf>
    sleep(500);
  16:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
  1d:	e8 d3 01 00 00       	call   1f5 <sleep>
    printf(1, "High Priority Process obtained lock %d\n", fd);
  22:	83 c4 0c             	add    $0xc,%esp
  25:	ff 35 18 07 00 00    	pushl  0x718
  2b:	68 34 06 00 00       	push   $0x634
  30:	6a 01                	push   $0x1
  32:	e8 ad 05 00 00       	call   5e4 <printf>
    funlock(fd);   
  37:	83 c4 04             	add    $0x4,%esp
  3a:	ff 35 18 07 00 00    	pushl  0x718
  40:	e8 e8 01 00 00       	call   22d <funlock>
    exit();
  45:	e8 1b 01 00 00       	call   165 <exit>

0000004a <startHP>:
}

void startHP()
{
  4a:	f3 0f 1e fb          	endbr32 
  4e:	55                   	push   %ebp
  4f:	89 e5                	mov    %esp,%ebp
  51:	83 ec 08             	sub    $0x8,%esp
    int pid = fork();
  54:	e8 04 01 00 00       	call   15d <fork>
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
        nice(pid, 50);  
  5d:	83 ec 08             	sub    $0x8,%esp
  60:	6a 32                	push   $0x32
  62:	50                   	push   %eax
  63:	e8 b5 01 00 00       	call   21d <nice>
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
  89:	ff 35 18 07 00 00    	pushl  0x718
  8f:	e8 91 01 00 00       	call   225 <flock>
    printf(1, "Low Priority Process got the lock %d\n", fd);
  94:	83 c4 0c             	add    $0xc,%esp
  97:	ff 35 18 07 00 00    	pushl  0x718
  9d:	68 5c 06 00 00       	push   $0x65c
  a2:	6a 01                	push   $0x1
  a4:	e8 3b 05 00 00       	call   5e4 <printf>

    // start child processes
    startHP();
  a9:	e8 9c ff ff ff       	call   4a <startHP>
    startHP();
  ae:	e8 97 ff ff ff       	call   4a <startHP>
    startHP();
  b3:	e8 92 ff ff ff       	call   4a <startHP>

    sleep(10);
  b8:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  bf:	e8 31 01 00 00       	call   1f5 <sleep>
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
        printf(1, "Low priority running...\n");
  d0:	83 ec 08             	sub    $0x8,%esp
  d3:	68 ca 06 00 00       	push   $0x6ca
  d8:	6a 01                	push   $0x1
  da:	e8 05 05 00 00       	call   5e4 <printf>
        sleep(50);
  df:	c7 04 24 32 00 00 00 	movl   $0x32,(%esp)
  e6:	e8 0a 01 00 00       	call   1f5 <sleep>
        counter -= 1;
  eb:	83 eb 01             	sub    $0x1,%ebx
  ee:	83 c4 10             	add    $0x10,%esp
  f1:	eb d9                	jmp    cc <main+0x5a>
    }
    printf(1, "Low Priority releases the lock %d\n", fd);
  f3:	83 ec 04             	sub    $0x4,%esp
  f6:	ff 35 18 07 00 00    	pushl  0x718
  fc:	68 84 06 00 00       	push   $0x684
 101:	6a 01                	push   $0x1
 103:	e8 dc 04 00 00       	call   5e4 <printf>
    funlock(fd);
 108:	83 c4 04             	add    $0x4,%esp
 10b:	ff 35 18 07 00 00    	pushl  0x718
 111:	e8 17 01 00 00       	call   22d <funlock>

    // wait on the child processes as to not create zombies
    int pidOne = wait();
 116:	e8 52 00 00 00       	call   16d <wait>
 11b:	89 c6                	mov    %eax,%esi
    int pidTwo = wait();
 11d:	e8 4b 00 00 00       	call   16d <wait>
 122:	89 c3                	mov    %eax,%ebx
    printf(1, "\n%d Processes complete!\n", pidOne);
 124:	83 c4 0c             	add    $0xc,%esp
 127:	56                   	push   %esi
 128:	68 e3 06 00 00       	push   $0x6e3
 12d:	6a 01                	push   $0x1
 12f:	e8 b0 04 00 00       	call   5e4 <printf>
    printf(1, "\n%d Processes complete!\n", pidTwo);
 134:	83 c4 0c             	add    $0xc,%esp
 137:	53                   	push   %ebx
 138:	68 e3 06 00 00       	push   $0x6e3
 13d:	6a 01                	push   $0x1
 13f:	e8 a0 04 00 00       	call   5e4 <printf>
     printf(1, "\nPriority Inversion Demonstrated\n");
 144:	83 c4 08             	add    $0x8,%esp
 147:	68 a8 06 00 00       	push   $0x6a8
 14c:	6a 01                	push   $0x1
 14e:	e8 91 04 00 00       	call   5e4 <printf>
    // wait before exit just to be safe
    wait();
 153:	e8 15 00 00 00       	call   16d <wait>
    exit();
 158:	e8 08 00 00 00       	call   165 <exit>

0000015d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 15d:	b8 01 00 00 00       	mov    $0x1,%eax
 162:	cd 40                	int    $0x40
 164:	c3                   	ret    

00000165 <exit>:
SYSCALL(exit)
 165:	b8 02 00 00 00       	mov    $0x2,%eax
 16a:	cd 40                	int    $0x40
 16c:	c3                   	ret    

0000016d <wait>:
SYSCALL(wait)
 16d:	b8 03 00 00 00       	mov    $0x3,%eax
 172:	cd 40                	int    $0x40
 174:	c3                   	ret    

00000175 <pipe>:
SYSCALL(pipe)
 175:	b8 04 00 00 00       	mov    $0x4,%eax
 17a:	cd 40                	int    $0x40
 17c:	c3                   	ret    

0000017d <read>:
SYSCALL(read)
 17d:	b8 05 00 00 00       	mov    $0x5,%eax
 182:	cd 40                	int    $0x40
 184:	c3                   	ret    

00000185 <write>:
SYSCALL(write)
 185:	b8 10 00 00 00       	mov    $0x10,%eax
 18a:	cd 40                	int    $0x40
 18c:	c3                   	ret    

0000018d <close>:
SYSCALL(close)
 18d:	b8 15 00 00 00       	mov    $0x15,%eax
 192:	cd 40                	int    $0x40
 194:	c3                   	ret    

00000195 <kill>:
SYSCALL(kill)
 195:	b8 06 00 00 00       	mov    $0x6,%eax
 19a:	cd 40                	int    $0x40
 19c:	c3                   	ret    

0000019d <exec>:
SYSCALL(exec)
 19d:	b8 07 00 00 00       	mov    $0x7,%eax
 1a2:	cd 40                	int    $0x40
 1a4:	c3                   	ret    

000001a5 <open>:
SYSCALL(open)
 1a5:	b8 0f 00 00 00       	mov    $0xf,%eax
 1aa:	cd 40                	int    $0x40
 1ac:	c3                   	ret    

000001ad <mknod>:
SYSCALL(mknod)
 1ad:	b8 11 00 00 00       	mov    $0x11,%eax
 1b2:	cd 40                	int    $0x40
 1b4:	c3                   	ret    

000001b5 <unlink>:
SYSCALL(unlink)
 1b5:	b8 12 00 00 00       	mov    $0x12,%eax
 1ba:	cd 40                	int    $0x40
 1bc:	c3                   	ret    

000001bd <fstat>:
SYSCALL(fstat)
 1bd:	b8 08 00 00 00       	mov    $0x8,%eax
 1c2:	cd 40                	int    $0x40
 1c4:	c3                   	ret    

000001c5 <link>:
SYSCALL(link)
 1c5:	b8 13 00 00 00       	mov    $0x13,%eax
 1ca:	cd 40                	int    $0x40
 1cc:	c3                   	ret    

000001cd <mkdir>:
SYSCALL(mkdir)
 1cd:	b8 14 00 00 00       	mov    $0x14,%eax
 1d2:	cd 40                	int    $0x40
 1d4:	c3                   	ret    

000001d5 <chdir>:
SYSCALL(chdir)
 1d5:	b8 09 00 00 00       	mov    $0x9,%eax
 1da:	cd 40                	int    $0x40
 1dc:	c3                   	ret    

000001dd <dup>:
SYSCALL(dup)
 1dd:	b8 0a 00 00 00       	mov    $0xa,%eax
 1e2:	cd 40                	int    $0x40
 1e4:	c3                   	ret    

000001e5 <getpid>:
SYSCALL(getpid)
 1e5:	b8 0b 00 00 00       	mov    $0xb,%eax
 1ea:	cd 40                	int    $0x40
 1ec:	c3                   	ret    

000001ed <sbrk>:
SYSCALL(sbrk)
 1ed:	b8 0c 00 00 00       	mov    $0xc,%eax
 1f2:	cd 40                	int    $0x40
 1f4:	c3                   	ret    

000001f5 <sleep>:
SYSCALL(sleep)
 1f5:	b8 0d 00 00 00       	mov    $0xd,%eax
 1fa:	cd 40                	int    $0x40
 1fc:	c3                   	ret    

000001fd <uptime>:
SYSCALL(uptime)
 1fd:	b8 0e 00 00 00       	mov    $0xe,%eax
 202:	cd 40                	int    $0x40
 204:	c3                   	ret    

00000205 <yield>:
SYSCALL(yield)
 205:	b8 16 00 00 00       	mov    $0x16,%eax
 20a:	cd 40                	int    $0x40
 20c:	c3                   	ret    

0000020d <shutdown>:
SYSCALL(shutdown)
 20d:	b8 17 00 00 00       	mov    $0x17,%eax
 212:	cd 40                	int    $0x40
 214:	c3                   	ret    

00000215 <ps>:
SYSCALL(ps)
 215:	b8 18 00 00 00       	mov    $0x18,%eax
 21a:	cd 40                	int    $0x40
 21c:	c3                   	ret    

0000021d <nice>:
SYSCALL(nice)
 21d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 222:	cd 40                	int    $0x40
 224:	c3                   	ret    

00000225 <flock>:
SYSCALL(flock)
 225:	b8 19 00 00 00       	mov    $0x19,%eax
 22a:	cd 40                	int    $0x40
 22c:	c3                   	ret    

0000022d <funlock>:
 22d:	b8 1a 00 00 00       	mov    $0x1a,%eax
 232:	cd 40                	int    $0x40
 234:	c3                   	ret    

00000235 <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 235:	f3 0f 1e fb          	endbr32 
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	8b 45 14             	mov    0x14(%ebp),%eax
 23f:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 242:	3b 45 10             	cmp    0x10(%ebp),%eax
 245:	73 06                	jae    24d <s_sputc+0x18>
  {
    outbuffer[index] = c;
 247:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 24a:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    

0000024f <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	57                   	push   %edi
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
 255:	83 ec 08             	sub    $0x8,%esp
 258:	89 c6                	mov    %eax,%esi
 25a:	89 d3                	mov    %edx,%ebx
 25c:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 25f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 263:	0f 95 c2             	setne  %dl
 266:	89 c8                	mov    %ecx,%eax
 268:	c1 e8 1f             	shr    $0x1f,%eax
 26b:	84 c2                	test   %al,%dl
 26d:	74 33                	je     2a2 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 26f:	89 c8                	mov    %ecx,%eax
 271:	f7 d8                	neg    %eax
    neg = 1;
 273:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 27a:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 27f:	8d 4f 01             	lea    0x1(%edi),%ecx
 282:	89 ca                	mov    %ecx,%edx
 284:	39 d9                	cmp    %ebx,%ecx
 286:	73 26                	jae    2ae <s_getReverseDigits+0x5f>
 288:	85 c0                	test   %eax,%eax
 28a:	74 22                	je     2ae <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 28c:	ba 00 00 00 00       	mov    $0x0,%edx
 291:	f7 75 08             	divl   0x8(%ebp)
 294:	0f b6 92 04 07 00 00 	movzbl 0x704(%edx),%edx
 29b:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 29e:	89 cf                	mov    %ecx,%edi
 2a0:	eb dd                	jmp    27f <s_getReverseDigits+0x30>
    x = xx;
 2a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 2a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 2ac:	eb cc                	jmp    27a <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 2ae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2b2:	75 0a                	jne    2be <s_getReverseDigits+0x6f>
 2b4:	39 da                	cmp    %ebx,%edx
 2b6:	73 06                	jae    2be <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 2b8:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 2bc:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 2be:	89 fa                	mov    %edi,%edx
 2c0:	39 df                	cmp    %ebx,%edi
 2c2:	0f 92 c0             	setb   %al
 2c5:	84 45 ec             	test   %al,-0x14(%ebp)
 2c8:	74 07                	je     2d1 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 2ca:	83 c7 01             	add    $0x1,%edi
 2cd:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 2d1:	89 f8                	mov    %edi,%eax
 2d3:	83 c4 08             	add    $0x8,%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 2db:	39 c2                	cmp    %eax,%edx
 2dd:	0f 46 c2             	cmovbe %edx,%eax
}
 2e0:	c3                   	ret    

000002e1 <s_printint>:
{
 2e1:	55                   	push   %ebp
 2e2:	89 e5                	mov    %esp,%ebp
 2e4:	57                   	push   %edi
 2e5:	56                   	push   %esi
 2e6:	53                   	push   %ebx
 2e7:	83 ec 2c             	sub    $0x2c,%esp
 2ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 2ed:	89 55 d0             	mov    %edx,-0x30(%ebp)
 2f0:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 2f3:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 2f6:	ff 75 14             	pushl  0x14(%ebp)
 2f9:	ff 75 10             	pushl  0x10(%ebp)
 2fc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ff:	ba 10 00 00 00       	mov    $0x10,%edx
 304:	8d 45 d8             	lea    -0x28(%ebp),%eax
 307:	e8 43 ff ff ff       	call   24f <s_getReverseDigits>
 30c:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 30f:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 311:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 314:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 319:	83 eb 01             	sub    $0x1,%ebx
 31c:	78 22                	js     340 <s_printint+0x5f>
 31e:	39 fe                	cmp    %edi,%esi
 320:	73 1e                	jae    340 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 322:	83 ec 0c             	sub    $0xc,%esp
 325:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 32a:	50                   	push   %eax
 32b:	56                   	push   %esi
 32c:	57                   	push   %edi
 32d:	ff 75 cc             	pushl  -0x34(%ebp)
 330:	ff 75 d0             	pushl  -0x30(%ebp)
 333:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 336:	ff d0                	call   *%eax
    j++;
 338:	83 c6 01             	add    $0x1,%esi
 33b:	83 c4 20             	add    $0x20,%esp
 33e:	eb d9                	jmp    319 <s_printint+0x38>
}
 340:	8b 45 c8             	mov    -0x38(%ebp),%eax
 343:	8d 65 f4             	lea    -0xc(%ebp),%esp
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    

0000034b <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	57                   	push   %edi
 34f:	56                   	push   %esi
 350:	53                   	push   %ebx
 351:	83 ec 2c             	sub    $0x2c,%esp
 354:	89 45 d8             	mov    %eax,-0x28(%ebp)
 357:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 35a:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 35d:	8b 45 08             	mov    0x8(%ebp),%eax
 360:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 363:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 36a:	bb 00 00 00 00       	mov    $0x0,%ebx
 36f:	89 f8                	mov    %edi,%eax
 371:	89 df                	mov    %ebx,%edi
 373:	89 c6                	mov    %eax,%esi
 375:	eb 20                	jmp    397 <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 377:	8d 43 01             	lea    0x1(%ebx),%eax
 37a:	89 45 e0             	mov    %eax,-0x20(%ebp)
 37d:	83 ec 0c             	sub    $0xc,%esp
 380:	51                   	push   %ecx
 381:	53                   	push   %ebx
 382:	56                   	push   %esi
 383:	ff 75 d0             	pushl  -0x30(%ebp)
 386:	ff 75 d4             	pushl  -0x2c(%ebp)
 389:	8b 55 d8             	mov    -0x28(%ebp),%edx
 38c:	ff d2                	call   *%edx
 38e:	83 c4 20             	add    $0x20,%esp
 391:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 394:	83 c7 01             	add    $0x1,%edi
 397:	8b 45 0c             	mov    0xc(%ebp),%eax
 39a:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 39e:	84 c0                	test   %al,%al
 3a0:	0f 84 cd 01 00 00    	je     573 <s_printf+0x228>
 3a6:	89 75 e0             	mov    %esi,-0x20(%ebp)
 3a9:	39 de                	cmp    %ebx,%esi
 3ab:	0f 86 c2 01 00 00    	jbe    573 <s_printf+0x228>
    c = fmt[i] & 0xff;
 3b1:	0f be c8             	movsbl %al,%ecx
 3b4:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 3b7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3ba:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 3be:	75 0a                	jne    3ca <s_printf+0x7f>
      if(c == '%') {
 3c0:	83 f8 25             	cmp    $0x25,%eax
 3c3:	75 b2                	jne    377 <s_printf+0x2c>
        state = '%';
 3c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 3c8:	eb ca                	jmp    394 <s_printf+0x49>
      }
    } else if(state == '%'){
 3ca:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 3ce:	75 c4                	jne    394 <s_printf+0x49>
      if(c == 'd'){
 3d0:	83 f8 64             	cmp    $0x64,%eax
 3d3:	74 6e                	je     443 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3d5:	83 f8 78             	cmp    $0x78,%eax
 3d8:	0f 94 c1             	sete   %cl
 3db:	83 f8 70             	cmp    $0x70,%eax
 3de:	0f 94 c2             	sete   %dl
 3e1:	08 d1                	or     %dl,%cl
 3e3:	0f 85 8e 00 00 00    	jne    477 <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 3e9:	83 f8 73             	cmp    $0x73,%eax
 3ec:	0f 84 b9 00 00 00    	je     4ab <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 3f2:	83 f8 63             	cmp    $0x63,%eax
 3f5:	0f 84 1a 01 00 00    	je     515 <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 3fb:	83 f8 25             	cmp    $0x25,%eax
 3fe:	0f 84 44 01 00 00    	je     548 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 404:	8d 43 01             	lea    0x1(%ebx),%eax
 407:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 40a:	83 ec 0c             	sub    $0xc,%esp
 40d:	6a 25                	push   $0x25
 40f:	53                   	push   %ebx
 410:	56                   	push   %esi
 411:	ff 75 d0             	pushl  -0x30(%ebp)
 414:	ff 75 d4             	pushl  -0x2c(%ebp)
 417:	8b 45 d8             	mov    -0x28(%ebp),%eax
 41a:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 41c:	83 c3 02             	add    $0x2,%ebx
 41f:	83 c4 14             	add    $0x14,%esp
 422:	ff 75 dc             	pushl  -0x24(%ebp)
 425:	ff 75 e4             	pushl  -0x1c(%ebp)
 428:	56                   	push   %esi
 429:	ff 75 d0             	pushl  -0x30(%ebp)
 42c:	ff 75 d4             	pushl  -0x2c(%ebp)
 42f:	8b 45 d8             	mov    -0x28(%ebp),%eax
 432:	ff d0                	call   *%eax
 434:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 437:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 43e:	e9 51 ff ff ff       	jmp    394 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 443:	8b 45 d0             	mov    -0x30(%ebp),%eax
 446:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 449:	6a 01                	push   $0x1
 44b:	6a 0a                	push   $0xa
 44d:	8b 45 10             	mov    0x10(%ebp),%eax
 450:	ff 30                	pushl  (%eax)
 452:	89 f0                	mov    %esi,%eax
 454:	29 d8                	sub    %ebx,%eax
 456:	50                   	push   %eax
 457:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 45a:	8b 45 d8             	mov    -0x28(%ebp),%eax
 45d:	e8 7f fe ff ff       	call   2e1 <s_printint>
 462:	01 c3                	add    %eax,%ebx
        ap++;
 464:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 468:	83 c4 10             	add    $0x10,%esp
      state = 0;
 46b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 472:	e9 1d ff ff ff       	jmp    394 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 477:	8b 45 d0             	mov    -0x30(%ebp),%eax
 47a:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 47d:	6a 00                	push   $0x0
 47f:	6a 10                	push   $0x10
 481:	8b 45 10             	mov    0x10(%ebp),%eax
 484:	ff 30                	pushl  (%eax)
 486:	89 f0                	mov    %esi,%eax
 488:	29 d8                	sub    %ebx,%eax
 48a:	50                   	push   %eax
 48b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 48e:	8b 45 d8             	mov    -0x28(%ebp),%eax
 491:	e8 4b fe ff ff       	call   2e1 <s_printint>
 496:	01 c3                	add    %eax,%ebx
        ap++;
 498:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 49c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 49f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4a6:	e9 e9 fe ff ff       	jmp    394 <s_printf+0x49>
        s = (char*)*ap;
 4ab:	8b 45 10             	mov    0x10(%ebp),%eax
 4ae:	8b 00                	mov    (%eax),%eax
        ap++;
 4b0:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 4b4:	85 c0                	test   %eax,%eax
 4b6:	75 4e                	jne    506 <s_printf+0x1bb>
          s = "(null)";
 4b8:	b8 fc 06 00 00       	mov    $0x6fc,%eax
 4bd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4c0:	89 da                	mov    %ebx,%edx
 4c2:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 4c5:	89 75 e0             	mov    %esi,-0x20(%ebp)
 4c8:	89 c6                	mov    %eax,%esi
 4ca:	eb 1f                	jmp    4eb <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 4cc:	8d 7a 01             	lea    0x1(%edx),%edi
 4cf:	83 ec 0c             	sub    $0xc,%esp
 4d2:	0f be c0             	movsbl %al,%eax
 4d5:	50                   	push   %eax
 4d6:	52                   	push   %edx
 4d7:	53                   	push   %ebx
 4d8:	ff 75 d0             	pushl  -0x30(%ebp)
 4db:	ff 75 d4             	pushl  -0x2c(%ebp)
 4de:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4e1:	ff d0                	call   *%eax
          s++;
 4e3:	83 c6 01             	add    $0x1,%esi
 4e6:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 4e9:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 4eb:	0f b6 06             	movzbl (%esi),%eax
 4ee:	84 c0                	test   %al,%al
 4f0:	75 da                	jne    4cc <s_printf+0x181>
 4f2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4f5:	89 d3                	mov    %edx,%ebx
 4f7:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 4fa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 501:	e9 8e fe ff ff       	jmp    394 <s_printf+0x49>
 506:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 509:	89 da                	mov    %ebx,%edx
 50b:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 50e:	89 75 e0             	mov    %esi,-0x20(%ebp)
 511:	89 c6                	mov    %eax,%esi
 513:	eb d6                	jmp    4eb <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 515:	8d 43 01             	lea    0x1(%ebx),%eax
 518:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 51b:	83 ec 0c             	sub    $0xc,%esp
 51e:	8b 55 10             	mov    0x10(%ebp),%edx
 521:	0f be 02             	movsbl (%edx),%eax
 524:	50                   	push   %eax
 525:	53                   	push   %ebx
 526:	56                   	push   %esi
 527:	ff 75 d0             	pushl  -0x30(%ebp)
 52a:	ff 75 d4             	pushl  -0x2c(%ebp)
 52d:	8b 55 d8             	mov    -0x28(%ebp),%edx
 530:	ff d2                	call   *%edx
        ap++;
 532:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 536:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 539:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 53c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 543:	e9 4c fe ff ff       	jmp    394 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 548:	8d 43 01             	lea    0x1(%ebx),%eax
 54b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 54e:	83 ec 0c             	sub    $0xc,%esp
 551:	ff 75 dc             	pushl  -0x24(%ebp)
 554:	53                   	push   %ebx
 555:	56                   	push   %esi
 556:	ff 75 d0             	pushl  -0x30(%ebp)
 559:	ff 75 d4             	pushl  -0x2c(%ebp)
 55c:	8b 55 d8             	mov    -0x28(%ebp),%edx
 55f:	ff d2                	call   *%edx
 561:	83 c4 20             	add    $0x20,%esp
 564:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 567:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 56e:	e9 21 fe ff ff       	jmp    394 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 573:	89 da                	mov    %ebx,%edx
 575:	89 f0                	mov    %esi,%eax
 577:	e8 5f fd ff ff       	call   2db <s_min>
}
 57c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57f:	5b                   	pop    %ebx
 580:	5e                   	pop    %esi
 581:	5f                   	pop    %edi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    

00000584 <s_putc>:
{
 584:	f3 0f 1e fb          	endbr32 
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	83 ec 1c             	sub    $0x1c,%esp
 58e:	8b 45 18             	mov    0x18(%ebp),%eax
 591:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 594:	6a 01                	push   $0x1
 596:	8d 45 f4             	lea    -0xc(%ebp),%eax
 599:	50                   	push   %eax
 59a:	ff 75 08             	pushl  0x8(%ebp)
 59d:	e8 e3 fb ff ff       	call   185 <write>
}
 5a2:	83 c4 10             	add    $0x10,%esp
 5a5:	c9                   	leave  
 5a6:	c3                   	ret    

000005a7 <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 5a7:	f3 0f 1e fb          	endbr32 
 5ab:	55                   	push   %ebp
 5ac:	89 e5                	mov    %esp,%ebp
 5ae:	56                   	push   %esi
 5af:	53                   	push   %ebx
 5b0:	8b 75 08             	mov    0x8(%ebp),%esi
 5b3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 5b6:	83 ec 04             	sub    $0x4,%esp
 5b9:	8d 45 14             	lea    0x14(%ebp),%eax
 5bc:	50                   	push   %eax
 5bd:	ff 75 10             	pushl  0x10(%ebp)
 5c0:	53                   	push   %ebx
 5c1:	89 f1                	mov    %esi,%ecx
 5c3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 5c8:	b8 35 02 00 00       	mov    $0x235,%eax
 5cd:	e8 79 fd ff ff       	call   34b <s_printf>
  if(count < n) {
 5d2:	83 c4 10             	add    $0x10,%esp
 5d5:	39 c3                	cmp    %eax,%ebx
 5d7:	76 04                	jbe    5dd <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 5d9:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 5dd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5e0:	5b                   	pop    %ebx
 5e1:	5e                   	pop    %esi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    

000005e4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e4:	f3 0f 1e fb          	endbr32 
 5e8:	55                   	push   %ebp
 5e9:	89 e5                	mov    %esp,%ebp
 5eb:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 5ee:	8d 45 10             	lea    0x10(%ebp),%eax
 5f1:	50                   	push   %eax
 5f2:	ff 75 0c             	pushl  0xc(%ebp)
 5f5:	68 00 00 00 40       	push   $0x40000000
 5fa:	b9 00 00 00 00       	mov    $0x0,%ecx
 5ff:	8b 55 08             	mov    0x8(%ebp),%edx
 602:	b8 84 05 00 00       	mov    $0x584,%eax
 607:	e8 3f fd ff ff       	call   34b <s_printf>
}
 60c:	83 c4 10             	add    $0x10,%esp
 60f:	c9                   	leave  
 610:	c3                   	ret    
