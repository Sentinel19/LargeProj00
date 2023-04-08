
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
  4d:	68 2c 05 00 00       	push   $0x52c
  52:	6a 02                	push   $0x2
  54:	e8 a5 04 00 00       	call   4fe <printf>
    exit();
  59:	e8 21 00 00 00       	call   7f <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5e:	83 ec 04             	sub    $0x4,%esp
  61:	ff 36                	pushl  (%esi)
  63:	68 43 05 00 00       	push   $0x543
  68:	6a 02                	push   $0x2
  6a:	e8 8f 04 00 00       	call   4fe <printf>
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
SYSCALL(nice)
 137:	b8 1b 00 00 00       	mov    $0x1b,%eax
 13c:	cd 40                	int    $0x40
 13e:	c3                   	ret    

0000013f <flock>:
SYSCALL(flock)
 13f:	b8 19 00 00 00       	mov    $0x19,%eax
 144:	cd 40                	int    $0x40
 146:	c3                   	ret    

00000147 <funlock>:
 147:	b8 1a 00 00 00       	mov    $0x1a,%eax
 14c:	cd 40                	int    $0x40
 14e:	c3                   	ret    

0000014f <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 14f:	f3 0f 1e fb          	endbr32 
 153:	55                   	push   %ebp
 154:	89 e5                	mov    %esp,%ebp
 156:	8b 45 14             	mov    0x14(%ebp),%eax
 159:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 15c:	3b 45 10             	cmp    0x10(%ebp),%eax
 15f:	73 06                	jae    167 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 161:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 164:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    

00000169 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	57                   	push   %edi
 16d:	56                   	push   %esi
 16e:	53                   	push   %ebx
 16f:	83 ec 08             	sub    $0x8,%esp
 172:	89 c6                	mov    %eax,%esi
 174:	89 d3                	mov    %edx,%ebx
 176:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 179:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 17d:	0f 95 c2             	setne  %dl
 180:	89 c8                	mov    %ecx,%eax
 182:	c1 e8 1f             	shr    $0x1f,%eax
 185:	84 c2                	test   %al,%dl
 187:	74 33                	je     1bc <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 189:	89 c8                	mov    %ecx,%eax
 18b:	f7 d8                	neg    %eax
    neg = 1;
 18d:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 194:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 199:	8d 4f 01             	lea    0x1(%edi),%ecx
 19c:	89 ca                	mov    %ecx,%edx
 19e:	39 d9                	cmp    %ebx,%ecx
 1a0:	73 26                	jae    1c8 <s_getReverseDigits+0x5f>
 1a2:	85 c0                	test   %eax,%eax
 1a4:	74 22                	je     1c8 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 1a6:	ba 00 00 00 00       	mov    $0x0,%edx
 1ab:	f7 75 08             	divl   0x8(%ebp)
 1ae:	0f b6 92 68 05 00 00 	movzbl 0x568(%edx),%edx
 1b5:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 1b8:	89 cf                	mov    %ecx,%edi
 1ba:	eb dd                	jmp    199 <s_getReverseDigits+0x30>
    x = xx;
 1bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 1bf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1c6:	eb cc                	jmp    194 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 1c8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1cc:	75 0a                	jne    1d8 <s_getReverseDigits+0x6f>
 1ce:	39 da                	cmp    %ebx,%edx
 1d0:	73 06                	jae    1d8 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 1d2:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 1d6:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 1d8:	89 fa                	mov    %edi,%edx
 1da:	39 df                	cmp    %ebx,%edi
 1dc:	0f 92 c0             	setb   %al
 1df:	84 45 ec             	test   %al,-0x14(%ebp)
 1e2:	74 07                	je     1eb <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 1e4:	83 c7 01             	add    $0x1,%edi
 1e7:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 1eb:	89 f8                	mov    %edi,%eax
 1ed:	83 c4 08             	add    $0x8,%esp
 1f0:	5b                   	pop    %ebx
 1f1:	5e                   	pop    %esi
 1f2:	5f                   	pop    %edi
 1f3:	5d                   	pop    %ebp
 1f4:	c3                   	ret    

000001f5 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 1f5:	39 c2                	cmp    %eax,%edx
 1f7:	0f 46 c2             	cmovbe %edx,%eax
}
 1fa:	c3                   	ret    

