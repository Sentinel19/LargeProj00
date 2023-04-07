
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	57                   	push   %edi
   8:	56                   	push   %esi
   9:	53                   	push   %ebx
   a:	83 ec 0c             	sub    $0xc,%esp
   d:	8b 75 08             	mov    0x8(%ebp),%esi
  10:	8b 7d 0c             	mov    0xc(%ebp),%edi
  13:	8b 5d 10             	mov    0x10(%ebp),%ebx
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  16:	83 ec 08             	sub    $0x8,%esp
  19:	53                   	push   %ebx
  1a:	57                   	push   %edi
  1b:	e8 2c 00 00 00       	call   4c <matchhere>
  20:	83 c4 10             	add    $0x10,%esp
  23:	85 c0                	test   %eax,%eax
  25:	75 18                	jne    3f <matchstar+0x3f>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  27:	0f b6 13             	movzbl (%ebx),%edx
  2a:	84 d2                	test   %dl,%dl
  2c:	74 16                	je     44 <matchstar+0x44>
  2e:	83 c3 01             	add    $0x1,%ebx
  31:	0f be d2             	movsbl %dl,%edx
  34:	39 f2                	cmp    %esi,%edx
  36:	74 de                	je     16 <matchstar+0x16>
  38:	83 fe 2e             	cmp    $0x2e,%esi
  3b:	74 d9                	je     16 <matchstar+0x16>
  3d:	eb 05                	jmp    44 <matchstar+0x44>
      return 1;
  3f:	b8 01 00 00 00       	mov    $0x1,%eax
  return 0;
}
  44:	8d 65 f4             	lea    -0xc(%ebp),%esp
  47:	5b                   	pop    %ebx
  48:	5e                   	pop    %esi
  49:	5f                   	pop    %edi
  4a:	5d                   	pop    %ebp
  4b:	c3                   	ret    

0000004c <matchhere>:
{
  4c:	f3 0f 1e fb          	endbr32 
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	83 ec 08             	sub    $0x8,%esp
  56:	8b 55 08             	mov    0x8(%ebp),%edx
  if(re[0] == '\0')
  59:	0f b6 02             	movzbl (%edx),%eax
  5c:	84 c0                	test   %al,%al
  5e:	74 68                	je     c8 <matchhere+0x7c>
  if(re[1] == '*')
  60:	0f b6 4a 01          	movzbl 0x1(%edx),%ecx
  64:	80 f9 2a             	cmp    $0x2a,%cl
  67:	74 1d                	je     86 <matchhere+0x3a>
  if(re[0] == '$' && re[1] == '\0')
  69:	3c 24                	cmp    $0x24,%al
  6b:	74 31                	je     9e <matchhere+0x52>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  6d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  70:	0f b6 09             	movzbl (%ecx),%ecx
  73:	84 c9                	test   %cl,%cl
  75:	74 58                	je     cf <matchhere+0x83>
  77:	3c 2e                	cmp    $0x2e,%al
  79:	74 35                	je     b0 <matchhere+0x64>
  7b:	38 c8                	cmp    %cl,%al
  7d:	74 31                	je     b0 <matchhere+0x64>
  return 0;
  7f:	b8 00 00 00 00       	mov    $0x0,%eax
  84:	eb 47                	jmp    cd <matchhere+0x81>
    return matchstar(re[0], re+2, text);
  86:	83 ec 04             	sub    $0x4,%esp
  89:	ff 75 0c             	pushl  0xc(%ebp)
  8c:	83 c2 02             	add    $0x2,%edx
  8f:	52                   	push   %edx
  90:	0f be c0             	movsbl %al,%eax
  93:	50                   	push   %eax
  94:	e8 67 ff ff ff       	call   0 <matchstar>
  99:	83 c4 10             	add    $0x10,%esp
  9c:	eb 2f                	jmp    cd <matchhere+0x81>
  if(re[0] == '$' && re[1] == '\0')
  9e:	84 c9                	test   %cl,%cl
  a0:	75 cb                	jne    6d <matchhere+0x21>
    return *text == '\0';
  a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  a5:	80 38 00             	cmpb   $0x0,(%eax)
  a8:	0f 94 c0             	sete   %al
  ab:	0f b6 c0             	movzbl %al,%eax
  ae:	eb 1d                	jmp    cd <matchhere+0x81>
    return matchhere(re+1, text+1);
  b0:	83 ec 08             	sub    $0x8,%esp
  b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  b6:	83 c0 01             	add    $0x1,%eax
  b9:	50                   	push   %eax
  ba:	83 c2 01             	add    $0x1,%edx
  bd:	52                   	push   %edx
  be:	e8 89 ff ff ff       	call   4c <matchhere>
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	eb 05                	jmp    cd <matchhere+0x81>
    return 1;
  c8:	b8 01 00 00 00       	mov    $0x1,%eax
}
  cd:	c9                   	leave  
  ce:	c3                   	ret    
  return 0;
  cf:	b8 00 00 00 00       	mov    $0x0,%eax
  d4:	eb f7                	jmp    cd <matchhere+0x81>

