
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	56                   	push   %esi
   8:	53                   	push   %ebx
   9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   c:	83 ec 0c             	sub    $0xc,%esp
   f:	53                   	push   %ebx
  10:	e8 2f 03 00 00       	call   344 <strlen>
  15:	01 d8                	add    %ebx,%eax
  17:	83 c4 10             	add    $0x10,%esp
  1a:	39 d8                	cmp    %ebx,%eax
  1c:	72 0a                	jb     28 <fmtname+0x28>
  1e:	80 38 2f             	cmpb   $0x2f,(%eax)
  21:	74 05                	je     28 <fmtname+0x28>
  23:	83 e8 01             	sub    $0x1,%eax
  26:	eb f2                	jmp    1a <fmtname+0x1a>
    ;
  p++;
  28:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  2b:	83 ec 0c             	sub    $0xc,%esp
  2e:	53                   	push   %ebx
  2f:	e8 10 03 00 00       	call   344 <strlen>
  34:	83 c4 10             	add    $0x10,%esp
  37:	83 f8 0d             	cmp    $0xd,%eax
  3a:	76 09                	jbe    45 <fmtname+0x45>
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;
}
  3c:	89 d8                	mov    %ebx,%eax
  3e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  41:	5b                   	pop    %ebx
  42:	5e                   	pop    %esi
  43:	5d                   	pop    %ebp
  44:	c3                   	ret    
  memmove(buf, p, strlen(p));
  45:	83 ec 0c             	sub    $0xc,%esp
  48:	53                   	push   %ebx
  49:	e8 f6 02 00 00       	call   344 <strlen>
  4e:	83 c4 0c             	add    $0xc,%esp
  51:	50                   	push   %eax
  52:	53                   	push   %ebx
  53:	68 c4 09 00 00       	push   $0x9c4
  58:	e8 18 04 00 00       	call   475 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  5d:	89 1c 24             	mov    %ebx,(%esp)
  60:	e8 df 02 00 00       	call   344 <strlen>
  65:	89 c6                	mov    %eax,%esi
  67:	89 1c 24             	mov    %ebx,(%esp)
  6a:	e8 d5 02 00 00       	call   344 <strlen>
  6f:	83 c4 0c             	add    $0xc,%esp
  72:	ba 0e 00 00 00       	mov    $0xe,%edx
  77:	29 f2                	sub    %esi,%edx
  79:	52                   	push   %edx
  7a:	6a 20                	push   $0x20
  7c:	05 c4 09 00 00       	add    $0x9c4,%eax
  81:	50                   	push   %eax
  82:	e8 d9 02 00 00       	call   360 <memset>
  return buf;
  87:	83 c4 10             	add    $0x10,%esp
  8a:	bb c4 09 00 00       	mov    $0x9c4,%ebx
  8f:	eb ab                	jmp    3c <fmtname+0x3c>

00000091 <ls>:

void
ls(char *path)
{
  91:	f3 0f 1e fb          	endbr32 
  95:	55                   	push   %ebp
  96:	89 e5                	mov    %esp,%ebp
  98:	57                   	push   %edi
  99:	56                   	push   %esi
  9a:	53                   	push   %ebx
  9b:	81 ec 54 02 00 00    	sub    $0x254,%esp
  a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  a4:	6a 00                	push   $0x0
  a6:	53                   	push   %ebx
  a7:	e8 41 04 00 00       	call   4ed <open>
  ac:	83 c4 10             	add    $0x10,%esp
  af:	85 c0                	test   %eax,%eax
  b1:	0f 88 8c 00 00 00    	js     143 <ls+0xb2>
  b7:	89 c7                	mov    %eax,%edi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  b9:	83 ec 08             	sub    $0x8,%esp
  bc:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
  c2:	50                   	push   %eax
  c3:	57                   	push   %edi
  c4:	e8 3c 04 00 00       	call   505 <fstat>
  c9:	83 c4 10             	add    $0x10,%esp
  cc:	85 c0                	test   %eax,%eax
  ce:	0f 88 84 00 00 00    	js     158 <ls+0xc7>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
  d4:	0f b7 85 c4 fd ff ff 	movzwl -0x23c(%ebp),%eax
  db:	0f bf f0             	movswl %ax,%esi
  de:	66 83 f8 01          	cmp    $0x1,%ax
  e2:	0f 84 8d 00 00 00    	je     175 <ls+0xe4>
  e8:	66 83 f8 02          	cmp    $0x2,%ax
  ec:	75 41                	jne    12f <ls+0x9e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
  ee:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
  f4:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
  fa:	8b 95 cc fd ff ff    	mov    -0x234(%ebp),%edx
 100:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 106:	83 ec 0c             	sub    $0xc,%esp
 109:	53                   	push   %ebx
 10a:	e8 f1 fe ff ff       	call   0 <fmtname>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 118:	ff b5 b0 fd ff ff    	pushl  -0x250(%ebp)
 11e:	56                   	push   %esi
 11f:	50                   	push   %eax
 120:	68 84 09 00 00       	push   $0x984
 125:	6a 01                	push   $0x1
 127:	e8 00 08 00 00       	call   92c <printf>
    break;
 12c:	83 c4 20             	add    $0x20,%esp
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 12f:	83 ec 0c             	sub    $0xc,%esp
 132:	57                   	push   %edi
 133:	e8 9d 03 00 00       	call   4d5 <close>
 138:	83 c4 10             	add    $0x10,%esp
}
 13b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 13e:	5b                   	pop    %ebx
 13f:	5e                   	pop    %esi
 140:	5f                   	pop    %edi
 141:	5d                   	pop    %ebp
 142:	c3                   	ret    
    printf(2, "ls: cannot open %s\n", path);
 143:	83 ec 04             	sub    $0x4,%esp
 146:	53                   	push   %ebx
 147:	68 5c 09 00 00       	push   $0x95c
 14c:	6a 02                	push   $0x2
 14e:	e8 d9 07 00 00       	call   92c <printf>
    return;
 153:	83 c4 10             	add    $0x10,%esp
 156:	eb e3                	jmp    13b <ls+0xaa>
    printf(2, "ls: cannot stat %s\n", path);
 158:	83 ec 04             	sub    $0x4,%esp
 15b:	53                   	push   %ebx
 15c:	68 70 09 00 00       	push   $0x970
 161:	6a 02                	push   $0x2
 163:	e8 c4 07 00 00       	call   92c <printf>
    close(fd);
 168:	89 3c 24             	mov    %edi,(%esp)
 16b:	e8 65 03 00 00       	call   4d5 <close>
    return;
 170:	83 c4 10             	add    $0x10,%esp
 173:	eb c6                	jmp    13b <ls+0xaa>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 175:	83 ec 0c             	sub    $0xc,%esp
 178:	53                   	push   %ebx
 179:	e8 c6 01 00 00       	call   344 <strlen>
 17e:	83 c0 10             	add    $0x10,%eax
 181:	83 c4 10             	add    $0x10,%esp
 184:	3d 00 02 00 00       	cmp    $0x200,%eax
 189:	76 14                	jbe    19f <ls+0x10e>
      printf(1, "ls: path too long\n");
 18b:	83 ec 08             	sub    $0x8,%esp
 18e:	68 91 09 00 00       	push   $0x991
 193:	6a 01                	push   $0x1
 195:	e8 92 07 00 00       	call   92c <printf>
      break;
 19a:	83 c4 10             	add    $0x10,%esp
 19d:	eb 90                	jmp    12f <ls+0x9e>
    strcpy(buf, path);
 19f:	83 ec 08             	sub    $0x8,%esp
 1a2:	53                   	push   %ebx
 1a3:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1a9:	56                   	push   %esi
 1aa:	e8 41 01 00 00       	call   2f0 <strcpy>
    p = buf+strlen(buf);
 1af:	89 34 24             	mov    %esi,(%esp)
 1b2:	e8 8d 01 00 00       	call   344 <strlen>
 1b7:	01 c6                	add    %eax,%esi
    *p++ = '/';
 1b9:	8d 46 01             	lea    0x1(%esi),%eax
 1bc:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
 1c2:	c6 06 2f             	movb   $0x2f,(%esi)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1c5:	83 c4 10             	add    $0x10,%esp
 1c8:	eb 19                	jmp    1e3 <ls+0x152>
        printf(1, "ls: cannot stat %s\n", buf);
 1ca:	83 ec 04             	sub    $0x4,%esp
 1cd:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	68 70 09 00 00       	push   $0x970
 1d9:	6a 01                	push   $0x1
 1db:	e8 4c 07 00 00       	call   92c <printf>
        continue;
 1e0:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e3:	83 ec 04             	sub    $0x4,%esp
 1e6:	6a 10                	push   $0x10
 1e8:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1ee:	50                   	push   %eax
 1ef:	57                   	push   %edi
 1f0:	e8 d0 02 00 00       	call   4c5 <read>
 1f5:	83 c4 10             	add    $0x10,%esp
 1f8:	83 f8 10             	cmp    $0x10,%eax
 1fb:	0f 85 2e ff ff ff    	jne    12f <ls+0x9e>
      if(de.inum == 0)
 201:	66 83 bd d8 fd ff ff 	cmpw   $0x0,-0x228(%ebp)
 208:	00 
 209:	74 d8                	je     1e3 <ls+0x152>
      memmove(p, de.name, DIRSIZ);
 20b:	83 ec 04             	sub    $0x4,%esp
 20e:	6a 0e                	push   $0xe
 210:	8d 85 da fd ff ff    	lea    -0x226(%ebp),%eax
 216:	50                   	push   %eax
 217:	ff b5 ac fd ff ff    	pushl  -0x254(%ebp)
 21d:	e8 53 02 00 00       	call   475 <memmove>
      p[DIRSIZ] = 0;
 222:	c6 46 0f 00          	movb   $0x0,0xf(%esi)
      if(stat(buf, &st) < 0){
 226:	83 c4 08             	add    $0x8,%esp
 229:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 22f:	50                   	push   %eax
 230:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 236:	50                   	push   %eax
 237:	e8 bf 01 00 00       	call   3fb <stat>
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	85 c0                	test   %eax,%eax
 241:	78 87                	js     1ca <ls+0x139>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 243:	8b 9d d4 fd ff ff    	mov    -0x22c(%ebp),%ebx
 249:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
 24f:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 255:	0f b7 8d c4 fd ff ff 	movzwl -0x23c(%ebp),%ecx
 25c:	66 89 8d b0 fd ff ff 	mov    %cx,-0x250(%ebp)
 263:	83 ec 0c             	sub    $0xc,%esp
 266:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 26c:	50                   	push   %eax
 26d:	e8 8e fd ff ff       	call   0 <fmtname>
 272:	89 c2                	mov    %eax,%edx
 274:	83 c4 08             	add    $0x8,%esp
 277:	53                   	push   %ebx
 278:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 27e:	0f bf 85 b0 fd ff ff 	movswl -0x250(%ebp),%eax
 285:	50                   	push   %eax
 286:	52                   	push   %edx
 287:	68 84 09 00 00       	push   $0x984
 28c:	6a 01                	push   $0x1
 28e:	e8 99 06 00 00       	call   92c <printf>
 293:	83 c4 20             	add    $0x20,%esp
 296:	e9 48 ff ff ff       	jmp    1e3 <ls+0x152>

0000029b <main>:

int
main(int argc, char *argv[])
{
 29b:	f3 0f 1e fb          	endbr32 
 29f:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2a3:	83 e4 f0             	and    $0xfffffff0,%esp
 2a6:	ff 71 fc             	pushl  -0x4(%ecx)
 2a9:	55                   	push   %ebp
 2aa:	89 e5                	mov    %esp,%ebp
 2ac:	57                   	push   %edi
 2ad:	56                   	push   %esi
 2ae:	53                   	push   %ebx
 2af:	51                   	push   %ecx
 2b0:	83 ec 08             	sub    $0x8,%esp
 2b3:	8b 31                	mov    (%ecx),%esi
 2b5:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
 2b8:	83 fe 01             	cmp    $0x1,%esi
 2bb:	7e 07                	jle    2c4 <main+0x29>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 2bd:	bb 01 00 00 00       	mov    $0x1,%ebx
 2c2:	eb 23                	jmp    2e7 <main+0x4c>
    ls(".");
 2c4:	83 ec 0c             	sub    $0xc,%esp
 2c7:	68 a4 09 00 00       	push   $0x9a4
 2cc:	e8 c0 fd ff ff       	call   91 <ls>
    exit();
 2d1:	e8 d7 01 00 00       	call   4ad <exit>
    ls(argv[i]);
 2d6:	83 ec 0c             	sub    $0xc,%esp
 2d9:	ff 34 9f             	pushl  (%edi,%ebx,4)
 2dc:	e8 b0 fd ff ff       	call   91 <ls>
  for(i=1; i<argc; i++)
 2e1:	83 c3 01             	add    $0x1,%ebx
 2e4:	83 c4 10             	add    $0x10,%esp
 2e7:	39 f3                	cmp    %esi,%ebx
 2e9:	7c eb                	jl     2d6 <main+0x3b>
  exit();
 2eb:	e8 bd 01 00 00       	call   4ad <exit>

000002f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	56                   	push   %esi
 2f8:	53                   	push   %ebx
 2f9:	8b 75 08             	mov    0x8(%ebp),%esi
 2fc:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ff:	89 f0                	mov    %esi,%eax
 301:	89 d1                	mov    %edx,%ecx
 303:	83 c2 01             	add    $0x1,%edx
 306:	89 c3                	mov    %eax,%ebx
 308:	83 c0 01             	add    $0x1,%eax
 30b:	0f b6 09             	movzbl (%ecx),%ecx
 30e:	88 0b                	mov    %cl,(%ebx)
 310:	84 c9                	test   %cl,%cl
 312:	75 ed                	jne    301 <strcpy+0x11>
    ;
  return os;
}
 314:	89 f0                	mov    %esi,%eax
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 31a:	f3 0f 1e fb          	endbr32 
 31e:	55                   	push   %ebp
 31f:	89 e5                	mov    %esp,%ebp
 321:	8b 4d 08             	mov    0x8(%ebp),%ecx
 324:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 327:	0f b6 01             	movzbl (%ecx),%eax
 32a:	84 c0                	test   %al,%al
 32c:	74 0c                	je     33a <strcmp+0x20>
 32e:	3a 02                	cmp    (%edx),%al
 330:	75 08                	jne    33a <strcmp+0x20>
    p++, q++;
 332:	83 c1 01             	add    $0x1,%ecx
 335:	83 c2 01             	add    $0x1,%edx
 338:	eb ed                	jmp    327 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 33a:	0f b6 c0             	movzbl %al,%eax
 33d:	0f b6 12             	movzbl (%edx),%edx
 340:	29 d0                	sub    %edx,%eax
}
 342:	5d                   	pop    %ebp
 343:	c3                   	ret    