000001fb <s_printint>:
{
 1fb:	55                   	push   %ebp
 1fc:	89 e5                	mov    %esp,%ebp
 1fe:	57                   	push   %edi
 1ff:	56                   	push   %esi
 200:	53                   	push   %ebx
 201:	83 ec 2c             	sub    $0x2c,%esp
 204:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 207:	89 55 d0             	mov    %edx,-0x30(%ebp)
 20a:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 20d:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 210:	ff 75 14             	pushl  0x14(%ebp)
 213:	ff 75 10             	pushl  0x10(%ebp)
 216:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 219:	ba 10 00 00 00       	mov    $0x10,%edx
 21e:	8d 45 d8             	lea    -0x28(%ebp),%eax
 221:	e8 43 ff ff ff       	call   169 <s_getReverseDigits>
 226:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 229:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 22b:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 22e:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 233:	83 eb 01             	sub    $0x1,%ebx
 236:	78 22                	js     25a <s_printint+0x5f>
 238:	39 fe                	cmp    %edi,%esi
 23a:	73 1e                	jae    25a <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 23c:	83 ec 0c             	sub    $0xc,%esp
 23f:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 244:	50                   	push   %eax
 245:	56                   	push   %esi
 246:	57                   	push   %edi
 247:	ff 75 cc             	pushl  -0x34(%ebp)
 24a:	ff 75 d0             	pushl  -0x30(%ebp)
 24d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 250:	ff d0                	call   *%eax
    j++;
 252:	83 c6 01             	add    $0x1,%esi
 255:	83 c4 20             	add    $0x20,%esp
 258:	eb d9                	jmp    233 <s_printint+0x38>
}
 25a:	8b 45 c8             	mov    -0x38(%ebp),%eax
 25d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 260:	5b                   	pop    %ebx
 261:	5e                   	pop    %esi
 262:	5f                   	pop    %edi
 263:	5d                   	pop    %ebp
 264:	c3                   	ret    

