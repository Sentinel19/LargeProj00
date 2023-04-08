
_testflock:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"

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
   int fd = open("lock", O_CREATE|O_RDWR);
  13:	83 ec 08             	sub    $0x8,%esp
  16:	68 02 02 00 00       	push   $0x202
  1b:	68 50 05 00 00       	push   $0x550
  20:	e8 bf 00 00 00       	call   e4 <open>
   if(0 <= fd) {
  25:	83 c4 10             	add    $0x10,%esp
  28:	85 c0                	test   %eax,%eax
  2a:	79 05                	jns    31 <main+0x31>
        sleep(500);
        printf(2, "Unlocking\n");
        funlock(fd);
    }
    }
   exit();
  2c:	e8 73 00 00 00       	call   a4 <exit>
  31:	89 c3                	mov    %eax,%ebx
    printf(2, "Trying to get lock\n");
  33:	83 ec 08             	sub    $0x8,%esp
  36:	68 55 05 00 00       	push   $0x555
  3b:	6a 02                	push   $0x2
  3d:	e8 e1 04 00 00       	call   523 <printf>
    int status = flock(fd);
  42:	89 1c 24             	mov    %ebx,(%esp)
  45:	e8 1a 01 00 00       	call   164 <flock>
    if(0 > status) {
  4a:	83 c4 10             	add    $0x10,%esp
  4d:	85 c0                	test   %eax,%eax
  4f:	78 37                	js     88 <main+0x88>
        printf(2, "Got lock\n");
  51:	83 ec 08             	sub    $0x8,%esp
  54:	68 79 05 00 00       	push   $0x579
  59:	6a 02                	push   $0x2
  5b:	e8 c3 04 00 00       	call   523 <printf>
        sleep(500);
  60:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
  67:	e8 c8 00 00 00       	call   134 <sleep>
        printf(2, "Unlocking\n");
  6c:	83 c4 08             	add    $0x8,%esp
  6f:	68 83 05 00 00       	push   $0x583
  74:	6a 02                	push   $0x2
  76:	e8 a8 04 00 00       	call   523 <printf>
        funlock(fd);
  7b:	89 1c 24             	mov    %ebx,(%esp)
  7e:	e8 e9 00 00 00       	call   16c <funlock>
  83:	83 c4 10             	add    $0x10,%esp
  86:	eb a4                	jmp    2c <main+0x2c>
        printf(2, "Error: flock()\n");
  88:	83 ec 08             	sub    $0x8,%esp
  8b:	68 69 05 00 00       	push   $0x569
  90:	6a 02                	push   $0x2
  92:	e8 8c 04 00 00       	call   523 <printf>
  97:	83 c4 10             	add    $0x10,%esp
  9a:	eb 90                	jmp    2c <main+0x2c>

0000009c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
  9c:	b8 01 00 00 00       	mov    $0x1,%eax
  a1:	cd 40                	int    $0x40
  a3:	c3                   	ret    

000000a4 <exit>:
SYSCALL(exit)
  a4:	b8 02 00 00 00       	mov    $0x2,%eax
  a9:	cd 40                	int    $0x40
  ab:	c3                   	ret    

000000ac <wait>:
SYSCALL(wait)
  ac:	b8 03 00 00 00       	mov    $0x3,%eax
  b1:	cd 40                	int    $0x40
  b3:	c3                   	ret    

000000b4 <pipe>:
SYSCALL(pipe)
  b4:	b8 04 00 00 00       	mov    $0x4,%eax
  b9:	cd 40                	int    $0x40
  bb:	c3                   	ret    

000000bc <read>:
SYSCALL(read)
  bc:	b8 05 00 00 00       	mov    $0x5,%eax
  c1:	cd 40                	int    $0x40
  c3:	c3                   	ret    

000000c4 <write>:
SYSCALL(write)
  c4:	b8 10 00 00 00       	mov    $0x10,%eax
  c9:	cd 40                	int    $0x40
  cb:	c3                   	ret    

000000cc <close>:
SYSCALL(close)
  cc:	b8 15 00 00 00       	mov    $0x15,%eax
  d1:	cd 40                	int    $0x40
  d3:	c3                   	ret    

000000d4 <kill>:
SYSCALL(kill)
  d4:	b8 06 00 00 00       	mov    $0x6,%eax
  d9:	cd 40                	int    $0x40
  db:	c3                   	ret    

000000dc <exec>:
SYSCALL(exec)
  dc:	b8 07 00 00 00       	mov    $0x7,%eax
  e1:	cd 40                	int    $0x40
  e3:	c3                   	ret    

000000e4 <open>:
SYSCALL(open)
  e4:	b8 0f 00 00 00       	mov    $0xf,%eax
  e9:	cd 40                	int    $0x40
  eb:	c3                   	ret    

000000ec <mknod>:
SYSCALL(mknod)
  ec:	b8 11 00 00 00       	mov    $0x11,%eax
  f1:	cd 40                	int    $0x40
  f3:	c3                   	ret    

000000f4 <unlink>:
SYSCALL(unlink)
  f4:	b8 12 00 00 00       	mov    $0x12,%eax
  f9:	cd 40                	int    $0x40
  fb:	c3                   	ret    

000000fc <fstat>:
SYSCALL(fstat)
  fc:	b8 08 00 00 00       	mov    $0x8,%eax
 101:	cd 40                	int    $0x40
 103:	c3                   	ret    

00000104 <link>:
SYSCALL(link)
 104:	b8 13 00 00 00       	mov    $0x13,%eax
 109:	cd 40                	int    $0x40
 10b:	c3                   	ret    

0000010c <mkdir>:
SYSCALL(mkdir)
 10c:	b8 14 00 00 00       	mov    $0x14,%eax
 111:	cd 40                	int    $0x40
 113:	c3                   	ret    

00000114 <chdir>:
SYSCALL(chdir)
 114:	b8 09 00 00 00       	mov    $0x9,%eax
 119:	cd 40                	int    $0x40
 11b:	c3                   	ret    

0000011c <dup>:
SYSCALL(dup)
 11c:	b8 0a 00 00 00       	mov    $0xa,%eax
 121:	cd 40                	int    $0x40
 123:	c3                   	ret    

00000124 <getpid>:
SYSCALL(getpid)
 124:	b8 0b 00 00 00       	mov    $0xb,%eax
 129:	cd 40                	int    $0x40
 12b:	c3                   	ret    

0000012c <sbrk>:
SYSCALL(sbrk)
 12c:	b8 0c 00 00 00       	mov    $0xc,%eax
 131:	cd 40                	int    $0x40
 133:	c3                   	ret    

00000134 <sleep>:
SYSCALL(sleep)
 134:	b8 0d 00 00 00       	mov    $0xd,%eax
 139:	cd 40                	int    $0x40
 13b:	c3                   	ret    

0000013c <uptime>:
SYSCALL(uptime)
 13c:	b8 0e 00 00 00       	mov    $0xe,%eax
 141:	cd 40                	int    $0x40
 143:	c3                   	ret    

00000144 <yield>:
SYSCALL(yield)
 144:	b8 16 00 00 00       	mov    $0x16,%eax
 149:	cd 40                	int    $0x40
 14b:	c3                   	ret    

0000014c <shutdown>:
SYSCALL(shutdown)
 14c:	b8 17 00 00 00       	mov    $0x17,%eax
 151:	cd 40                	int    $0x40
 153:	c3                   	ret    

00000154 <ps>:
SYSCALL(ps)
 154:	b8 18 00 00 00       	mov    $0x18,%eax
 159:	cd 40                	int    $0x40
 15b:	c3                   	ret    

0000015c <nice>:
SYSCALL(nice)
 15c:	b8 1b 00 00 00       	mov    $0x1b,%eax
 161:	cd 40                	int    $0x40
 163:	c3                   	ret    

00000164 <flock>:
SYSCALL(flock)
 164:	b8 19 00 00 00       	mov    $0x19,%eax
 169:	cd 40                	int    $0x40
 16b:	c3                   	ret    

0000016c <funlock>:
 16c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 171:	cd 40                	int    $0x40
 173:	c3                   	ret    

00000174 <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 174:	f3 0f 1e fb          	endbr32 
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	8b 45 14             	mov    0x14(%ebp),%eax
 17e:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 181:	3b 45 10             	cmp    0x10(%ebp),%eax
 184:	73 06                	jae    18c <s_sputc+0x18>
  {
    outbuffer[index] = c;
 186:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 189:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 18c:	5d                   	pop    %ebp
 18d:	c3                   	ret    

0000018e <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 18e:	55                   	push   %ebp
 18f:	89 e5                	mov    %esp,%ebp
 191:	57                   	push   %edi
 192:	56                   	push   %esi
 193:	53                   	push   %ebx
 194:	83 ec 08             	sub    $0x8,%esp
 197:	89 c6                	mov    %eax,%esi
 199:	89 d3                	mov    %edx,%ebx
 19b:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 19e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 1a2:	0f 95 c2             	setne  %dl
 1a5:	89 c8                	mov    %ecx,%eax
 1a7:	c1 e8 1f             	shr    $0x1f,%eax
 1aa:	84 c2                	test   %al,%dl
 1ac:	74 33                	je     1e1 <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 1ae:	89 c8                	mov    %ecx,%eax
 1b0:	f7 d8                	neg    %eax
    neg = 1;
 1b2:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 1b9:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 1be:	8d 4f 01             	lea    0x1(%edi),%ecx
 1c1:	89 ca                	mov    %ecx,%edx
 1c3:	39 d9                	cmp    %ebx,%ecx
 1c5:	73 26                	jae    1ed <s_getReverseDigits+0x5f>
 1c7:	85 c0                	test   %eax,%eax
 1c9:	74 22                	je     1ed <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 1cb:	ba 00 00 00 00       	mov    $0x0,%edx
 1d0:	f7 75 08             	divl   0x8(%ebp)
 1d3:	0f b6 92 98 05 00 00 	movzbl 0x598(%edx),%edx
 1da:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 1dd:	89 cf                	mov    %ecx,%edi
 1df:	eb dd                	jmp    1be <s_getReverseDigits+0x30>
    x = xx;
 1e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 1e4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1eb:	eb cc                	jmp    1b9 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 1ed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1f1:	75 0a                	jne    1fd <s_getReverseDigits+0x6f>
 1f3:	39 da                	cmp    %ebx,%edx
 1f5:	73 06                	jae    1fd <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 1f7:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 1fb:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 1fd:	89 fa                	mov    %edi,%edx
 1ff:	39 df                	cmp    %ebx,%edi
 201:	0f 92 c0             	setb   %al
 204:	84 45 ec             	test   %al,-0x14(%ebp)
 207:	74 07                	je     210 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 209:	83 c7 01             	add    $0x1,%edi
 20c:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 210:	89 f8                	mov    %edi,%eax
 212:	83 c4 08             	add    $0x8,%esp
 215:	5b                   	pop    %ebx
 216:	5e                   	pop    %esi
 217:	5f                   	pop    %edi
 218:	5d                   	pop    %ebp
 219:	c3                   	ret    

0000021a <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 21a:	39 c2                	cmp    %eax,%edx
 21c:	0f 46 c2             	cmovbe %edx,%eax
}
 21f:	c3                   	ret    

00000220 <s_printint>:
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
 225:	53                   	push   %ebx
 226:	83 ec 2c             	sub    $0x2c,%esp
 229:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 22c:	89 55 d0             	mov    %edx,-0x30(%ebp)
 22f:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 232:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 235:	ff 75 14             	pushl  0x14(%ebp)
 238:	ff 75 10             	pushl  0x10(%ebp)
 23b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 23e:	ba 10 00 00 00       	mov    $0x10,%edx
 243:	8d 45 d8             	lea    -0x28(%ebp),%eax
 246:	e8 43 ff ff ff       	call   18e <s_getReverseDigits>
 24b:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 24e:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 250:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 253:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 258:	83 eb 01             	sub    $0x1,%ebx
 25b:	78 22                	js     27f <s_printint+0x5f>
 25d:	39 fe                	cmp    %edi,%esi
 25f:	73 1e                	jae    27f <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 261:	83 ec 0c             	sub    $0xc,%esp
 264:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 269:	50                   	push   %eax
 26a:	56                   	push   %esi
 26b:	57                   	push   %edi
 26c:	ff 75 cc             	pushl  -0x34(%ebp)
 26f:	ff 75 d0             	pushl  -0x30(%ebp)
 272:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 275:	ff d0                	call   *%eax
    j++;
 277:	83 c6 01             	add    $0x1,%esi
 27a:	83 c4 20             	add    $0x20,%esp
 27d:	eb d9                	jmp    258 <s_printint+0x38>
}
 27f:	8b 45 c8             	mov    -0x38(%ebp),%eax
 282:	8d 65 f4             	lea    -0xc(%ebp),%esp
 285:	5b                   	pop    %ebx
 286:	5e                   	pop    %esi
 287:	5f                   	pop    %edi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    