00000344 <strlen>:

uint
strlen(const char *s)
{
 344:	f3 0f 1e fb          	endbr32 
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 34e:	b8 00 00 00 00       	mov    $0x0,%eax
 353:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 357:	74 05                	je     35e <strlen+0x1a>
 359:	83 c0 01             	add    $0x1,%eax
 35c:	eb f5                	jmp    353 <strlen+0xf>
    ;
  return n;
}
 35e:	5d                   	pop    %ebp
 35f:	c3                   	ret    

00000360 <memset>:

void*
memset(void *dst, int c, uint n)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 36b:	89 d7                	mov    %edx,%edi
 36d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 370:	8b 45 0c             	mov    0xc(%ebp),%eax
 373:	fc                   	cld    
 374:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 376:	89 d0                	mov    %edx,%eax
 378:	5f                   	pop    %edi
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    

0000037b <strchr>:

char*
strchr(const char *s, char c)
{
 37b:	f3 0f 1e fb          	endbr32 
 37f:	55                   	push   %ebp
 380:	89 e5                	mov    %esp,%ebp
 382:	8b 45 08             	mov    0x8(%ebp),%eax
 385:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 389:	0f b6 10             	movzbl (%eax),%edx
 38c:	84 d2                	test   %dl,%dl
 38e:	74 09                	je     399 <strchr+0x1e>
    if(*s == c)
 390:	38 ca                	cmp    %cl,%dl
 392:	74 0a                	je     39e <strchr+0x23>
  for(; *s; s++)
 394:	83 c0 01             	add    $0x1,%eax
 397:	eb f0                	jmp    389 <strchr+0xe>
      return (char*)s;
  return 0;
 399:	b8 00 00 00 00       	mov    $0x0,%eax
}
 39e:	5d                   	pop    %ebp
 39f:	c3                   	ret    

000003a0 <gets>:

char*
gets(char *buf, int max)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	57                   	push   %edi
 3a8:	56                   	push   %esi
 3a9:	53                   	push   %ebx
 3aa:	83 ec 1c             	sub    $0x1c,%esp
 3ad:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3b0:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b5:	89 de                	mov    %ebx,%esi
 3b7:	83 c3 01             	add    $0x1,%ebx
 3ba:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3bd:	7d 2e                	jge    3ed <gets+0x4d>
    cc = read(0, &c, 1);
 3bf:	83 ec 04             	sub    $0x4,%esp
 3c2:	6a 01                	push   $0x1
 3c4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3c7:	50                   	push   %eax
 3c8:	6a 00                	push   $0x0
 3ca:	e8 f6 00 00 00       	call   4c5 <read>
    if(cc < 1)
 3cf:	83 c4 10             	add    $0x10,%esp
 3d2:	85 c0                	test   %eax,%eax
 3d4:	7e 17                	jle    3ed <gets+0x4d>
      break;
    buf[i++] = c;
 3d6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3da:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3dd:	3c 0a                	cmp    $0xa,%al
 3df:	0f 94 c2             	sete   %dl
 3e2:	3c 0d                	cmp    $0xd,%al
 3e4:	0f 94 c0             	sete   %al
 3e7:	08 c2                	or     %al,%dl
 3e9:	74 ca                	je     3b5 <gets+0x15>
    buf[i++] = c;
 3eb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3ed:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3f1:	89 f8                	mov    %edi,%eax
 3f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5f                   	pop    %edi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    

