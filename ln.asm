
_ln:     file format elf32-i386


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
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  13:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  16:	83 39 03             	cmpl   $0x3,(%ecx)
  19:	74 14                	je     2f <main+0x2f>
    printf(2, "Usage: ln old new\n");
  1b:	83 ec 08             	sub    $0x8,%esp
  1e:	68 14 05 00 00       	push   $0x514
  23:	6a 02                	push   $0x2
  25:	e8 bd 04 00 00       	call   4e7 <printf>
    exit();
  2a:	e8 39 00 00 00       	call   68 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2f:	83 ec 08             	sub    $0x8,%esp
  32:	ff 73 08             	pushl  0x8(%ebx)
  35:	ff 73 04             	pushl  0x4(%ebx)
  38:	e8 8b 00 00 00       	call   c8 <link>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	85 c0                	test   %eax,%eax
  42:	78 05                	js     49 <main+0x49>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  44:	e8 1f 00 00 00       	call   68 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  49:	ff 73 08             	pushl  0x8(%ebx)
  4c:	ff 73 04             	pushl  0x4(%ebx)
  4f:	68 27 05 00 00       	push   $0x527
  54:	6a 02                	push   $0x2
  56:	e8 8c 04 00 00       	call   4e7 <printf>
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	eb e4                	jmp    44 <main+0x44>

00000060 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
  60:	b8 01 00 00 00       	mov    $0x1,%eax
  65:	cd 40                	int    $0x40
  67:	c3                   	ret    

00000068 <exit>:
SYSCALL(exit)
  68:	b8 02 00 00 00       	mov    $0x2,%eax
  6d:	cd 40                	int    $0x40
  6f:	c3                   	ret    

00000070 <wait>:
SYSCALL(wait)
  70:	b8 03 00 00 00       	mov    $0x3,%eax
  75:	cd 40                	int    $0x40
  77:	c3                   	ret    

00000078 <pipe>:
SYSCALL(pipe)
  78:	b8 04 00 00 00       	mov    $0x4,%eax
  7d:	cd 40                	int    $0x40
  7f:	c3                   	ret    

00000080 <read>:
SYSCALL(read)
  80:	b8 05 00 00 00       	mov    $0x5,%eax
  85:	cd 40                	int    $0x40
  87:	c3                   	ret    

00000088 <write>:
SYSCALL(write)
  88:	b8 10 00 00 00       	mov    $0x10,%eax
  8d:	cd 40                	int    $0x40
  8f:	c3                   	ret    

00000090 <close>:
SYSCALL(close)
  90:	b8 15 00 00 00       	mov    $0x15,%eax
  95:	cd 40                	int    $0x40
  97:	c3                   	ret    

00000098 <kill>:
SYSCALL(kill)
  98:	b8 06 00 00 00       	mov    $0x6,%eax
  9d:	cd 40                	int    $0x40
  9f:	c3                   	ret    

000000a0 <exec>:
SYSCALL(exec)
  a0:	b8 07 00 00 00       	mov    $0x7,%eax
  a5:	cd 40                	int    $0x40
  a7:	c3                   	ret    

000000a8 <open>:
SYSCALL(open)
  a8:	b8 0f 00 00 00       	mov    $0xf,%eax
  ad:	cd 40                	int    $0x40
  af:	c3                   	ret    

000000b0 <mknod>:
SYSCALL(mknod)
  b0:	b8 11 00 00 00       	mov    $0x11,%eax
  b5:	cd 40                	int    $0x40
  b7:	c3                   	ret    

000000b8 <unlink>:
SYSCALL(unlink)
  b8:	b8 12 00 00 00       	mov    $0x12,%eax
  bd:	cd 40                	int    $0x40
  bf:	c3                   	ret    

000000c0 <fstat>:
SYSCALL(fstat)
  c0:	b8 08 00 00 00       	mov    $0x8,%eax
  c5:	cd 40                	int    $0x40
  c7:	c3                   	ret    

000000c8 <link>:
SYSCALL(link)
  c8:	b8 13 00 00 00       	mov    $0x13,%eax
  cd:	cd 40                	int    $0x40
  cf:	c3                   	ret    

