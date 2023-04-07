
_echo:     file format elf32-i386


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
  15:	83 ec 08             	sub    $0x8,%esp
  18:	8b 31                	mov    (%ecx),%esi
  1a:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  1d:	b8 01 00 00 00       	mov    $0x1,%eax
  22:	eb 1a                	jmp    3e <main+0x3e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  24:	ba fc 04 00 00       	mov    $0x4fc,%edx
  29:	52                   	push   %edx
  2a:	ff 34 87             	pushl  (%edi,%eax,4)
  2d:	68 00 05 00 00       	push   $0x500
  32:	6a 01                	push   $0x1
  34:	e8 93 04 00 00       	call   4cc <printf>
  39:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  3c:	89 d8                	mov    %ebx,%eax
  3e:	39 f0                	cmp    %esi,%eax
  40:	7d 0e                	jge    50 <main+0x50>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  42:	8d 58 01             	lea    0x1(%eax),%ebx
  45:	39 f3                	cmp    %esi,%ebx
  47:	7d db                	jge    24 <main+0x24>
  49:	ba fe 04 00 00       	mov    $0x4fe,%edx
  4e:	eb d9                	jmp    29 <main+0x29>
  exit();
  50:	e8 08 00 00 00       	call   5d <exit>

00000055 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
  55:	b8 01 00 00 00       	mov    $0x1,%eax
  5a:	cd 40                	int    $0x40
  5c:	c3                   	ret    

0000005d <exit>:
SYSCALL(exit)
  5d:	b8 02 00 00 00       	mov    $0x2,%eax
  62:	cd 40                	int    $0x40
  64:	c3                   	ret    

00000065 <wait>:
SYSCALL(wait)
  65:	b8 03 00 00 00       	mov    $0x3,%eax
  6a:	cd 40                	int    $0x40
  6c:	c3                   	ret    

0000006d <pipe>:
SYSCALL(pipe)
  6d:	b8 04 00 00 00       	mov    $0x4,%eax
  72:	cd 40                	int    $0x40
  74:	c3                   	ret    

00000075 <read>:
SYSCALL(read)
  75:	b8 05 00 00 00       	mov    $0x5,%eax
  7a:	cd 40                	int    $0x40
  7c:	c3                   	ret    

0000007d <write>:
SYSCALL(write)
  7d:	b8 10 00 00 00       	mov    $0x10,%eax
  82:	cd 40                	int    $0x40
  84:	c3                   	ret    

00000085 <close>:
SYSCALL(close)
  85:	b8 15 00 00 00       	mov    $0x15,%eax
  8a:	cd 40                	int    $0x40
  8c:	c3                   	ret    

0000008d <kill>:
SYSCALL(kill)
  8d:	b8 06 00 00 00       	mov    $0x6,%eax
  92:	cd 40                	int    $0x40
  94:	c3                   	ret    

00000095 <exec>:
SYSCALL(exec)
  95:	b8 07 00 00 00       	mov    $0x7,%eax
  9a:	cd 40                	int    $0x40
  9c:	c3                   	ret    

0000009d <open>:
SYSCALL(open)
  9d:	b8 0f 00 00 00       	mov    $0xf,%eax
  a2:	cd 40                	int    $0x40
  a4:	c3                   	ret    

000000a5 <mknod>:
SYSCALL(mknod)
  a5:	b8 11 00 00 00       	mov    $0x11,%eax
  aa:	cd 40                	int    $0x40
  ac:	c3                   	ret    

000000ad <unlink>:
SYSCALL(unlink)
  ad:	b8 12 00 00 00       	mov    $0x12,%eax
  b2:	cd 40                	int    $0x40
  b4:	c3                   	ret    

000000b5 <fstat>:
SYSCALL(fstat)
  b5:	b8 08 00 00 00       	mov    $0x8,%eax
  ba:	cd 40                	int    $0x40
  bc:	c3                   	ret    