000003fb <stat>:

int
stat(const char *n, struct stat *st)
{
 3fb:	f3 0f 1e fb          	endbr32 
 3ff:	55                   	push   %ebp
 400:	89 e5                	mov    %esp,%ebp
 402:	56                   	push   %esi
 403:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 404:	83 ec 08             	sub    $0x8,%esp
 407:	6a 00                	push   $0x0
 409:	ff 75 08             	pushl  0x8(%ebp)
 40c:	e8 dc 00 00 00       	call   4ed <open>
  if(fd < 0)
 411:	83 c4 10             	add    $0x10,%esp
 414:	85 c0                	test   %eax,%eax
 416:	78 24                	js     43c <stat+0x41>
 418:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 41a:	83 ec 08             	sub    $0x8,%esp
 41d:	ff 75 0c             	pushl  0xc(%ebp)
 420:	50                   	push   %eax
 421:	e8 df 00 00 00       	call   505 <fstat>
 426:	89 c6                	mov    %eax,%esi
  close(fd);
 428:	89 1c 24             	mov    %ebx,(%esp)
 42b:	e8 a5 00 00 00       	call   4d5 <close>
  return r;
 430:	83 c4 10             	add    $0x10,%esp
}
 433:	89 f0                	mov    %esi,%eax
 435:	8d 65 f8             	lea    -0x8(%ebp),%esp
 438:	5b                   	pop    %ebx
 439:	5e                   	pop    %esi
 43a:	5d                   	pop    %ebp
 43b:	c3                   	ret    
    return -1;
 43c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 441:	eb f0                	jmp    433 <stat+0x38>

00000443 <atoi>:

int
atoi(const char *s)
{
 443:	f3 0f 1e fb          	endbr32 
 447:	55                   	push   %ebp
 448:	89 e5                	mov    %esp,%ebp
 44a:	53                   	push   %ebx
 44b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 44e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 453:	0f b6 01             	movzbl (%ecx),%eax
 456:	8d 58 d0             	lea    -0x30(%eax),%ebx
 459:	80 fb 09             	cmp    $0x9,%bl
 45c:	77 12                	ja     470 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 45e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 461:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 464:	83 c1 01             	add    $0x1,%ecx
 467:	0f be c0             	movsbl %al,%eax
 46a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 46e:	eb e3                	jmp    453 <atoi+0x10>
  return n;
}
 470:	89 d0                	mov    %edx,%eax
 472:	5b                   	pop    %ebx
 473:	5d                   	pop    %ebp
 474:	c3                   	ret    

00000475 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 475:	f3 0f 1e fb          	endbr32 
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
 47c:	56                   	push   %esi
 47d:	53                   	push   %ebx
 47e:	8b 75 08             	mov    0x8(%ebp),%esi
 481:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 484:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 487:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 489:	8d 58 ff             	lea    -0x1(%eax),%ebx
 48c:	85 c0                	test   %eax,%eax
 48e:	7e 0f                	jle    49f <memmove+0x2a>
    *dst++ = *src++;
 490:	0f b6 01             	movzbl (%ecx),%eax
 493:	88 02                	mov    %al,(%edx)
 495:	8d 49 01             	lea    0x1(%ecx),%ecx
 498:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 49b:	89 d8                	mov    %ebx,%eax
 49d:	eb ea                	jmp    489 <memmove+0x14>
  return vdst;
}
 49f:	89 f0                	mov    %esi,%eax
 4a1:	5b                   	pop    %ebx
 4a2:	5e                   	pop    %esi
 4a3:	5d                   	pop    %ebp
 4a4:	c3                   	ret    

000004a5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4a5:	b8 01 00 00 00       	mov    $0x1,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <exit>:
SYSCALL(exit)
 4ad:	b8 02 00 00 00       	mov    $0x2,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <wait>:
SYSCALL(wait)
 4b5:	b8 03 00 00 00       	mov    $0x3,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <pipe>:
SYSCALL(pipe)
 4bd:	b8 04 00 00 00       	mov    $0x4,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <read>:
SYSCALL(read)
 4c5:	b8 05 00 00 00       	mov    $0x5,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <write>:
SYSCALL(write)
 4cd:	b8 10 00 00 00       	mov    $0x10,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <close>:
SYSCALL(close)
 4d5:	b8 15 00 00 00       	mov    $0x15,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <kill>:
SYSCALL(kill)
 4dd:	b8 06 00 00 00       	mov    $0x6,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <exec>:
SYSCALL(exec)
 4e5:	b8 07 00 00 00       	mov    $0x7,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <open>:
SYSCALL(open)
 4ed:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <mknod>:
SYSCALL(mknod)
 4f5:	b8 11 00 00 00       	mov    $0x11,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <unlink>:
SYSCALL(unlink)
 4fd:	b8 12 00 00 00       	mov    $0x12,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <fstat>:
SYSCALL(fstat)
 505:	b8 08 00 00 00       	mov    $0x8,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <link>:
SYSCALL(link)
 50d:	b8 13 00 00 00       	mov    $0x13,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <mkdir>:
SYSCALL(mkdir)
 515:	b8 14 00 00 00       	mov    $0x14,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <chdir>:
SYSCALL(chdir)
 51d:	b8 09 00 00 00       	mov    $0x9,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <dup>:
SYSCALL(dup)
 525:	b8 0a 00 00 00       	mov    $0xa,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <getpid>:
SYSCALL(getpid)
 52d:	b8 0b 00 00 00       	mov    $0xb,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <sbrk>:
SYSCALL(sbrk)
 535:	b8 0c 00 00 00       	mov    $0xc,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <sleep>:
SYSCALL(sleep)
 53d:	b8 0d 00 00 00       	mov    $0xd,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <uptime>:
SYSCALL(uptime)
 545:	b8 0e 00 00 00       	mov    $0xe,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <yield>:
SYSCALL(yield)
 54d:	b8 16 00 00 00       	mov    $0x16,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <shutdown>:
SYSCALL(shutdown)
 555:	b8 17 00 00 00       	mov    $0x17,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <ps>:
SYSCALL(ps)
 55d:	b8 18 00 00 00       	mov    $0x18,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <nice>:
SYSCALL(nice)
 565:	b8 1b 00 00 00       	mov    $0x1b,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <flock>:
SYSCALL(flock)
 56d:	b8 19 00 00 00       	mov    $0x19,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <funlock>:
 575:	b8 1a 00 00 00       	mov    $0x1a,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <s_sputc>:
  write(fd, &c, 1);
}

// store c at index within outbuffer if index is less than length
void s_sputc(int fd, char *outbuffer, uint length, uint index, char c) 
{
 57d:	f3 0f 1e fb          	endbr32 
 581:	55                   	push   %ebp
 582:	89 e5                	mov    %esp,%ebp
 584:	8b 45 14             	mov    0x14(%ebp),%eax
 587:	8b 55 18             	mov    0x18(%ebp),%edx
  if(index < length)
 58a:	3b 45 10             	cmp    0x10(%ebp),%eax
 58d:	73 06                	jae    595 <s_sputc+0x18>
  {
    outbuffer[index] = c;
 58f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 592:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  }
}
 595:	5d                   	pop    %ebp
 596:	c3                   	ret    

00000597 <s_getReverseDigits>:
// "most significant digit on teh left" representation. At most length
// characters are written to outbuf.
// \return the number of characters written to outbuf
static uint 
s_getReverseDigits(char *outbuf, uint length, int xx, int base, int sgn)
{
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
 59a:	57                   	push   %edi
 59b:	56                   	push   %esi
 59c:	53                   	push   %ebx
 59d:	83 ec 08             	sub    $0x8,%esp
 5a0:	89 c6                	mov    %eax,%esi
 5a2:	89 d3                	mov    %edx,%ebx
 5a4:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  static char digits[] = "0123456789ABCDEF";
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5a7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5ab:	0f 95 c2             	setne  %dl
 5ae:	89 c8                	mov    %ecx,%eax
 5b0:	c1 e8 1f             	shr    $0x1f,%eax
 5b3:	84 c2                	test   %al,%dl
 5b5:	74 33                	je     5ea <s_getReverseDigits+0x53>
    neg = 1;
    x = -xx;
 5b7:	89 c8                	mov    %ecx,%eax
 5b9:	f7 d8                	neg    %eax
    neg = 1;
 5bb:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5c2:	bf 00 00 00 00       	mov    $0x0,%edi
  while(i + 1 < length && x != 0) {
 5c7:	8d 4f 01             	lea    0x1(%edi),%ecx
 5ca:	89 ca                	mov    %ecx,%edx
 5cc:	39 d9                	cmp    %ebx,%ecx
 5ce:	73 26                	jae    5f6 <s_getReverseDigits+0x5f>
 5d0:	85 c0                	test   %eax,%eax
 5d2:	74 22                	je     5f6 <s_getReverseDigits+0x5f>
    outbuf[i++] = digits[x % base];
 5d4:	ba 00 00 00 00       	mov    $0x0,%edx
 5d9:	f7 75 08             	divl   0x8(%ebp)
 5dc:	0f b6 92 b0 09 00 00 	movzbl 0x9b0(%edx),%edx
 5e3:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 5e6:	89 cf                	mov    %ecx,%edi
 5e8:	eb dd                	jmp    5c7 <s_getReverseDigits+0x30>
    x = xx;
 5ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  neg = 0;
 5ed:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5f4:	eb cc                	jmp    5c2 <s_getReverseDigits+0x2b>
    x /= base;
  }

  if(0 == xx && i + 1 < length) {
 5f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5fa:	75 0a                	jne    606 <s_getReverseDigits+0x6f>
 5fc:	39 da                	cmp    %ebx,%edx
 5fe:	73 06                	jae    606 <s_getReverseDigits+0x6f>
    outbuf[i++] = digits[0];   
 600:	c6 04 3e 30          	movb   $0x30,(%esi,%edi,1)
 604:	89 cf                	mov    %ecx,%edi
  }

  if(neg && i < length) {
 606:	89 fa                	mov    %edi,%edx
 608:	39 df                	cmp    %ebx,%edi
 60a:	0f 92 c0             	setb   %al
 60d:	84 45 ec             	test   %al,-0x14(%ebp)
 610:	74 07                	je     619 <s_getReverseDigits+0x82>
    outbuf[i++] = '-';
 612:	83 c7 01             	add    $0x1,%edi
 615:	c6 04 16 2d          	movb   $0x2d,(%esi,%edx,1)
  }

  return i;
}
 619:	89 f8                	mov    %edi,%eax
 61b:	83 c4 08             	add    $0x8,%esp
 61e:	5b                   	pop    %ebx
 61f:	5e                   	pop    %esi
 620:	5f                   	pop    %edi
 621:	5d                   	pop    %ebp
 622:	c3                   	ret    

00000623 <s_min>:
  }
  return result;
}

static uint s_min(uint a, uint b) {
  return (a < b) ? a : b;
 623:	39 c2                	cmp    %eax,%edx
 625:	0f 46 c2             	cmovbe %edx,%eax
}
 628:	c3                   	ret    