000000d6 <match>:
{
  d6:	f3 0f 1e fb          	endbr32 
  da:	55                   	push   %ebp
  db:	89 e5                	mov    %esp,%ebp
  dd:	56                   	push   %esi
  de:	53                   	push   %ebx
  df:	8b 75 08             	mov    0x8(%ebp),%esi
  e2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
  e5:	80 3e 5e             	cmpb   $0x5e,(%esi)
  e8:	75 14                	jne    fe <match+0x28>
    return matchhere(re+1, text);
  ea:	83 ec 08             	sub    $0x8,%esp
  ed:	53                   	push   %ebx
  ee:	83 c6 01             	add    $0x1,%esi
  f1:	56                   	push   %esi
  f2:	e8 55 ff ff ff       	call   4c <matchhere>
  f7:	83 c4 10             	add    $0x10,%esp
  fa:	eb 22                	jmp    11e <match+0x48>
  }while(*text++ != '\0');
  fc:	89 d3                	mov    %edx,%ebx
    if(matchhere(re, text))
  fe:	83 ec 08             	sub    $0x8,%esp
 101:	53                   	push   %ebx
 102:	56                   	push   %esi
 103:	e8 44 ff ff ff       	call   4c <matchhere>
 108:	83 c4 10             	add    $0x10,%esp
 10b:	85 c0                	test   %eax,%eax
 10d:	75 0a                	jne    119 <match+0x43>
  }while(*text++ != '\0');
 10f:	8d 53 01             	lea    0x1(%ebx),%edx
 112:	80 3b 00             	cmpb   $0x0,(%ebx)
 115:	75 e5                	jne    fc <match+0x26>
 117:	eb 05                	jmp    11e <match+0x48>
      return 1;
 119:	b8 01 00 00 00       	mov    $0x1,%eax
}
 11e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 121:	5b                   	pop    %ebx
 122:	5e                   	pop    %esi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <grep>:
{
 125:	f3 0f 1e fb          	endbr32 
 129:	55                   	push   %ebp
 12a:	89 e5                	mov    %esp,%ebp
 12c:	57                   	push   %edi
 12d:	56                   	push   %esi
 12e:	53                   	push   %ebx
 12f:	83 ec 1c             	sub    $0x1c,%esp
 132:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 135:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 13c:	eb 53                	jmp    191 <grep+0x6c>
        *q = '\n';
 13e:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 141:	8d 43 01             	lea    0x1(%ebx),%eax
 144:	83 ec 04             	sub    $0x4,%esp
 147:	29 f0                	sub    %esi,%eax
 149:	50                   	push   %eax
 14a:	56                   	push   %esi
 14b:	6a 01                	push   $0x1
 14d:	e8 3c 03 00 00       	call   48e <write>
 152:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 155:	8d 73 01             	lea    0x1(%ebx),%esi
    while((q = strchr(p, '\n')) != 0){
 158:	83 ec 08             	sub    $0x8,%esp
 15b:	6a 0a                	push   $0xa
 15d:	56                   	push   %esi
 15e:	e8 d9 01 00 00       	call   33c <strchr>
 163:	89 c3                	mov    %eax,%ebx
 165:	83 c4 10             	add    $0x10,%esp
 168:	85 c0                	test   %eax,%eax
 16a:	74 16                	je     182 <grep+0x5d>
      *q = 0;
 16c:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 16f:	83 ec 08             	sub    $0x8,%esp
 172:	56                   	push   %esi
 173:	57                   	push   %edi
 174:	e8 5d ff ff ff       	call   d6 <match>
 179:	83 c4 10             	add    $0x10,%esp
 17c:	85 c0                	test   %eax,%eax
 17e:	74 d5                	je     155 <grep+0x30>
 180:	eb bc                	jmp    13e <grep+0x19>
    if(p == buf)
 182:	81 fe 60 09 00 00    	cmp    $0x960,%esi
 188:	74 5f                	je     1e9 <grep+0xc4>
    if(m > 0){
 18a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 18d:	85 c9                	test   %ecx,%ecx
 18f:	7f 38                	jg     1c9 <grep+0xa4>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 191:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 196:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 199:	29 c8                	sub    %ecx,%eax
 19b:	83 ec 04             	sub    $0x4,%esp
 19e:	50                   	push   %eax
 19f:	8d 81 60 09 00 00    	lea    0x960(%ecx),%eax
 1a5:	50                   	push   %eax
 1a6:	ff 75 0c             	pushl  0xc(%ebp)
 1a9:	e8 d8 02 00 00       	call   486 <read>
 1ae:	83 c4 10             	add    $0x10,%esp
 1b1:	85 c0                	test   %eax,%eax
 1b3:	7e 3d                	jle    1f2 <grep+0xcd>
    m += n;
 1b5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1bb:	c6 82 60 09 00 00 00 	movb   $0x0,0x960(%edx)
    p = buf;
 1c2:	be 60 09 00 00       	mov    $0x960,%esi
    while((q = strchr(p, '\n')) != 0){
 1c7:	eb 8f                	jmp    158 <grep+0x33>
      m -= p - buf;
 1c9:	89 f0                	mov    %esi,%eax
 1cb:	2d 60 09 00 00       	sub    $0x960,%eax
 1d0:	29 c1                	sub    %eax,%ecx
 1d2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 1d5:	83 ec 04             	sub    $0x4,%esp
 1d8:	51                   	push   %ecx
 1d9:	56                   	push   %esi
 1da:	68 60 09 00 00       	push   $0x960
 1df:	e8 52 02 00 00       	call   436 <memmove>
 1e4:	83 c4 10             	add    $0x10,%esp
 1e7:	eb a8                	jmp    191 <grep+0x6c>
      m = 0;
 1e9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1f0:	eb 9f                	jmp    191 <grep+0x6c>
}
 1f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f5:	5b                   	pop    %ebx
 1f6:	5e                   	pop    %esi
 1f7:	5f                   	pop    %edi
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    

000001fa <main>:
{
 1fa:	f3 0f 1e fb          	endbr32 
 1fe:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 202:	83 e4 f0             	and    $0xfffffff0,%esp
 205:	ff 71 fc             	pushl  -0x4(%ecx)
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	57                   	push   %edi
 20c:	56                   	push   %esi
 20d:	53                   	push   %ebx
 20e:	51                   	push   %ecx
 20f:	83 ec 18             	sub    $0x18,%esp
 212:	8b 01                	mov    (%ecx),%eax
 214:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 217:	8b 51 04             	mov    0x4(%ecx),%edx
 21a:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(argc <= 1){
 21d:	83 f8 01             	cmp    $0x1,%eax
 220:	7e 50                	jle    272 <main+0x78>
  pattern = argv[1];
 222:	8b 45 e0             	mov    -0x20(%ebp),%eax
 225:	8b 40 04             	mov    0x4(%eax),%eax
 228:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(argc <= 2){
 22b:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
 22f:	7e 55                	jle    286 <main+0x8c>
  for(i = 2; i < argc; i++){
 231:	be 02 00 00 00       	mov    $0x2,%esi
 236:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 239:	7d 71                	jge    2ac <main+0xb2>
    if((fd = open(argv[i], 0)) < 0){
 23b:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23e:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 241:	83 ec 08             	sub    $0x8,%esp
 244:	6a 00                	push   $0x0
 246:	ff 37                	pushl  (%edi)
 248:	e8 61 02 00 00       	call   4ae <open>
 24d:	89 c3                	mov    %eax,%ebx
 24f:	83 c4 10             	add    $0x10,%esp
 252:	85 c0                	test   %eax,%eax
 254:	78 40                	js     296 <main+0x9c>
    grep(pattern, fd);
 256:	83 ec 08             	sub    $0x8,%esp
 259:	50                   	push   %eax
 25a:	ff 75 dc             	pushl  -0x24(%ebp)
 25d:	e8 c3 fe ff ff       	call   125 <grep>
    close(fd);
 262:	89 1c 24             	mov    %ebx,(%esp)
 265:	e8 2c 02 00 00       	call   496 <close>
  for(i = 2; i < argc; i++){
 26a:	83 c6 01             	add    $0x1,%esi
 26d:	83 c4 10             	add    $0x10,%esp
 270:	eb c4                	jmp    236 <main+0x3c>
    printf(2, "usage: grep pattern [file ...]\n");
 272:	83 ec 08             	sub    $0x8,%esp
 275:	68 0c 09 00 00       	push   $0x90c
 27a:	6a 02                	push   $0x2
 27c:	e8 5c 06 00 00       	call   8dd <printf>
    exit();
 281:	e8 e8 01 00 00       	call   46e <exit>
    grep(pattern, 0);
 286:	83 ec 08             	sub    $0x8,%esp
 289:	6a 00                	push   $0x0
 28b:	50                   	push   %eax
 28c:	e8 94 fe ff ff       	call   125 <grep>
    exit();
 291:	e8 d8 01 00 00       	call   46e <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 296:	83 ec 04             	sub    $0x4,%esp
 299:	ff 37                	pushl  (%edi)
 29b:	68 2c 09 00 00       	push   $0x92c
 2a0:	6a 01                	push   $0x1
 2a2:	e8 36 06 00 00       	call   8dd <printf>
      exit();
 2a7:	e8 c2 01 00 00       	call   46e <exit>
  exit();
 2ac:	e8 bd 01 00 00       	call   46e <exit>

000002b1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2b1:	f3 0f 1e fb          	endbr32 
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
 2b8:	56                   	push   %esi
 2b9:	53                   	push   %ebx
 2ba:	8b 75 08             	mov    0x8(%ebp),%esi
 2bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2c0:	89 f0                	mov    %esi,%eax
 2c2:	89 d1                	mov    %edx,%ecx
 2c4:	83 c2 01             	add    $0x1,%edx
 2c7:	89 c3                	mov    %eax,%ebx
 2c9:	83 c0 01             	add    $0x1,%eax
 2cc:	0f b6 09             	movzbl (%ecx),%ecx
 2cf:	88 0b                	mov    %cl,(%ebx)
 2d1:	84 c9                	test   %cl,%cl
 2d3:	75 ed                	jne    2c2 <strcpy+0x11>
    ;
  return os;
}
 2d5:	89 f0                	mov    %esi,%eax
 2d7:	5b                   	pop    %ebx
 2d8:	5e                   	pop    %esi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2db:	f3 0f 1e fb          	endbr32 
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
 2e2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2e8:	0f b6 01             	movzbl (%ecx),%eax
 2eb:	84 c0                	test   %al,%al
 2ed:	74 0c                	je     2fb <strcmp+0x20>
 2ef:	3a 02                	cmp    (%edx),%al
 2f1:	75 08                	jne    2fb <strcmp+0x20>
    p++, q++;
 2f3:	83 c1 01             	add    $0x1,%ecx
 2f6:	83 c2 01             	add    $0x1,%edx
 2f9:	eb ed                	jmp    2e8 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 2fb:	0f b6 c0             	movzbl %al,%eax
 2fe:	0f b6 12             	movzbl (%edx),%edx
 301:	29 d0                	sub    %edx,%eax
}
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    

00000305 <strlen>:

uint
strlen(const char *s)
{
 305:	f3 0f 1e fb          	endbr32 
 309:	55                   	push   %ebp
 30a:	89 e5                	mov    %esp,%ebp
 30c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 30f:	b8 00 00 00 00       	mov    $0x0,%eax
 314:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 318:	74 05                	je     31f <strlen+0x1a>
 31a:	83 c0 01             	add    $0x1,%eax
 31d:	eb f5                	jmp    314 <strlen+0xf>
    ;
  return n;
}
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    

00000321 <memset>:

void*
memset(void *dst, int c, uint n)
{
 321:	f3 0f 1e fb          	endbr32 
 325:	55                   	push   %ebp
 326:	89 e5                	mov    %esp,%ebp
 328:	57                   	push   %edi
 329:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 32c:	89 d7                	mov    %edx,%edi
 32e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 331:	8b 45 0c             	mov    0xc(%ebp),%eax
 334:	fc                   	cld    
 335:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 337:	89 d0                	mov    %edx,%eax
 339:	5f                   	pop    %edi
 33a:	5d                   	pop    %ebp
 33b:	c3                   	ret    

0000033c <strchr>:

char*
strchr(const char *s, char c)
{
 33c:	f3 0f 1e fb          	endbr32 
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 34a:	0f b6 10             	movzbl (%eax),%edx
 34d:	84 d2                	test   %dl,%dl
 34f:	74 09                	je     35a <strchr+0x1e>
    if(*s == c)
 351:	38 ca                	cmp    %cl,%dl
 353:	74 0a                	je     35f <strchr+0x23>
  for(; *s; s++)
 355:	83 c0 01             	add    $0x1,%eax
 358:	eb f0                	jmp    34a <strchr+0xe>
      return (char*)s;
  return 0;
 35a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    

00000361 <gets>:

char*
gets(char *buf, int max)
{
 361:	f3 0f 1e fb          	endbr32 
 365:	55                   	push   %ebp
 366:	89 e5                	mov    %esp,%ebp
 368:	57                   	push   %edi
 369:	56                   	push   %esi
 36a:	53                   	push   %ebx
 36b:	83 ec 1c             	sub    $0x1c,%esp
 36e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 371:	bb 00 00 00 00       	mov    $0x0,%ebx
 376:	89 de                	mov    %ebx,%esi
 378:	83 c3 01             	add    $0x1,%ebx
 37b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 37e:	7d 2e                	jge    3ae <gets+0x4d>
    cc = read(0, &c, 1);
 380:	83 ec 04             	sub    $0x4,%esp
 383:	6a 01                	push   $0x1
 385:	8d 45 e7             	lea    -0x19(%ebp),%eax
 388:	50                   	push   %eax
 389:	6a 00                	push   $0x0
 38b:	e8 f6 00 00 00       	call   486 <read>
    if(cc < 1)
 390:	83 c4 10             	add    $0x10,%esp
 393:	85 c0                	test   %eax,%eax
 395:	7e 17                	jle    3ae <gets+0x4d>
      break;
    buf[i++] = c;
 397:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 39b:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 39e:	3c 0a                	cmp    $0xa,%al
 3a0:	0f 94 c2             	sete   %dl
 3a3:	3c 0d                	cmp    $0xd,%al
 3a5:	0f 94 c0             	sete   %al
 3a8:	08 c2                	or     %al,%dl
 3aa:	74 ca                	je     376 <gets+0x15>
    buf[i++] = c;
 3ac:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3ae:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3b2:	89 f8                	mov    %edi,%eax
 3b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3b7:	5b                   	pop    %ebx
 3b8:	5e                   	pop    %esi
 3b9:	5f                   	pop    %edi
 3ba:	5d                   	pop    %ebp
 3bb:	c3                   	ret    

000003bc <stat>:

int
stat(const char *n, struct stat *st)
{
 3bc:	f3 0f 1e fb          	endbr32 
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c5:	83 ec 08             	sub    $0x8,%esp
 3c8:	6a 00                	push   $0x0
 3ca:	ff 75 08             	pushl  0x8(%ebp)
 3cd:	e8 dc 00 00 00       	call   4ae <open>
  if(fd < 0)
 3d2:	83 c4 10             	add    $0x10,%esp
 3d5:	85 c0                	test   %eax,%eax
 3d7:	78 24                	js     3fd <stat+0x41>
 3d9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3db:	83 ec 08             	sub    $0x8,%esp
 3de:	ff 75 0c             	pushl  0xc(%ebp)
 3e1:	50                   	push   %eax
 3e2:	e8 df 00 00 00       	call   4c6 <fstat>
 3e7:	89 c6                	mov    %eax,%esi
  close(fd);
 3e9:	89 1c 24             	mov    %ebx,(%esp)
 3ec:	e8 a5 00 00 00       	call   496 <close>
  return r;
 3f1:	83 c4 10             	add    $0x10,%esp
}
 3f4:	89 f0                	mov    %esi,%eax
 3f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3f9:	5b                   	pop    %ebx
 3fa:	5e                   	pop    %esi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
    return -1;
 3fd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 402:	eb f0                	jmp    3f4 <stat+0x38>

00000404 <atoi>:

int
atoi(const char *s)
{
 404:	f3 0f 1e fb          	endbr32 
 408:	55                   	push   %ebp
 409:	89 e5                	mov    %esp,%ebp
 40b:	53                   	push   %ebx
 40c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 40f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 414:	0f b6 01             	movzbl (%ecx),%eax
 417:	8d 58 d0             	lea    -0x30(%eax),%ebx
 41a:	80 fb 09             	cmp    $0x9,%bl
 41d:	77 12                	ja     431 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 41f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 422:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 425:	83 c1 01             	add    $0x1,%ecx
 428:	0f be c0             	movsbl %al,%eax
 42b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 42f:	eb e3                	jmp    414 <atoi+0x10>
  return n;
}
 431:	89 d0                	mov    %edx,%eax
 433:	5b                   	pop    %ebx
 434:	5d                   	pop    %ebp
 435:	c3                   	ret    

00000436 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 436:	f3 0f 1e fb          	endbr32 
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	8b 75 08             	mov    0x8(%ebp),%esi
 442:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 445:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 448:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 44a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 44d:	85 c0                	test   %eax,%eax
 44f:	7e 0f                	jle    460 <memmove+0x2a>
    *dst++ = *src++;
 451:	0f b6 01             	movzbl (%ecx),%eax
 454:	88 02                	mov    %al,(%edx)
 456:	8d 49 01             	lea    0x1(%ecx),%ecx
 459:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 45c:	89 d8                	mov    %ebx,%eax
 45e:	eb ea                	jmp    44a <memmove+0x14>
  return vdst;
}
 460:	89 f0                	mov    %esi,%eax
 462:	5b                   	pop    %ebx
 463:	5e                   	pop    %esi
 464:	5d                   	pop    %ebp
 465:	c3                   	ret    

00000466 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 466:	b8 01 00 00 00       	mov    $0x1,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <exit>:
SYSCALL(exit)
 46e:	b8 02 00 00 00       	mov    $0x2,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <wait>:
SYSCALL(wait)
 476:	b8 03 00 00 00       	mov    $0x3,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <pipe>:
SYSCALL(pipe)
 47e:	b8 04 00 00 00       	mov    $0x4,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <read>:
SYSCALL(read)
 486:	b8 05 00 00 00       	mov    $0x5,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <write>:
SYSCALL(write)
 48e:	b8 10 00 00 00       	mov    $0x10,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <close>:
SYSCALL(close)
 496:	b8 15 00 00 00       	mov    $0x15,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <kill>:
SYSCALL(kill)
 49e:	b8 06 00 00 00       	mov    $0x6,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <exec>:
SYSCALL(exec)
 4a6:	b8 07 00 00 00       	mov    $0x7,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <open>:
SYSCALL(open)
 4ae:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <mknod>:
SYSCALL(mknod)
 4b6:	b8 11 00 00 00       	mov    $0x11,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <unlink>:
SYSCALL(unlink)
 4be:	b8 12 00 00 00       	mov    $0x12,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <fstat>:
SYSCALL(fstat)
 4c6:	b8 08 00 00 00       	mov    $0x8,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <link>:
SYSCALL(link)
 4ce:	b8 13 00 00 00       	mov    $0x13,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <mkdir>:
SYSCALL(mkdir)
 4d6:	b8 14 00 00 00       	mov    $0x14,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <chdir>:
SYSCALL(chdir)
 4de:	b8 09 00 00 00       	mov    $0x9,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <dup>:
SYSCALL(dup)
 4e6:	b8 0a 00 00 00       	mov    $0xa,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <getpid>:
SYSCALL(getpid)
 4ee:	b8 0b 00 00 00       	mov    $0xb,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <sbrk>:
SYSCALL(sbrk)
 4f6:	b8 0c 00 00 00       	mov    $0xc,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <sleep>:
SYSCALL(sleep)
 4fe:	b8 0d 00 00 00       	mov    $0xd,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <uptime>:
SYSCALL(uptime)
 506:	b8 0e 00 00 00       	mov    $0xe,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <yield>:
SYSCALL(yield)
 50e:	b8 16 00 00 00       	mov    $0x16,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <shutdown>:
SYSCALL(shutdown)
 516:	b8 17 00 00 00       	mov    $0x17,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <ps>:
SYSCALL(ps)
 51e:	b8 18 00 00 00       	mov    $0x18,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <nice>:
 526:	b8 1b 00 00 00       	mov    $0x1b,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 52e:	f3 0f 1e fb          	endbr32 
 532:	55                   	push   %ebp
 533:	89 e5                	mov    %esp,%ebp
 535:	8b 45 14             	mov    0x14(%ebp),%eax
 538:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 53b:	3b 45 10             	cmp    0x10(%ebp),%eax
 53e:	73 06                	jae    546 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 540:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 543:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    

00000548 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 548:	55                   	push   %ebp
 549:	89 e5                	mov    %esp,%ebp
 54b:	57                   	push   %edi
 54c:	56                   	push   %esi
 54d:	53                   	push   %ebx
 54e:	83 ec 08             	sub    $0x8,%esp
 551:	89 c6                	mov    %eax,%esi
 553:	89 d3                	mov    %edx,%ebx
 555:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 558:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 55c:	0f 95 c2             	setne  %dl
 55f:	89 c8                	mov    %ecx,%eax
 561:	c1 e8 1f             	shr    $0x1f,%eax
 564:	84 c2                	test   %al,%dl
 566:	74 33                	je     59b <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 568:	89 c8                	mov    %ecx,%eax
 56a:	f7 d8                	neg    %eax
    neg = 1;
 56c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 573:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 578:	8d 4f 01             	lea    0x1(%edi),%ecx
 57b:	89 ca                	mov    %ecx,%edx
 57d:	39 d9                	cmp    %ebx,%ecx
 57f:	73 26                	jae    5a7 <s_getReverseDigits+0x5f>
 581:	85 c0                	test   %eax,%eax
 583:	74 22                	je     5a7 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 585:	ba 00 00 00 00       	mov    $0x0,%edx
 58a:	f7 75 08             	divl   0x8(%ebp)
 58d:	0f b6 92 4c 09 00 00 	movzbl 0x94c(%edx),%edx
 594:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 597:	89 cf                	mov    %ecx,%edi
 599:	eb dd                	jmp    578 <s_getReverseDigits+0x30>
    x = xx;
 59b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 59e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5a5:	eb cc                	jmp    573 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 5a7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5ab:	75 0a                	jne    5b7 <s_getReverseDigits+0x6f>
 5ad:	39 da                	cmp    %ebx,%edx
 5af:	73 06                	jae    5b7 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 5b1:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 5b5:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 5b7:	89 fa                	mov    %edi,%edx
 5b9:	39 df                	cmp    %ebx,%edi
 5bb:	0f 92 c0             	setb   %al
 5be:	84 45 ec             	test   %al,-0x14(%ebp)
 5c1:	74 07                	je     5ca <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 5c3:	83 c7 01             	add    $0x1,%edi
 5c6:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 5ca:	89 f8                	mov    %edi,%eax
 5cc:	83 c4 08             	add    $0x8,%esp
 5cf:	5b                   	pop    %ebx
 5d0:	5e                   	pop    %esi
 5d1:	5f                   	pop    %edi
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    

000005d4 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 5d4:	39 c2                	cmp    %eax,%edx
 5d6:	0f 46 c2             	cmovbe %edx,%eax
}
 5d9:	c3                   	ret    

000005da <s_printint>:
{
 5da:	55                   	push   %ebp
 5db:	89 e5                	mov    %esp,%ebp
 5dd:	57                   	push   %edi
 5de:	56                   	push   %esi
 5df:	53                   	push   %ebx
 5e0:	83 ec 2c             	sub    $0x2c,%esp
 5e3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5e6:	89 55 d0             	mov    %edx,-0x30(%ebp)
 5e9:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 5ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 5ef:	ff 75 14             	pushl  0x14(%ebp)
 5f2:	ff 75 10             	pushl  0x10(%ebp)
 5f5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5f8:	ba 10 00 00 00       	mov    $0x10,%edx
 5fd:	8d 45 d8             	lea    -0x28(%ebp),%eax
 600:	e8 43 ff ff ff       	call   548 <s_getReverseDigits>
 605:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 608:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 60a:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 60d:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 612:	83 eb 01             	sub    $0x1,%ebx
 615:	78 22                	js     639 <s_printint+0x5f>
 617:	39 fe                	cmp    %edi,%esi
 619:	73 1e                	jae    639 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 61b:	83 ec 0c             	sub    $0xc,%esp
 61e:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 623:	50                   	push   %eax
 624:	56                   	push   %esi
 625:	57                   	push   %edi
 626:	ff 75 cc             	pushl  -0x34(%ebp)
 629:	ff 75 d0             	pushl  -0x30(%ebp)
 62c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 62f:	ff d0                	call   *%eax
    j++;
 631:	83 c6 01             	add    $0x1,%esi
 634:	83 c4 20             	add    $0x20,%esp
 637:	eb d9                	jmp    612 <s_printint+0x38>
}
 639:	8b 45 c8             	mov    -0x38(%ebp),%eax
 63c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63f:	5b                   	pop    %ebx
 640:	5e                   	pop    %esi
 641:	5f                   	pop    %edi
 642:	5d                   	pop    %ebp
 643:	c3                   	ret    

00000644 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	57                   	push   %edi
 648:	56                   	push   %esi
 649:	53                   	push   %ebx
 64a:	83 ec 2c             	sub    $0x2c,%esp
 64d:	89 45 d8             	mov    %eax,-0x28(%ebp)
 650:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 653:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 656:	8b 45 08             	mov    0x8(%ebp),%eax
 659:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 65c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 663:	bb 00 00 00 00       	mov    $0x0,%ebx
 668:	89 f8                	mov    %edi,%eax
 66a:	89 df                	mov    %ebx,%edi
 66c:	89 c6                	mov    %eax,%esi
 66e:	eb 20                	jmp    690 <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 670:	8d 43 01             	lea    0x1(%ebx),%eax
 673:	89 45 e0             	mov    %eax,-0x20(%ebp)
 676:	83 ec 0c             	sub    $0xc,%esp
 679:	51                   	push   %ecx
 67a:	53                   	push   %ebx
 67b:	56                   	push   %esi
 67c:	ff 75 d0             	pushl  -0x30(%ebp)
 67f:	ff 75 d4             	pushl  -0x2c(%ebp)
 682:	8b 55 d8             	mov    -0x28(%ebp),%edx
 685:	ff d2                	call   *%edx
 687:	83 c4 20             	add    $0x20,%esp
 68a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 68d:	83 c7 01             	add    $0x1,%edi
 690:	8b 45 0c             	mov    0xc(%ebp),%eax
 693:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 697:	84 c0                	test   %al,%al
 699:	0f 84 cd 01 00 00    	je     86c <s_printf+0x228>
 69f:	89 75 e0             	mov    %esi,-0x20(%ebp)
 6a2:	39 de                	cmp    %ebx,%esi
 6a4:	0f 86 c2 01 00 00    	jbe    86c <s_printf+0x228>
    c = fmt[i] & 0xff;
 6aa:	0f be c8             	movsbl %al,%ecx
 6ad:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 6b0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6b3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 6b7:	75 0a                	jne    6c3 <s_printf+0x7f>
      if(c == '%') {
 6b9:	83 f8 25             	cmp    $0x25,%eax
 6bc:	75 b2                	jne    670 <s_printf+0x2c>
        state = '%';
 6be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6c1:	eb ca                	jmp    68d <s_printf+0x49>
      }
    } else if(state == '%'){
 6c3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6c7:	75 c4                	jne    68d <s_printf+0x49>
      if(c == 'd'){
 6c9:	83 f8 64             	cmp    $0x64,%eax
 6cc:	74 6e                	je     73c <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6ce:	83 f8 78             	cmp    $0x78,%eax
 6d1:	0f 94 c1             	sete   %cl
 6d4:	83 f8 70             	cmp    $0x70,%eax
 6d7:	0f 94 c2             	sete   %dl
 6da:	08 d1                	or     %dl,%cl
 6dc:	0f 85 8e 00 00 00    	jne    770 <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6e2:	83 f8 73             	cmp    $0x73,%eax
 6e5:	0f 84 b9 00 00 00    	je     7a4 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 6eb:	83 f8 63             	cmp    $0x63,%eax
 6ee:	0f 84 1a 01 00 00    	je     80e <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 6f4:	83 f8 25             	cmp    $0x25,%eax
 6f7:	0f 84 44 01 00 00    	je     841 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 6fd:	8d 43 01             	lea    0x1(%ebx),%eax
 700:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 703:	83 ec 0c             	sub    $0xc,%esp
 706:	6a 25                	push   $0x25
 708:	53                   	push   %ebx
 709:	56                   	push   %esi
 70a:	ff 75 d0             	pushl  -0x30(%ebp)
 70d:	ff 75 d4             	pushl  -0x2c(%ebp)
 710:	8b 45 d8             	mov    -0x28(%ebp),%eax
 713:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 715:	83 c3 02             	add    $0x2,%ebx
 718:	83 c4 14             	add    $0x14,%esp
 71b:	ff 75 dc             	pushl  -0x24(%ebp)
 71e:	ff 75 e4             	pushl  -0x1c(%ebp)
 721:	56                   	push   %esi
 722:	ff 75 d0             	pushl  -0x30(%ebp)
 725:	ff 75 d4             	pushl  -0x2c(%ebp)
 728:	8b 45 d8             	mov    -0x28(%ebp),%eax
 72b:	ff d0                	call   *%eax
 72d:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 730:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 737:	e9 51 ff ff ff       	jmp    68d <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 73c:	8b 45 d0             	mov    -0x30(%ebp),%eax
 73f:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 742:	6a 01                	push   $0x1
 744:	6a 0a                	push   $0xa
 746:	8b 45 10             	mov    0x10(%ebp),%eax
 749:	ff 30                	pushl  (%eax)
 74b:	89 f0                	mov    %esi,%eax
 74d:	29 d8                	sub    %ebx,%eax
 74f:	50                   	push   %eax
 750:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 753:	8b 45 d8             	mov    -0x28(%ebp),%eax
 756:	e8 7f fe ff ff       	call   5da <s_printint>
 75b:	01 c3                	add    %eax,%ebx
        ap++;
 75d:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 761:	83 c4 10             	add    $0x10,%esp
      state = 0;
 764:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 76b:	e9 1d ff ff ff       	jmp    68d <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 770:	8b 45 d0             	mov    -0x30(%ebp),%eax
 773:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 776:	6a 00                	push   $0x0
 778:	6a 10                	push   $0x10
 77a:	8b 45 10             	mov    0x10(%ebp),%eax
 77d:	ff 30                	pushl  (%eax)
 77f:	89 f0                	mov    %esi,%eax
 781:	29 d8                	sub    %ebx,%eax
 783:	50                   	push   %eax
 784:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 787:	8b 45 d8             	mov    -0x28(%ebp),%eax
 78a:	e8 4b fe ff ff       	call   5da <s_printint>
 78f:	01 c3                	add    %eax,%ebx
        ap++;
 791:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 795:	83 c4 10             	add    $0x10,%esp
      state = 0;
 798:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 79f:	e9 e9 fe ff ff       	jmp    68d <s_printf+0x49>
        s = (char*)*ap;
 7a4:	8b 45 10             	mov    0x10(%ebp),%eax
 7a7:	8b 00                	mov    (%eax),%eax
        ap++;
 7a9:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 7ad:	85 c0                	test   %eax,%eax
 7af:	75 4e                	jne    7ff <s_printf+0x1bb>
          s = "(null)";
 7b1:	b8 42 09 00 00       	mov    $0x942,%eax
 7b6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7b9:	89 da                	mov    %ebx,%edx
 7bb:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 7be:	89 75 e0             	mov    %esi,-0x20(%ebp)
 7c1:	89 c6                	mov    %eax,%esi
 7c3:	eb 1f                	jmp    7e4 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 7c5:	8d 7a 01             	lea    0x1(%edx),%edi
 7c8:	83 ec 0c             	sub    $0xc,%esp
 7cb:	0f be c0             	movsbl %al,%eax
 7ce:	50                   	push   %eax
 7cf:	52                   	push   %edx
 7d0:	53                   	push   %ebx
 7d1:	ff 75 d0             	pushl  -0x30(%ebp)
 7d4:	ff 75 d4             	pushl  -0x2c(%ebp)
 7d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
 7da:	ff d0                	call   *%eax
          s++;
 7dc:	83 c6 01             	add    $0x1,%esi
 7df:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 7e2:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 7e4:	0f b6 06             	movzbl (%esi),%eax
 7e7:	84 c0                	test   %al,%al
 7e9:	75 da                	jne    7c5 <s_printf+0x181>
 7eb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ee:	89 d3                	mov    %edx,%ebx
 7f0:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 7f3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 7fa:	e9 8e fe ff ff       	jmp    68d <s_printf+0x49>
 7ff:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 802:	89 da                	mov    %ebx,%edx
 804:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 807:	89 75 e0             	mov    %esi,-0x20(%ebp)
 80a:	89 c6                	mov    %eax,%esi
 80c:	eb d6                	jmp    7e4 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 80e:	8d 43 01             	lea    0x1(%ebx),%eax
 811:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 814:	83 ec 0c             	sub    $0xc,%esp
 817:	8b 55 10             	mov    0x10(%ebp),%edx
 81a:	0f be 02             	movsbl (%edx),%eax
 81d:	50                   	push   %eax
 81e:	53                   	push   %ebx
 81f:	56                   	push   %esi
 820:	ff 75 d0             	pushl  -0x30(%ebp)
 823:	ff 75 d4             	pushl  -0x2c(%ebp)
 826:	8b 55 d8             	mov    -0x28(%ebp),%edx
 829:	ff d2                	call   *%edx
        ap++;
 82b:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 82f:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 832:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 835:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 83c:	e9 4c fe ff ff       	jmp    68d <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 841:	8d 43 01             	lea    0x1(%ebx),%eax
 844:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 847:	83 ec 0c             	sub    $0xc,%esp
 84a:	ff 75 dc             	pushl  -0x24(%ebp)
 84d:	53                   	push   %ebx
 84e:	56                   	push   %esi
 84f:	ff 75 d0             	pushl  -0x30(%ebp)
 852:	ff 75 d4             	pushl  -0x2c(%ebp)
 855:	8b 55 d8             	mov    -0x28(%ebp),%edx
 858:	ff d2                	call   *%edx
 85a:	83 c4 20             	add    $0x20,%esp
 85d:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 860:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 867:	e9 21 fe ff ff       	jmp    68d <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 86c:	89 da                	mov    %ebx,%edx
 86e:	89 f0                	mov    %esi,%eax
 870:	e8 5f fd ff ff       	call   5d4 <s_min>
}
 875:	8d 65 f4             	lea    -0xc(%ebp),%esp
 878:	5b                   	pop    %ebx
 879:	5e                   	pop    %esi
 87a:	5f                   	pop    %edi
 87b:	5d                   	pop    %ebp
 87c:	c3                   	ret    

0000087d <s_putc>:
{
 87d:	f3 0f 1e fb          	endbr32 
 881:	55                   	push   %ebp
 882:	89 e5                	mov    %esp,%ebp
 884:	83 ec 1c             	sub    $0x1c,%esp
 887:	8b 45 18             	mov    0x18(%ebp),%eax
 88a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 88d:	6a 01                	push   $0x1
 88f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 892:	50                   	push   %eax
 893:	ff 75 08             	pushl  0x8(%ebp)
 896:	e8 f3 fb ff ff       	call   48e <write>
}
 89b:	83 c4 10             	add    $0x10,%esp
 89e:	c9                   	leave  
 89f:	c3                   	ret    

000008a0 <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 8a0:	f3 0f 1e fb          	endbr32 
 8a4:	55                   	push   %ebp
 8a5:	89 e5                	mov    %esp,%ebp
 8a7:	56                   	push   %esi
 8a8:	53                   	push   %ebx
 8a9:	8b 75 08             	mov    0x8(%ebp),%esi
 8ac:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 8af:	83 ec 04             	sub    $0x4,%esp
 8b2:	8d 45 14             	lea    0x14(%ebp),%eax
 8b5:	50                   	push   %eax
 8b6:	ff 75 10             	pushl  0x10(%ebp)
 8b9:	53                   	push   %ebx
 8ba:	89 f1                	mov    %esi,%ecx
 8bc:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 8c1:	b8 2e 05 00 00       	mov    $0x52e,%eax
 8c6:	e8 79 fd ff ff       	call   644 <s_printf>
  if(count < n) {
 8cb:	83 c4 10             	add    $0x10,%esp
 8ce:	39 c3                	cmp    %eax,%ebx
 8d0:	76 04                	jbe    8d6 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 8d2:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 8d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8d9:	5b                   	pop    %ebx
 8da:	5e                   	pop    %esi
 8db:	5d                   	pop    %ebp
 8dc:	c3                   	ret    

000008dd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8dd:	f3 0f 1e fb          	endbr32 
 8e1:	55                   	push   %ebp
 8e2:	89 e5                	mov    %esp,%ebp
 8e4:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 8e7:	8d 45 10             	lea    0x10(%ebp),%eax
 8ea:	50                   	push   %eax
 8eb:	ff 75 0c             	pushl  0xc(%ebp)
 8ee:	68 00 00 00 40       	push   $0x40000000
 8f3:	b9 00 00 00 00       	mov    $0x0,%ecx
 8f8:	8b 55 08             	mov    0x8(%ebp),%edx
 8fb:	b8 7d 08 00 00       	mov    $0x87d,%eax
 900:	e8 3f fd ff ff       	call   644 <s_printf>
}
 905:	83 c4 10             	add    $0x10,%esp
 908:	c9                   	leave  
 909:	c3                   	ret    