000000bd <link>:
SYSCALL(link)
  bd:	b8 13 00 00 00       	mov    $0x13,%eax
  c2:	cd 40                	int    $0x40
  c4:	c3                   	ret    

000000c5 <mkdir>:
SYSCALL(mkdir)
  c5:	b8 14 00 00 00       	mov    $0x14,%eax
  ca:	cd 40                	int    $0x40
  cc:	c3                   	ret    

000000cd <chdir>:
SYSCALL(chdir)
  cd:	b8 09 00 00 00       	mov    $0x9,%eax
  d2:	cd 40                	int    $0x40
  d4:	c3                   	ret    

000000d5 <dup>:
SYSCALL(dup)
  d5:	b8 0a 00 00 00       	mov    $0xa,%eax
  da:	cd 40                	int    $0x40
  dc:	c3                   	ret    

000000dd <getpid>:
SYSCALL(getpid)
  dd:	b8 0b 00 00 00       	mov    $0xb,%eax
  e2:	cd 40                	int    $0x40
  e4:	c3                   	ret    

000000e5 <sbrk>:
SYSCALL(sbrk)
  e5:	b8 0c 00 00 00       	mov    $0xc,%eax
  ea:	cd 40                	int    $0x40
  ec:	c3                   	ret    

000000ed <sleep>:
SYSCALL(sleep)
  ed:	b8 0d 00 00 00       	mov    $0xd,%eax
  f2:	cd 40                	int    $0x40
  f4:	c3                   	ret    

000000f5 <uptime>:
SYSCALL(uptime)
  f5:	b8 0e 00 00 00       	mov    $0xe,%eax
  fa:	cd 40                	int    $0x40
  fc:	c3                   	ret    

000000fd <yield>:
SYSCALL(yield)
  fd:	b8 16 00 00 00       	mov    $0x16,%eax
 102:	cd 40                	int    $0x40
 104:	c3                   	ret    

00000105 <shutdown>:
SYSCALL(shutdown)
 105:	b8 17 00 00 00       	mov    $0x17,%eax
 10a:	cd 40                	int    $0x40
 10c:	c3                   	ret    

0000010d <ps>:
SYSCALL(ps)
 10d:	b8 18 00 00 00       	mov    $0x18,%eax
 112:	cd 40                	int    $0x40
 114:	c3                   	ret    

00000115 <nice>:
 115:	b8 1b 00 00 00       	mov    $0x1b,%eax
 11a:	cd 40                	int    $0x40
 11c:	c3                   	ret    

0000011d <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 11d:	f3 0f 1e fb          	endbr32 
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
 124:	8b 45 14             	mov    0x14(%ebp),%eax
 127:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 12a:	3b 45 10             	cmp    0x10(%ebp),%eax
 12d:	73 06                	jae    135 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 12f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 132:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    

