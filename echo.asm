
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
  24:	ba 0c 05 00 00       	mov    $0x50c,%edx
  29:	52                   	push   %edx
  2a:	ff 34 87             	pushl  (%edi,%eax,4)
  2d:	68 10 05 00 00       	push   $0x510
  32:	6a 01                	push   $0x1
  34:	e8 a3 04 00 00       	call   4dc <printf>
  39:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  3c:	89 d8                	mov    %ebx,%eax
  3e:	39 f0                	cmp    %esi,%eax
  40:	7d 0e                	jge    50 <main+0x50>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  42:	8d 58 01             	lea    0x1(%eax),%ebx
  45:	39 f3                	cmp    %esi,%ebx
  47:	7d db                	jge    24 <main+0x24>
  49:	ba 0e 05 00 00       	mov    $0x50e,%edx
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
SYSCALL(nice)
 115:	b8 1b 00 00 00       	mov    $0x1b,%eax
 11a:	cd 40                	int    $0x40
 11c:	c3                   	ret    

0000011d <flock>:
SYSCALL(flock)
 11d:	b8 19 00 00 00       	mov    $0x19,%eax
 122:	cd 40                	int    $0x40
 124:	c3                   	ret    

00000125 <funlock>:
 125:	b8 1a 00 00 00       	mov    $0x1a,%eax
 12a:	cd 40                	int    $0x40
 12c:	c3                   	ret    

0000012d <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 12d:	f3 0f 1e fb          	endbr32 
 131:	55                   	push   %ebp
 132:	89 e5                	mov    %esp,%ebp
 134:	8b 45 14             	mov    0x14(%ebp),%eax
 137:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 13a:	3b 45 10             	cmp    0x10(%ebp),%eax
 13d:	73 06                	jae    145 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 13f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 142:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    

00000147 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 147:	55                   	push   %ebp
 148:	89 e5                	mov    %esp,%ebp
 14a:	57                   	push   %edi
 14b:	56                   	push   %esi
 14c:	53                   	push   %ebx
 14d:	83 ec 08             	sub    $0x8,%esp
 150:	89 c6                	mov    %eax,%esi
 152:	89 d3                	mov    %edx,%ebx
 154:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 157:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 15b:	0f 95 c2             	setne  %dl
 15e:	89 c8                	mov    %ecx,%eax
 160:	c1 e8 1f             	shr    $0x1f,%eax
 163:	84 c2                	test   %al,%dl
 165:	74 33                	je     19a <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 167:	89 c8                	mov    %ecx,%eax
 169:	f7 d8                	neg    %eax
    neg = 1;
 16b:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 172:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 177:	8d 4f 01             	lea    0x1(%edi),%ecx
 17a:	89 ca                	mov    %ecx,%edx
 17c:	39 d9                	cmp    %ebx,%ecx
 17e:	73 26                	jae    1a6 <s_getReverseDigits+0x5f>
 180:	85 c0                	test   %eax,%eax
 182:	74 22                	je     1a6 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 184:	ba 00 00 00 00       	mov    $0x0,%edx
 189:	f7 75 08             	divl   0x8(%ebp)
 18c:	0f b6 92 1c 05 00 00 	movzbl 0x51c(%edx),%edx
 193:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 196:	89 cf                	mov    %ecx,%edi
 198:	eb dd                	jmp    177 <s_getReverseDigits+0x30>
    x = xx;
 19a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 19d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1a4:	eb cc                	jmp    172 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 1a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1aa:	75 0a                	jne    1b6 <s_getReverseDigits+0x6f>
 1ac:	39 da                	cmp    %ebx,%edx
 1ae:	73 06                	jae    1b6 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 1b0:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 1b4:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 1b6:	89 fa                	mov    %edi,%edx
 1b8:	39 df                	cmp    %ebx,%edi
 1ba:	0f 92 c0             	setb   %al
 1bd:	84 45 ec             	test   %al,-0x14(%ebp)
 1c0:	74 07                	je     1c9 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 1c2:	83 c7 01             	add    $0x1,%edi
 1c5:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 1c9:	89 f8                	mov    %edi,%eax
 1cb:	83 c4 08             	add    $0x8,%esp
 1ce:	5b                   	pop    %ebx
 1cf:	5e                   	pop    %esi
 1d0:	5f                   	pop    %edi
 1d1:	5d                   	pop    %ebp
 1d2:	c3                   	ret    

000001d3 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 1d3:	39 c2                	cmp    %eax,%edx
 1d5:	0f 46 c2             	cmovbe %edx,%eax
}
 1d8:	c3                   	ret    

