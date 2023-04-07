
_mkdir:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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
  15:	83 ec 18             	sub    $0x18,%esp
  18:	8b 39                	mov    (%ecx),%edi
  1a:	8b 41 04             	mov    0x4(%ecx),%eax
  1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int i;

  if(argc < 2){
  20:	83 ff 01             	cmp    $0x1,%edi
  23:	7e 25                	jle    4a <main+0x4a>
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  25:	bb 01 00 00 00       	mov    $0x1,%ebx
  2a:	39 fb                	cmp    %edi,%ebx
  2c:	7d 44                	jge    72 <main+0x72>
    if(mkdir(argv[i]) < 0){
  2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  31:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  34:	83 ec 0c             	sub    $0xc,%esp
  37:	ff 36                	pushl  (%esi)
  39:	e8 a9 00 00 00       	call   e7 <mkdir>
  3e:	83 c4 10             	add    $0x10,%esp
  41:	85 c0                	test   %eax,%eax
  43:	78 19                	js     5e <main+0x5e>
  for(i = 1; i < argc; i++){
  45:	83 c3 01             	add    $0x1,%ebx
  48:	eb e0                	jmp    2a <main+0x2a>
    printf(2, "Usage: mkdir files...\n");
  4a:	83 ec 08             	sub    $0x8,%esp
  4d:	68 1c 05 00 00       	push   $0x51c
  52:	6a 02                	push   $0x2
  54:	e8 95 04 00 00       	call   4ee <printf>
    exit();
  59:	e8 21 00 00 00       	call   7f <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5e:	83 ec 04             	sub    $0x4,%esp
  61:	ff 36                	pushl  (%esi)
  63:	68 33 05 00 00       	push   $0x533
  68:	6a 02                	push   $0x2
  6a:	e8 7f 04 00 00       	call   4ee <printf>
      break;
  6f:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  72:	e8 08 00 00 00       	call   7f <exit>

00000077 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
  77:	b8 01 00 00 00       	mov    $0x1,%eax
  7c:	cd 40                	int    $0x40
  7e:	c3                   	ret    

0000007f <exit>:
SYSCALL(exit)
  7f:	b8 02 00 00 00       	mov    $0x2,%eax
  84:	cd 40                	int    $0x40
  86:	c3                   	ret    

00000087 <wait>:
SYSCALL(wait)
  87:	b8 03 00 00 00       	mov    $0x3,%eax
  8c:	cd 40                	int    $0x40
  8e:	c3                   	ret    

0000008f <pipe>:
SYSCALL(pipe)
  8f:	b8 04 00 00 00       	mov    $0x4,%eax
  94:	cd 40                	int    $0x40
  96:	c3                   	ret    

00000097 <read>:
SYSCALL(read)
  97:	b8 05 00 00 00       	mov    $0x5,%eax
  9c:	cd 40                	int    $0x40
  9e:	c3                   	ret    

0000009f <write>:
SYSCALL(write)
  9f:	b8 10 00 00 00       	mov    $0x10,%eax
  a4:	cd 40                	int    $0x40
  a6:	c3                   	ret    

000000a7 <close>:
SYSCALL(close)
  a7:	b8 15 00 00 00       	mov    $0x15,%eax
  ac:	cd 40                	int    $0x40
  ae:	c3                   	ret    

000000af <kill>:
SYSCALL(kill)
  af:	b8 06 00 00 00       	mov    $0x6,%eax
  b4:	cd 40                	int    $0x40
  b6:	c3                   	ret    

000000b7 <exec>:
SYSCALL(exec)
  b7:	b8 07 00 00 00       	mov    $0x7,%eax
  bc:	cd 40                	int    $0x40
  be:	c3                   	ret    

000000bf <open>:
SYSCALL(open)
  bf:	b8 0f 00 00 00       	mov    $0xf,%eax
  c4:	cd 40                	int    $0x40
  c6:	c3                   	ret    

000000c7 <mknod>:
SYSCALL(mknod)
  c7:	b8 11 00 00 00       	mov    $0x11,%eax
  cc:	cd 40                	int    $0x40
  ce:	c3                   	ret    

000000cf <unlink>:
SYSCALL(unlink)
  cf:	b8 12 00 00 00       	mov    $0x12,%eax
  d4:	cd 40                	int    $0x40
  d6:	c3                   	ret    

000000d7 <fstat>:
SYSCALL(fstat)
  d7:	b8 08 00 00 00       	mov    $0x8,%eax
  dc:	cd 40                	int    $0x40
  de:	c3                   	ret    

000000df <link>:
SYSCALL(link)
  df:	b8 13 00 00 00       	mov    $0x13,%eax
  e4:	cd 40                	int    $0x40
  e6:	c3                   	ret    

000000e7 <mkdir>:
SYSCALL(mkdir)
  e7:	b8 14 00 00 00       	mov    $0x14,%eax
  ec:	cd 40                	int    $0x40
  ee:	c3                   	ret    

000000ef <chdir>:
SYSCALL(chdir)
  ef:	b8 09 00 00 00       	mov    $0x9,%eax
  f4:	cd 40                	int    $0x40
  f6:	c3                   	ret    

000000f7 <dup>:
SYSCALL(dup)
  f7:	b8 0a 00 00 00       	mov    $0xa,%eax
  fc:	cd 40                	int    $0x40
  fe:	c3                   	ret    

000000ff <getpid>:
SYSCALL(getpid)
  ff:	b8 0b 00 00 00       	mov    $0xb,%eax
 104:	cd 40                	int    $0x40
 106:	c3                   	ret    

00000107 <sbrk>:
SYSCALL(sbrk)
 107:	b8 0c 00 00 00       	mov    $0xc,%eax
 10c:	cd 40                	int    $0x40
 10e:	c3                   	ret    

0000010f <sleep>:
SYSCALL(sleep)
 10f:	b8 0d 00 00 00       	mov    $0xd,%eax
 114:	cd 40                	int    $0x40
 116:	c3                   	ret    

00000117 <uptime>:
SYSCALL(uptime)
 117:	b8 0e 00 00 00       	mov    $0xe,%eax
 11c:	cd 40                	int    $0x40
 11e:	c3                   	ret    

0000011f <yield>:
SYSCALL(yield)
 11f:	b8 16 00 00 00       	mov    $0x16,%eax
 124:	cd 40                	int    $0x40
 126:	c3                   	ret    

00000127 <shutdown>:
SYSCALL(shutdown)
 127:	b8 17 00 00 00       	mov    $0x17,%eax
 12c:	cd 40                	int    $0x40
 12e:	c3                   	ret    

0000012f <ps>:
SYSCALL(ps)
 12f:	b8 18 00 00 00       	mov    $0x18,%eax
 134:	cd 40                	int    $0x40
 136:	c3                   	ret    

00000137 <nice>:
 137:	b8 1b 00 00 00       	mov    $0x1b,%eax
 13c:	cd 40                	int    $0x40
 13e:	c3                   	ret    

0000013f <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 13f:	f3 0f 1e fb          	endbr32 
 143:	55                   	push   %ebp
 144:	89 e5                	mov    %esp,%ebp
 146:	8b 45 14             	mov    0x14(%ebp),%eax
 149:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 14c:	3b 45 10             	cmp    0x10(%ebp),%eax
 14f:	73 06                	jae    157 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 151:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 157:	5d                   	pop    %ebp
 158:	c3                   	ret    

00000159 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 159:	55                   	push   %ebp
 15a:	89 e5                	mov    %esp,%ebp
 15c:	57                   	push   %edi
 15d:	56                   	push   %esi
 15e:	53                   	push   %ebx
 15f:	83 ec 08             	sub    $0x8,%esp
 162:	89 c6                	mov    %eax,%esi
 164:	89 d3                	mov    %edx,%ebx
 166:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 169:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 16d:	0f 95 c2             	setne  %dl
 170:	89 c8                	mov    %ecx,%eax
 172:	c1 e8 1f             	shr    $0x1f,%eax
 175:	84 c2                	test   %al,%dl
 177:	74 33                	je     1ac <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 179:	89 c8                	mov    %ecx,%eax
 17b:	f7 d8                	neg    %eax
    neg = 1;
 17d:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 184:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 189:	8d 4f 01             	lea    0x1(%edi),%ecx
 18c:	89 ca                	mov    %ecx,%edx
 18e:	39 d9                	cmp    %ebx,%ecx
 190:	73 26                	jae    1b8 <s_getReverseDigits+0x5f>
 192:	85 c0                	test   %eax,%eax
 194:	74 22                	je     1b8 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 196:	ba 00 00 00 00       	mov    $0x0,%edx
 19b:	f7 75 08             	divl   0x8(%ebp)
 19e:	0f b6 92 58 05 00 00 	movzbl 0x558(%edx),%edx
 1a5:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 1a8:	89 cf                	mov    %ecx,%edi
 1aa:	eb dd                	jmp    189 <s_getReverseDigits+0x30>
    x = xx;
 1ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 1af:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1b6:	eb cc                	jmp    184 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 1b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1bc:	75 0a                	jne    1c8 <s_getReverseDigits+0x6f>
 1be:	39 da                	cmp    %ebx,%edx
 1c0:	73 06                	jae    1c8 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 1c2:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 1c6:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 1c8:	89 fa                	mov    %edi,%edx
 1ca:	39 df                	cmp    %ebx,%edi
 1cc:	0f 92 c0             	setb   %al
 1cf:	84 45 ec             	test   %al,-0x14(%ebp)
 1d2:	74 07                	je     1db <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 1d4:	83 c7 01             	add    $0x1,%edi
 1d7:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 1db:	89 f8                	mov    %edi,%eax
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	5b                   	pop    %ebx
 1e1:	5e                   	pop    %esi
 1e2:	5f                   	pop    %edi
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    

000001e5 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 1e5:	39 c2                	cmp    %eax,%edx
 1e7:	0f 46 c2             	cmovbe %edx,%eax
}
 1ea:	c3                   	ret    

000001eb <s_printint>:
{
 1eb:	55                   	push   %ebp
 1ec:	89 e5                	mov    %esp,%ebp
 1ee:	57                   	push   %edi
 1ef:	56                   	push   %esi
 1f0:	53                   	push   %ebx
 1f1:	83 ec 2c             	sub    $0x2c,%esp
 1f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 1f7:	89 55 d0             	mov    %edx,-0x30(%ebp)
 1fa:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 1fd:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 200:	ff 75 14             	pushl  0x14(%ebp)
 203:	ff 75 10             	pushl  0x10(%ebp)
 206:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 209:	ba 10 00 00 00       	mov    $0x10,%edx
 20e:	8d 45 d8             	lea    -0x28(%ebp),%eax
 211:	e8 43 ff ff ff       	call   159 <s_getReverseDigits>
 216:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 219:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 21b:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 21e:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 223:	83 eb 01             	sub    $0x1,%ebx
 226:	78 22                	js     24a <s_printint+0x5f>
 228:	39 fe                	cmp    %edi,%esi
 22a:	73 1e                	jae    24a <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 22c:	83 ec 0c             	sub    $0xc,%esp
 22f:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 234:	50                   	push   %eax
 235:	56                   	push   %esi
 236:	57                   	push   %edi
 237:	ff 75 cc             	pushl  -0x34(%ebp)
 23a:	ff 75 d0             	pushl  -0x30(%ebp)
 23d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 240:	ff d0                	call   *%eax
    j++;
 242:	83 c6 01             	add    $0x1,%esi
 245:	83 c4 20             	add    $0x20,%esp
 248:	eb d9                	jmp    223 <s_printint+0x38>
}
 24a:	8b 45 c8             	mov    -0x38(%ebp),%eax
 24d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 250:	5b                   	pop    %ebx
 251:	5e                   	pop    %esi
 252:	5f                   	pop    %edi
 253:	5d                   	pop    %ebp
 254:	c3                   	ret    

00000255 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 255:	55                   	push   %ebp
 256:	89 e5                	mov    %esp,%ebp
 258:	57                   	push   %edi
 259:	56                   	push   %esi
 25a:	53                   	push   %ebx
 25b:	83 ec 2c             	sub    $0x2c,%esp
 25e:	89 45 d8             	mov    %eax,-0x28(%ebp)
 261:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 264:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 267:	8b 45 08             	mov    0x8(%ebp),%eax
 26a:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 26d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 274:	bb 00 00 00 00       	mov    $0x0,%ebx
 279:	89 f8                	mov    %edi,%eax
 27b:	89 df                	mov    %ebx,%edi
 27d:	89 c6                	mov    %eax,%esi
 27f:	eb 20                	jmp    2a1 <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 281:	8d 43 01             	lea    0x1(%ebx),%eax
 284:	89 45 e0             	mov    %eax,-0x20(%ebp)
 287:	83 ec 0c             	sub    $0xc,%esp
 28a:	51                   	push   %ecx
 28b:	53                   	push   %ebx
 28c:	56                   	push   %esi
 28d:	ff 75 d0             	pushl  -0x30(%ebp)
 290:	ff 75 d4             	pushl  -0x2c(%ebp)
 293:	8b 55 d8             	mov    -0x28(%ebp),%edx
 296:	ff d2                	call   *%edx
 298:	83 c4 20             	add    $0x20,%esp
 29b:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 29e:	83 c7 01             	add    $0x1,%edi
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 2a8:	84 c0                	test   %al,%al
 2aa:	0f 84 cd 01 00 00    	je     47d <s_printf+0x228>
 2b0:	89 75 e0             	mov    %esi,-0x20(%ebp)
 2b3:	39 de                	cmp    %ebx,%esi
 2b5:	0f 86 c2 01 00 00    	jbe    47d <s_printf+0x228>
    c = fmt[i] & 0xff;
 2bb:	0f be c8             	movsbl %al,%ecx
 2be:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 2c1:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 2c4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 2c8:	75 0a                	jne    2d4 <s_printf+0x7f>
      if(c == '%') {
 2ca:	83 f8 25             	cmp    $0x25,%eax
 2cd:	75 b2                	jne    281 <s_printf+0x2c>
        state = '%';
 2cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2d2:	eb ca                	jmp    29e <s_printf+0x49>
      }
    } else if(state == '%'){
 2d4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 2d8:	75 c4                	jne    29e <s_printf+0x49>
      if(c == 'd'){
 2da:	83 f8 64             	cmp    $0x64,%eax
 2dd:	74 6e                	je     34d <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 2df:	83 f8 78             	cmp    $0x78,%eax
 2e2:	0f 94 c1             	sete   %cl
 2e5:	83 f8 70             	cmp    $0x70,%eax
 2e8:	0f 94 c2             	sete   %dl
 2eb:	08 d1                	or     %dl,%cl
 2ed:	0f 85 8e 00 00 00    	jne    381 <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 2f3:	83 f8 73             	cmp    $0x73,%eax
 2f6:	0f 84 b9 00 00 00    	je     3b5 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 2fc:	83 f8 63             	cmp    $0x63,%eax
 2ff:	0f 84 1a 01 00 00    	je     41f <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 305:	83 f8 25             	cmp    $0x25,%eax
 308:	0f 84 44 01 00 00    	je     452 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 30e:	8d 43 01             	lea    0x1(%ebx),%eax
 311:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 314:	83 ec 0c             	sub    $0xc,%esp
 317:	6a 25                	push   $0x25
 319:	53                   	push   %ebx
 31a:	56                   	push   %esi
 31b:	ff 75 d0             	pushl  -0x30(%ebp)
 31e:	ff 75 d4             	pushl  -0x2c(%ebp)
 321:	8b 45 d8             	mov    -0x28(%ebp),%eax
 324:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 326:	83 c3 02             	add    $0x2,%ebx
 329:	83 c4 14             	add    $0x14,%esp
 32c:	ff 75 dc             	pushl  -0x24(%ebp)
 32f:	ff 75 e4             	pushl  -0x1c(%ebp)
 332:	56                   	push   %esi
 333:	ff 75 d0             	pushl  -0x30(%ebp)
 336:	ff 75 d4             	pushl  -0x2c(%ebp)
 339:	8b 45 d8             	mov    -0x28(%ebp),%eax
 33c:	ff d0                	call   *%eax
 33e:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 341:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 348:	e9 51 ff ff ff       	jmp    29e <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 34d:	8b 45 d0             	mov    -0x30(%ebp),%eax
 350:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 353:	6a 01                	push   $0x1
 355:	6a 0a                	push   $0xa
 357:	8b 45 10             	mov    0x10(%ebp),%eax
 35a:	ff 30                	pushl  (%eax)
 35c:	89 f0                	mov    %esi,%eax
 35e:	29 d8                	sub    %ebx,%eax
 360:	50                   	push   %eax
 361:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 364:	8b 45 d8             	mov    -0x28(%ebp),%eax
 367:	e8 7f fe ff ff       	call   1eb <s_printint>
 36c:	01 c3                	add    %eax,%ebx
        ap++;
 36e:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 372:	83 c4 10             	add    $0x10,%esp
      state = 0;
 375:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 37c:	e9 1d ff ff ff       	jmp    29e <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 381:	8b 45 d0             	mov    -0x30(%ebp),%eax
 384:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 387:	6a 00                	push   $0x0
 389:	6a 10                	push   $0x10
 38b:	8b 45 10             	mov    0x10(%ebp),%eax
 38e:	ff 30                	pushl  (%eax)
 390:	89 f0                	mov    %esi,%eax
 392:	29 d8                	sub    %ebx,%eax
 394:	50                   	push   %eax
 395:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 398:	8b 45 d8             	mov    -0x28(%ebp),%eax
 39b:	e8 4b fe ff ff       	call   1eb <s_printint>
 3a0:	01 c3                	add    %eax,%ebx
        ap++;
 3a2:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 3a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3a9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3b0:	e9 e9 fe ff ff       	jmp    29e <s_printf+0x49>
        s = (char*)*ap;
 3b5:	8b 45 10             	mov    0x10(%ebp),%eax
 3b8:	8b 00                	mov    (%eax),%eax
        ap++;
 3ba:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 3be:	85 c0                	test   %eax,%eax
 3c0:	75 4e                	jne    410 <s_printf+0x1bb>
          s = "(null)";
 3c2:	b8 4f 05 00 00       	mov    $0x54f,%eax
 3c7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3ca:	89 da                	mov    %ebx,%edx
 3cc:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 3cf:	89 75 e0             	mov    %esi,-0x20(%ebp)
 3d2:	89 c6                	mov    %eax,%esi
 3d4:	eb 1f                	jmp    3f5 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3d6:	8d 7a 01             	lea    0x1(%edx),%edi
 3d9:	83 ec 0c             	sub    $0xc,%esp
 3dc:	0f be c0             	movsbl %al,%eax
 3df:	50                   	push   %eax
 3e0:	52                   	push   %edx
 3e1:	53                   	push   %ebx
 3e2:	ff 75 d0             	pushl  -0x30(%ebp)
 3e5:	ff 75 d4             	pushl  -0x2c(%ebp)
 3e8:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3eb:	ff d0                	call   *%eax
          s++;
 3ed:	83 c6 01             	add    $0x1,%esi
 3f0:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3f3:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 3f5:	0f b6 06             	movzbl (%esi),%eax
 3f8:	84 c0                	test   %al,%al
 3fa:	75 da                	jne    3d6 <s_printf+0x181>
 3fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3ff:	89 d3                	mov    %edx,%ebx
 401:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 404:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 40b:	e9 8e fe ff ff       	jmp    29e <s_printf+0x49>
 410:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 413:	89 da                	mov    %ebx,%edx
 415:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 418:	89 75 e0             	mov    %esi,-0x20(%ebp)
 41b:	89 c6                	mov    %eax,%esi
 41d:	eb d6                	jmp    3f5 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 41f:	8d 43 01             	lea    0x1(%ebx),%eax
 422:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 425:	83 ec 0c             	sub    $0xc,%esp
 428:	8b 55 10             	mov    0x10(%ebp),%edx
 42b:	0f be 02             	movsbl (%edx),%eax
 42e:	50                   	push   %eax
 42f:	53                   	push   %ebx
 430:	56                   	push   %esi
 431:	ff 75 d0             	pushl  -0x30(%ebp)
 434:	ff 75 d4             	pushl  -0x2c(%ebp)
 437:	8b 55 d8             	mov    -0x28(%ebp),%edx
 43a:	ff d2                	call   *%edx
        ap++;
 43c:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 440:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 443:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 446:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 44d:	e9 4c fe ff ff       	jmp    29e <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 452:	8d 43 01             	lea    0x1(%ebx),%eax
 455:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 458:	83 ec 0c             	sub    $0xc,%esp
 45b:	ff 75 dc             	pushl  -0x24(%ebp)
 45e:	53                   	push   %ebx
 45f:	56                   	push   %esi
 460:	ff 75 d0             	pushl  -0x30(%ebp)
 463:	ff 75 d4             	pushl  -0x2c(%ebp)
 466:	8b 55 d8             	mov    -0x28(%ebp),%edx
 469:	ff d2                	call   *%edx
 46b:	83 c4 20             	add    $0x20,%esp
 46e:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 471:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 478:	e9 21 fe ff ff       	jmp    29e <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 47d:	89 da                	mov    %ebx,%edx
 47f:	89 f0                	mov    %esi,%eax
 481:	e8 5f fd ff ff       	call   1e5 <s_min>
}
 486:	8d 65 f4             	lea    -0xc(%ebp),%esp
 489:	5b                   	pop    %ebx
 48a:	5e                   	pop    %esi
 48b:	5f                   	pop    %edi
 48c:	5d                   	pop    %ebp
 48d:	c3                   	ret    

0000048e <s_putc>:
{
 48e:	f3 0f 1e fb          	endbr32 
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	83 ec 1c             	sub    $0x1c,%esp
 498:	8b 45 18             	mov    0x18(%ebp),%eax
 49b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 49e:	6a 01                	push   $0x1
 4a0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4a3:	50                   	push   %eax
 4a4:	ff 75 08             	pushl  0x8(%ebp)
 4a7:	e8 f3 fb ff ff       	call   9f <write>
}
 4ac:	83 c4 10             	add    $0x10,%esp
 4af:	c9                   	leave  
 4b0:	c3                   	ret    

000004b1 <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 4b1:	f3 0f 1e fb          	endbr32 
 4b5:	55                   	push   %ebp
 4b6:	89 e5                	mov    %esp,%ebp
 4b8:	56                   	push   %esi
 4b9:	53                   	push   %ebx
 4ba:	8b 75 08             	mov    0x8(%ebp),%esi
 4bd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 4c0:	83 ec 04             	sub    $0x4,%esp
 4c3:	8d 45 14             	lea    0x14(%ebp),%eax
 4c6:	50                   	push   %eax
 4c7:	ff 75 10             	pushl  0x10(%ebp)
 4ca:	53                   	push   %ebx
 4cb:	89 f1                	mov    %esi,%ecx
 4cd:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 4d2:	b8 3f 01 00 00       	mov    $0x13f,%eax
 4d7:	e8 79 fd ff ff       	call   255 <s_printf>
  if(count < n) {
 4dc:	83 c4 10             	add    $0x10,%esp
 4df:	39 c3                	cmp    %eax,%ebx
 4e1:	76 04                	jbe    4e7 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 4e3:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 4e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ea:	5b                   	pop    %ebx
 4eb:	5e                   	pop    %esi
 4ec:	5d                   	pop    %ebp
 4ed:	c3                   	ret    

000004ee <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4ee:	f3 0f 1e fb          	endbr32 
 4f2:	55                   	push   %ebp
 4f3:	89 e5                	mov    %esp,%ebp
 4f5:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 4f8:	8d 45 10             	lea    0x10(%ebp),%eax
 4fb:	50                   	push   %eax
 4fc:	ff 75 0c             	pushl  0xc(%ebp)
 4ff:	68 00 00 00 40       	push   $0x40000000
 504:	b9 00 00 00 00       	mov    $0x0,%ecx
 509:	8b 55 08             	mov    0x8(%ebp),%edx
 50c:	b8 8e 04 00 00       	mov    $0x48e,%eax
 511:	e8 3f fd ff ff       	call   255 <s_printf>
}
 516:	83 c4 10             	add    $0x10,%esp
 519:	c9                   	leave  
 51a:	c3                   	ret    