00000137 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 137:	55                   	push   %ebp
 138:	89 e5                	mov    %esp,%ebp
 13a:	57                   	push   %edi
 13b:	56                   	push   %esi
 13c:	53                   	push   %ebx
 13d:	83 ec 08             	sub    $0x8,%esp
 140:	89 c6                	mov    %eax,%esi
 142:	89 d3                	mov    %edx,%ebx
 144:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 147:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 14b:	0f 95 c2             	setne  %dl
 14e:	89 c8                	mov    %ecx,%eax
 150:	c1 e8 1f             	shr    $0x1f,%eax
 153:	84 c2                	test   %al,%dl
 155:	74 33                	je     18a <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 157:	89 c8                	mov    %ecx,%eax
 159:	f7 d8                	neg    %eax
    neg = 1;
 15b:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 162:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 167:	8d 4f 01             	lea    0x1(%edi),%ecx
 16a:	89 ca                	mov    %ecx,%edx
 16c:	39 d9                	cmp    %ebx,%ecx
 16e:	73 26                	jae    196 <s_getReverseDigits+0x5f>
 170:	85 c0                	test   %eax,%eax
 172:	74 22                	je     196 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 174:	ba 00 00 00 00       	mov    $0x0,%edx
 179:	f7 75 08             	divl   0x8(%ebp)
 17c:	0f b6 92 0c 05 00 00 	movzbl 0x50c(%edx),%edx
 183:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 186:	89 cf                	mov    %ecx,%edi
 188:	eb dd                	jmp    167 <s_getReverseDigits+0x30>
    x = xx;
 18a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 18d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 194:	eb cc                	jmp    162 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 196:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 19a:	75 0a                	jne    1a6 <s_getReverseDigits+0x6f>
 19c:	39 da                	cmp    %ebx,%edx
 19e:	73 06                	jae    1a6 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 1a0:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 1a4:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 1a6:	89 fa                	mov    %edi,%edx
 1a8:	39 df                	cmp    %ebx,%edi
 1aa:	0f 92 c0             	setb   %al
 1ad:	84 45 ec             	test   %al,-0x14(%ebp)
 1b0:	74 07                	je     1b9 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 1b2:	83 c7 01             	add    $0x1,%edi
 1b5:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 1b9:	89 f8                	mov    %edi,%eax
 1bb:	83 c4 08             	add    $0x8,%esp
 1be:	5b                   	pop    %ebx
 1bf:	5e                   	pop    %esi
 1c0:	5f                   	pop    %edi
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    

000001c3 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 1c3:	39 c2                	cmp    %eax,%edx
 1c5:	0f 46 c2             	cmovbe %edx,%eax
}
 1c8:	c3                   	ret    

000001c9 <s_printint>:
{
 1c9:	55                   	push   %ebp
 1ca:	89 e5                	mov    %esp,%ebp
 1cc:	57                   	push   %edi
 1cd:	56                   	push   %esi
 1ce:	53                   	push   %ebx
 1cf:	83 ec 2c             	sub    $0x2c,%esp
 1d2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 1d5:	89 55 d0             	mov    %edx,-0x30(%ebp)
 1d8:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 1db:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 1de:	ff 75 14             	pushl  0x14(%ebp)
 1e1:	ff 75 10             	pushl  0x10(%ebp)
 1e4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1e7:	ba 10 00 00 00       	mov    $0x10,%edx
 1ec:	8d 45 d8             	lea    -0x28(%ebp),%eax
 1ef:	e8 43 ff ff ff       	call   137 <s_getReverseDigits>
 1f4:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 1f7:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 1f9:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 1fc:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 201:	83 eb 01             	sub    $0x1,%ebx
 204:	78 22                	js     228 <s_printint+0x5f>
 206:	39 fe                	cmp    %edi,%esi
 208:	73 1e                	jae    228 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 20a:	83 ec 0c             	sub    $0xc,%esp
 20d:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 212:	50                   	push   %eax
 213:	56                   	push   %esi
 214:	57                   	push   %edi
 215:	ff 75 cc             	pushl  -0x34(%ebp)
 218:	ff 75 d0             	pushl  -0x30(%ebp)
 21b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 21e:	ff d0                	call   *%eax
    j++;
 220:	83 c6 01             	add    $0x1,%esi
 223:	83 c4 20             	add    $0x20,%esp
 226:	eb d9                	jmp    201 <s_printint+0x38>
}
 228:	8b 45 c8             	mov    -0x38(%ebp),%eax
 22b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22e:	5b                   	pop    %ebx
 22f:	5e                   	pop    %esi
 230:	5f                   	pop    %edi
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    