0000028a <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	57                   	push   %edi
 28e:	56                   	push   %esi
 28f:	53                   	push   %ebx
 290:	83 ec 2c             	sub    $0x2c,%esp
 293:	89 45 d8             	mov    %eax,-0x28(%ebp)
 296:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 299:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 29c:	8b 45 08             	mov    0x8(%ebp),%eax
 29f:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 2a2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 2a9:	bb 00 00 00 00       	mov    $0x0,%ebx
 2ae:	89 f8                	mov    %edi,%eax
 2b0:	89 df                	mov    %ebx,%edi
 2b2:	89 c6                	mov    %eax,%esi
 2b4:	eb 20                	jmp    2d6 <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 2b6:	8d 43 01             	lea    0x1(%ebx),%eax
 2b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
 2bc:	83 ec 0c             	sub    $0xc,%esp
 2bf:	51                   	push   %ecx
 2c0:	53                   	push   %ebx
 2c1:	56                   	push   %esi
 2c2:	ff 75 d0             	pushl  -0x30(%ebp)
 2c5:	ff 75 d4             	pushl  -0x2c(%ebp)
 2c8:	8b 55 d8             	mov    -0x28(%ebp),%edx
 2cb:	ff d2                	call   *%edx
 2cd:	83 c4 20             	add    $0x20,%esp
 2d0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 2d3:	83 c7 01             	add    $0x1,%edi
 2d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d9:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 2dd:	84 c0                	test   %al,%al
 2df:	0f 84 cd 01 00 00    	je     4b2 <s_printf+0x228>
 2e5:	89 75 e0             	mov    %esi,-0x20(%ebp)
 2e8:	39 de                	cmp    %ebx,%esi
 2ea:	0f 86 c2 01 00 00    	jbe    4b2 <s_printf+0x228>
    c = fmt[i] & 0xff;
 2f0:	0f be c8             	movsbl %al,%ecx
 2f3:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 2f6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 2f9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 2fd:	75 0a                	jne    309 <s_printf+0x7f>
      if(c == '%') {
 2ff:	83 f8 25             	cmp    $0x25,%eax
 302:	75 b2                	jne    2b6 <s_printf+0x2c>
        state = '%';
 304:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 307:	eb ca                	jmp    2d3 <s_printf+0x49>
      }
    } else if(state == '%'){
 309:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 30d:	75 c4                	jne    2d3 <s_printf+0x49>
      if(c == 'd'){
 30f:	83 f8 64             	cmp    $0x64,%eax
 312:	74 6e                	je     382 <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 314:	83 f8 78             	cmp    $0x78,%eax
 317:	0f 94 c1             	sete   %cl
 31a:	83 f8 70             	cmp    $0x70,%eax
 31d:	0f 94 c2             	sete   %dl
 320:	08 d1                	or     %dl,%cl
 322:	0f 85 8e 00 00 00    	jne    3b6 <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 328:	83 f8 73             	cmp    $0x73,%eax
 32b:	0f 84 b9 00 00 00    	je     3ea <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 331:	83 f8 63             	cmp    $0x63,%eax
 334:	0f 84 1a 01 00 00    	je     454 <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 33a:	83 f8 25             	cmp    $0x25,%eax
 33d:	0f 84 44 01 00 00    	je     487 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 343:	8d 43 01             	lea    0x1(%ebx),%eax
 346:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 349:	83 ec 0c             	sub    $0xc,%esp
 34c:	6a 25                	push   $0x25
 34e:	53                   	push   %ebx
 34f:	56                   	push   %esi
 350:	ff 75 d0             	pushl  -0x30(%ebp)
 353:	ff 75 d4             	pushl  -0x2c(%ebp)
 356:	8b 45 d8             	mov    -0x28(%ebp),%eax
 359:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 35b:	83 c3 02             	add    $0x2,%ebx
 35e:	83 c4 14             	add    $0x14,%esp
 361:	ff 75 dc             	pushl  -0x24(%ebp)
 364:	ff 75 e4             	pushl  -0x1c(%ebp)
 367:	56                   	push   %esi
 368:	ff 75 d0             	pushl  -0x30(%ebp)
 36b:	ff 75 d4             	pushl  -0x2c(%ebp)
 36e:	8b 45 d8             	mov    -0x28(%ebp),%eax
 371:	ff d0                	call   *%eax
 373:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 376:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 37d:	e9 51 ff ff ff       	jmp    2d3 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 382:	8b 45 d0             	mov    -0x30(%ebp),%eax
 385:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 388:	6a 01                	push   $0x1
 38a:	6a 0a                	push   $0xa
 38c:	8b 45 10             	mov    0x10(%ebp),%eax
 38f:	ff 30                	pushl  (%eax)
 391:	89 f0                	mov    %esi,%eax
 393:	29 d8                	sub    %ebx,%eax
 395:	50                   	push   %eax
 396:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 399:	8b 45 d8             	mov    -0x28(%ebp),%eax
 39c:	e8 7f fe ff ff       	call   220 <s_printint>
 3a1:	01 c3                	add    %eax,%ebx
        ap++;
 3a3:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 3a7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3aa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3b1:	e9 1d ff ff ff       	jmp    2d3 <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 3b6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 3b9:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 3bc:	6a 00                	push   $0x0
 3be:	6a 10                	push   $0x10
 3c0:	8b 45 10             	mov    0x10(%ebp),%eax
 3c3:	ff 30                	pushl  (%eax)
 3c5:	89 f0                	mov    %esi,%eax
 3c7:	29 d8                	sub    %ebx,%eax
 3c9:	50                   	push   %eax
 3ca:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 3cd:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3d0:	e8 4b fe ff ff       	call   220 <s_printint>
 3d5:	01 c3                	add    %eax,%ebx
        ap++;
 3d7:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 3db:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3de:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3e5:	e9 e9 fe ff ff       	jmp    2d3 <s_printf+0x49>
        s = (char*)*ap;
 3ea:	8b 45 10             	mov    0x10(%ebp),%eax
 3ed:	8b 00                	mov    (%eax),%eax
        ap++;
 3ef:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 3f3:	85 c0                	test   %eax,%eax
 3f5:	75 4e                	jne    445 <s_printf+0x1bb>
          s = "(null)";
 3f7:	b8 8e 05 00 00       	mov    $0x58e,%eax
 3fc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3ff:	89 da                	mov    %ebx,%edx
 401:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 404:	89 75 e0             	mov    %esi,-0x20(%ebp)
 407:	89 c6                	mov    %eax,%esi
 409:	eb 1f                	jmp    42a <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 40b:	8d 7a 01             	lea    0x1(%edx),%edi
 40e:	83 ec 0c             	sub    $0xc,%esp
 411:	0f be c0             	movsbl %al,%eax
 414:	50                   	push   %eax
 415:	52                   	push   %edx
 416:	53                   	push   %ebx
 417:	ff 75 d0             	pushl  -0x30(%ebp)
 41a:	ff 75 d4             	pushl  -0x2c(%ebp)
 41d:	8b 45 d8             	mov    -0x28(%ebp),%eax
 420:	ff d0                	call   *%eax
          s++;
 422:	83 c6 01             	add    $0x1,%esi
 425:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 428:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 42a:	0f b6 06             	movzbl (%esi),%eax
 42d:	84 c0                	test   %al,%al
 42f:	75 da                	jne    40b <s_printf+0x181>
 431:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 434:	89 d3                	mov    %edx,%ebx
 436:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 439:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 440:	e9 8e fe ff ff       	jmp    2d3 <s_printf+0x49>
 445:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 448:	89 da                	mov    %ebx,%edx
 44a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 44d:	89 75 e0             	mov    %esi,-0x20(%ebp)
 450:	89 c6                	mov    %eax,%esi
 452:	eb d6                	jmp    42a <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 454:	8d 43 01             	lea    0x1(%ebx),%eax
 457:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 45a:	83 ec 0c             	sub    $0xc,%esp
 45d:	8b 55 10             	mov    0x10(%ebp),%edx
 460:	0f be 02             	movsbl (%edx),%eax
 463:	50                   	push   %eax
 464:	53                   	push   %ebx
 465:	56                   	push   %esi
 466:	ff 75 d0             	pushl  -0x30(%ebp)
 469:	ff 75 d4             	pushl  -0x2c(%ebp)
 46c:	8b 55 d8             	mov    -0x28(%ebp),%edx
 46f:	ff d2                	call   *%edx
        ap++;
 471:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 475:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 478:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 47b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 482:	e9 4c fe ff ff       	jmp    2d3 <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 487:	8d 43 01             	lea    0x1(%ebx),%eax
 48a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 48d:	83 ec 0c             	sub    $0xc,%esp
 490:	ff 75 dc             	pushl  -0x24(%ebp)
 493:	53                   	push   %ebx
 494:	56                   	push   %esi
 495:	ff 75 d0             	pushl  -0x30(%ebp)
 498:	ff 75 d4             	pushl  -0x2c(%ebp)
 49b:	8b 55 d8             	mov    -0x28(%ebp),%edx
 49e:	ff d2                	call   *%edx
 4a0:	83 c4 20             	add    $0x20,%esp
 4a3:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 4a6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4ad:	e9 21 fe ff ff       	jmp    2d3 <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 4b2:	89 da                	mov    %ebx,%edx
 4b4:	89 f0                	mov    %esi,%eax
 4b6:	e8 5f fd ff ff       	call   21a <s_min>
}
 4bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4be:	5b                   	pop    %ebx
 4bf:	5e                   	pop    %esi
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    

000004c3 <s_putc>:
{
 4c3:	f3 0f 1e fb          	endbr32 
 4c7:	55                   	push   %ebp
 4c8:	89 e5                	mov    %esp,%ebp
 4ca:	83 ec 1c             	sub    $0x1c,%esp
 4cd:	8b 45 18             	mov    0x18(%ebp),%eax
 4d0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4d3:	6a 01                	push   $0x1
 4d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4d8:	50                   	push   %eax
 4d9:	ff 75 08             	pushl  0x8(%ebp)
 4dc:	e8 e3 fb ff ff       	call   c4 <write>
}
 4e1:	83 c4 10             	add    $0x10,%esp
 4e4:	c9                   	leave  
 4e5:	c3                   	ret    

000004e6 <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 4e6:	f3 0f 1e fb          	endbr32 
 4ea:	55                   	push   %ebp
 4eb:	89 e5                	mov    %esp,%ebp
 4ed:	56                   	push   %esi
 4ee:	53                   	push   %ebx
 4ef:	8b 75 08             	mov    0x8(%ebp),%esi
 4f2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 4f5:	83 ec 04             	sub    $0x4,%esp
 4f8:	8d 45 14             	lea    0x14(%ebp),%eax
 4fb:	50                   	push   %eax
 4fc:	ff 75 10             	pushl  0x10(%ebp)
 4ff:	53                   	push   %ebx
 500:	89 f1                	mov    %esi,%ecx
 502:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 507:	b8 74 01 00 00       	mov    $0x174,%eax
 50c:	e8 79 fd ff ff       	call   28a <s_printf>
  if(count < n) {
 511:	83 c4 10             	add    $0x10,%esp
 514:	39 c3                	cmp    %eax,%ebx
 516:	76 04                	jbe    51c <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 518:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 51c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51f:	5b                   	pop    %ebx
 520:	5e                   	pop    %esi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    

00000523 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 523:	f3 0f 1e fb          	endbr32 
 527:	55                   	push   %ebp
 528:	89 e5                	mov    %esp,%ebp
 52a:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 52d:	8d 45 10             	lea    0x10(%ebp),%eax
 530:	50                   	push   %eax
 531:	ff 75 0c             	pushl  0xc(%ebp)
 534:	68 00 00 00 40       	push   $0x40000000
 539:	b9 00 00 00 00       	mov    $0x0,%ecx
 53e:	8b 55 08             	mov    0x8(%ebp),%edx
 541:	b8 c3 04 00 00       	mov    $0x4c3,%eax
 546:	e8 3f fd ff ff       	call   28a <s_printf>
}
 54b:	83 c4 10             	add    $0x10,%esp
 54e:	c9                   	leave  
 54f:	c3                   	ret    