000001d9 <s_printint>:
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	57                   	push   %edi
 1dd:	56                   	push   %esi
 1de:	53                   	push   %ebx
 1df:	83 ec 2c             	sub    $0x2c,%esp
 1e2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 1e5:	89 55 d0             	mov    %edx,-0x30(%ebp)
 1e8:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 1eb:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 1ee:	ff 75 14             	pushl  0x14(%ebp)
 1f1:	ff 75 10             	pushl  0x10(%ebp)
 1f4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1f7:	ba 10 00 00 00       	mov    $0x10,%edx
 1fc:	8d 45 d8             	lea    -0x28(%ebp),%eax
 1ff:	e8 43 ff ff ff       	call   147 <s_getReverseDigits>
 204:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 207:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 209:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 20c:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 211:	83 eb 01             	sub    $0x1,%ebx
 214:	78 22                	js     238 <s_printint+0x5f>
 216:	39 fe                	cmp    %edi,%esi
 218:	73 1e                	jae    238 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 222:	50                   	push   %eax
 223:	56                   	push   %esi
 224:	57                   	push   %edi
 225:	ff 75 cc             	pushl  -0x34(%ebp)
 228:	ff 75 d0             	pushl  -0x30(%ebp)
 22b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 22e:	ff d0                	call   *%eax
    j++;
 230:	83 c6 01             	add    $0x1,%esi
 233:	83 c4 20             	add    $0x20,%esp
 236:	eb d9                	jmp    211 <s_printint+0x38>
}
 238:	8b 45 c8             	mov    -0x38(%ebp),%eax
 23b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 23e:	5b                   	pop    %ebx
 23f:	5e                   	pop    %esi
 240:	5f                   	pop    %edi
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    