00000265 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	57                   	push   %edi
 269:	56                   	push   %esi
 26a:	53                   	push   %ebx
 26b:	83 ec 2c             	sub    $0x2c,%esp
 26e:	89 45 d8             	mov    %eax,-0x28(%ebp)
 271:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 274:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 27d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 284:	bb 00 00 00 00       	mov    $0x0,%ebx
 289:	89 f8                	mov    %edi,%eax
 28b:	89 df                	mov    %ebx,%edi
 28d:	89 c6                	mov    %eax,%esi
 28f:	eb 20                	jmp    2b1 <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 291:	8d 43 01             	lea    0x1(%ebx),%eax
 294:	89 45 e0             	mov    %eax,-0x20(%ebp)
 297:	83 ec 0c             	sub    $0xc,%esp
 29a:	51                   	push   %ecx
 29b:	53                   	push   %ebx
 29c:	56                   	push   %esi
 29d:	ff 75 d0             	pushl  -0x30(%ebp)
 2a0:	ff 75 d4             	pushl  -0x2c(%ebp)
 2a3:	8b 55 d8             	mov    -0x28(%ebp),%edx
 2a6:	ff d2                	call   *%edx
 2a8:	83 c4 20             	add    $0x20,%esp
 2ab:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 2ae:	83 c7 01             	add    $0x1,%edi
 2b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b4:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 2b8:	84 c0                	test   %al,%al
 2ba:	0f 84 cd 01 00 00    	je     48d <s_printf+0x228>
 2c0:	89 75 e0             	mov    %esi,-0x20(%ebp)
 2c3:	39 de                	cmp    %ebx,%esi
 2c5:	0f 86 c2 01 00 00    	jbe    48d <s_printf+0x228>
    c = fmt[i] & 0xff;
 2cb:	0f be c8             	movsbl %al,%ecx
 2ce:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 2d1:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 2d4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 2d8:	75 0a                	jne    2e4 <s_printf+0x7f>
      if(c == '%') {
 2da:	83 f8 25             	cmp    $0x25,%eax
 2dd:	75 b2                	jne    291 <s_printf+0x2c>
        state = '%';
 2df:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2e2:	eb ca                	jmp    2ae <s_printf+0x49>
      }
    } else if(state == '%'){
 2e4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 2e8:	75 c4                	jne    2ae <s_printf+0x49>
      if(c == 'd'){
 2ea:	83 f8 64             	cmp    $0x64,%eax
 2ed:	74 6e                	je     35d <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 2ef:	83 f8 78             	cmp    $0x78,%eax
 2f2:	0f 94 c1             	sete   %cl
 2f5:	83 f8 70             	cmp    $0x70,%eax
 2f8:	0f 94 c2             	sete   %dl
 2fb:	08 d1                	or     %dl,%cl
 2fd:	0f 85 8e 00 00 00    	jne    391 <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 303:	83 f8 73             	cmp    $0x73,%eax
 306:	0f 84 b9 00 00 00    	je     3c5 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 30c:	83 f8 63             	cmp    $0x63,%eax
 30f:	0f 84 1a 01 00 00    	je     42f <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 315:	83 f8 25             	cmp    $0x25,%eax
 318:	0f 84 44 01 00 00    	je     462 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 31e:	8d 43 01             	lea    0x1(%ebx),%eax
 321:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 324:	83 ec 0c             	sub    $0xc,%esp
 327:	6a 25                	push   $0x25
 329:	53                   	push   %ebx
 32a:	56                   	push   %esi
 32b:	ff 75 d0             	pushl  -0x30(%ebp)
 32e:	ff 75 d4             	pushl  -0x2c(%ebp)
 331:	8b 45 d8             	mov    -0x28(%ebp),%eax
 334:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 336:	83 c3 02             	add    $0x2,%ebx
 339:	83 c4 14             	add    $0x14,%esp
 33c:	ff 75 dc             	pushl  -0x24(%ebp)
 33f:	ff 75 e4             	pushl  -0x1c(%ebp)
 342:	56                   	push   %esi
 343:	ff 75 d0             	pushl  -0x30(%ebp)
 346:	ff 75 d4             	pushl  -0x2c(%ebp)
 349:	8b 45 d8             	mov    -0x28(%ebp),%eax
 34c:	ff d0                	call   *%eax
 34e:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 351:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 358:	e9 51 ff ff ff       	jmp    2ae <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 35d:	8b 45 d0             	mov    -0x30(%ebp),%eax
 360:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 363:	6a 01                	push   $0x1
 365:	6a 0a                	push   $0xa
 367:	8b 45 10             	mov    0x10(%ebp),%eax
 36a:	ff 30                	pushl  (%eax)
 36c:	89 f0                	mov    %esi,%eax
 36e:	29 d8                	sub    %ebx,%eax
 370:	50                   	push   %eax
 371:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 374:	8b 45 d8             	mov    -0x28(%ebp),%eax
 377:	e8 7f fe ff ff       	call   1fb <s_printint>
 37c:	01 c3                	add    %eax,%ebx
        ap++;
 37e:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 382:	83 c4 10             	add    $0x10,%esp
      state = 0;
 385:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 38c:	e9 1d ff ff ff       	jmp    2ae <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 391:	8b 45 d0             	mov    -0x30(%ebp),%eax
 394:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 397:	6a 00                	push   $0x0
 399:	6a 10                	push   $0x10
 39b:	8b 45 10             	mov    0x10(%ebp),%eax
 39e:	ff 30                	pushl  (%eax)
 3a0:	89 f0                	mov    %esi,%eax
 3a2:	29 d8                	sub    %ebx,%eax
 3a4:	50                   	push   %eax
 3a5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 3a8:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3ab:	e8 4b fe ff ff       	call   1fb <s_printint>
 3b0:	01 c3                	add    %eax,%ebx
        ap++;
 3b2:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 3b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3b9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3c0:	e9 e9 fe ff ff       	jmp    2ae <s_printf+0x49>
        s = (char*)*ap;
 3c5:	8b 45 10             	mov    0x10(%ebp),%eax
 3c8:	8b 00                	mov    (%eax),%eax
        ap++;
 3ca:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 3ce:	85 c0                	test   %eax,%eax
 3d0:	75 4e                	jne    420 <s_printf+0x1bb>
          s = "(null)";
 3d2:	b8 5f 05 00 00       	mov    $0x55f,%eax
 3d7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3da:	89 da                	mov    %ebx,%edx
 3dc:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 3df:	89 75 e0             	mov    %esi,-0x20(%ebp)
 3e2:	89 c6                	mov    %eax,%esi
 3e4:	eb 1f                	jmp    405 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 3e6:	8d 7a 01             	lea    0x1(%edx),%edi
 3e9:	83 ec 0c             	sub    $0xc,%esp
 3ec:	0f be c0             	movsbl %al,%eax
 3ef:	50                   	push   %eax
 3f0:	52                   	push   %edx
 3f1:	53                   	push   %ebx
 3f2:	ff 75 d0             	pushl  -0x30(%ebp)
 3f5:	ff 75 d4             	pushl  -0x2c(%ebp)
 3f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3fb:	ff d0                	call   *%eax
          s++;
 3fd:	83 c6 01             	add    $0x1,%esi
 400:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 403:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 405:	0f b6 06             	movzbl (%esi),%eax
 408:	84 c0                	test   %al,%al
 40a:	75 da                	jne    3e6 <s_printf+0x181>
 40c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 40f:	89 d3                	mov    %edx,%ebx
 411:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 414:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 41b:	e9 8e fe ff ff       	jmp    2ae <s_printf+0x49>
 420:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 423:	89 da                	mov    %ebx,%edx
 425:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 428:	89 75 e0             	mov    %esi,-0x20(%ebp)
 42b:	89 c6                	mov    %eax,%esi
 42d:	eb d6                	jmp    405 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 42f:	8d 43 01             	lea    0x1(%ebx),%eax
 432:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 435:	83 ec 0c             	sub    $0xc,%esp
 438:	8b 55 10             	mov    0x10(%ebp),%edx
 43b:	0f be 02             	movsbl (%edx),%eax
 43e:	50                   	push   %eax
 43f:	53                   	push   %ebx
 440:	56                   	push   %esi
 441:	ff 75 d0             	pushl  -0x30(%ebp)
 444:	ff 75 d4             	pushl  -0x2c(%ebp)
 447:	8b 55 d8             	mov    -0x28(%ebp),%edx
 44a:	ff d2                	call   *%edx
        ap++;
 44c:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 450:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 453:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 456:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 45d:	e9 4c fe ff ff       	jmp    2ae <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 462:	8d 43 01             	lea    0x1(%ebx),%eax
 465:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 468:	83 ec 0c             	sub    $0xc,%esp
 46b:	ff 75 dc             	pushl  -0x24(%ebp)
 46e:	53                   	push   %ebx
 46f:	56                   	push   %esi
 470:	ff 75 d0             	pushl  -0x30(%ebp)
 473:	ff 75 d4             	pushl  -0x2c(%ebp)
 476:	8b 55 d8             	mov    -0x28(%ebp),%edx
 479:	ff d2                	call   *%edx
 47b:	83 c4 20             	add    $0x20,%esp
 47e:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 481:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 488:	e9 21 fe ff ff       	jmp    2ae <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 48d:	89 da                	mov    %ebx,%edx
 48f:	89 f0                	mov    %esi,%eax
 491:	e8 5f fd ff ff       	call   1f5 <s_min>
}
 496:	8d 65 f4             	lea    -0xc(%ebp),%esp
 499:	5b                   	pop    %ebx
 49a:	5e                   	pop    %esi
 49b:	5f                   	pop    %edi
 49c:	5d                   	pop    %ebp
 49d:	c3                   	ret    

0000049e <s_putc>:
{
 49e:	f3 0f 1e fb          	endbr32 
 4a2:	55                   	push   %ebp
 4a3:	89 e5                	mov    %esp,%ebp
 4a5:	83 ec 1c             	sub    $0x1c,%esp
 4a8:	8b 45 18             	mov    0x18(%ebp),%eax
 4ab:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4ae:	6a 01                	push   $0x1
 4b0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b3:	50                   	push   %eax
 4b4:	ff 75 08             	pushl  0x8(%ebp)
 4b7:	e8 e3 fb ff ff       	call   9f <write>
}
 4bc:	83 c4 10             	add    $0x10,%esp
 4bf:	c9                   	leave  
 4c0:	c3                   	ret    

000004c1 <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 4c1:	f3 0f 1e fb          	endbr32 
 4c5:	55                   	push   %ebp
 4c6:	89 e5                	mov    %esp,%ebp
 4c8:	56                   	push   %esi
 4c9:	53                   	push   %ebx
 4ca:	8b 75 08             	mov    0x8(%ebp),%esi
 4cd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 4d0:	83 ec 04             	sub    $0x4,%esp
 4d3:	8d 45 14             	lea    0x14(%ebp),%eax
 4d6:	50                   	push   %eax
 4d7:	ff 75 10             	pushl  0x10(%ebp)
 4da:	53                   	push   %ebx
 4db:	89 f1                	mov    %esi,%ecx
 4dd:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 4e2:	b8 4f 01 00 00       	mov    $0x14f,%eax
 4e7:	e8 79 fd ff ff       	call   265 <s_printf>
  if(count < n) {
 4ec:	83 c4 10             	add    $0x10,%esp
 4ef:	39 c3                	cmp    %eax,%ebx
 4f1:	76 04                	jbe    4f7 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 4f3:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 4f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4fa:	5b                   	pop    %ebx
 4fb:	5e                   	pop    %esi
 4fc:	5d                   	pop    %ebp
 4fd:	c3                   	ret    

000004fe <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4fe:	f3 0f 1e fb          	endbr32 
 502:	55                   	push   %ebp
 503:	89 e5                	mov    %esp,%ebp
 505:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 508:	8d 45 10             	lea    0x10(%ebp),%eax
 50b:	50                   	push   %eax
 50c:	ff 75 0c             	pushl  0xc(%ebp)
 50f:	68 00 00 00 40       	push   $0x40000000
 514:	b9 00 00 00 00       	mov    $0x0,%ecx
 519:	8b 55 08             	mov    0x8(%ebp),%edx
 51c:	b8 9e 04 00 00       	mov    $0x49e,%eax
 521:	e8 3f fd ff ff       	call   265 <s_printf>
}
 526:	83 c4 10             	add    $0x10,%esp
 529:	c9                   	leave  
 52a:	c3                   	ret    