000000d0 <mkdir>:
SYSCALL(mkdir)
  d0:	b8 14 00 00 00       	mov    $0x14,%eax
  d5:	cd 40                	int    $0x40
  d7:	c3                   	ret    

000000d8 <chdir>:
SYSCALL(chdir)
  d8:	b8 09 00 00 00       	mov    $0x9,%eax
  dd:	cd 40                	int    $0x40
  df:	c3                   	ret    

000000e0 <dup>:
SYSCALL(dup)
  e0:	b8 0a 00 00 00       	mov    $0xa,%eax
  e5:	cd 40                	int    $0x40
  e7:	c3                   	ret    

000000e8 <getpid>:
SYSCALL(getpid)
  e8:	b8 0b 00 00 00       	mov    $0xb,%eax
  ed:	cd 40                	int    $0x40
  ef:	c3                   	ret    

000000f0 <sbrk>:
SYSCALL(sbrk)
  f0:	b8 0c 00 00 00       	mov    $0xc,%eax
  f5:	cd 40                	int    $0x40
  f7:	c3                   	ret    

000000f8 <sleep>:
SYSCALL(sleep)
  f8:	b8 0d 00 00 00       	mov    $0xd,%eax
  fd:	cd 40                	int    $0x40
  ff:	c3                   	ret    

00000100 <uptime>:
SYSCALL(uptime)
 100:	b8 0e 00 00 00       	mov    $0xe,%eax
 105:	cd 40                	int    $0x40
 107:	c3                   	ret    

00000108 <yield>:
SYSCALL(yield)
 108:	b8 16 00 00 00       	mov    $0x16,%eax
 10d:	cd 40                	int    $0x40
 10f:	c3                   	ret    

00000110 <shutdown>:
SYSCALL(shutdown)
 110:	b8 17 00 00 00       	mov    $0x17,%eax
 115:	cd 40                	int    $0x40
 117:	c3                   	ret    

00000118 <ps>:
SYSCALL(ps)
 118:	b8 18 00 00 00       	mov    $0x18,%eax
 11d:	cd 40                	int    $0x40
 11f:	c3                   	ret    

00000120 <nice>:
SYSCALL(nice)
 120:	b8 1b 00 00 00       	mov    $0x1b,%eax
 125:	cd 40                	int    $0x40
 127:	c3                   	ret    

00000128 <flock>:
SYSCALL(flock)
 128:	b8 19 00 00 00       	mov    $0x19,%eax
 12d:	cd 40                	int    $0x40
 12f:	c3                   	ret    

00000130 <funlock>:
 130:	b8 1a 00 00 00       	mov    $0x1a,%eax
 135:	cd 40                	int    $0x40
 137:	c3                   	ret    

00000138 <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 138:	f3 0f 1e fb          	endbr32 
 13c:	55                   	push   %ebp
 13d:	89 e5                	mov    %esp,%ebp
 13f:	8b 45 14             	mov    0x14(%ebp),%eax
 142:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 145:	3b 45 10             	cmp    0x10(%ebp),%eax
 148:	73 06                	jae    150 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 14a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 14d:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    

