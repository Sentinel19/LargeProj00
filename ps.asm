
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
  50:	ff 34 85 60 05 00 00 	pushl  0x560(,%eax,4)
  57:	ff 72 04             	pushl  0x4(%edx)
  5a:	68 28 05 00 00       	push   $0x528
  5f:	6a 01                	push   $0x1
  61:	e8 94 04 00 00       	call   4fa <printf>
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
SYSCALL(nice)
 133:	b8 1b 00 00 00       	mov    $0x1b,%eax
 138:	cd 40                	int    $0x40
 13a:	c3                   	ret    

0000013b <flock>:
SYSCALL(flock)
 13b:	b8 19 00 00 00       	mov    $0x19,%eax
 140:	cd 40                	int    $0x40
 142:	c3                   	ret    

00000143 <funlock>:
 143:	b8 1a 00 00 00       	mov    $0x1a,%eax
 148:	cd 40                	int    $0x40
 14a:	c3                   	ret    

0000014b <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 14b:	f3 0f 1e fb          	endbr32 
 14f:	55                   	push   %ebp
 150:	89 e5                	mov    %esp,%ebp
 152:	8b 45 14             	mov    0x14(%ebp),%eax
 155:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 158:	3b 45 10             	cmp    0x10(%ebp),%eax
 15b:	73 06                	jae    163 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 15d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 160:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    

00000165 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 165:	55                   	push   %ebp
 166:	89 e5                	mov    %esp,%ebp
 168:	57                   	push   %edi
 169:	56                   	push   %esi
 16a:	53                   	push   %ebx
 16b:	83 ec 08             	sub    $0x8,%esp
 16e:	89 c6                	mov    %eax,%esi
 170:	89 d3                	mov    %edx,%ebx
 172:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 175:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 179:	0f 95 c2             	setne  %dl
 17c:	89 c8                	mov    %ecx,%eax
 17e:	c1 e8 1f             	shr    $0x1f,%eax
 181:	84 c2                	test   %al,%dl
 183:	74 33                	je     1b8 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 185:	89 c8                	mov    %ecx,%eax
 187:	f7 d8                	neg    %eax
    neg = 1;
 189:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 190:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 195:	8d 4f 01             	lea    0x1(%edi),%ecx
 198:	89 ca                	mov    %ecx,%edx
 19a:	39 d9                	cmp    %ebx,%ecx
 19c:	73 26                	jae    1c4 <s_getReverseDigits+0x5f>
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 22                	je     1c4 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 1a2:	ba 00 00 00 00       	mov    $0x0,%edx
 1a7:	f7 75 08             	divl   0x8(%ebp)
 1aa:	0f b6 92 80 05 00 00 	movzbl 0x580(%edx),%edx
 1b1:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 1b4:	89 cf                	mov    %ecx,%edi
 1b6:	eb dd                	jmp    195 <s_getReverseDigits+0x30>
    x = xx;
 1b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 1bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1c2:	eb cc                	jmp    190 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 1c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1c8:	75 0a                	jne    1d4 <s_getReverseDigits+0x6f>
 1ca:	39 da                	cmp    %ebx,%edx
 1cc:	73 06                	jae    1d4 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 1ce:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 1d2:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 1d4:	89 fa                	mov    %edi,%edx
 1d6:	39 df                	cmp    %ebx,%edi
 1d8:	0f 92 c0             	setb   %al
 1db:	84 45 ec             	test   %al,-0x14(%ebp)
 1de:	74 07                	je     1e7 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 1e0:	83 c7 01             	add    $0x1,%edi
 1e3:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 1e7:	89 f8                	mov    %edi,%eax
 1e9:	83 c4 08             	add    $0x8,%esp
 1ec:	5b                   	pop    %ebx
 1ed:	5e                   	pop    %esi
 1ee:	5f                   	pop    %edi
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    

000001f1 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 1f1:	39 c2                	cmp    %eax,%edx
 1f3:	0f 46 c2             	cmovbe %edx,%eax
}
 1f6:	c3                   	ret    