00000233 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	57                   	push   %edi
 237:	56                   	push   %esi
 238:	53                   	push   %ebx
 239:	83 ec 2c             	sub    $0x2c,%esp
 23c:	89 45 d8             	mov    %eax,-0x28(%ebp)
 23f:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 242:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 24b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 252:	bb 00 00 00 00       	mov    $0x0,%ebx
 257:	89 f8                	mov    %edi,%eax
 259:	89 df                	mov    %ebx,%edi
 25b:	89 c6                	mov    %eax,%esi
 25d:	eb 20                	jmp    27f <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 25f:	8d 43 01             	lea    0x1(%ebx),%eax
 262:	89 45 e0             	mov    %eax,-0x20(%ebp)
 265:	83 ec 0c             	sub    $0xc,%esp
 268:	51                   	push   %ecx
 269:	53                   	push   %ebx
 26a:	56                   	push   %esi
 26b:	ff 75 d0             	pushl  -0x30(%ebp)
 26e:	ff 75 d4             	pushl  -0x2c(%ebp)
 271:	8b 55 d8             	mov    -0x28(%ebp),%edx
 274:	ff d2                	call   *%edx
 276:	83 c4 20             	add    $0x20,%esp
 279:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 27c:	83 c7 01             	add    $0x1,%edi
 27f:	8b 45 0c             	mov    0xc(%ebp),%eax
 282:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 286:	84 c0                	test   %al,%al
 288:	0f 84 cd 01 00 00    	je     45b <s_printf+0x228>
 28e:	89 75 e0             	mov    %esi,-0x20(%ebp)
 291:	39 de                	cmp    %ebx,%esi
 293:	0f 86 c2 01 00 00    	jbe    45b <s_printf+0x228>
    c = fmt[i] & 0xff;
 299:	0f be c8             	movsbl %al,%ecx
 29c:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 29f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 2a2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 2a6:	75 0a                	jne    2b2 <s_printf+0x7f>
      if(c == '%') {
 2a8:	83 f8 25             	cmp    $0x25,%eax
 2ab:	75 b2                	jne    25f <s_printf+0x2c>
        state = '%';
 2ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2b0:	eb ca                	jmp    27c <s_printf+0x49>
      }
    } else if(state == '%'){
 2b2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 2b6:	75 c4                	jne    27c <s_printf+0x49>
      if(c == 'd'){
 2b8:	83 f8 64             	cmp    $0x64,%eax
 2bb:	74 6e                	je     32b <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 2bd:	83 f8 78             	cmp    $0x78,%eax
 2c0:	0f 94 c1             	sete   %cl
 2c3:	83 f8 70             	cmp    $0x70,%eax
 2c6:	0f 94 c2             	sete   %dl
 2c9:	08 d1                	or     %dl,%cl
 2cb:	0f 85 8e 00 00 00    	jne    35f <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 2d1:	83 f8 73             	cmp    $0x73,%eax
 2d4:	0f 84 b9 00 00 00    	je     393 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 2da:	83 f8 63             	cmp    $0x63,%eax
 2dd:	0f 84 1a 01 00 00    	je     3fd <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 2e3:	83 f8 25             	cmp    $0x25,%eax
 2e6:	0f 84 44 01 00 00    	je     430 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 2ec:	8d 43 01             	lea    0x1(%ebx),%eax
 2ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2f2:	83 ec 0c             	sub    $0xc,%esp
 2f5:	6a 25                	push   $0x25
 2f7:	53                   	push   %ebx
 2f8:	56                   	push   %esi
 2f9:	ff 75 d0             	pushl  -0x30(%ebp)
 2fc:	ff 75 d4             	pushl  -0x2c(%ebp)
 2ff:	8b 45 d8             	mov    -0x28(%ebp),%eax
 302:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 304:	83 c3 02             	add    $0x2,%ebx
 307:	83 c4 14             	add    $0x14,%esp
 30a:	ff 75 dc             	pushl  -0x24(%ebp)
 30d:	ff 75 e4             	pushl  -0x1c(%ebp)
 310:	56                   	push   %esi
 311:	ff 75 d0             	pushl  -0x30(%ebp)
 314:	ff 75 d4             	pushl  -0x2c(%ebp)
 317:	8b 45 d8             	mov    -0x28(%ebp),%eax
 31a:	ff d0                	call   *%eax
 31c:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 31f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 326:	e9 51 ff ff ff       	jmp    27c <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 32b:	8b 45 d0             	mov    -0x30(%ebp),%eax
 32e:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 331:	6a 01                	push   $0x1
 333:	6a 0a                	push   $0xa
 335:	8b 45 10             	mov    0x10(%ebp),%eax
 338:	ff 30                	pushl  (%eax)
 33a:	89 f0                	mov    %esi,%eax
 33c:	29 d8                	sub    %ebx,%eax
 33e:	50                   	push   %eax
 33f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 342:	8b 45 d8             	mov    -0x28(%ebp),%eax
 345:	e8 7f fe ff ff       	call   1c9 <s_printint>
 34a:	01 c3                	add    %eax,%ebx
        ap++;
 34c:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 350:	83 c4 10             	add    $0x10,%esp
      state = 0;
 353:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 35a:	e9 1d ff ff ff       	jmp    27c <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 35f:	8b 45 d0             	mov    -0x30(%ebp),%eax
 362:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 365:	6a 00                	push   $0x0
 367:	6a 10                	push   $0x10
 369:	8b 45 10             	mov    0x10(%ebp),%eax
 36c:	ff 30                	pushl  (%eax)
 36e:	89 f0                	mov    %esi,%eax
 370:	29 d8                	sub    %ebx,%eax
 372:	50                   	push   %eax
 373:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 376:	8b 45 d8             	mov    -0x28(%ebp),%eax
 379:	e8 4b fe ff ff       	call   1c9 <s_printint>
 37e:	01 c3                	add    %eax,%ebx
        ap++;
 380:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 384:	83 c4 10             	add    $0x10,%esp
      state = 0;
 387:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 38e:	e9 e9 fe ff ff       	jmp    27c <s_printf+0x49>
        s = (char*)*ap;
 393:	8b 45 10             	mov    0x10(%ebp),%eax
 396:	8b 00                	mov    (%eax),%eax
        ap++;
 398:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 39c:	85 c0                	test   %eax,%eax
 39e:	75 4e                	jne    3ee <s_printf+0x1bb>
          s = "(null)";
 3a0:	b8 05 05 00 00       	mov    $0x505,%eax
 3a5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3a8:	89 da                	mov    %ebx,%edx
 3aa:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 3ad:	89 75 e0             	mov    %esi,-0x20(%ebp)
 3b0:	89 c6                	mov    %eax,%esi
 3b2:	eb 1f                	jmp    3d3 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3b4:	8d 7a 01             	lea    0x1(%edx),%edi
 3b7:	83 ec 0c             	sub    $0xc,%esp
 3ba:	0f be c0             	movsbl %al,%eax
 3bd:	50                   	push   %eax
 3be:	52                   	push   %edx
 3bf:	53                   	push   %ebx
 3c0:	ff 75 d0             	pushl  -0x30(%ebp)
 3c3:	ff 75 d4             	pushl  -0x2c(%ebp)
 3c6:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3c9:	ff d0                	call   *%eax
          s++;
 3cb:	83 c6 01             	add    $0x1,%esi
 3ce:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3d1:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 3d3:	0f b6 06             	movzbl (%esi),%eax
 3d6:	84 c0                	test   %al,%al
 3d8:	75 da                	jne    3b4 <s_printf+0x181>
 3da:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3dd:	89 d3                	mov    %edx,%ebx
 3df:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 3e2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3e9:	e9 8e fe ff ff       	jmp    27c <s_printf+0x49>
 3ee:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3f1:	89 da                	mov    %ebx,%edx
 3f3:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 3f6:	89 75 e0             	mov    %esi,-0x20(%ebp)
 3f9:	89 c6                	mov    %eax,%esi
 3fb:	eb d6                	jmp    3d3 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 3fd:	8d 43 01             	lea    0x1(%ebx),%eax
 400:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 403:	83 ec 0c             	sub    $0xc,%esp
 406:	8b 55 10             	mov    0x10(%ebp),%edx
 409:	0f be 02             	movsbl (%edx),%eax
 40c:	50                   	push   %eax
 40d:	53                   	push   %ebx
 40e:	56                   	push   %esi
 40f:	ff 75 d0             	pushl  -0x30(%ebp)
 412:	ff 75 d4             	pushl  -0x2c(%ebp)
 415:	8b 55 d8             	mov    -0x28(%ebp),%edx
 418:	ff d2                	call   *%edx
        ap++;
 41a:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 41e:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 421:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 424:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 42b:	e9 4c fe ff ff       	jmp    27c <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 430:	8d 43 01             	lea    0x1(%ebx),%eax
 433:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 436:	83 ec 0c             	sub    $0xc,%esp
 439:	ff 75 dc             	pushl  -0x24(%ebp)
 43c:	53                   	push   %ebx
 43d:	56                   	push   %esi
 43e:	ff 75 d0             	pushl  -0x30(%ebp)
 441:	ff 75 d4             	pushl  -0x2c(%ebp)
 444:	8b 55 d8             	mov    -0x28(%ebp),%edx
 447:	ff d2                	call   *%edx
 449:	83 c4 20             	add    $0x20,%esp
 44c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 44f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 456:	e9 21 fe ff ff       	jmp    27c <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 45b:	89 da                	mov    %ebx,%edx
 45d:	89 f0                	mov    %esi,%eax
 45f:	e8 5f fd ff ff       	call   1c3 <s_min>
}
 464:	8d 65 f4             	lea    -0xc(%ebp),%esp
 467:	5b                   	pop    %ebx
 468:	5e                   	pop    %esi
 469:	5f                   	pop    %edi
 46a:	5d                   	pop    %ebp
 46b:	c3                   	ret    

0000046c <s_putc>:
{
 46c:	f3 0f 1e fb          	endbr32 
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	83 ec 1c             	sub    $0x1c,%esp
 476:	8b 45 18             	mov    0x18(%ebp),%eax
 479:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 47c:	6a 01                	push   $0x1
 47e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 481:	50                   	push   %eax
 482:	ff 75 08             	pushl  0x8(%ebp)
 485:	e8 f3 fb ff ff       	call   7d <write>
}
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	c9                   	leave  
 48e:	c3                   	ret    

0000048f <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 48f:	f3 0f 1e fb          	endbr32 
 493:	55                   	push   %ebp
 494:	89 e5                	mov    %esp,%ebp
 496:	56                   	push   %esi
 497:	53                   	push   %ebx
 498:	8b 75 08             	mov    0x8(%ebp),%esi
 49b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 49e:	83 ec 04             	sub    $0x4,%esp
 4a1:	8d 45 14             	lea    0x14(%ebp),%eax
 4a4:	50                   	push   %eax
 4a5:	ff 75 10             	pushl  0x10(%ebp)
 4a8:	53                   	push   %ebx
 4a9:	89 f1                	mov    %esi,%ecx
 4ab:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 4b0:	b8 1d 01 00 00       	mov    $0x11d,%eax
 4b5:	e8 79 fd ff ff       	call   233 <s_printf>
  if(count < n) {
 4ba:	83 c4 10             	add    $0x10,%esp
 4bd:	39 c3                	cmp    %eax,%ebx
 4bf:	76 04                	jbe    4c5 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 4c1:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 4c5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4c8:	5b                   	pop    %ebx
 4c9:	5e                   	pop    %esi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    

000004cc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4cc:	f3 0f 1e fb          	endbr32 
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 4d6:	8d 45 10             	lea    0x10(%ebp),%eax
 4d9:	50                   	push   %eax
 4da:	ff 75 0c             	pushl  0xc(%ebp)
 4dd:	68 00 00 00 40       	push   $0x40000000
 4e2:	b9 00 00 00 00       	mov    $0x0,%ecx
 4e7:	8b 55 08             	mov    0x8(%ebp),%edx
 4ea:	b8 6c 04 00 00       	mov    $0x46c,%eax
 4ef:	e8 3f fd ff ff       	call   233 <s_printf>
}
 4f4:	83 c4 10             	add    $0x10,%esp
 4f7:	c9                   	leave  
 4f8:	c3                   	ret    