00000243 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 243:	55                   	push   %ebp
 244:	89 e5                	mov    %esp,%ebp
 246:	57                   	push   %edi
 247:	56                   	push   %esi
 248:	53                   	push   %ebx
 249:	83 ec 2c             	sub    $0x2c,%esp
 24c:	89 45 d8             	mov    %eax,-0x28(%ebp)
 24f:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 252:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 25b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 262:	bb 00 00 00 00       	mov    $0x0,%ebx
 267:	89 f8                	mov    %edi,%eax
 269:	89 df                	mov    %ebx,%edi
 26b:	89 c6                	mov    %eax,%esi
 26d:	eb 20                	jmp    28f <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 26f:	8d 43 01             	lea    0x1(%ebx),%eax
 272:	89 45 e0             	mov    %eax,-0x20(%ebp)
 275:	83 ec 0c             	sub    $0xc,%esp
 278:	51                   	push   %ecx
 279:	53                   	push   %ebx
 27a:	56                   	push   %esi
 27b:	ff 75 d0             	pushl  -0x30(%ebp)
 27e:	ff 75 d4             	pushl  -0x2c(%ebp)
 281:	8b 55 d8             	mov    -0x28(%ebp),%edx
 284:	ff d2                	call   *%edx
 286:	83 c4 20             	add    $0x20,%esp
 289:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 28c:	83 c7 01             	add    $0x1,%edi
 28f:	8b 45 0c             	mov    0xc(%ebp),%eax
 292:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 296:	84 c0                	test   %al,%al
 298:	0f 84 cd 01 00 00    	je     46b <s_printf+0x228>
 29e:	89 75 e0             	mov    %esi,-0x20(%ebp)
 2a1:	39 de                	cmp    %ebx,%esi
 2a3:	0f 86 c2 01 00 00    	jbe    46b <s_printf+0x228>
    c = fmt[i] & 0xff;
 2a9:	0f be c8             	movsbl %al,%ecx
 2ac:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 2af:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 2b2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 2b6:	75 0a                	jne    2c2 <s_printf+0x7f>
      if(c == '%') {
 2b8:	83 f8 25             	cmp    $0x25,%eax
 2bb:	75 b2                	jne    26f <s_printf+0x2c>
        state = '%';
 2bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2c0:	eb ca                	jmp    28c <s_printf+0x49>
      }
    } else if(state == '%'){
 2c2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 2c6:	75 c4                	jne    28c <s_printf+0x49>
      if(c == 'd'){
 2c8:	83 f8 64             	cmp    $0x64,%eax
 2cb:	74 6e                	je     33b <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 2cd:	83 f8 78             	cmp    $0x78,%eax
 2d0:	0f 94 c1             	sete   %cl
 2d3:	83 f8 70             	cmp    $0x70,%eax
 2d6:	0f 94 c2             	sete   %dl
 2d9:	08 d1                	or     %dl,%cl
 2db:	0f 85 8e 00 00 00    	jne    36f <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 2e1:	83 f8 73             	cmp    $0x73,%eax
 2e4:	0f 84 b9 00 00 00    	je     3a3 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 2ea:	83 f8 63             	cmp    $0x63,%eax
 2ed:	0f 84 1a 01 00 00    	je     40d <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 2f3:	83 f8 25             	cmp    $0x25,%eax
 2f6:	0f 84 44 01 00 00    	je     440 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 2fc:	8d 43 01             	lea    0x1(%ebx),%eax
 2ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 302:	83 ec 0c             	sub    $0xc,%esp
 305:	6a 25                	push   $0x25
 307:	53                   	push   %ebx
 308:	56                   	push   %esi
 309:	ff 75 d0             	pushl  -0x30(%ebp)
 30c:	ff 75 d4             	pushl  -0x2c(%ebp)
 30f:	8b 45 d8             	mov    -0x28(%ebp),%eax
 312:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 314:	83 c3 02             	add    $0x2,%ebx
 317:	83 c4 14             	add    $0x14,%esp
 31a:	ff 75 dc             	pushl  -0x24(%ebp)
 31d:	ff 75 e4             	pushl  -0x1c(%ebp)
 320:	56                   	push   %esi
 321:	ff 75 d0             	pushl  -0x30(%ebp)
 324:	ff 75 d4             	pushl  -0x2c(%ebp)
 327:	8b 45 d8             	mov    -0x28(%ebp),%eax
 32a:	ff d0                	call   *%eax
 32c:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 32f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 336:	e9 51 ff ff ff       	jmp    28c <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 33b:	8b 45 d0             	mov    -0x30(%ebp),%eax
 33e:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 341:	6a 01                	push   $0x1
 343:	6a 0a                	push   $0xa
 345:	8b 45 10             	mov    0x10(%ebp),%eax
 348:	ff 30                	pushl  (%eax)
 34a:	89 f0                	mov    %esi,%eax
 34c:	29 d8                	sub    %ebx,%eax
 34e:	50                   	push   %eax
 34f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 352:	8b 45 d8             	mov    -0x28(%ebp),%eax
 355:	e8 7f fe ff ff       	call   1d9 <s_printint>
 35a:	01 c3                	add    %eax,%ebx
        ap++;
 35c:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 360:	83 c4 10             	add    $0x10,%esp
      state = 0;
 363:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 36a:	e9 1d ff ff ff       	jmp    28c <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 36f:	8b 45 d0             	mov    -0x30(%ebp),%eax
 372:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 375:	6a 00                	push   $0x0
 377:	6a 10                	push   $0x10
 379:	8b 45 10             	mov    0x10(%ebp),%eax
 37c:	ff 30                	pushl  (%eax)
 37e:	89 f0                	mov    %esi,%eax
 380:	29 d8                	sub    %ebx,%eax
 382:	50                   	push   %eax
 383:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 386:	8b 45 d8             	mov    -0x28(%ebp),%eax
 389:	e8 4b fe ff ff       	call   1d9 <s_printint>
 38e:	01 c3                	add    %eax,%ebx
        ap++;
 390:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 394:	83 c4 10             	add    $0x10,%esp
      state = 0;
 397:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 39e:	e9 e9 fe ff ff       	jmp    28c <s_printf+0x49>
        s = (char*)*ap;
 3a3:	8b 45 10             	mov    0x10(%ebp),%eax
 3a6:	8b 00                	mov    (%eax),%eax
        ap++;
 3a8:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 3ac:	85 c0                	test   %eax,%eax
 3ae:	75 4e                	jne    3fe <s_printf+0x1bb>
          s = "(null)";
 3b0:	b8 15 05 00 00       	mov    $0x515,%eax
 3b5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3b8:	89 da                	mov    %ebx,%edx
 3ba:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 3bd:	89 75 e0             	mov    %esi,-0x20(%ebp)
 3c0:	89 c6                	mov    %eax,%esi
 3c2:	eb 1f                	jmp    3e3 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3c4:	8d 7a 01             	lea    0x1(%edx),%edi
 3c7:	83 ec 0c             	sub    $0xc,%esp
 3ca:	0f be c0             	movsbl %al,%eax
 3cd:	50                   	push   %eax
 3ce:	52                   	push   %edx
 3cf:	53                   	push   %ebx
 3d0:	ff 75 d0             	pushl  -0x30(%ebp)
 3d3:	ff 75 d4             	pushl  -0x2c(%ebp)
 3d6:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3d9:	ff d0                	call   *%eax
          s++;
 3db:	83 c6 01             	add    $0x1,%esi
 3de:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3e1:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 3e3:	0f b6 06             	movzbl (%esi),%eax
 3e6:	84 c0                	test   %al,%al
 3e8:	75 da                	jne    3c4 <s_printf+0x181>
 3ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3ed:	89 d3                	mov    %edx,%ebx
 3ef:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 3f2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3f9:	e9 8e fe ff ff       	jmp    28c <s_printf+0x49>
 3fe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 401:	89 da                	mov    %ebx,%edx
 403:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 406:	89 75 e0             	mov    %esi,-0x20(%ebp)
 409:	89 c6                	mov    %eax,%esi
 40b:	eb d6                	jmp    3e3 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 40d:	8d 43 01             	lea    0x1(%ebx),%eax
 410:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 413:	83 ec 0c             	sub    $0xc,%esp
 416:	8b 55 10             	mov    0x10(%ebp),%edx
 419:	0f be 02             	movsbl (%edx),%eax
 41c:	50                   	push   %eax
 41d:	53                   	push   %ebx
 41e:	56                   	push   %esi
 41f:	ff 75 d0             	pushl  -0x30(%ebp)
 422:	ff 75 d4             	pushl  -0x2c(%ebp)
 425:	8b 55 d8             	mov    -0x28(%ebp),%edx
 428:	ff d2                	call   *%edx
        ap++;
 42a:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 42e:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 431:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 434:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 43b:	e9 4c fe ff ff       	jmp    28c <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 440:	8d 43 01             	lea    0x1(%ebx),%eax
 443:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 446:	83 ec 0c             	sub    $0xc,%esp
 449:	ff 75 dc             	pushl  -0x24(%ebp)
 44c:	53                   	push   %ebx
 44d:	56                   	push   %esi
 44e:	ff 75 d0             	pushl  -0x30(%ebp)
 451:	ff 75 d4             	pushl  -0x2c(%ebp)
 454:	8b 55 d8             	mov    -0x28(%ebp),%edx
 457:	ff d2                	call   *%edx
 459:	83 c4 20             	add    $0x20,%esp
 45c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 45f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 466:	e9 21 fe ff ff       	jmp    28c <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 46b:	89 da                	mov    %ebx,%edx
 46d:	89 f0                	mov    %esi,%eax
 46f:	e8 5f fd ff ff       	call   1d3 <s_min>
}
 474:	8d 65 f4             	lea    -0xc(%ebp),%esp
 477:	5b                   	pop    %ebx
 478:	5e                   	pop    %esi
 479:	5f                   	pop    %edi
 47a:	5d                   	pop    %ebp
 47b:	c3                   	ret    

0000047c <s_putc>:
{
 47c:	f3 0f 1e fb          	endbr32 
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	83 ec 1c             	sub    $0x1c,%esp
 486:	8b 45 18             	mov    0x18(%ebp),%eax
 489:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 48c:	6a 01                	push   $0x1
 48e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 491:	50                   	push   %eax
 492:	ff 75 08             	pushl  0x8(%ebp)
 495:	e8 e3 fb ff ff       	call   7d <write>
}
 49a:	83 c4 10             	add    $0x10,%esp
 49d:	c9                   	leave  
 49e:	c3                   	ret    

0000049f <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 49f:	f3 0f 1e fb          	endbr32 
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
 4a6:	56                   	push   %esi
 4a7:	53                   	push   %ebx
 4a8:	8b 75 08             	mov    0x8(%ebp),%esi
 4ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 4ae:	83 ec 04             	sub    $0x4,%esp
 4b1:	8d 45 14             	lea    0x14(%ebp),%eax
 4b4:	50                   	push   %eax
 4b5:	ff 75 10             	pushl  0x10(%ebp)
 4b8:	53                   	push   %ebx
 4b9:	89 f1                	mov    %esi,%ecx
 4bb:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 4c0:	b8 2d 01 00 00       	mov    $0x12d,%eax
 4c5:	e8 79 fd ff ff       	call   243 <s_printf>
  if(count < n) {
 4ca:	83 c4 10             	add    $0x10,%esp
 4cd:	39 c3                	cmp    %eax,%ebx
 4cf:	76 04                	jbe    4d5 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 4d1:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 4d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4d8:	5b                   	pop    %ebx
 4d9:	5e                   	pop    %esi
 4da:	5d                   	pop    %ebp
 4db:	c3                   	ret    

000004dc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4dc:	f3 0f 1e fb          	endbr32 
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 4e6:	8d 45 10             	lea    0x10(%ebp),%eax
 4e9:	50                   	push   %eax
 4ea:	ff 75 0c             	pushl  0xc(%ebp)
 4ed:	68 00 00 00 40       	push   $0x40000000
 4f2:	b9 00 00 00 00       	mov    $0x0,%ecx
 4f7:	8b 55 08             	mov    0x8(%ebp),%edx
 4fa:	b8 7c 04 00 00       	mov    $0x47c,%eax
 4ff:	e8 3f fd ff ff       	call   243 <s_printf>
}
 504:	83 c4 10             	add    $0x10,%esp
 507:	c9                   	leave  
 508:	c3                   	ret    