000001f7 <s_printint>:
{
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	57                   	push   %edi
 1fb:	56                   	push   %esi
 1fc:	53                   	push   %ebx
 1fd:	83 ec 2c             	sub    $0x2c,%esp
 200:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 203:	89 55 d0             	mov    %edx,-0x30(%ebp)
 206:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 209:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 20c:	ff 75 14             	pushl  0x14(%ebp)
 20f:	ff 75 10             	pushl  0x10(%ebp)
 212:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 215:	ba 10 00 00 00       	mov    $0x10,%edx
 21a:	8d 45 d8             	lea    -0x28(%ebp),%eax
 21d:	e8 43 ff ff ff       	call   165 <s_getReverseDigits>
 222:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 225:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 227:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 22a:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 22f:	83 eb 01             	sub    $0x1,%ebx
 232:	78 22                	js     256 <s_printint+0x5f>
 234:	39 fe                	cmp    %edi,%esi
 236:	73 1e                	jae    256 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 238:	83 ec 0c             	sub    $0xc,%esp
 23b:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 240:	50                   	push   %eax
 241:	56                   	push   %esi
 242:	57                   	push   %edi
 243:	ff 75 cc             	pushl  -0x34(%ebp)
 246:	ff 75 d0             	pushl  -0x30(%ebp)
 249:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 24c:	ff d0                	call   *%eax
    j++;
 24e:	83 c6 01             	add    $0x1,%esi
 251:	83 c4 20             	add    $0x20,%esp
 254:	eb d9                	jmp    22f <s_printint+0x38>
}
 256:	8b 45 c8             	mov    -0x38(%ebp),%eax
 259:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25c:	5b                   	pop    %ebx
 25d:	5e                   	pop    %esi
 25e:	5f                   	pop    %edi
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    

