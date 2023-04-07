
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  [ZOMBIE]    "zombie"
  };

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
  14:	83 ec 14             	sub    $0x14,%esp
  int result = ps(1024, arrayOfProcInfo);
  17:	68 a0 05 00 00       	push   $0x5a0
  1c:	68 00 04 00 00       	push   $0x400
  21:	e8 05 01 00 00       	call   12b <ps>
  26:	89 c6                	mov    %eax,%esi
  for(int i = 0; i < result; ++i) {
  28:	83 c4 10             	add    $0x10,%esp
  2b:	bb 00 00 00 00       	mov    $0x0,%ebx
  30:	39 f3                	cmp    %esi,%ebx
  32:	7d 3a                	jge    6e <main+0x6e>
    printf(1, "%d: %s %d %s\n", arrayOfProcInfo[i].pid,
      states[arrayOfProcInfo[i].state], 
      arrayOfProcInfo[i].cpuPercent,
      arrayOfProcInfo[i].name);
  34:	6b c3 1c             	imul   $0x1c,%ebx,%eax
  37:	8d 90 a0 05 00 00    	lea    0x5a0(%eax),%edx
  3d:	8d 88 ac 05 00 00    	lea    0x5ac(%eax),%ecx
      states[arrayOfProcInfo[i].state], 
  43:	8b 80 a0 05 00 00    	mov    0x5a0(%eax),%eax
    printf(1, "%d: %s %d %s\n", arrayOfProcInfo[i].pid,
  49:	83 ec 08             	sub    $0x8,%esp
  4c:	51                   	push   %ecx
  4d:	ff 72 08             	pushl  0x8(%edx)
  50:	ff 34 85 50 05 00 00 	pushl  0x550(,%eax,4)
  57:	ff 72 04             	pushl  0x4(%edx)
  5a:	68 18 05 00 00       	push   $0x518
  5f:	6a 01                	push   $0x1
  61:	e8 84 04 00 00       	call   4ea <printf>
  for(int i = 0; i < result; ++i) {
  66:	83 c3 01             	add    $0x1,%ebx
  69:	83 c4 20             	add    $0x20,%esp
  6c:	eb c2                	jmp    30 <main+0x30>
  }
  exit();
  6e:	e8 08 00 00 00       	call   7b <exit>

00000073 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
  73:	b8 01 00 00 00       	mov    $0x1,%eax
  78:	cd 40                	int    $0x40
  7a:	c3                   	ret    

0000007b <exit>:
SYSCALL(exit)
  7b:	b8 02 00 00 00       	mov    $0x2,%eax
  80:	cd 40                	int    $0x40
  82:	c3                   	ret    

00000083 <wait>:
SYSCALL(wait)
  83:	b8 03 00 00 00       	mov    $0x3,%eax
  88:	cd 40                	int    $0x40
  8a:	c3                   	ret    

0000008b <pipe>:
SYSCALL(pipe)
  8b:	b8 04 00 00 00       	mov    $0x4,%eax
  90:	cd 40                	int    $0x40
  92:	c3                   	ret    

00000093 <read>:
SYSCALL(read)
  93:	b8 05 00 00 00       	mov    $0x5,%eax
  98:	cd 40                	int    $0x40
  9a:	c3                   	ret    

0000009b <write>:
SYSCALL(write)
  9b:	b8 10 00 00 00       	mov    $0x10,%eax
  a0:	cd 40                	int    $0x40
  a2:	c3                   	ret    

000000a3 <close>:
SYSCALL(close)
  a3:	b8 15 00 00 00       	mov    $0x15,%eax
  a8:	cd 40                	int    $0x40
  aa:	c3                   	ret    

000000ab <kill>:
SYSCALL(kill)
  ab:	b8 06 00 00 00       	mov    $0x6,%eax
  b0:	cd 40                	int    $0x40
  b2:	c3                   	ret    

000000b3 <exec>:
SYSCALL(exec)
  b3:	b8 07 00 00 00       	mov    $0x7,%eax
  b8:	cd 40                	int    $0x40
  ba:	c3                   	ret    

000000bb <open>:
SYSCALL(open)
  bb:	b8 0f 00 00 00       	mov    $0xf,%eax
  c0:	cd 40                	int    $0x40
  c2:	c3                   	ret    

000000c3 <mknod>:
SYSCALL(mknod)
  c3:	b8 11 00 00 00       	mov    $0x11,%eax
  c8:	cd 40                	int    $0x40
  ca:	c3                   	ret    

000000cb <unlink>:
SYSCALL(unlink)
  cb:	b8 12 00 00 00       	mov    $0x12,%eax
  d0:	cd 40                	int    $0x40
  d2:	c3                   	ret    

000000d3 <fstat>:
SYSCALL(fstat)
  d3:	b8 08 00 00 00       	mov    $0x8,%eax
  d8:	cd 40                	int    $0x40
  da:	c3                   	ret    

000000db <link>:
SYSCALL(link)
  db:	b8 13 00 00 00       	mov    $0x13,%eax
  e0:	cd 40                	int    $0x40
  e2:	c3                   	ret    

000000e3 <mkdir>:
SYSCALL(mkdir)
  e3:	b8 14 00 00 00       	mov    $0x14,%eax
  e8:	cd 40                	int    $0x40
  ea:	c3                   	ret    

000000eb <chdir>:
SYSCALL(chdir)
  eb:	b8 09 00 00 00       	mov    $0x9,%eax
  f0:	cd 40                	int    $0x40
  f2:	c3                   	ret    

000000f3 <dup>:
SYSCALL(dup)
  f3:	b8 0a 00 00 00       	mov    $0xa,%eax
  f8:	cd 40                	int    $0x40
  fa:	c3                   	ret    

000000fb <getpid>:
SYSCALL(getpid)
  fb:	b8 0b 00 00 00       	mov    $0xb,%eax
 100:	cd 40                	int    $0x40
 102:	c3                   	ret    

00000103 <sbrk>:
SYSCALL(sbrk)
 103:	b8 0c 00 00 00       	mov    $0xc,%eax
 108:	cd 40                	int    $0x40
 10a:	c3                   	ret    

0000010b <sleep>:
SYSCALL(sleep)
 10b:	b8 0d 00 00 00       	mov    $0xd,%eax
 110:	cd 40                	int    $0x40
 112:	c3                   	ret    

00000113 <uptime>:
SYSCALL(uptime)
 113:	b8 0e 00 00 00       	mov    $0xe,%eax
 118:	cd 40                	int    $0x40
 11a:	c3                   	ret    

0000011b <yield>:
SYSCALL(yield)
 11b:	b8 16 00 00 00       	mov    $0x16,%eax
 120:	cd 40                	int    $0x40
 122:	c3                   	ret    

00000123 <shutdown>:
SYSCALL(shutdown)
 123:	b8 17 00 00 00       	mov    $0x17,%eax
 128:	cd 40                	int    $0x40
 12a:	c3                   	ret    

0000012b <ps>:
SYSCALL(ps)
 12b:	b8 18 00 00 00       	mov    $0x18,%eax
 130:	cd 40                	int    $0x40
 132:	c3                   	ret    

00000133 <nice>:
 133:	b8 1b 00 00 00       	mov    $0x1b,%eax
 138:	cd 40                	int    $0x40
 13a:	c3                   	ret    

0000013b <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 13b:	f3 0f 1e fb          	endbr32 
 13f:	55                   	push   %ebp
 140:	89 e5                	mov    %esp,%ebp
 142:	8b 45 14             	mov    0x14(%ebp),%eax
 145:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 148:	3b 45 10             	cmp    0x10(%ebp),%eax
 14b:	73 06                	jae    153 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 14d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 150:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 153:	5d                   	pop    %ebp
 154:	c3                   	ret    

00000155 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 155:	55                   	push   %ebp
 156:	89 e5                	mov    %esp,%ebp
 158:	57                   	push   %edi
 159:	56                   	push   %esi
 15a:	53                   	push   %ebx
 15b:	83 ec 08             	sub    $0x8,%esp
 15e:	89 c6                	mov    %eax,%esi
 160:	89 d3                	mov    %edx,%ebx
 162:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 165:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 169:	0f 95 c2             	setne  %dl
 16c:	89 c8                	mov    %ecx,%eax
 16e:	c1 e8 1f             	shr    $0x1f,%eax
 171:	84 c2                	test   %al,%dl
 173:	74 33                	je     1a8 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 175:	89 c8                	mov    %ecx,%eax
 177:	f7 d8                	neg    %eax
    neg = 1;
 179:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 180:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 185:	8d 4f 01             	lea    0x1(%edi),%ecx
 188:	89 ca                	mov    %ecx,%edx
 18a:	39 d9                	cmp    %ebx,%ecx
 18c:	73 26                	jae    1b4 <s_getReverseDigits+0x5f>
 18e:	85 c0                	test   %eax,%eax
 190:	74 22                	je     1b4 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 192:	ba 00 00 00 00       	mov    $0x0,%edx
 197:	f7 75 08             	divl   0x8(%ebp)
 19a:	0f b6 92 70 05 00 00 	movzbl 0x570(%edx),%edx
 1a1:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 1a4:	89 cf                	mov    %ecx,%edi
 1a6:	eb dd                	jmp    185 <s_getReverseDigits+0x30>
    x = xx;
 1a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 1ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1b2:	eb cc                	jmp    180 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 1b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1b8:	75 0a                	jne    1c4 <s_getReverseDigits+0x6f>
 1ba:	39 da                	cmp    %ebx,%edx
 1bc:	73 06                	jae    1c4 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 1be:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 1c2:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 1c4:	89 fa                	mov    %edi,%edx
 1c6:	39 df                	cmp    %ebx,%edi
 1c8:	0f 92 c0             	setb   %al
 1cb:	84 45 ec             	test   %al,-0x14(%ebp)
 1ce:	74 07                	je     1d7 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 1d0:	83 c7 01             	add    $0x1,%edi
 1d3:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 1d7:	89 f8                	mov    %edi,%eax
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	5b                   	pop    %ebx
 1dd:	5e                   	pop    %esi
 1de:	5f                   	pop    %edi
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    

000001e1 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 1e1:	39 c2                	cmp    %eax,%edx
 1e3:	0f 46 c2             	cmovbe %edx,%eax
}
 1e6:	c3                   	ret    

000001e7 <s_printint>:
{
 1e7:	55                   	push   %ebp
 1e8:	89 e5                	mov    %esp,%ebp
 1ea:	57                   	push   %edi
 1eb:	56                   	push   %esi
 1ec:	53                   	push   %ebx
 1ed:	83 ec 2c             	sub    $0x2c,%esp
 1f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 1f3:	89 55 d0             	mov    %edx,-0x30(%ebp)
 1f6:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 1f9:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 1fc:	ff 75 14             	pushl  0x14(%ebp)
 1ff:	ff 75 10             	pushl  0x10(%ebp)
 202:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 205:	ba 10 00 00 00       	mov    $0x10,%edx
 20a:	8d 45 d8             	lea    -0x28(%ebp),%eax
 20d:	e8 43 ff ff ff       	call   155 <s_getReverseDigits>
 212:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 215:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 217:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 21a:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 21f:	83 eb 01             	sub    $0x1,%ebx
 222:	78 22                	js     246 <s_printint+0x5f>
 224:	39 fe                	cmp    %edi,%esi
 226:	73 1e                	jae    246 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 228:	83 ec 0c             	sub    $0xc,%esp
 22b:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 230:	50                   	push   %eax
 231:	56                   	push   %esi
 232:	57                   	push   %edi
 233:	ff 75 cc             	pushl  -0x34(%ebp)
 236:	ff 75 d0             	pushl  -0x30(%ebp)
 239:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 23c:	ff d0                	call   *%eax
    j++;
 23e:	83 c6 01             	add    $0x1,%esi
 241:	83 c4 20             	add    $0x20,%esp
 244:	eb d9                	jmp    21f <s_printint+0x38>
}
 246:	8b 45 c8             	mov    -0x38(%ebp),%eax
 249:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24c:	5b                   	pop    %ebx
 24d:	5e                   	pop    %esi
 24e:	5f                   	pop    %edi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    

00000251 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 251:	55                   	push   %ebp
 252:	89 e5                	mov    %esp,%ebp
 254:	57                   	push   %edi
 255:	56                   	push   %esi
 256:	53                   	push   %ebx
 257:	83 ec 2c             	sub    $0x2c,%esp
 25a:	89 45 d8             	mov    %eax,-0x28(%ebp)
 25d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 260:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 269:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 270:	bb 00 00 00 00       	mov    $0x0,%ebx
 275:	89 f8                	mov    %edi,%eax
 277:	89 df                	mov    %ebx,%edi
 279:	89 c6                	mov    %eax,%esi
 27b:	eb 20                	jmp    29d <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 27d:	8d 43 01             	lea    0x1(%ebx),%eax
 280:	89 45 e0             	mov    %eax,-0x20(%ebp)
 283:	83 ec 0c             	sub    $0xc,%esp
 286:	51                   	push   %ecx
 287:	53                   	push   %ebx
 288:	56                   	push   %esi
 289:	ff 75 d0             	pushl  -0x30(%ebp)
 28c:	ff 75 d4             	pushl  -0x2c(%ebp)
 28f:	8b 55 d8             	mov    -0x28(%ebp),%edx
 292:	ff d2                	call   *%edx
 294:	83 c4 20             	add    $0x20,%esp
 297:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 29a:	83 c7 01             	add    $0x1,%edi
 29d:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a0:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 2a4:	84 c0                	test   %al,%al
 2a6:	0f 84 cd 01 00 00    	je     479 <s_printf+0x228>
 2ac:	89 75 e0             	mov    %esi,-0x20(%ebp)
 2af:	39 de                	cmp    %ebx,%esi
 2b1:	0f 86 c2 01 00 00    	jbe    479 <s_printf+0x228>
    c = fmt[i] & 0xff;
 2b7:	0f be c8             	movsbl %al,%ecx
 2ba:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 2bd:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 2c0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 2c4:	75 0a                	jne    2d0 <s_printf+0x7f>
      if(c == '%') {
 2c6:	83 f8 25             	cmp    $0x25,%eax
 2c9:	75 b2                	jne    27d <s_printf+0x2c>
        state = '%';
 2cb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2ce:	eb ca                	jmp    29a <s_printf+0x49>
      }
    } else if(state == '%'){
 2d0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 2d4:	75 c4                	jne    29a <s_printf+0x49>
      if(c == 'd'){
 2d6:	83 f8 64             	cmp    $0x64,%eax
 2d9:	74 6e                	je     349 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 2db:	83 f8 78             	cmp    $0x78,%eax
 2de:	0f 94 c1             	sete   %cl
 2e1:	83 f8 70             	cmp    $0x70,%eax
 2e4:	0f 94 c2             	sete   %dl
 2e7:	08 d1                	or     %dl,%cl
 2e9:	0f 85 8e 00 00 00    	jne    37d <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 2ef:	83 f8 73             	cmp    $0x73,%eax
 2f2:	0f 84 b9 00 00 00    	je     3b1 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 2f8:	83 f8 63             	cmp    $0x63,%eax
 2fb:	0f 84 1a 01 00 00    	je     41b <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 301:	83 f8 25             	cmp    $0x25,%eax
 304:	0f 84 44 01 00 00    	je     44e <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 30a:	8d 43 01             	lea    0x1(%ebx),%eax
 30d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 310:	83 ec 0c             	sub    $0xc,%esp
 313:	6a 25                	push   $0x25
 315:	53                   	push   %ebx
 316:	56                   	push   %esi
 317:	ff 75 d0             	pushl  -0x30(%ebp)
 31a:	ff 75 d4             	pushl  -0x2c(%ebp)
 31d:	8b 45 d8             	mov    -0x28(%ebp),%eax
 320:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 322:	83 c3 02             	add    $0x2,%ebx
 325:	83 c4 14             	add    $0x14,%esp
 328:	ff 75 dc             	pushl  -0x24(%ebp)
 32b:	ff 75 e4             	pushl  -0x1c(%ebp)
 32e:	56                   	push   %esi
 32f:	ff 75 d0             	pushl  -0x30(%ebp)
 332:	ff 75 d4             	pushl  -0x2c(%ebp)
 335:	8b 45 d8             	mov    -0x28(%ebp),%eax
 338:	ff d0                	call   *%eax
 33a:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 33d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 344:	e9 51 ff ff ff       	jmp    29a <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 349:	8b 45 d0             	mov    -0x30(%ebp),%eax
 34c:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 34f:	6a 01                	push   $0x1
 351:	6a 0a                	push   $0xa
 353:	8b 45 10             	mov    0x10(%ebp),%eax
 356:	ff 30                	pushl  (%eax)
 358:	89 f0                	mov    %esi,%eax
 35a:	29 d8                	sub    %ebx,%eax
 35c:	50                   	push   %eax
 35d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 360:	8b 45 d8             	mov    -0x28(%ebp),%eax
 363:	e8 7f fe ff ff       	call   1e7 <s_printint>
 368:	01 c3                	add    %eax,%ebx
        ap++;
 36a:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 36e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 371:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 378:	e9 1d ff ff ff       	jmp    29a <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 37d:	8b 45 d0             	mov    -0x30(%ebp),%eax
 380:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 383:	6a 00                	push   $0x0
 385:	6a 10                	push   $0x10
 387:	8b 45 10             	mov    0x10(%ebp),%eax
 38a:	ff 30                	pushl  (%eax)
 38c:	89 f0                	mov    %esi,%eax
 38e:	29 d8                	sub    %ebx,%eax
 390:	50                   	push   %eax
 391:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 394:	8b 45 d8             	mov    -0x28(%ebp),%eax
 397:	e8 4b fe ff ff       	call   1e7 <s_printint>
 39c:	01 c3                	add    %eax,%ebx
        ap++;
 39e:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 3a2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3a5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3ac:	e9 e9 fe ff ff       	jmp    29a <s_printf+0x49>
        s = (char*)*ap;
 3b1:	8b 45 10             	mov    0x10(%ebp),%eax
 3b4:	8b 00                	mov    (%eax),%eax
        ap++;
 3b6:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 3ba:	85 c0                	test   %eax,%eax
 3bc:	75 4e                	jne    40c <s_printf+0x1bb>
          s = "(null)";
 3be:	b8 68 05 00 00       	mov    $0x568,%eax
 3c3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3c6:	89 da                	mov    %ebx,%edx
 3c8:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 3cb:	89 75 e0             	mov    %esi,-0x20(%ebp)
 3ce:	89 c6                	mov    %eax,%esi
 3d0:	eb 1f                	jmp    3f1 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3d2:	8d 7a 01             	lea    0x1(%edx),%edi
 3d5:	83 ec 0c             	sub    $0xc,%esp
 3d8:	0f be c0             	movsbl %al,%eax
 3db:	50                   	push   %eax
 3dc:	52                   	push   %edx
 3dd:	53                   	push   %ebx
 3de:	ff 75 d0             	pushl  -0x30(%ebp)
 3e1:	ff 75 d4             	pushl  -0x2c(%ebp)
 3e4:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3e7:	ff d0                	call   *%eax
          s++;
 3e9:	83 c6 01             	add    $0x1,%esi
 3ec:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3ef:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 3f1:	0f b6 06             	movzbl (%esi),%eax
 3f4:	84 c0                	test   %al,%al
 3f6:	75 da                	jne    3d2 <s_printf+0x181>
 3f8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3fb:	89 d3                	mov    %edx,%ebx
 3fd:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 400:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 407:	e9 8e fe ff ff       	jmp    29a <s_printf+0x49>
 40c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 40f:	89 da                	mov    %ebx,%edx
 411:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 414:	89 75 e0             	mov    %esi,-0x20(%ebp)
 417:	89 c6                	mov    %eax,%esi
 419:	eb d6                	jmp    3f1 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 41b:	8d 43 01             	lea    0x1(%ebx),%eax
 41e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 421:	83 ec 0c             	sub    $0xc,%esp
 424:	8b 55 10             	mov    0x10(%ebp),%edx
 427:	0f be 02             	movsbl (%edx),%eax
 42a:	50                   	push   %eax
 42b:	53                   	push   %ebx
 42c:	56                   	push   %esi
 42d:	ff 75 d0             	pushl  -0x30(%ebp)
 430:	ff 75 d4             	pushl  -0x2c(%ebp)
 433:	8b 55 d8             	mov    -0x28(%ebp),%edx
 436:	ff d2                	call   *%edx
        ap++;
 438:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 43c:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 43f:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 442:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 449:	e9 4c fe ff ff       	jmp    29a <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 44e:	8d 43 01             	lea    0x1(%ebx),%eax
 451:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 454:	83 ec 0c             	sub    $0xc,%esp
 457:	ff 75 dc             	pushl  -0x24(%ebp)
 45a:	53                   	push   %ebx
 45b:	56                   	push   %esi
 45c:	ff 75 d0             	pushl  -0x30(%ebp)
 45f:	ff 75 d4             	pushl  -0x2c(%ebp)
 462:	8b 55 d8             	mov    -0x28(%ebp),%edx
 465:	ff d2                	call   *%edx
 467:	83 c4 20             	add    $0x20,%esp
 46a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 46d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 474:	e9 21 fe ff ff       	jmp    29a <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 479:	89 da                	mov    %ebx,%edx
 47b:	89 f0                	mov    %esi,%eax
 47d:	e8 5f fd ff ff       	call   1e1 <s_min>
}
 482:	8d 65 f4             	lea    -0xc(%ebp),%esp
 485:	5b                   	pop    %ebx
 486:	5e                   	pop    %esi
 487:	5f                   	pop    %edi
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    

0000048a <s_putc>:
{
 48a:	f3 0f 1e fb          	endbr32 
 48e:	55                   	push   %ebp
 48f:	89 e5                	mov    %esp,%ebp
 491:	83 ec 1c             	sub    $0x1c,%esp
 494:	8b 45 18             	mov    0x18(%ebp),%eax
 497:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 49a:	6a 01                	push   $0x1
 49c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 49f:	50                   	push   %eax
 4a0:	ff 75 08             	pushl  0x8(%ebp)
 4a3:	e8 f3 fb ff ff       	call   9b <write>
}
 4a8:	83 c4 10             	add    $0x10,%esp
 4ab:	c9                   	leave  
 4ac:	c3                   	ret    

000004ad <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 4ad:	f3 0f 1e fb          	endbr32 
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	8b 75 08             	mov    0x8(%ebp),%esi
 4b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 4bc:	83 ec 04             	sub    $0x4,%esp
 4bf:	8d 45 14             	lea    0x14(%ebp),%eax
 4c2:	50                   	push   %eax
 4c3:	ff 75 10             	pushl  0x10(%ebp)
 4c6:	53                   	push   %ebx
 4c7:	89 f1                	mov    %esi,%ecx
 4c9:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 4ce:	b8 3b 01 00 00       	mov    $0x13b,%eax
 4d3:	e8 79 fd ff ff       	call   251 <s_printf>
  if(count < n) {
 4d8:	83 c4 10             	add    $0x10,%esp
 4db:	39 c3                	cmp    %eax,%ebx
 4dd:	76 04                	jbe    4e3 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 4df:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 4e3:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e6:	5b                   	pop    %ebx
 4e7:	5e                   	pop    %esi
 4e8:	5d                   	pop    %ebp
 4e9:	c3                   	ret    

000004ea <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4ea:	f3 0f 1e fb          	endbr32 
 4ee:	55                   	push   %ebp
 4ef:	89 e5                	mov    %esp,%ebp
 4f1:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 4f4:	8d 45 10             	lea    0x10(%ebp),%eax
 4f7:	50                   	push   %eax
 4f8:	ff 75 0c             	pushl  0xc(%ebp)
 4fb:	68 00 00 00 40       	push   $0x40000000
 500:	b9 00 00 00 00       	mov    $0x0,%ecx
 505:	8b 55 08             	mov    0x8(%ebp),%edx
 508:	b8 8a 04 00 00       	mov    $0x48a,%eax
 50d:	e8 3f fd ff ff       	call   251 <s_printf>
}
 512:	83 c4 10             	add    $0x10,%esp
 515:	c9                   	leave  
 516:	c3                   	ret    
