
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
   a:	68 f4 05 00 00       	push   $0x5f4
   f:	6a 01                	push   $0x1
  11:	e8 ae 05 00 00       	call   5c4 <printf>
    sleep(500);
  16:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
  1d:	e8 b3 01 00 00       	call   1d5 <sleep>
    printf(1, "High Priority Process obtained lock %d\n", fd);
  22:	83 c4 0c             	add    $0xc,%esp
  25:	ff 35 f8 06 00 00    	pushl  0x6f8
  2b:	68 14 06 00 00       	push   $0x614
  30:	6a 01                	push   $0x1
  32:	e8 8d 05 00 00       	call   5c4 <printf>
    funlock(fd);   
  37:	83 c4 04             	add    $0x4,%esp
  3a:	ff 35 f8 06 00 00    	pushl  0x6f8
  40:	e8 c8 01 00 00       	call   20d <funlock>
    exit();
  45:	e8 fb 00 00 00       	call   145 <exit>

0000004a <startHP>:
}

void startHP()
{
  4a:	f3 0f 1e fb          	endbr32 
  4e:	55                   	push   %ebp
  4f:	89 e5                	mov    %esp,%ebp
  51:	83 ec 08             	sub    $0x8,%esp
    int pid = fork();
  54:	e8 e4 00 00 00       	call   13d <fork>
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
  63:	e8 95 01 00 00       	call   1fd <nice>
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
  89:	ff 35 f8 06 00 00    	pushl  0x6f8
  8f:	e8 71 01 00 00       	call   205 <flock>
    printf(1, "Low Priority Process got the lock %d\n", fd);
  94:	83 c4 0c             	add    $0xc,%esp
  97:	ff 35 f8 06 00 00    	pushl  0x6f8
  9d:	68 3c 06 00 00       	push   $0x63c
  a2:	6a 01                	push   $0x1
  a4:	e8 1b 05 00 00       	call   5c4 <printf>

    // start child processes
    startHP();
  a9:	e8 9c ff ff ff       	call   4a <startHP>
    startHP();
  ae:	e8 97 ff ff ff       	call   4a <startHP>
    startHP();
  b3:	e8 92 ff ff ff       	call   4a <startHP>

  
  
    // lower priority process running
    printf(1, "Low priority running...\n");
  b8:	83 c4 08             	add    $0x8,%esp
  bb:	68 aa 06 00 00       	push   $0x6aa
  c0:	6a 01                	push   $0x1
  c2:	e8 fd 04 00 00       	call   5c4 <printf>
    sleep(100);
  c7:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  ce:	e8 02 01 00 00       	call   1d5 <sleep>

    printf(1, "Low Priority releases the lock %d\n", fd);
  d3:	83 c4 0c             	add    $0xc,%esp
  d6:	ff 35 f8 06 00 00    	pushl  0x6f8
  dc:	68 64 06 00 00       	push   $0x664
  e1:	6a 01                	push   $0x1
  e3:	e8 dc 04 00 00       	call   5c4 <printf>
    funlock(fd);
  e8:	83 c4 04             	add    $0x4,%esp
  eb:	ff 35 f8 06 00 00    	pushl  0x6f8
  f1:	e8 17 01 00 00       	call   20d <funlock>

    // wait on the child processes as to not create zombies
    int pidOne = wait();
  f6:	e8 52 00 00 00       	call   14d <wait>
  fb:	89 c6                	mov    %eax,%esi
    int pidTwo = wait();
  fd:	e8 4b 00 00 00       	call   14d <wait>
 102:	89 c3                	mov    %eax,%ebx
    printf(1, "\n%d Processes complete!\n", pidOne);
 104:	83 c4 0c             	add    $0xc,%esp
 107:	56                   	push   %esi
 108:	68 c3 06 00 00       	push   $0x6c3
 10d:	6a 01                	push   $0x1
 10f:	e8 b0 04 00 00       	call   5c4 <printf>
    printf(1, "\n%d Processes complete!\n", pidTwo);
 114:	83 c4 0c             	add    $0xc,%esp
 117:	53                   	push   %ebx
 118:	68 c3 06 00 00       	push   $0x6c3
 11d:	6a 01                	push   $0x1
 11f:	e8 a0 04 00 00       	call   5c4 <printf>
     printf(1, "\nPriority Inversion Demonstrated\n");
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 88 06 00 00       	push   $0x688
 12c:	6a 01                	push   $0x1
 12e:	e8 91 04 00 00       	call   5c4 <printf>
    // wait before exit just to be safe
    wait();
 133:	e8 15 00 00 00       	call   14d <wait>
    exit();
 138:	e8 08 00 00 00       	call   145 <exit>

0000013d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 13d:	b8 01 00 00 00       	mov    $0x1,%eax
 142:	cd 40                	int    $0x40
 144:	c3                   	ret    

00000145 <exit>:
SYSCALL(exit)
 145:	b8 02 00 00 00       	mov    $0x2,%eax
 14a:	cd 40                	int    $0x40
 14c:	c3                   	ret    

0000014d <wait>:
SYSCALL(wait)
 14d:	b8 03 00 00 00       	mov    $0x3,%eax
 152:	cd 40                	int    $0x40
 154:	c3                   	ret    

00000155 <pipe>:
SYSCALL(pipe)
 155:	b8 04 00 00 00       	mov    $0x4,%eax
 15a:	cd 40                	int    $0x40
 15c:	c3                   	ret    

0000015d <read>:
SYSCALL(read)
 15d:	b8 05 00 00 00       	mov    $0x5,%eax
 162:	cd 40                	int    $0x40
 164:	c3                   	ret    

00000165 <write>:
SYSCALL(write)
 165:	b8 10 00 00 00       	mov    $0x10,%eax
 16a:	cd 40                	int    $0x40
 16c:	c3                   	ret    

0000016d <close>:
SYSCALL(close)
 16d:	b8 15 00 00 00       	mov    $0x15,%eax
 172:	cd 40                	int    $0x40
 174:	c3                   	ret    

00000175 <kill>:
SYSCALL(kill)
 175:	b8 06 00 00 00       	mov    $0x6,%eax
 17a:	cd 40                	int    $0x40
 17c:	c3                   	ret    

0000017d <exec>:
SYSCALL(exec)
 17d:	b8 07 00 00 00       	mov    $0x7,%eax
 182:	cd 40                	int    $0x40
 184:	c3                   	ret    

00000185 <open>:
SYSCALL(open)
 185:	b8 0f 00 00 00       	mov    $0xf,%eax
 18a:	cd 40                	int    $0x40
 18c:	c3                   	ret    

0000018d <mknod>:
SYSCALL(mknod)
 18d:	b8 11 00 00 00       	mov    $0x11,%eax
 192:	cd 40                	int    $0x40
 194:	c3                   	ret    

00000195 <unlink>:
SYSCALL(unlink)
 195:	b8 12 00 00 00       	mov    $0x12,%eax
 19a:	cd 40                	int    $0x40
 19c:	c3                   	ret    

0000019d <fstat>:
SYSCALL(fstat)
 19d:	b8 08 00 00 00       	mov    $0x8,%eax
 1a2:	cd 40                	int    $0x40
 1a4:	c3                   	ret    

000001a5 <link>:
SYSCALL(link)
 1a5:	b8 13 00 00 00       	mov    $0x13,%eax
 1aa:	cd 40                	int    $0x40
 1ac:	c3                   	ret    

000001ad <mkdir>:
SYSCALL(mkdir)
 1ad:	b8 14 00 00 00       	mov    $0x14,%eax
 1b2:	cd 40                	int    $0x40
 1b4:	c3                   	ret    

000001b5 <chdir>:
SYSCALL(chdir)
 1b5:	b8 09 00 00 00       	mov    $0x9,%eax
 1ba:	cd 40                	int    $0x40
 1bc:	c3                   	ret    

000001bd <dup>:
SYSCALL(dup)
 1bd:	b8 0a 00 00 00       	mov    $0xa,%eax
 1c2:	cd 40                	int    $0x40
 1c4:	c3                   	ret    

000001c5 <getpid>:
SYSCALL(getpid)
 1c5:	b8 0b 00 00 00       	mov    $0xb,%eax
 1ca:	cd 40                	int    $0x40
 1cc:	c3                   	ret    

000001cd <sbrk>:
SYSCALL(sbrk)
 1cd:	b8 0c 00 00 00       	mov    $0xc,%eax
 1d2:	cd 40                	int    $0x40
 1d4:	c3                   	ret    

000001d5 <sleep>:
SYSCALL(sleep)
 1d5:	b8 0d 00 00 00       	mov    $0xd,%eax
 1da:	cd 40                	int    $0x40
 1dc:	c3                   	ret    

000001dd <uptime>:
SYSCALL(uptime)
 1dd:	b8 0e 00 00 00       	mov    $0xe,%eax
 1e2:	cd 40                	int    $0x40
 1e4:	c3                   	ret    

000001e5 <yield>:
SYSCALL(yield)
 1e5:	b8 16 00 00 00       	mov    $0x16,%eax
 1ea:	cd 40                	int    $0x40
 1ec:	c3                   	ret    

000001ed <shutdown>:
SYSCALL(shutdown)
 1ed:	b8 17 00 00 00       	mov    $0x17,%eax
 1f2:	cd 40                	int    $0x40
 1f4:	c3                   	ret    

000001f5 <ps>:
SYSCALL(ps)
 1f5:	b8 18 00 00 00       	mov    $0x18,%eax
 1fa:	cd 40                	int    $0x40
 1fc:	c3                   	ret    

000001fd <nice>:
SYSCALL(nice)
 1fd:	b8 1b 00 00 00       	mov    $0x1b,%eax
 202:	cd 40                	int    $0x40
 204:	c3                   	ret    

00000205 <flock>:
SYSCALL(flock)
 205:	b8 19 00 00 00       	mov    $0x19,%eax
 20a:	cd 40                	int    $0x40
 20c:	c3                   	ret    

0000020d <funlock>:
 20d:	b8 1a 00 00 00       	mov    $0x1a,%eax
 212:	cd 40                	int    $0x40
 214:	c3                   	ret    

00000215 <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 215:	f3 0f 1e fb          	endbr32 
 219:	55                   	push   %ebp
 21a:	89 e5                	mov    %esp,%ebp
 21c:	8b 45 14             	mov    0x14(%ebp),%eax
 21f:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 222:	3b 45 10             	cmp    0x10(%ebp),%eax
 225:	73 06                	jae    22d <s_sputc+0x18>
  {
    outbuffer[index] = c;
 227:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 22a:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret    

0000022f <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	57                   	push   %edi
 233:	56                   	push   %esi
 234:	53                   	push   %ebx
 235:	83 ec 08             	sub    $0x8,%esp
 238:	89 c6                	mov    %eax,%esi
 23a:	89 d3                	mov    %edx,%ebx
 23c:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 23f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 243:	0f 95 c2             	setne  %dl
 246:	89 c8                	mov    %ecx,%eax
 248:	c1 e8 1f             	shr    $0x1f,%eax
 24b:	84 c2                	test   %al,%dl
 24d:	74 33                	je     282 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 24f:	89 c8                	mov    %ecx,%eax
 251:	f7 d8                	neg    %eax
    neg = 1;
 253:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 25a:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 25f:	8d 4f 01             	lea    0x1(%edi),%ecx
 262:	89 ca                	mov    %ecx,%edx
 264:	39 d9                	cmp    %ebx,%ecx
 266:	73 26                	jae    28e <s_getReverseDigits+0x5f>
 268:	85 c0                	test   %eax,%eax
 26a:	74 22                	je     28e <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 26c:	ba 00 00 00 00       	mov    $0x0,%edx
 271:	f7 75 08             	divl   0x8(%ebp)
 274:	0f b6 92 e4 06 00 00 	movzbl 0x6e4(%edx),%edx
 27b:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 27e:	89 cf                	mov    %ecx,%edi
 280:	eb dd                	jmp    25f <s_getReverseDigits+0x30>
    x = xx;
 282:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 285:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 28c:	eb cc                	jmp    25a <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 28e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 292:	75 0a                	jne    29e <s_getReverseDigits+0x6f>
 294:	39 da                	cmp    %ebx,%edx
 296:	73 06                	jae    29e <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 298:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 29c:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 29e:	89 fa                	mov    %edi,%edx
 2a0:	39 df                	cmp    %ebx,%edi
 2a2:	0f 92 c0             	setb   %al
 2a5:	84 45 ec             	test   %al,-0x14(%ebp)
 2a8:	74 07                	je     2b1 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 2aa:	83 c7 01             	add    $0x1,%edi
 2ad:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 2b1:	89 f8                	mov    %edi,%eax
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    

000002bb <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 2bb:	39 c2                	cmp    %eax,%edx
 2bd:	0f 46 c2             	cmovbe %edx,%eax
}
 2c0:	c3                   	ret    

000002c1 <s_printint>:
{
 2c1:	55                   	push   %ebp
 2c2:	89 e5                	mov    %esp,%ebp
 2c4:	57                   	push   %edi
 2c5:	56                   	push   %esi
 2c6:	53                   	push   %ebx
 2c7:	83 ec 2c             	sub    $0x2c,%esp
 2ca:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 2cd:	89 55 d0             	mov    %edx,-0x30(%ebp)
 2d0:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 2d3:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 2d6:	ff 75 14             	pushl  0x14(%ebp)
 2d9:	ff 75 10             	pushl  0x10(%ebp)
 2dc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2df:	ba 10 00 00 00       	mov    $0x10,%edx
 2e4:	8d 45 d8             	lea    -0x28(%ebp),%eax
 2e7:	e8 43 ff ff ff       	call   22f <s_getReverseDigits>
 2ec:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 2ef:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 2f1:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 2f4:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 2f9:	83 eb 01             	sub    $0x1,%ebx
 2fc:	78 22                	js     320 <s_printint+0x5f>
 2fe:	39 fe                	cmp    %edi,%esi
 300:	73 1e                	jae    320 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 302:	83 ec 0c             	sub    $0xc,%esp
 305:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 30a:	50                   	push   %eax
 30b:	56                   	push   %esi
 30c:	57                   	push   %edi
 30d:	ff 75 cc             	pushl  -0x34(%ebp)
 310:	ff 75 d0             	pushl  -0x30(%ebp)
 313:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 316:	ff d0                	call   *%eax
    j++;
 318:	83 c6 01             	add    $0x1,%esi
 31b:	83 c4 20             	add    $0x20,%esp
 31e:	eb d9                	jmp    2f9 <s_printint+0x38>
}
 320:	8b 45 c8             	mov    -0x38(%ebp),%eax
 323:	8d 65 f4             	lea    -0xc(%ebp),%esp
 326:	5b                   	pop    %ebx
 327:	5e                   	pop    %esi
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    

0000032b <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 32b:	55                   	push   %ebp
 32c:	89 e5                	mov    %esp,%ebp
 32e:	57                   	push   %edi
 32f:	56                   	push   %esi
 330:	53                   	push   %ebx
 331:	83 ec 2c             	sub    $0x2c,%esp
 334:	89 45 d8             	mov    %eax,-0x28(%ebp)
 337:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 33a:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 33d:	8b 45 08             	mov    0x8(%ebp),%eax
 340:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 343:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 34a:	bb 00 00 00 00       	mov    $0x0,%ebx
 34f:	89 f8                	mov    %edi,%eax
 351:	89 df                	mov    %ebx,%edi
 353:	89 c6                	mov    %eax,%esi
 355:	eb 20                	jmp    377 <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 357:	8d 43 01             	lea    0x1(%ebx),%eax
 35a:	89 45 e0             	mov    %eax,-0x20(%ebp)
 35d:	83 ec 0c             	sub    $0xc,%esp
 360:	51                   	push   %ecx
 361:	53                   	push   %ebx
 362:	56                   	push   %esi
 363:	ff 75 d0             	pushl  -0x30(%ebp)
 366:	ff 75 d4             	pushl  -0x2c(%ebp)
 369:	8b 55 d8             	mov    -0x28(%ebp),%edx
 36c:	ff d2                	call   *%edx
 36e:	83 c4 20             	add    $0x20,%esp
 371:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 374:	83 c7 01             	add    $0x1,%edi
 377:	8b 45 0c             	mov    0xc(%ebp),%eax
 37a:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 37e:	84 c0                	test   %al,%al
 380:	0f 84 cd 01 00 00    	je     553 <s_printf+0x228>
 386:	89 75 e0             	mov    %esi,-0x20(%ebp)
 389:	39 de                	cmp    %ebx,%esi
 38b:	0f 86 c2 01 00 00    	jbe    553 <s_printf+0x228>
    c = fmt[i] & 0xff;
 391:	0f be c8             	movsbl %al,%ecx
 394:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 397:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 39a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 39e:	75 0a                	jne    3aa <s_printf+0x7f>
      if(c == '%') {
 3a0:	83 f8 25             	cmp    $0x25,%eax
 3a3:	75 b2                	jne    357 <s_printf+0x2c>
        state = '%';
 3a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 3a8:	eb ca                	jmp    374 <s_printf+0x49>
      }
    } else if(state == '%'){
 3aa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 3ae:	75 c4                	jne    374 <s_printf+0x49>
      if(c == 'd'){
 3b0:	83 f8 64             	cmp    $0x64,%eax
 3b3:	74 6e                	je     423 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3b5:	83 f8 78             	cmp    $0x78,%eax
 3b8:	0f 94 c1             	sete   %cl
 3bb:	83 f8 70             	cmp    $0x70,%eax
 3be:	0f 94 c2             	sete   %dl
 3c1:	08 d1                	or     %dl,%cl
 3c3:	0f 85 8e 00 00 00    	jne    457 <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 3c9:	83 f8 73             	cmp    $0x73,%eax
 3cc:	0f 84 b9 00 00 00    	je     48b <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 3d2:	83 f8 63             	cmp    $0x63,%eax
 3d5:	0f 84 1a 01 00 00    	je     4f5 <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 3db:	83 f8 25             	cmp    $0x25,%eax
 3de:	0f 84 44 01 00 00    	je     528 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 3e4:	8d 43 01             	lea    0x1(%ebx),%eax
 3e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 3ea:	83 ec 0c             	sub    $0xc,%esp
 3ed:	6a 25                	push   $0x25
 3ef:	53                   	push   %ebx
 3f0:	56                   	push   %esi
 3f1:	ff 75 d0             	pushl  -0x30(%ebp)
 3f4:	ff 75 d4             	pushl  -0x2c(%ebp)
 3f7:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3fa:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 3fc:	83 c3 02             	add    $0x2,%ebx
 3ff:	83 c4 14             	add    $0x14,%esp
 402:	ff 75 dc             	pushl  -0x24(%ebp)
 405:	ff 75 e4             	pushl  -0x1c(%ebp)
 408:	56                   	push   %esi
 409:	ff 75 d0             	pushl  -0x30(%ebp)
 40c:	ff 75 d4             	pushl  -0x2c(%ebp)
 40f:	8b 45 d8             	mov    -0x28(%ebp),%eax
 412:	ff d0                	call   *%eax
 414:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 417:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 41e:	e9 51 ff ff ff       	jmp    374 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 423:	8b 45 d0             	mov    -0x30(%ebp),%eax
 426:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 429:	6a 01                	push   $0x1
 42b:	6a 0a                	push   $0xa
 42d:	8b 45 10             	mov    0x10(%ebp),%eax
 430:	ff 30                	pushl  (%eax)
 432:	89 f0                	mov    %esi,%eax
 434:	29 d8                	sub    %ebx,%eax
 436:	50                   	push   %eax
 437:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 43a:	8b 45 d8             	mov    -0x28(%ebp),%eax
 43d:	e8 7f fe ff ff       	call   2c1 <s_printint>
 442:	01 c3                	add    %eax,%ebx
        ap++;
 444:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 448:	83 c4 10             	add    $0x10,%esp
      state = 0;
 44b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 452:	e9 1d ff ff ff       	jmp    374 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 457:	8b 45 d0             	mov    -0x30(%ebp),%eax
 45a:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 45d:	6a 00                	push   $0x0
 45f:	6a 10                	push   $0x10
 461:	8b 45 10             	mov    0x10(%ebp),%eax
 464:	ff 30                	pushl  (%eax)
 466:	89 f0                	mov    %esi,%eax
 468:	29 d8                	sub    %ebx,%eax
 46a:	50                   	push   %eax
 46b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 46e:	8b 45 d8             	mov    -0x28(%ebp),%eax
 471:	e8 4b fe ff ff       	call   2c1 <s_printint>
 476:	01 c3                	add    %eax,%ebx
        ap++;
 478:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 47c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 47f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 486:	e9 e9 fe ff ff       	jmp    374 <s_printf+0x49>
        s = (char*)*ap;
 48b:	8b 45 10             	mov    0x10(%ebp),%eax
 48e:	8b 00                	mov    (%eax),%eax
        ap++;
 490:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 494:	85 c0                	test   %eax,%eax
 496:	75 4e                	jne    4e6 <s_printf+0x1bb>
          s = "(null)";
 498:	b8 dc 06 00 00       	mov    $0x6dc,%eax
 49d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a0:	89 da                	mov    %ebx,%edx
 4a2:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 4a5:	89 75 e0             	mov    %esi,-0x20(%ebp)
 4a8:	89 c6                	mov    %eax,%esi
 4aa:	eb 1f                	jmp    4cb <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 4ac:	8d 7a 01             	lea    0x1(%edx),%edi
 4af:	83 ec 0c             	sub    $0xc,%esp
 4b2:	0f be c0             	movsbl %al,%eax
 4b5:	50                   	push   %eax
 4b6:	52                   	push   %edx
 4b7:	53                   	push   %ebx
 4b8:	ff 75 d0             	pushl  -0x30(%ebp)
 4bb:	ff 75 d4             	pushl  -0x2c(%ebp)
 4be:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4c1:	ff d0                	call   *%eax
          s++;
 4c3:	83 c6 01             	add    $0x1,%esi
 4c6:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 4c9:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 4cb:	0f b6 06             	movzbl (%esi),%eax
 4ce:	84 c0                	test   %al,%al
 4d0:	75 da                	jne    4ac <s_printf+0x181>
 4d2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d5:	89 d3                	mov    %edx,%ebx
 4d7:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 4da:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4e1:	e9 8e fe ff ff       	jmp    374 <s_printf+0x49>
 4e6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4e9:	89 da                	mov    %ebx,%edx
 4eb:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 4ee:	89 75 e0             	mov    %esi,-0x20(%ebp)
 4f1:	89 c6                	mov    %eax,%esi
 4f3:	eb d6                	jmp    4cb <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 4f5:	8d 43 01             	lea    0x1(%ebx),%eax
 4f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4fb:	83 ec 0c             	sub    $0xc,%esp
 4fe:	8b 55 10             	mov    0x10(%ebp),%edx
 501:	0f be 02             	movsbl (%edx),%eax
 504:	50                   	push   %eax
 505:	53                   	push   %ebx
 506:	56                   	push   %esi
 507:	ff 75 d0             	pushl  -0x30(%ebp)
 50a:	ff 75 d4             	pushl  -0x2c(%ebp)
 50d:	8b 55 d8             	mov    -0x28(%ebp),%edx
 510:	ff d2                	call   *%edx
        ap++;
 512:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 516:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 519:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 51c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 523:	e9 4c fe ff ff       	jmp    374 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 528:	8d 43 01             	lea    0x1(%ebx),%eax
 52b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 52e:	83 ec 0c             	sub    $0xc,%esp
 531:	ff 75 dc             	pushl  -0x24(%ebp)
 534:	53                   	push   %ebx
 535:	56                   	push   %esi
 536:	ff 75 d0             	pushl  -0x30(%ebp)
 539:	ff 75 d4             	pushl  -0x2c(%ebp)
 53c:	8b 55 d8             	mov    -0x28(%ebp),%edx
 53f:	ff d2                	call   *%edx
 541:	83 c4 20             	add    $0x20,%esp
 544:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 547:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 54e:	e9 21 fe ff ff       	jmp    374 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 553:	89 da                	mov    %ebx,%edx
 555:	89 f0                	mov    %esi,%eax
 557:	e8 5f fd ff ff       	call   2bb <s_min>
}
 55c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55f:	5b                   	pop    %ebx
 560:	5e                   	pop    %esi
 561:	5f                   	pop    %edi
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    

00000564 <s_putc>:
{
 564:	f3 0f 1e fb          	endbr32 
 568:	55                   	push   %ebp
 569:	89 e5                	mov    %esp,%ebp
 56b:	83 ec 1c             	sub    $0x1c,%esp
 56e:	8b 45 18             	mov    0x18(%ebp),%eax
 571:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 574:	6a 01                	push   $0x1
 576:	8d 45 f4             	lea    -0xc(%ebp),%eax
 579:	50                   	push   %eax
 57a:	ff 75 08             	pushl  0x8(%ebp)
 57d:	e8 e3 fb ff ff       	call   165 <write>
}
 582:	83 c4 10             	add    $0x10,%esp
 585:	c9                   	leave  
 586:	c3                   	ret    

00000587 <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 587:	f3 0f 1e fb          	endbr32 
 58b:	55                   	push   %ebp
 58c:	89 e5                	mov    %esp,%ebp
 58e:	56                   	push   %esi
 58f:	53                   	push   %ebx
 590:	8b 75 08             	mov    0x8(%ebp),%esi
 593:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 596:	83 ec 04             	sub    $0x4,%esp
 599:	8d 45 14             	lea    0x14(%ebp),%eax
 59c:	50                   	push   %eax
 59d:	ff 75 10             	pushl  0x10(%ebp)
 5a0:	53                   	push   %ebx
 5a1:	89 f1                	mov    %esi,%ecx
 5a3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 5a8:	b8 15 02 00 00       	mov    $0x215,%eax
 5ad:	e8 79 fd ff ff       	call   32b <s_printf>
  if(count < n) {
 5b2:	83 c4 10             	add    $0x10,%esp
 5b5:	39 c3                	cmp    %eax,%ebx
 5b7:	76 04                	jbe    5bd <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 5b9:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 5bd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5c0:	5b                   	pop    %ebx
 5c1:	5e                   	pop    %esi
 5c2:	5d                   	pop    %ebp
 5c3:	c3                   	ret    

000005c4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c4:	f3 0f 1e fb          	endbr32 
 5c8:	55                   	push   %ebp
 5c9:	89 e5                	mov    %esp,%ebp
 5cb:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 5ce:	8d 45 10             	lea    0x10(%ebp),%eax
 5d1:	50                   	push   %eax
 5d2:	ff 75 0c             	pushl  0xc(%ebp)
 5d5:	68 00 00 00 40       	push   $0x40000000
 5da:	b9 00 00 00 00       	mov    $0x0,%ecx
 5df:	8b 55 08             	mov    0x8(%ebp),%edx
 5e2:	b8 64 05 00 00       	mov    $0x564,%eax
 5e7:	e8 3f fd ff ff       	call   32b <s_printf>
}
 5ec:	83 c4 10             	add    $0x10,%esp
 5ef:	c9                   	leave  
 5f0:	c3                   	ret    