00000261 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 261:	55                   	push   %ebp
 262:	89 e5                	mov    %esp,%ebp
 264:	57                   	push   %edi
 265:	56                   	push   %esi
 266:	53                   	push   %ebx
 267:	83 ec 2c             	sub    $0x2c,%esp
 26a:	89 45 d8             	mov    %eax,-0x28(%ebp)
 26d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 270:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 279:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 280:	bb 00 00 00 00       	mov    $0x0,%ebx
 285:	89 f8                	mov    %edi,%eax
 287:	89 df                	mov    %ebx,%edi
 289:	89 c6                	mov    %eax,%esi
 28b:	eb 20                	jmp    2ad <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 28d:	8d 43 01             	lea    0x1(%ebx),%eax
 290:	89 45 e0             	mov    %eax,-0x20(%ebp)
 293:	83 ec 0c             	sub    $0xc,%esp
 296:	51                   	push   %ecx
 297:	53                   	push   %ebx
 298:	56                   	push   %esi
 299:	ff 75 d0             	pushl  -0x30(%ebp)
 29c:	ff 75 d4             	pushl  -0x2c(%ebp)
 29f:	8b 55 d8             	mov    -0x28(%ebp),%edx
 2a2:	ff d2                	call   *%edx
 2a4:	83 c4 20             	add    $0x20,%esp
 2a7:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 2aa:	83 c7 01             	add    $0x1,%edi
 2ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b0:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 2b4:	84 c0                	test   %al,%al
 2b6:	0f 84 cd 01 00 00    	je     489 <s_printf+0x228>
 2bc:	89 75 e0             	mov    %esi,-0x20(%ebp)
 2bf:	39 de                	cmp    %ebx,%esi
 2c1:	0f 86 c2 01 00 00    	jbe    489 <s_printf+0x228>
    c = fmt[i] & 0xff;
 2c7:	0f be c8             	movsbl %al,%ecx
 2ca:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 2cd:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 2d0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 2d4:	75 0a                	jne    2e0 <s_printf+0x7f>
      if(c == '%') {
 2d6:	83 f8 25             	cmp    $0x25,%eax
 2d9:	75 b2                	jne    28d <s_printf+0x2c>
        state = '%';
 2db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2de:	eb ca                	jmp    2aa <s_printf+0x49>
      }
    } else if(state == '%'){
 2e0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 2e4:	75 c4                	jne    2aa <s_printf+0x49>
      if(c == 'd'){
 2e6:	83 f8 64             	cmp    $0x64,%eax
 2e9:	74 6e                	je     359 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 2eb:	83 f8 78             	cmp    $0x78,%eax
 2ee:	0f 94 c1             	sete   %cl
 2f1:	83 f8 70             	cmp    $0x70,%eax
 2f4:	0f 94 c2             	sete   %dl
 2f7:	08 d1                	or     %dl,%cl
 2f9:	0f 85 8e 00 00 00    	jne    38d <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 2ff:	83 f8 73             	cmp    $0x73,%eax
 302:	0f 84 b9 00 00 00    	je     3c1 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 308:	83 f8 63             	cmp    $0x63,%eax
 30b:	0f 84 1a 01 00 00    	je     42b <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 311:	83 f8 25             	cmp    $0x25,%eax
 314:	0f 84 44 01 00 00    	je     45e <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 31a:	8d 43 01             	lea    0x1(%ebx),%eax
 31d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 320:	83 ec 0c             	sub    $0xc,%esp
 323:	6a 25                	push   $0x25
 325:	53                   	push   %ebx
 326:	56                   	push   %esi
 327:	ff 75 d0             	pushl  -0x30(%ebp)
 32a:	ff 75 d4             	pushl  -0x2c(%ebp)
 32d:	8b 45 d8             	mov    -0x28(%ebp),%eax
 330:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 332:	83 c3 02             	add    $0x2,%ebx
 335:	83 c4 14             	add    $0x14,%esp
 338:	ff 75 dc             	pushl  -0x24(%ebp)
 33b:	ff 75 e4             	pushl  -0x1c(%ebp)
 33e:	56                   	push   %esi
 33f:	ff 75 d0             	pushl  -0x30(%ebp)
 342:	ff 75 d4             	pushl  -0x2c(%ebp)
 345:	8b 45 d8             	mov    -0x28(%ebp),%eax
 348:	ff d0                	call   *%eax
 34a:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 34d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 354:	e9 51 ff ff ff       	jmp    2aa <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 359:	8b 45 d0             	mov    -0x30(%ebp),%eax
 35c:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 35f:	6a 01                	push   $0x1
 361:	6a 0a                	push   $0xa
 363:	8b 45 10             	mov    0x10(%ebp),%eax
 366:	ff 30                	pushl  (%eax)
 368:	89 f0                	mov    %esi,%eax
 36a:	29 d8                	sub    %ebx,%eax
 36c:	50                   	push   %eax
 36d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 370:	8b 45 d8             	mov    -0x28(%ebp),%eax
 373:	e8 7f fe ff ff       	call   1f7 <s_printint>
 378:	01 c3                	add    %eax,%ebx
        ap++;
 37a:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 37e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 381:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 388:	e9 1d ff ff ff       	jmp    2aa <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 38d:	8b 45 d0             	mov    -0x30(%ebp),%eax
 390:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 393:	6a 00                	push   $0x0
 395:	6a 10                	push   $0x10
 397:	8b 45 10             	mov    0x10(%ebp),%eax
 39a:	ff 30                	pushl  (%eax)
 39c:	89 f0                	mov    %esi,%eax
 39e:	29 d8                	sub    %ebx,%eax
 3a0:	50                   	push   %eax
 3a1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 3a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3a7:	e8 4b fe ff ff       	call   1f7 <s_printint>
 3ac:	01 c3                	add    %eax,%ebx
        ap++;
 3ae:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 3b2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3b5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3bc:	e9 e9 fe ff ff       	jmp    2aa <s_printf+0x49>
        s = (char*)*ap;
 3c1:	8b 45 10             	mov    0x10(%ebp),%eax
 3c4:	8b 00                	mov    (%eax),%eax
        ap++;
 3c6:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 3ca:	85 c0                	test   %eax,%eax
 3cc:	75 4e                	jne    41c <s_printf+0x1bb>
          s = "(null)";
 3ce:	b8 78 05 00 00       	mov    $0x578,%eax
 3d3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3d6:	89 da                	mov    %ebx,%edx
 3d8:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 3db:	89 75 e0             	mov    %esi,-0x20(%ebp)
 3de:	89 c6                	mov    %eax,%esi
 3e0:	eb 1f                	jmp    401 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3e2:	8d 7a 01             	lea    0x1(%edx),%edi
 3e5:	83 ec 0c             	sub    $0xc,%esp
 3e8:	0f be c0             	movsbl %al,%eax
 3eb:	50                   	push   %eax
 3ec:	52                   	push   %edx
 3ed:	53                   	push   %ebx
 3ee:	ff 75 d0             	pushl  -0x30(%ebp)
 3f1:	ff 75 d4             	pushl  -0x2c(%ebp)
 3f4:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3f7:	ff d0                	call   *%eax
          s++;
 3f9:	83 c6 01             	add    $0x1,%esi
 3fc:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3ff:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 401:	0f b6 06             	movzbl (%esi),%eax
 404:	84 c0                	test   %al,%al
 406:	75 da                	jne    3e2 <s_printf+0x181>
 408:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 40b:	89 d3                	mov    %edx,%ebx
 40d:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 410:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 417:	e9 8e fe ff ff       	jmp    2aa <s_printf+0x49>
 41c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 41f:	89 da                	mov    %ebx,%edx
 421:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 424:	89 75 e0             	mov    %esi,-0x20(%ebp)
 427:	89 c6                	mov    %eax,%esi
 429:	eb d6                	jmp    401 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 42b:	8d 43 01             	lea    0x1(%ebx),%eax
 42e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 431:	83 ec 0c             	sub    $0xc,%esp
 434:	8b 55 10             	mov    0x10(%ebp),%edx
 437:	0f be 02             	movsbl (%edx),%eax
 43a:	50                   	push   %eax
 43b:	53                   	push   %ebx
 43c:	56                   	push   %esi
 43d:	ff 75 d0             	pushl  -0x30(%ebp)
 440:	ff 75 d4             	pushl  -0x2c(%ebp)
 443:	8b 55 d8             	mov    -0x28(%ebp),%edx
 446:	ff d2                	call   *%edx
        ap++;
 448:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 44c:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 44f:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 452:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 459:	e9 4c fe ff ff       	jmp    2aa <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 45e:	8d 43 01             	lea    0x1(%ebx),%eax
 461:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 464:	83 ec 0c             	sub    $0xc,%esp
 467:	ff 75 dc             	pushl  -0x24(%ebp)
 46a:	53                   	push   %ebx
 46b:	56                   	push   %esi
 46c:	ff 75 d0             	pushl  -0x30(%ebp)
 46f:	ff 75 d4             	pushl  -0x2c(%ebp)
 472:	8b 55 d8             	mov    -0x28(%ebp),%edx
 475:	ff d2                	call   *%edx
 477:	83 c4 20             	add    $0x20,%esp
 47a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 47d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 484:	e9 21 fe ff ff       	jmp    2aa <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 489:	89 da                	mov    %ebx,%edx
 48b:	89 f0                	mov    %esi,%eax
 48d:	e8 5f fd ff ff       	call   1f1 <s_min>
}
 492:	8d 65 f4             	lea    -0xc(%ebp),%esp
 495:	5b                   	pop    %ebx
 496:	5e                   	pop    %esi
 497:	5f                   	pop    %edi
 498:	5d                   	pop    %ebp
 499:	c3                   	ret    

0000049a <s_putc>:
{
 49a:	f3 0f 1e fb          	endbr32 
 49e:	55                   	push   %ebp
 49f:	89 e5                	mov    %esp,%ebp
 4a1:	83 ec 1c             	sub    $0x1c,%esp
 4a4:	8b 45 18             	mov    0x18(%ebp),%eax
 4a7:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4aa:	6a 01                	push   $0x1
 4ac:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4af:	50                   	push   %eax
 4b0:	ff 75 08             	pushl  0x8(%ebp)
 4b3:	e8 e3 fb ff ff       	call   9b <write>
}
 4b8:	83 c4 10             	add    $0x10,%esp
 4bb:	c9                   	leave  
 4bc:	c3                   	ret    

000004bd <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 4bd:	f3 0f 1e fb          	endbr32 
 4c1:	55                   	push   %ebp
 4c2:	89 e5                	mov    %esp,%ebp
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	8b 75 08             	mov    0x8(%ebp),%esi
 4c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 4cc:	83 ec 04             	sub    $0x4,%esp
 4cf:	8d 45 14             	lea    0x14(%ebp),%eax
 4d2:	50                   	push   %eax
 4d3:	ff 75 10             	pushl  0x10(%ebp)
 4d6:	53                   	push   %ebx
 4d7:	89 f1                	mov    %esi,%ecx
 4d9:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 4de:	b8 4b 01 00 00       	mov    $0x14b,%eax
 4e3:	e8 79 fd ff ff       	call   261 <s_printf>
  if(count < n) {
 4e8:	83 c4 10             	add    $0x10,%esp
 4eb:	39 c3                	cmp    %eax,%ebx
 4ed:	76 04                	jbe    4f3 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 4ef:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 4f3:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4f6:	5b                   	pop    %ebx
 4f7:	5e                   	pop    %esi
 4f8:	5d                   	pop    %ebp
 4f9:	c3                   	ret    

000004fa <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4fa:	f3 0f 1e fb          	endbr32 
 4fe:	55                   	push   %ebp
 4ff:	89 e5                	mov    %esp,%ebp
 501:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 504:	8d 45 10             	lea    0x10(%ebp),%eax
 507:	50                   	push   %eax
 508:	ff 75 0c             	pushl  0xc(%ebp)
 50b:	68 00 00 00 40       	push   $0x40000000
 510:	b9 00 00 00 00       	mov    $0x0,%ecx
 515:	8b 55 08             	mov    0x8(%ebp),%edx
 518:	b8 9a 04 00 00       	mov    $0x49a,%eax
 51d:	e8 3f fd ff ff       	call   261 <s_printf>
}
 522:	83 c4 10             	add    $0x10,%esp
 525:	c9                   	leave  
 526:	c3                   	ret    