00000629 <s_printint>:
{
 629:	55                   	push   %ebp
 62a:	89 e5                	mov    %esp,%ebp
 62c:	57                   	push   %edi
 62d:	56                   	push   %esi
 62e:	53                   	push   %ebx
 62f:	83 ec 2c             	sub    $0x2c,%esp
 632:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 635:	89 55 d0             	mov    %edx,-0x30(%ebp)
 638:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 63b:	8b 7d 08             	mov    0x8(%ebp),%edi
  s_getReverseDigits(localBuffer, localBufferLength, xx, base, sgn);
 63e:	ff 75 14             	pushl  0x14(%ebp)
 641:	ff 75 10             	pushl  0x10(%ebp)
 644:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 647:	ba 10 00 00 00       	mov    $0x10,%edx
 64c:	8d 45 d8             	lea    -0x28(%ebp),%eax
 64f:	e8 43 ff ff ff       	call   597 <s_getReverseDigits>
 654:	89 45 c8             	mov    %eax,-0x38(%ebp)
  int i = result;
 657:	89 c3                	mov    %eax,%ebx
  while(--i >= 0 && j < length) 
 659:	83 c4 08             	add    $0x8,%esp
  int j = 0;
 65c:	be 00 00 00 00       	mov    $0x0,%esi
  while(--i >= 0 && j < length) 
 661:	83 eb 01             	sub    $0x1,%ebx
 664:	78 22                	js     688 <s_printint+0x5f>
 666:	39 fe                	cmp    %edi,%esi
 668:	73 1e                	jae    688 <s_printint+0x5f>
    putcFunction(fd, outbuf, length, j, localBuffer[i]);
 66a:	83 ec 0c             	sub    $0xc,%esp
 66d:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
 672:	50                   	push   %eax
 673:	56                   	push   %esi
 674:	57                   	push   %edi
 675:	ff 75 cc             	pushl  -0x34(%ebp)
 678:	ff 75 d0             	pushl  -0x30(%ebp)
 67b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 67e:	ff d0                	call   *%eax
    j++;
 680:	83 c6 01             	add    $0x1,%esi
 683:	83 c4 20             	add    $0x20,%esp
 686:	eb d9                	jmp    661 <s_printint+0x38>
}
 688:	8b 45 c8             	mov    -0x38(%ebp),%eax
 68b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 68e:	5b                   	pop    %ebx
 68f:	5e                   	pop    %esi
 690:	5f                   	pop    %edi
 691:	5d                   	pop    %ebp
 692:	c3                   	ret    

00000693 <s_printf>:

static 
int s_printf(putFunction_t putcFunction, int fd, char *outbuffer, int n, const char *fmt, uint* ap)
{
 693:	55                   	push   %ebp
 694:	89 e5                	mov    %esp,%ebp
 696:	57                   	push   %edi
 697:	56                   	push   %esi
 698:	53                   	push   %ebx
 699:	83 ec 2c             	sub    $0x2c,%esp
 69c:	89 45 d8             	mov    %eax,-0x28(%ebp)
 69f:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 6a2:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  char *s;
  int c, i, state;
  uint outindex = 0;
  const int length = n -1; // leave room for nul termination
 6a5:	8b 45 08             	mov    0x8(%ebp),%eax
 6a8:	8d 78 ff             	lea    -0x1(%eax),%edi

  state = 0;
 6ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i = 0; fmt[i] && outindex < length; i++) {
 6b2:	bb 00 00 00 00       	mov    $0x0,%ebx
 6b7:	89 f8                	mov    %edi,%eax
 6b9:	89 df                	mov    %ebx,%edi
 6bb:	89 c6                	mov    %eax,%esi
 6bd:	eb 20                	jmp    6df <s_printf+0x4c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%') {
        state = '%';
      } else {
        putcFunction(fd, outbuffer, length, outindex++, c);
 6bf:	8d 43 01             	lea    0x1(%ebx),%eax
 6c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
 6c5:	83 ec 0c             	sub    $0xc,%esp
 6c8:	51                   	push   %ecx
 6c9:	53                   	push   %ebx
 6ca:	56                   	push   %esi
 6cb:	ff 75 d0             	pushl  -0x30(%ebp)
 6ce:	ff 75 d4             	pushl  -0x2c(%ebp)
 6d1:	8b 55 d8             	mov    -0x28(%ebp),%edx
 6d4:	ff d2                	call   *%edx
 6d6:	83 c4 20             	add    $0x20,%esp
 6d9:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  for(i = 0; fmt[i] && outindex < length; i++) {
 6dc:	83 c7 01             	add    $0x1,%edi
 6df:	8b 45 0c             	mov    0xc(%ebp),%eax
 6e2:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 6e6:	84 c0                	test   %al,%al
 6e8:	0f 84 cd 01 00 00    	je     8bb <s_printf+0x228>
 6ee:	89 75 e0             	mov    %esi,-0x20(%ebp)
 6f1:	39 de                	cmp    %ebx,%esi
 6f3:	0f 86 c2 01 00 00    	jbe    8bb <s_printf+0x228>
    c = fmt[i] & 0xff;
 6f9:	0f be c8             	movsbl %al,%ecx
 6fc:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 6ff:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 702:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 706:	75 0a                	jne    712 <s_printf+0x7f>
      if(c == '%') {
 708:	83 f8 25             	cmp    $0x25,%eax
 70b:	75 b2                	jne    6bf <s_printf+0x2c>
        state = '%';
 70d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 710:	eb ca                	jmp    6dc <s_printf+0x49>
      }
    } else if(state == '%'){
 712:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 716:	75 c4                	jne    6dc <s_printf+0x49>
      if(c == 'd'){
 718:	83 f8 64             	cmp    $0x64,%eax
 71b:	74 6e                	je     78b <s_printf+0xf8>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 71d:	83 f8 78             	cmp    $0x78,%eax
 720:	0f 94 c1             	sete   %cl
 723:	83 f8 70             	cmp    $0x70,%eax
 726:	0f 94 c2             	sete   %dl
 729:	08 d1                	or     %dl,%cl
 72b:	0f 85 8e 00 00 00    	jne    7bf <s_printf+0x12c>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 731:	83 f8 73             	cmp    $0x73,%eax
 734:	0f 84 b9 00 00 00    	je     7f3 <s_printf+0x160>
          s = "(null)";
        while(*s != 0){
          putcFunction(fd, outbuffer, length, outindex++, *s);
          s++;
        }
      } else if(c == 'c'){
 73a:	83 f8 63             	cmp    $0x63,%eax
 73d:	0f 84 1a 01 00 00    	je     85d <s_printf+0x1ca>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
        ap++;
      } else if(c == '%'){
 743:	83 f8 25             	cmp    $0x25,%eax
 746:	0f 84 44 01 00 00    	je     890 <s_printf+0x1fd>
        putcFunction(fd, outbuffer, length, outindex++, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putcFunction(fd, outbuffer, length, outindex++, '%');
 74c:	8d 43 01             	lea    0x1(%ebx),%eax
 74f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 752:	83 ec 0c             	sub    $0xc,%esp
 755:	6a 25                	push   $0x25
 757:	53                   	push   %ebx
 758:	56                   	push   %esi
 759:	ff 75 d0             	pushl  -0x30(%ebp)
 75c:	ff 75 d4             	pushl  -0x2c(%ebp)
 75f:	8b 45 d8             	mov    -0x28(%ebp),%eax
 762:	ff d0                	call   *%eax
        putcFunction(fd, outbuffer, length, outindex++, c);
 764:	83 c3 02             	add    $0x2,%ebx
 767:	83 c4 14             	add    $0x14,%esp
 76a:	ff 75 dc             	pushl  -0x24(%ebp)
 76d:	ff 75 e4             	pushl  -0x1c(%ebp)
 770:	56                   	push   %esi
 771:	ff 75 d0             	pushl  -0x30(%ebp)
 774:	ff 75 d4             	pushl  -0x2c(%ebp)
 777:	8b 45 d8             	mov    -0x28(%ebp),%eax
 77a:	ff d0                	call   *%eax
 77c:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
 77f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 786:	e9 51 ff ff ff       	jmp    6dc <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 10, 1);
 78b:	8b 45 d0             	mov    -0x30(%ebp),%eax
 78e:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 791:	6a 01                	push   $0x1
 793:	6a 0a                	push   $0xa
 795:	8b 45 10             	mov    0x10(%ebp),%eax
 798:	ff 30                	pushl  (%eax)
 79a:	89 f0                	mov    %esi,%eax
 79c:	29 d8                	sub    %ebx,%eax
 79e:	50                   	push   %eax
 79f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 7a2:	8b 45 d8             	mov    -0x28(%ebp),%eax
 7a5:	e8 7f fe ff ff       	call   629 <s_printint>
 7aa:	01 c3                	add    %eax,%ebx
        ap++;
 7ac:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 7b0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7b3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 7ba:	e9 1d ff ff ff       	jmp    6dc <s_printf+0x49>
        outindex += s_printint(putcFunction, fd, &outbuffer[outindex], length - outindex, *ap, 16, 0);
 7bf:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7c2:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
 7c5:	6a 00                	push   $0x0
 7c7:	6a 10                	push   $0x10
 7c9:	8b 45 10             	mov    0x10(%ebp),%eax
 7cc:	ff 30                	pushl  (%eax)
 7ce:	89 f0                	mov    %esi,%eax
 7d0:	29 d8                	sub    %ebx,%eax
 7d2:	50                   	push   %eax
 7d3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 7d6:	8b 45 d8             	mov    -0x28(%ebp),%eax
 7d9:	e8 4b fe ff ff       	call   629 <s_printint>
 7de:	01 c3                	add    %eax,%ebx
        ap++;
 7e0:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 7e4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7e7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 7ee:	e9 e9 fe ff ff       	jmp    6dc <s_printf+0x49>
        s = (char*)*ap;
 7f3:	8b 45 10             	mov    0x10(%ebp),%eax
 7f6:	8b 00                	mov    (%eax),%eax
        ap++;
 7f8:	83 45 10 04          	addl   $0x4,0x10(%ebp)
        if(s == 0)
 7fc:	85 c0                	test   %eax,%eax
 7fe:	75 4e                	jne    84e <s_printf+0x1bb>
          s = "(null)";
 800:	b8 a6 09 00 00       	mov    $0x9a6,%eax
 805:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 808:	89 da                	mov    %ebx,%edx
 80a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 80d:	89 75 e0             	mov    %esi,-0x20(%ebp)
 810:	89 c6                	mov    %eax,%esi
 812:	eb 1f                	jmp    833 <s_printf+0x1a0>
          putcFunction(fd, outbuffer, length, outindex++, *s);
 814:	8d 7a 01             	lea    0x1(%edx),%edi
 817:	83 ec 0c             	sub    $0xc,%esp
 81a:	0f be c0             	movsbl %al,%eax
 81d:	50                   	push   %eax
 81e:	52                   	push   %edx
 81f:	53                   	push   %ebx
 820:	ff 75 d0             	pushl  -0x30(%ebp)
 823:	ff 75 d4             	pushl  -0x2c(%ebp)
 826:	8b 45 d8             	mov    -0x28(%ebp),%eax
 829:	ff d0                	call   *%eax
          s++;
 82b:	83 c6 01             	add    $0x1,%esi
 82e:	83 c4 20             	add    $0x20,%esp
          putcFunction(fd, outbuffer, length, outindex++, *s);
 831:	89 fa                	mov    %edi,%edx
        while(*s != 0){
 833:	0f b6 06             	movzbl (%esi),%eax
 836:	84 c0                	test   %al,%al
 838:	75 da                	jne    814 <s_printf+0x181>
 83a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 83d:	89 d3                	mov    %edx,%ebx
 83f:	8b 75 e0             	mov    -0x20(%ebp),%esi
      state = 0;
 842:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 849:	e9 8e fe ff ff       	jmp    6dc <s_printf+0x49>
 84e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 851:	89 da                	mov    %ebx,%edx
 853:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 856:	89 75 e0             	mov    %esi,-0x20(%ebp)
 859:	89 c6                	mov    %eax,%esi
 85b:	eb d6                	jmp    833 <s_printf+0x1a0>
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 85d:	8d 43 01             	lea    0x1(%ebx),%eax
 860:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 863:	83 ec 0c             	sub    $0xc,%esp
 866:	8b 55 10             	mov    0x10(%ebp),%edx
 869:	0f be 02             	movsbl (%edx),%eax
 86c:	50                   	push   %eax
 86d:	53                   	push   %ebx
 86e:	56                   	push   %esi
 86f:	ff 75 d0             	pushl  -0x30(%ebp)
 872:	ff 75 d4             	pushl  -0x2c(%ebp)
 875:	8b 55 d8             	mov    -0x28(%ebp),%edx
 878:	ff d2                	call   *%edx
        ap++;
 87a:	83 45 10 04          	addl   $0x4,0x10(%ebp)
 87e:	83 c4 20             	add    $0x20,%esp
        putcFunction(fd, outbuffer, length, outindex++, *ap);
 881:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 884:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 88b:	e9 4c fe ff ff       	jmp    6dc <s_printf+0x49>
        putcFunction(fd, outbuffer, length, outindex++, c);
 890:	8d 43 01             	lea    0x1(%ebx),%eax
 893:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 896:	83 ec 0c             	sub    $0xc,%esp
 899:	ff 75 dc             	pushl  -0x24(%ebp)
 89c:	53                   	push   %ebx
 89d:	56                   	push   %esi
 89e:	ff 75 d0             	pushl  -0x30(%ebp)
 8a1:	ff 75 d4             	pushl  -0x2c(%ebp)
 8a4:	8b 55 d8             	mov    -0x28(%ebp),%edx
 8a7:	ff d2                	call   *%edx
 8a9:	83 c4 20             	add    $0x20,%esp
 8ac:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
      state = 0;
 8af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 8b6:	e9 21 fe ff ff       	jmp    6dc <s_printf+0x49>
    }
  }
  
  return s_min(length, outindex);
 8bb:	89 da                	mov    %ebx,%edx
 8bd:	89 f0                	mov    %esi,%eax
 8bf:	e8 5f fd ff ff       	call   623 <s_min>
}
 8c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c7:	5b                   	pop    %ebx
 8c8:	5e                   	pop    %esi
 8c9:	5f                   	pop    %edi
 8ca:	5d                   	pop    %ebp
 8cb:	c3                   	ret    

000008cc <s_putc>:
{
 8cc:	f3 0f 1e fb          	endbr32 
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	83 ec 1c             	sub    $0x1c,%esp
 8d6:	8b 45 18             	mov    0x18(%ebp),%eax
 8d9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 8dc:	6a 01                	push   $0x1
 8de:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8e1:	50                   	push   %eax
 8e2:	ff 75 08             	pushl  0x8(%ebp)
 8e5:	e8 e3 fb ff ff       	call   4cd <write>
}
 8ea:	83 c4 10             	add    $0x10,%esp
 8ed:	c9                   	leave  
 8ee:	c3                   	ret    

000008ef <snprintf>:
// Print into outbuffer at most n characters. Only understands %d, %x, %p, %s.
// If n is greater than 0, a terminating nul is always stored in outbuffer.
// \return the number of characters written to outbuffer not counting the
// terminating nul.
int snprintf(char *outbuffer, int n, const char *fmt, ...)
{
 8ef:	f3 0f 1e fb          	endbr32 
 8f3:	55                   	push   %ebp
 8f4:	89 e5                	mov    %esp,%ebp
 8f6:	56                   	push   %esi
 8f7:	53                   	push   %ebx
 8f8:	8b 75 08             	mov    0x8(%ebp),%esi
 8fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint* ap = (uint*)(void*)&fmt + 1;
  const uint count = s_printf(s_sputc, -1, outbuffer, n, fmt, ap);
 8fe:	83 ec 04             	sub    $0x4,%esp
 901:	8d 45 14             	lea    0x14(%ebp),%eax
 904:	50                   	push   %eax
 905:	ff 75 10             	pushl  0x10(%ebp)
 908:	53                   	push   %ebx
 909:	89 f1                	mov    %esi,%ecx
 90b:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 910:	b8 7d 05 00 00       	mov    $0x57d,%eax
 915:	e8 79 fd ff ff       	call   693 <s_printf>
  if(count < n) {
 91a:	83 c4 10             	add    $0x10,%esp
 91d:	39 c3                	cmp    %eax,%ebx
 91f:	76 04                	jbe    925 <snprintf+0x36>
    outbuffer[count] = 0; // Assure nul termination
 921:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
  } 

  return count;
}
 925:	8d 65 f8             	lea    -0x8(%ebp),%esp
 928:	5b                   	pop    %ebx
 929:	5e                   	pop    %esi
 92a:	5d                   	pop    %ebp
 92b:	c3                   	ret    

0000092c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 92c:	f3 0f 1e fb          	endbr32 
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	83 ec 0c             	sub    $0xc,%esp
  static const uint veryLarge = 1<<30;
  uint* ap = (uint*)(void*)&fmt + 1;
  s_printf(s_putc, fd, 0, veryLarge, fmt, ap);
 936:	8d 45 10             	lea    0x10(%ebp),%eax
 939:	50                   	push   %eax
 93a:	ff 75 0c             	pushl  0xc(%ebp)
 93d:	68 00 00 00 40       	push   $0x40000000
 942:	b9 00 00 00 00       	mov    $0x0,%ecx
 947:	8b 55 08             	mov    0x8(%ebp),%edx
 94a:	b8 cc 08 00 00       	mov    $0x8cc,%eax
 94f:	e8 3f fd ff ff       	call   693 <s_printf>
}
 954:	83 c4 10             	add    $0x10,%esp
 957:	c9                   	leave  
 958:	c3                   	ret    