00000152 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	57                   	push   %edi
 156:	56                   	push   %esi
 157:	53                   	push   %ebx
 158:	83 ec 08             	sub    $0x8,%esp
 15b:	89 c6                	mov    %eax,%esi
 15d:	89 d3                	mov    %edx,%ebx
 15f:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 162:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 166:	0f 95 c2             	setne  %dl
 169:	89 c8                	mov    %ecx,%eax
 16b:	c1 e8 1f             	shr    $0x1f,%eax
 16e:	84 c2                	test   %al,%dl
 170:	74 33                	je     1a5 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 172:	89 c8                	mov    %ecx,%eax
 174:	f7 d8                	neg    %eax
    neg = 1;
 176:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 17d:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 182:	8d 4f 01             	lea    0x1(%edi),%ecx
 185:	89 ca                	mov    %ecx,%edx
 187:	39 d9                	cmp    %ebx,%ecx
 189:	73 26                	jae    1b1 <s_getReverseDigits+0x5f>
 18b:	85 c0                	test   %eax,%eax
 18d:	74 22                	je     1b1 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 18f:	ba 00 00 00 00       	mov    $0x0,%edx
 194:	f7 75 08             	divl   0x8(%ebp)
 197:	0f b6 92 44 05 00 00 	movzbl 0x544(%edx),%edx
 19e:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 1a1:	89 cf                	mov    %ecx,%edi
 1a3:	eb dd                	jmp    182 <s_getReverseDigits+0x30>
    x = xx;
 1a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 1a8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1af:	eb cc                	jmp    17d <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 1b1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1b5:	75 0a                	jne    1c1 <s_getReverseDigits+0x6f>
 1b7:	39 da                	cmp    %ebx,%edx
 1b9:	73 06                	jae    1c1 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 1bb:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 1bf:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 1c1:	89 fa                	mov    %edi,%edx
 1c3:	39 df                	cmp    %ebx,%edi
 1c5:	0f 92 c0             	setb   %al
 1c8:	84 45 ec             	test   %al,-0x14(%ebp)
 1cb:	74 07                	je     1d4 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 1cd:	83 c7 01             	add    $0x1,%edi
 1d0:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 1d4:	89 f8                	mov    %edi,%eax
 1d6:	83 c4 08             	add    $0x8,%esp
 1d9:	5b                   	pop    %ebx
 1da:	5e                   	pop    %esi
 1db:	5f                   	pop    %edi
 1dc:	5d                   	pop    %ebp
 1dd:	c3                   	ret    

000001de <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 1de:	39 c2                	cmp    %eax,%edx
 1e0:	0f 46 c2             	cmovbe %edx,%eax
}
 1e3:	c3                   	ret    

000001e4 <s_printint>:
{
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
 1e7:	57                   	push   %edi
 1e8:	56                   	push   %esi
 1e9:	53                   	push   %ebx
 1ea:	83 ec 2c             	sub    $0x2c,%esp
 1ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 1f0:	89 55 d0             	mov    %edx,-0x30(%ebp)
 1f3:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 1f6:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 1f9:	ff 75 14             	pushl  0x14(%ebp)
 1fc:	ff 75 10             	pushl  0x10(%ebp)
 1ff:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 202:	ba 10 00 00 00       	mov    $0x10,%edx
 207:	8d 45 d8             	lea    -0x28(%ebp),%eax
 20a:	e8 43 ff ff ff       	call   152 <s_getReverseDigits>
 20f:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 212:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 214:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 217:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 21c:	83 eb 01             	sub    $0x1,%ebx
 21f:	78 22                	js     243 <s_printint+0x5f>
 221:	39 fe                	cmp    %edi,%esi
 223:	73 1e                	jae    243 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 225:	83 ec 0c             	sub    $0xc,%esp
 228:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 22d:	50                   	push   %eax
 22e:	56                   	push   %esi
 22f:	57                   	push   %edi
 230:	ff 75 cc             	pushl  -0x34(%ebp)
 233:	ff 75 d0             	pushl  -0x30(%ebp)
 236:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 239:	ff d0                	call   *%eax
    j++;
 23b:	83 c6 01             	add    $0x1,%esi
 23e:	83 c4 20             	add    $0x20,%esp
 241:	eb d9                	jmp    21c <s_printint+0x38>
}
 243:	8b 45 c8             	mov    -0x38(%ebp),%eax
 246:	8d 65 f4             	lea    -0xc(%ebp),%esp
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5f                   	pop    %edi
 24c:	5d                   	pop    %ebp
 24d:	c3                   	ret    

0000024e <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 24e:	55                   	push   %ebp
 24f:	89 e5                	mov    %esp,%ebp
 251:	57                   	push   %edi
 252:	56                   	push   %esi
 253:	53                   	push   %ebx
 254:	83 ec 2c             	sub    $0x2c,%esp
 257:	89 45 d8             	mov    %eax,-0x28(%ebp)
 25a:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 25d:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 266:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 26d:	bb 00 00 00 00       	mov    $0x0,%ebx
 272:	89 f8                	mov    %edi,%eax
 274:	89 df                	mov    %ebx,%edi
 276:	89 c6                	mov    %eax,%esi
 278:	eb 20                	jmp    29a <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 27a:	8d 43 01             	lea    0x1(%ebx),%eax
 27d:	89 45 e0             	mov    %eax,-0x20(%ebp)
 280:	83 ec 0c             	sub    $0xc,%esp
 283:	51                   	push   %ecx
 284:	53                   	push   %ebx
 285:	56                   	push   %esi
 286:	ff 75 d0             	pushl  -0x30(%ebp)
 289:	ff 75 d4             	pushl  -0x2c(%ebp)
 28c:	8b 55 d8             	mov    -0x28(%ebp),%edx
 28f:	ff d2                	call   *%edx
 291:	83 c4 20             	add    $0x20,%esp
 294:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 297:	83 c7 01             	add    $0x1,%edi
 29a:	8b 45 0c             	mov    0xc(%ebp),%eax
 29d:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 2a1:	84 c0                	test   %al,%al
 2a3:	0f 84 cd 01 00 00    	je     476 <s_printf+0x228>
 2a9:	89 75 e0             	mov    %esi,-0x20(%ebp)
 2ac:	39 de                	cmp    %ebx,%esi
 2ae:	0f 86 c2 01 00 00    	jbe    476 <s_printf+0x228>
    c = fmt[i] & 0xff;
 2b4:	0f be c8             	movsbl %al,%ecx
 2b7:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 2ba:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 2bd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 2c1:	75 0a                	jne    2cd <s_printf+0x7f>
      if(c == '%') {
 2c3:	83 f8 25             	cmp    $0x25,%eax
 2c6:	75 b2                	jne    27a <s_printf+0x2c>
        state = '%';
 2c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2cb:	eb ca                	jmp    297 <s_printf+0x49>
      }
    } else if(state == '%'){
 2cd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 2d1:	75 c4                	jne    297 <s_printf+0x49>
      if(c == 'd'){
 2d3:	83 f8 64             	cmp    $0x64,%eax
 2d6:	74 6e                	je     346 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 2d8:	83 f8 78             	cmp    $0x78,%eax
 2db:	0f 94 c1             	sete   %cl
 2de:	83 f8 70             	cmp    $0x70,%eax
 2e1:	0f 94 c2             	sete   %dl
 2e4:	08 d1                	or     %dl,%cl
 2e6:	0f 85 8e 00 00 00    	jne    37a <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 2ec:	83 f8 73             	cmp    $0x73,%eax
 2ef:	0f 84 b9 00 00 00    	je     3ae <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 2f5:	83 f8 63             	cmp    $0x63,%eax
 2f8:	0f 84 1a 01 00 00    	je     418 <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 2fe:	83 f8 25             	cmp    $0x25,%eax
 301:	0f 84 44 01 00 00    	je     44b <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 307:	8d 43 01             	lea    0x1(%ebx),%eax
 30a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 30d:	83 ec 0c             	sub    $0xc,%esp
 310:	6a 25                	push   $0x25
 312:	53                   	push   %ebx
 313:	56                   	push   %esi
 314:	ff 75 d0             	pushl  -0x30(%ebp)
 317:	ff 75 d4             	pushl  -0x2c(%ebp)
 31a:	8b 45 d8             	mov    -0x28(%ebp),%eax
 31d:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 31f:	83 c3 02             	add    $0x2,%ebx
 322:	83 c4 14             	add    $0x14,%esp
 325:	ff 75 dc             	pushl  -0x24(%ebp)
 328:	ff 75 e4             	pushl  -0x1c(%ebp)
 32b:	56                   	push   %esi
 32c:	ff 75 d0             	pushl  -0x30(%ebp)
 32f:	ff 75 d4             	pushl  -0x2c(%ebp)
 332:	8b 45 d8             	mov    -0x28(%ebp),%eax
 335:	ff d0                	call   *%eax
 337:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 33a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 341:	e9 51 ff ff ff       	jmp    297 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 346:	8b 45 d0             	mov    -0x30(%ebp),%eax
 349:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 34c:	6a 01                	push   $0x1
 34e:	6a 0a                	push   $0xa
 350:	8b 45 10             	mov    0x10(%ebp),%eax
 353:	ff 30                	pushl  (%eax)
 355:	89 f0                	mov    %esi,%eax
 357:	29 d8                	sub    %ebx,%eax
 359:	50                   	push   %eax
 35a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 35d:	8b 45 d8             	mov    -0x28(%ebp),%eax
 360:	e8 7f fe ff ff       	call   1e4 <s_printint>
 365:	01 c3                	add    %eax,%ebx
        ap++;
 367:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 36b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 36e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 375:	e9 1d ff ff ff       	jmp    297 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 37a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 37d:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 380:	6a 00                	push   $0x0
 382:	6a 10                	push   $0x10
 384:	8b 45 10             	mov    0x10(%ebp),%eax
 387:	ff 30                	pushl  (%eax)
 389:	89 f0                	mov    %esi,%eax
 38b:	29 d8                	sub    %ebx,%eax
 38d:	50                   	push   %eax
 38e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 391:	8b 45 d8             	mov    -0x28(%ebp),%eax
 394:	e8 4b fe ff ff       	call   1e4 <s_printint>
 399:	01 c3                	add    %eax,%ebx
        ap++;
 39b:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 39f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3a2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3a9:	e9 e9 fe ff ff       	jmp    297 <s_printf+0x49>
        s = (char*)*ap;
 3ae:	8b 45 10             	mov    0x10(%ebp),%eax
 3b1:	8b 00                	mov    (%eax),%eax
        ap++;
 3b3:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 3b7:	85 c0                	test   %eax,%eax
 3b9:	75 4e                	jne    409 <s_printf+0x1bb>
          s = "(null)";
 3bb:	b8 3b 05 00 00       	mov    $0x53b,%eax
 3c0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3c3:	89 da                	mov    %ebx,%edx
 3c5:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 3c8:	89 75 e0             	mov    %esi,-0x20(%ebp)
 3cb:	89 c6                	mov    %eax,%esi
 3cd:	eb 1f                	jmp    3ee <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3cf:	8d 7a 01             	lea    0x1(%edx),%edi
 3d2:	83 ec 0c             	sub    $0xc,%esp
 3d5:	0f be c0             	movsbl %al,%eax
 3d8:	50                   	push   %eax
 3d9:	52                   	push   %edx
 3da:	53                   	push   %ebx
 3db:	ff 75 d0             	pushl  -0x30(%ebp)
 3de:	ff 75 d4             	pushl  -0x2c(%ebp)
 3e1:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3e4:	ff d0                	call   *%eax
          s++;
 3e6:	83 c6 01             	add    $0x1,%esi
 3e9:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3ec:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 3ee:	0f b6 06             	movzbl (%esi),%eax
 3f1:	84 c0                	test   %al,%al
 3f3:	75 da                	jne    3cf <s_printf+0x181>
 3f5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3f8:	89 d3                	mov    %edx,%ebx
 3fa:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 3fd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 404:	e9 8e fe ff ff       	jmp    297 <s_printf+0x49>
 409:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 40c:	89 da                	mov    %ebx,%edx
 40e:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 411:	89 75 e0             	mov    %esi,-0x20(%ebp)
 414:	89 c6                	mov    %eax,%esi
 416:	eb d6                	jmp    3ee <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 418:	8d 43 01             	lea    0x1(%ebx),%eax
 41b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 41e:	83 ec 0c             	sub    $0xc,%esp
 421:	8b 55 10             	mov    0x10(%ebp),%edx
 424:	0f be 02             	movsbl (%edx),%eax
 427:	50                   	push   %eax
 428:	53                   	push   %ebx
 429:	56                   	push   %esi
 42a:	ff 75 d0             	pushl  -0x30(%ebp)
 42d:	ff 75 d4             	pushl  -0x2c(%ebp)
 430:	8b 55 d8             	mov    -0x28(%ebp),%edx
 433:	ff d2                	call   *%edx
        ap++;
 435:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 439:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 43c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 43f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 446:	e9 4c fe ff ff       	jmp    297 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 44b:	8d 43 01             	lea    0x1(%ebx),%eax
 44e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 451:	83 ec 0c             	sub    $0xc,%esp
 454:	ff 75 dc             	pushl  -0x24(%ebp)
 457:	53                   	push   %ebx
 458:	56                   	push   %esi
 459:	ff 75 d0             	pushl  -0x30(%ebp)
 45c:	ff 75 d4             	pushl  -0x2c(%ebp)
 45f:	8b 55 d8             	mov    -0x28(%ebp),%edx
 462:	ff d2                	call   *%edx
 464:	83 c4 20             	add    $0x20,%esp
 467:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 46a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 471:	e9 21 fe ff ff       	jmp    297 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 476:	89 da                	mov    %ebx,%edx
 478:	89 f0                	mov    %esi,%eax
 47a:	e8 5f fd ff ff       	call   1de <s_min>
}
 47f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 482:	5b                   	pop    %ebx
 483:	5e                   	pop    %esi
 484:	5f                   	pop    %edi
 485:	5d                   	pop    %ebp
 486:	c3                   	ret    

00000487 <s_putc>:
{
 487:	f3 0f 1e fb          	endbr32 
 48b:	55                   	push   %ebp
 48c:	89 e5                	mov    %esp,%ebp
 48e:	83 ec 1c             	sub    $0x1c,%esp
 491:	8b 45 18             	mov    0x18(%ebp),%eax
 494:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 497:	6a 01                	push   $0x1
 499:	8d 45 f4             	lea    -0xc(%ebp),%eax
 49c:	50                   	push   %eax
 49d:	ff 75 08             	pushl  0x8(%ebp)
 4a0:	e8 e3 fb ff ff       	call   88 <write>
}
 4a5:	83 c4 10             	add    $0x10,%esp
 4a8:	c9                   	leave  
 4a9:	c3                   	ret    

000004aa <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 4aa:	f3 0f 1e fb          	endbr32 
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	56                   	push   %esi
 4b2:	53                   	push   %ebx
 4b3:	8b 75 08             	mov    0x8(%ebp),%esi
 4b6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 4b9:	83 ec 04             	sub    $0x4,%esp
 4bc:	8d 45 14             	lea    0x14(%ebp),%eax
 4bf:	50                   	push   %eax
 4c0:	ff 75 10             	pushl  0x10(%ebp)
 4c3:	53                   	push   %ebx
 4c4:	89 f1                	mov    %esi,%ecx
 4c6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 4cb:	b8 38 01 00 00       	mov    $0x138,%eax
 4d0:	e8 79 fd ff ff       	call   24e <s_printf>
  if(count < n) {
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	39 c3                	cmp    %eax,%ebx
 4da:	76 04                	jbe    4e0 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 4dc:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 4e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e3:	5b                   	pop    %ebx
 4e4:	5e                   	pop    %esi
 4e5:	5d                   	pop    %ebp
 4e6:	c3                   	ret    

000004e7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e7:	f3 0f 1e fb          	endbr32 
 4eb:	55                   	push   %ebp
 4ec:	89 e5                	mov    %esp,%ebp
 4ee:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 4f1:	8d 45 10             	lea    0x10(%ebp),%eax
 4f4:	50                   	push   %eax
 4f5:	ff 75 0c             	pushl  0xc(%ebp)
 4f8:	68 00 00 00 40       	push   $0x40000000
 4fd:	b9 00 00 00 00       	mov    $0x0,%ecx
 502:	8b 55 08             	mov    0x8(%ebp),%edx
 505:	b8 87 04 00 00       	mov    $0x487,%eax
 50a:	e8 3f fd ff ff       	call   24e <s_printf>
}
 50f:	83 c4 10             	add    $0x10,%esp
 512:	c9                   	leave  
 513:	c3                   	ret    
