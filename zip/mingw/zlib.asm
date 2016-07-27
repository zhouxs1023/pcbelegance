In archive .\libzlib.a:

adler32.o:     file format pe-i386


Disassembly of section .text:

00000000 <_adler32>:
/* ========================================================================= */
uLong ZEXPORT adler32(adler, buf, len)
    uLong adler;
    const Bytef *buf;
    uInt len;
{
   0:	55                   	push   %ebp
   1:	57                   	push   %edi
   2:	56                   	push   %esi
   3:	53                   	push   %ebx
   4:	83 ec 38             	sub    $0x38,%esp
    unsigned long s1 = adler & 0xffff;
   7:	31 db                	xor    %ebx,%ebx
/* ========================================================================= */
uLong ZEXPORT adler32(adler, buf, len)
    uLong adler;
    const Bytef *buf;
    uInt len;
{
   9:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    unsigned long s1 = adler & 0xffff;
    unsigned long s2 = (adler >> 16) & 0xffff;
    int k;

    if (buf == Z_NULL) return 1L;
   d:	8b 7c 24 50          	mov    0x50(%esp),%edi
uLong ZEXPORT adler32(adler, buf, len)
    uLong adler;
    const Bytef *buf;
    uInt len;
{
    unsigned long s1 = adler & 0xffff;
  11:	66 89 c3             	mov    %ax,%bx
    unsigned long s2 = (adler >> 16) & 0xffff;
  14:	c1 e8 10             	shr    $0x10,%eax
    int k;

    if (buf == Z_NULL) return 1L;
  17:	85 ff                	test   %edi,%edi
    uLong adler;
    const Bytef *buf;
    uInt len;
{
    unsigned long s1 = adler & 0xffff;
    unsigned long s2 = (adler >> 16) & 0xffff;
  19:	89 44 24 30          	mov    %eax,0x30(%esp)
    int k;

    if (buf == Z_NULL) return 1L;
  1d:	0f 84 d5 01 00 00    	je     1f8 <_adler32+0x1f8>

    while (len > 0) {
  23:	8b 74 24 54          	mov    0x54(%esp),%esi
  27:	85 f6                	test   %esi,%esi
  29:	0f 84 92 01 00 00    	je     1c1 <_adler32+0x1c1>
        }
        if (k != 0) do {
            s1 += *buf++;
	    s2 += s1;
        } while (--k);
        s1 %= BASE;
  2f:	89 dd                	mov    %ebx,%ebp
    int k;

    if (buf == Z_NULL) return 1L;

    while (len > 0) {
        k = len < NMAX ? len : NMAX;
  31:	b8 b0 15 00 00       	mov    $0x15b0,%eax
        len -= k;
  36:	8b 5c 24 54          	mov    0x54(%esp),%ebx
    int k;

    if (buf == Z_NULL) return 1L;

    while (len > 0) {
        k = len < NMAX ? len : NMAX;
  3a:	81 7c 24 54 b0 15 00 	cmpl   $0x15b0,0x54(%esp)
  41:	00 
  42:	0f 46 44 24 54       	cmovbe 0x54(%esp),%eax
        len -= k;
  47:	29 c3                	sub    %eax,%ebx
    int k;

    if (buf == Z_NULL) return 1L;

    while (len > 0) {
        k = len < NMAX ? len : NMAX;
  49:	89 44 24 34          	mov    %eax,0x34(%esp)
        len -= k;
  4d:	89 5c 24 54          	mov    %ebx,0x54(%esp)
        while (k >= 16) {
  51:	83 f8 0f             	cmp    $0xf,%eax
  54:	0f 86 78 01 00 00    	jbe    1d2 <_adler32+0x1d2>
  5a:	89 04 24             	mov    %eax,(%esp)
  5d:	8b 44 24 50          	mov    0x50(%esp),%eax
            DO16(buf);
  61:	31 d2                	xor    %edx,%edx
  63:	8a 10                	mov    (%eax),%dl
  65:	8d 5c 15 00          	lea    0x0(%ebp,%edx,1),%ebx
  69:	31 d2                	xor    %edx,%edx
  6b:	8a 50 01             	mov    0x1(%eax),%dl
  6e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  72:	01 da                	add    %ebx,%edx
  74:	89 d6                	mov    %edx,%esi
  76:	31 d2                	xor    %edx,%edx
  78:	8a 50 02             	mov    0x2(%eax),%dl
  7b:	89 74 24 08          	mov    %esi,0x8(%esp)
  7f:	89 d7                	mov    %edx,%edi
  81:	31 d2                	xor    %edx,%edx
  83:	8a 50 03             	mov    0x3(%eax),%dl
  86:	01 f7                	add    %esi,%edi
  88:	89 d3                	mov    %edx,%ebx
  8a:	31 d2                	xor    %edx,%edx
  8c:	8a 50 04             	mov    0x4(%eax),%dl
  8f:	01 fb                	add    %edi,%ebx
  91:	89 d1                	mov    %edx,%ecx
  93:	31 d2                	xor    %edx,%edx
  95:	8a 50 05             	mov    0x5(%eax),%dl
  98:	01 d9                	add    %ebx,%ecx
  9a:	89 d5                	mov    %edx,%ebp
  9c:	31 d2                	xor    %edx,%edx
  9e:	01 cd                	add    %ecx,%ebp
  a0:	8a 50 06             	mov    0x6(%eax),%dl
  a3:	01 ea                	add    %ebp,%edx
  a5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  a9:	89 d6                	mov    %edx,%esi
  ab:	31 d2                	xor    %edx,%edx
  ad:	8a 50 07             	mov    0x7(%eax),%dl
  b0:	89 5c 24 10          	mov    %ebx,0x10(%esp)
  b4:	01 f2                	add    %esi,%edx
  b6:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  ba:	89 d7                	mov    %edx,%edi
  bc:	31 d2                	xor    %edx,%edx
  be:	8a 50 08             	mov    0x8(%eax),%dl
  c1:	89 7c 24 20          	mov    %edi,0x20(%esp)
  c5:	01 fa                	add    %edi,%edx
  c7:	89 74 24 1c          	mov    %esi,0x1c(%esp)
  cb:	89 d3                	mov    %edx,%ebx
  cd:	31 d2                	xor    %edx,%edx
  cf:	8a 50 09             	mov    0x9(%eax),%dl
  d2:	89 5c 24 24          	mov    %ebx,0x24(%esp)
  d6:	01 da                	add    %ebx,%edx
  d8:	31 db                	xor    %ebx,%ebx
  da:	89 d1                	mov    %edx,%ecx
  dc:	31 d2                	xor    %edx,%edx
  de:	0f b6 78 0b          	movzbl 0xb(%eax),%edi
  e2:	8a 50 0a             	mov    0xa(%eax),%dl
  e5:	81 e7 ff 00 00 00    	and    $0xff,%edi
  eb:	01 ca                	add    %ecx,%edx
  ed:	8a 58 0d             	mov    0xd(%eax),%bl
  f0:	0f b6 70 0c          	movzbl 0xc(%eax),%esi
  f4:	01 d7                	add    %edx,%edi
  f6:	89 54 24 2c          	mov    %edx,0x2c(%esp)
  fa:	8b 54 24 08          	mov    0x8(%esp),%edx
  fe:	81 e6 ff 00 00 00    	and    $0xff,%esi
 104:	03 54 24 04          	add    0x4(%esp),%edx
 108:	01 fe                	add    %edi,%esi
 10a:	89 6c 24 18          	mov    %ebp,0x18(%esp)
 10e:	89 4c 24 28          	mov    %ecx,0x28(%esp)
 112:	0f b6 68 0f          	movzbl 0xf(%eax),%ebp
 116:	31 c9                	xor    %ecx,%ecx
 118:	01 f3                	add    %esi,%ebx
 11a:	8a 48 0e             	mov    0xe(%eax),%cl
 11d:	03 54 24 0c          	add    0xc(%esp),%edx
 121:	01 d9                	add    %ebx,%ecx
 123:	81 e5 ff 00 00 00    	and    $0xff,%ebp
 129:	01 cd                	add    %ecx,%ebp
 12b:	03 54 24 10          	add    0x10(%esp),%edx
 12f:	03 54 24 14          	add    0x14(%esp),%edx
	    buf += 16;
 133:	83 c0 10             	add    $0x10,%eax
 136:	03 54 24 18          	add    0x18(%esp),%edx
 13a:	03 54 24 1c          	add    0x1c(%esp),%edx
 13e:	03 54 24 20          	add    0x20(%esp),%edx
 142:	03 54 24 24          	add    0x24(%esp),%edx
 146:	03 54 24 28          	add    0x28(%esp),%edx
 14a:	03 54 24 2c          	add    0x2c(%esp),%edx
 14e:	01 fa                	add    %edi,%edx
 150:	01 f2                	add    %esi,%edx
 152:	01 d3                	add    %edx,%ebx

    while (len > 0) {
        k = len < NMAX ? len : NMAX;
        len -= k;
        while (k >= 16) {
            DO16(buf);
 154:	8b 54 24 30          	mov    0x30(%esp),%edx
 158:	01 d9                	add    %ebx,%ecx
 15a:	01 e9                	add    %ebp,%ecx
 15c:	01 ca                	add    %ecx,%edx
	    buf += 16;
            k -= 16;
 15e:	8b 0c 24             	mov    (%esp),%ecx
 161:	83 e9 10             	sub    $0x10,%ecx

    while (len > 0) {
        k = len < NMAX ? len : NMAX;
        len -= k;
        while (k >= 16) {
            DO16(buf);
 164:	89 54 24 30          	mov    %edx,0x30(%esp)
	    buf += 16;
            k -= 16;
 168:	89 0c 24             	mov    %ecx,(%esp)
 16b:	8b 34 24             	mov    (%esp),%esi
    if (buf == Z_NULL) return 1L;

    while (len > 0) {
        k = len < NMAX ? len : NMAX;
        len -= k;
        while (k >= 16) {
 16e:	83 fe 0f             	cmp    $0xf,%esi
 171:	0f 8f ea fe ff ff    	jg     61 <_adler32+0x61>
 177:	8b 44 24 34          	mov    0x34(%esp),%eax
 17b:	8b 5c 24 50          	mov    0x50(%esp),%ebx
 17f:	83 e8 10             	sub    $0x10,%eax
 182:	89 c2                	mov    %eax,%edx
 184:	c1 ea 04             	shr    $0x4,%edx
 187:	8d 4a 01             	lea    0x1(%edx),%ecx
 18a:	c1 e1 04             	shl    $0x4,%ecx
 18d:	c1 e2 04             	shl    $0x4,%edx
 190:	01 cb                	add    %ecx,%ebx
            DO16(buf);
	    buf += 16;
            k -= 16;
        }
        if (k != 0) do {
 192:	29 d0                	sub    %edx,%eax
 194:	89 5c 24 50          	mov    %ebx,0x50(%esp)
 198:	75 38                	jne    1d2 <_adler32+0x1d2>
            s1 += *buf++;
	    s2 += s1;
        } while (--k);
        s1 %= BASE;
 19a:	89 e8                	mov    %ebp,%eax
 19c:	b9 f1 ff 00 00       	mov    $0xfff1,%ecx
 1a1:	31 d2                	xor    %edx,%edx
 1a3:	f7 f1                	div    %ecx
 1a5:	89 d5                	mov    %edx,%ebp
        s2 %= BASE;
 1a7:	8b 44 24 30          	mov    0x30(%esp),%eax
 1ab:	31 d2                	xor    %edx,%edx
 1ad:	f7 f1                	div    %ecx
    unsigned long s2 = (adler >> 16) & 0xffff;
    int k;

    if (buf == Z_NULL) return 1L;

    while (len > 0) {
 1af:	8b 44 24 54          	mov    0x54(%esp),%eax
        if (k != 0) do {
            s1 += *buf++;
	    s2 += s1;
        } while (--k);
        s1 %= BASE;
        s2 %= BASE;
 1b3:	89 54 24 30          	mov    %edx,0x30(%esp)
    unsigned long s2 = (adler >> 16) & 0xffff;
    int k;

    if (buf == Z_NULL) return 1L;

    while (len > 0) {
 1b7:	85 c0                	test   %eax,%eax
 1b9:	0f 85 72 fe ff ff    	jne    31 <_adler32+0x31>
 1bf:	89 eb                	mov    %ebp,%ebx
	    s2 += s1;
        } while (--k);
        s1 %= BASE;
        s2 %= BASE;
    }
    return (s2 << 16) | s1;
 1c1:	8b 44 24 30          	mov    0x30(%esp),%eax
}
 1c5:	83 c4 38             	add    $0x38,%esp
	    s2 += s1;
        } while (--k);
        s1 %= BASE;
        s2 %= BASE;
    }
    return (s2 << 16) | s1;
 1c8:	c1 e0 10             	shl    $0x10,%eax
 1cb:	09 d8                	or     %ebx,%eax
}
 1cd:	5b                   	pop    %ebx
 1ce:	5e                   	pop    %esi
 1cf:	5f                   	pop    %edi
 1d0:	5d                   	pop    %ebp
 1d1:	c3                   	ret    
 1d2:	8b 54 24 50          	mov    0x50(%esp),%edx
 1d6:	8b 4c 24 30          	mov    0x30(%esp),%ecx
 1da:	01 d0                	add    %edx,%eax
 1dc:	8b 54 24 50          	mov    0x50(%esp),%edx
            DO16(buf);
	    buf += 16;
            k -= 16;
        }
        if (k != 0) do {
            s1 += *buf++;
 1e0:	42                   	inc    %edx
 1e1:	31 db                	xor    %ebx,%ebx
 1e3:	8a 5a ff             	mov    -0x1(%edx),%bl
 1e6:	01 dd                	add    %ebx,%ebp
	    s2 += s1;
 1e8:	01 e9                	add    %ebp,%ecx
        } while (--k);
 1ea:	39 c2                	cmp    %eax,%edx
 1ec:	75 f2                	jne    1e0 <_adler32+0x1e0>
 1ee:	89 4c 24 30          	mov    %ecx,0x30(%esp)
 1f2:	89 54 24 50          	mov    %edx,0x50(%esp)
 1f6:	eb a2                	jmp    19a <_adler32+0x19a>
        s1 %= BASE;
        s2 %= BASE;
    }
    return (s2 << 16) | s1;
}
 1f8:	83 c4 38             	add    $0x38,%esp
{
    unsigned long s1 = adler & 0xffff;
    unsigned long s2 = (adler >> 16) & 0xffff;
    int k;

    if (buf == Z_NULL) return 1L;
 1fb:	b8 01 00 00 00       	mov    $0x1,%eax
        } while (--k);
        s1 %= BASE;
        s2 %= BASE;
    }
    return (s2 << 16) | s1;
}
 200:	5b                   	pop    %ebx
 201:	5e                   	pop    %esi
 202:	5f                   	pop    %edi
 203:	5d                   	pop    %ebp
 204:	c3                   	ret    
 205:	90                   	nop
 206:	90                   	nop
 207:	90                   	nop
 208:	90                   	nop
 209:	90                   	nop
 20a:	90                   	nop
 20b:	90                   	nop
 20c:	90                   	nop
 20d:	90                   	nop
 20e:	90                   	nop
 20f:	90                   	nop

compress.o:     file format pe-i386


Disassembly of section .text:

00000000 <_compress2>:
    Bytef *dest;
    uLongf *destLen;
    const Bytef *source;
    uLong sourceLen;
    int level;
{
   0:	57                   	push   %edi
   1:	56                   	push   %esi
   2:	53                   	push   %ebx
   3:	83 ec 50             	sub    $0x50,%esp
    z_stream stream;
    int err;

    stream.next_in = (Bytef*)source;
   6:	8b 44 24 68          	mov    0x68(%esp),%eax
    Bytef *dest;
    uLongf *destLen;
    const Bytef *source;
    uLong sourceLen;
    int level;
{
   a:	8b 7c 24 64          	mov    0x64(%esp),%edi
    z_stream stream;
    int err;

    stream.next_in = (Bytef*)source;
   e:	89 44 24 18          	mov    %eax,0x18(%esp)
    stream.avail_in = (uInt)sourceLen;
  12:	8b 44 24 6c          	mov    0x6c(%esp),%eax
  16:	89 44 24 1c          	mov    %eax,0x1c(%esp)
#ifdef MAXSEG_64K
    /* Check for source > 64K on 16-bit machine: */
    if ((uLong)stream.avail_in != sourceLen) return Z_BUF_ERROR;
#endif
    stream.next_out = dest;
  1a:	8b 44 24 60          	mov    0x60(%esp),%eax
  1e:	89 44 24 24          	mov    %eax,0x24(%esp)
    stream.avail_out = (uInt)*destLen;
  22:	8b 07                	mov    (%edi),%eax
  24:	89 44 24 28          	mov    %eax,0x28(%esp)

    stream.zalloc = (alloc_func)0;
    stream.zfree = (free_func)0;
    stream.opaque = (voidpf)0;

    err = deflateInit(&stream, level);
  28:	8d 74 24 18          	lea    0x18(%esp),%esi
  2c:	8b 44 24 70          	mov    0x70(%esp),%eax
  30:	c7 44 24 0c 38 00 00 	movl   $0x38,0xc(%esp)
  37:	00 
  38:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  3f:	00 
  40:	89 44 24 04          	mov    %eax,0x4(%esp)
  44:	89 34 24             	mov    %esi,(%esp)
#endif
    stream.next_out = dest;
    stream.avail_out = (uInt)*destLen;
    if ((uLong)stream.avail_out != *destLen) return Z_BUF_ERROR;

    stream.zalloc = (alloc_func)0;
  47:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  4e:	00 
    stream.zfree = (free_func)0;
  4f:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
  56:	00 
    stream.opaque = (voidpf)0;
  57:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
  5e:	00 

    err = deflateInit(&stream, level);
  5f:	e8 00 00 00 00       	call   64 <_compress2+0x64>
    if (err != Z_OK) return err;
  64:	85 c0                	test   %eax,%eax
  66:	74 08                	je     70 <_compress2+0x70>
    }
    *destLen = stream.total_out;

    err = deflateEnd(&stream);
    return err;
}
  68:	83 c4 50             	add    $0x50,%esp
  6b:	5b                   	pop    %ebx
  6c:	5e                   	pop    %esi
  6d:	5f                   	pop    %edi
  6e:	c3                   	ret    
  6f:	90                   	nop
    stream.opaque = (voidpf)0;

    err = deflateInit(&stream, level);
    if (err != Z_OK) return err;

    err = deflate(&stream, Z_FINISH);
  70:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
  77:	00 
  78:	89 34 24             	mov    %esi,(%esp)
  7b:	e8 00 00 00 00       	call   80 <_compress2+0x80>
  80:	89 c3                	mov    %eax,%ebx
    if (err != Z_STREAM_END) {
  82:	83 f8 01             	cmp    $0x1,%eax
  85:	74 19                	je     a0 <_compress2+0xa0>
        deflateEnd(&stream);
  87:	89 34 24             	mov    %esi,(%esp)
  8a:	e8 00 00 00 00       	call   8f <_compress2+0x8f>
        return err == Z_OK ? Z_BUF_ERROR : err;
  8f:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
  94:	85 db                	test   %ebx,%ebx
  96:	0f 45 c3             	cmovne %ebx,%eax
    }
    *destLen = stream.total_out;

    err = deflateEnd(&stream);
    return err;
}
  99:	83 c4 50             	add    $0x50,%esp
  9c:	5b                   	pop    %ebx
  9d:	5e                   	pop    %esi
  9e:	5f                   	pop    %edi
  9f:	c3                   	ret    
    err = deflate(&stream, Z_FINISH);
    if (err != Z_STREAM_END) {
        deflateEnd(&stream);
        return err == Z_OK ? Z_BUF_ERROR : err;
    }
    *destLen = stream.total_out;
  a0:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  a4:	89 07                	mov    %eax,(%edi)

    err = deflateEnd(&stream);
  a6:	89 34 24             	mov    %esi,(%esp)
  a9:	e8 00 00 00 00       	call   ae <_compress2+0xae>
    return err;
}
  ae:	83 c4 50             	add    $0x50,%esp
  b1:	5b                   	pop    %ebx
  b2:	5e                   	pop    %esi
  b3:	5f                   	pop    %edi
  b4:	c3                   	ret    
  b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000c0 <_compress>:
int ZEXPORT compress (dest, destLen, source, sourceLen)
    Bytef *dest;
    uLongf *destLen;
    const Bytef *source;
    uLong sourceLen;
{
  c0:	83 ec 2c             	sub    $0x2c,%esp
    return compress2(dest, destLen, source, sourceLen, Z_DEFAULT_COMPRESSION);
  c3:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  c7:	c7 44 24 10 ff ff ff 	movl   $0xffffffff,0x10(%esp)
  ce:	ff 
  cf:	89 44 24 0c          	mov    %eax,0xc(%esp)
  d3:	8b 44 24 38          	mov    0x38(%esp),%eax
  d7:	89 44 24 08          	mov    %eax,0x8(%esp)
  db:	8b 44 24 34          	mov    0x34(%esp),%eax
  df:	89 44 24 04          	mov    %eax,0x4(%esp)
  e3:	8b 44 24 30          	mov    0x30(%esp),%eax
  e7:	89 04 24             	mov    %eax,(%esp)
  ea:	e8 11 ff ff ff       	call   0 <_compress2>
}
  ef:	83 c4 2c             	add    $0x2c,%esp
  f2:	c3                   	ret    
  f3:	90                   	nop
  f4:	90                   	nop
  f5:	90                   	nop
  f6:	90                   	nop
  f7:	90                   	nop
  f8:	90                   	nop
  f9:	90                   	nop
  fa:	90                   	nop
  fb:	90                   	nop
  fc:	90                   	nop
  fd:	90                   	nop
  fe:	90                   	nop
  ff:	90                   	nop

crc32.o:     file format pe-i386


Disassembly of section .text:

00000000 <_get_crc_table>:
{
#ifdef DYNAMIC_CRC_TABLE
  if (crc_table_empty) make_crc_table();
#endif
  return (const uLongf *)crc_table;
}
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	c3                   	ret    
   6:	8d 76 00             	lea    0x0(%esi),%esi
   9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000010 <_crc32>:
/* ========================================================================= */
uLong ZEXPORT crc32(crc, buf, len)
    uLong crc;
    const Bytef *buf;
    uInt len;
{
  10:	56                   	push   %esi
  11:	53                   	push   %ebx
  12:	8b 54 24 10          	mov    0x10(%esp),%edx
  16:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    if (buf == Z_NULL) return 0L;
  1a:	85 d2                	test   %edx,%edx
  1c:	0f 84 03 01 00 00    	je     125 <_crc32+0x115>
#ifdef DYNAMIC_CRC_TABLE
    if (crc_table_empty)
      make_crc_table();
#endif
    crc = crc ^ 0xffffffffL;
  22:	8b 44 24 0c          	mov    0xc(%esp),%eax
  26:	83 f0 ff             	xor    $0xffffffff,%eax
    while (len >= 8)
  29:	83 fb 07             	cmp    $0x7,%ebx
  2c:	0f 86 f8 00 00 00    	jbe    12a <_crc32+0x11a>
  32:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  35:	c1 e9 03             	shr    $0x3,%ecx
  38:	8d 4c ca 08          	lea    0x8(%edx,%ecx,8),%ecx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    {
      DO8(buf);
  40:	0f b6 32             	movzbl (%edx),%esi
  43:	31 c6                	xor    %eax,%esi
  45:	83 c2 08             	add    $0x8,%edx
  48:	c1 e8 08             	shr    $0x8,%eax
  4b:	81 e6 ff 00 00 00    	and    $0xff,%esi
  51:	33 04 b5 00 00 00 00 	xor    0x0(,%esi,4),%eax
  58:	0f b6 72 f9          	movzbl -0x7(%edx),%esi
  5c:	31 c6                	xor    %eax,%esi
  5e:	c1 e8 08             	shr    $0x8,%eax
  61:	81 e6 ff 00 00 00    	and    $0xff,%esi
  67:	33 04 b5 00 00 00 00 	xor    0x0(,%esi,4),%eax
  6e:	0f b6 72 fa          	movzbl -0x6(%edx),%esi
  72:	31 c6                	xor    %eax,%esi
  74:	c1 e8 08             	shr    $0x8,%eax
  77:	81 e6 ff 00 00 00    	and    $0xff,%esi
  7d:	33 04 b5 00 00 00 00 	xor    0x0(,%esi,4),%eax
  84:	0f b6 72 fb          	movzbl -0x5(%edx),%esi
  88:	31 c6                	xor    %eax,%esi
  8a:	c1 e8 08             	shr    $0x8,%eax
  8d:	81 e6 ff 00 00 00    	and    $0xff,%esi
  93:	33 04 b5 00 00 00 00 	xor    0x0(,%esi,4),%eax
  9a:	0f b6 72 fc          	movzbl -0x4(%edx),%esi
  9e:	31 c6                	xor    %eax,%esi
  a0:	c1 e8 08             	shr    $0x8,%eax
  a3:	81 e6 ff 00 00 00    	and    $0xff,%esi
  a9:	33 04 b5 00 00 00 00 	xor    0x0(,%esi,4),%eax
  b0:	0f b6 72 fd          	movzbl -0x3(%edx),%esi
  b4:	31 c6                	xor    %eax,%esi
  b6:	c1 e8 08             	shr    $0x8,%eax
  b9:	81 e6 ff 00 00 00    	and    $0xff,%esi
  bf:	33 04 b5 00 00 00 00 	xor    0x0(,%esi,4),%eax
  c6:	0f b6 72 fe          	movzbl -0x2(%edx),%esi
  ca:	31 c6                	xor    %eax,%esi
  cc:	c1 e8 08             	shr    $0x8,%eax
  cf:	81 e6 ff 00 00 00    	and    $0xff,%esi
  d5:	33 04 b5 00 00 00 00 	xor    0x0(,%esi,4),%eax
  dc:	0f b6 72 ff          	movzbl -0x1(%edx),%esi
  e0:	31 c6                	xor    %eax,%esi
  e2:	c1 e8 08             	shr    $0x8,%eax
  e5:	81 e6 ff 00 00 00    	and    $0xff,%esi
  eb:	33 04 b5 00 00 00 00 	xor    0x0(,%esi,4),%eax
#ifdef DYNAMIC_CRC_TABLE
    if (crc_table_empty)
      make_crc_table();
#endif
    crc = crc ^ 0xffffffffL;
    while (len >= 8)
  f2:	39 ca                	cmp    %ecx,%edx
  f4:	0f 85 46 ff ff ff    	jne    40 <_crc32+0x30>
  fa:	83 e3 07             	and    $0x7,%ebx
    {
      DO8(buf);
      len -= 8;
    }
    if (len) do {
  fd:	85 db                	test   %ebx,%ebx
  ff:	74 1e                	je     11f <_crc32+0x10f>
 101:	01 cb                	add    %ecx,%ebx
      DO1(buf);
 103:	41                   	inc    %ecx
 104:	88 c2                	mov    %al,%dl
 106:	c1 e8 08             	shr    $0x8,%eax
 109:	32 51 ff             	xor    -0x1(%ecx),%dl
 10c:	81 e2 ff 00 00 00    	and    $0xff,%edx
 112:	8b 34 95 00 00 00 00 	mov    0x0(,%edx,4),%esi
 119:	31 f0                	xor    %esi,%eax
    } while (--len);
 11b:	39 d9                	cmp    %ebx,%ecx
 11d:	75 e4                	jne    103 <_crc32+0xf3>
    return crc ^ 0xffffffffL;
 11f:	83 f0 ff             	xor    $0xffffffff,%eax
}
 122:	5b                   	pop    %ebx
 123:	5e                   	pop    %esi
 124:	c3                   	ret    
uLong ZEXPORT crc32(crc, buf, len)
    uLong crc;
    const Bytef *buf;
    uInt len;
{
    if (buf == Z_NULL) return 0L;
 125:	31 c0                	xor    %eax,%eax
    }
    if (len) do {
      DO1(buf);
    } while (--len);
    return crc ^ 0xffffffffL;
}
 127:	5b                   	pop    %ebx
 128:	5e                   	pop    %esi
 129:	c3                   	ret    
#ifdef DYNAMIC_CRC_TABLE
    if (crc_table_empty)
      make_crc_table();
#endif
    crc = crc ^ 0xffffffffL;
    while (len >= 8)
 12a:	89 d1                	mov    %edx,%ecx
 12c:	eb cf                	jmp    fd <_crc32+0xed>
 12e:	90                   	nop
 12f:	90                   	nop

deflate.o:     file format pe-i386


Disassembly of section .text:

00000000 <_longest_match>:
 */
#ifndef FASTEST
local uInt longest_match(s, cur_match)
    deflate_state *s;
    IPos cur_match;                             /* current match */
{
       0:	55                   	push   %ebp
       1:	57                   	push   %edi
       2:	56                   	push   %esi
       3:	53                   	push   %ebx
       4:	83 ec 30             	sub    $0x30,%esp
       7:	89 c7                	mov    %eax,%edi
       9:	89 54 24 18          	mov    %edx,0x18(%esp)
    unsigned chain_length = s->max_chain_length;/* max hash chain length */
    register Bytef *scan = s->window + s->strstart; /* current string */
       d:	8b 4f 64             	mov    0x64(%edi),%ecx
    register Bytef *match;                       /* matched string */
    register int len;                           /* length of current match */
    int best_len = s->prev_length;              /* best match length so far */
    int nice_match = s->nice_match;             /* stop if match long enough */
      10:	8b 97 88 00 00 00    	mov    0x88(%edi),%edx
local uInt longest_match(s, cur_match)
    deflate_state *s;
    IPos cur_match;                             /* current match */
{
    unsigned chain_length = s->max_chain_length;/* max hash chain length */
    register Bytef *scan = s->window + s->strstart; /* current string */
      16:	8b 5f 30             	mov    0x30(%edi),%ebx
    register Bytef *match;                       /* matched string */
    register int len;                           /* length of current match */
    int best_len = s->prev_length;              /* best match length so far */
      19:	8b 6f 70             	mov    0x70(%edi),%ebp
    int nice_match = s->nice_match;             /* stop if match long enough */
    IPos limit = s->strstart > (IPos)MAX_DIST(s) ?
      1c:	8b 7f 24             	mov    0x24(%edi),%edi
local uInt longest_match(s, cur_match)
    deflate_state *s;
    IPos cur_match;                             /* current match */
{
    unsigned chain_length = s->max_chain_length;/* max hash chain length */
    register Bytef *scan = s->window + s->strstart; /* current string */
      1f:	8d 34 0b             	lea    (%ebx,%ecx,1),%esi
    register Bytef *match;                       /* matched string */
    register int len;                           /* length of current match */
    int best_len = s->prev_length;              /* best match length so far */
    int nice_match = s->nice_match;             /* stop if match long enough */
      22:	89 54 24 20          	mov    %edx,0x20(%esp)
    IPos limit = s->strstart > (IPos)MAX_DIST(s) ?
      26:	8d 97 fa fe ff ff    	lea    -0x106(%edi),%edx
 */
#ifndef FASTEST
local uInt longest_match(s, cur_match)
    deflate_state *s;
    IPos cur_match;                             /* current match */
{
      2c:	89 44 24 24          	mov    %eax,0x24(%esp)
    unsigned chain_length = s->max_chain_length;/* max hash chain length */
    register Bytef *scan = s->window + s->strstart; /* current string */
      30:	89 74 24 1c          	mov    %esi,0x1c(%esp)
#ifndef FASTEST
local uInt longest_match(s, cur_match)
    deflate_state *s;
    IPos cur_match;                             /* current match */
{
    unsigned chain_length = s->max_chain_length;/* max hash chain length */
      34:	8b 40 74             	mov    0x74(%eax),%eax
    register Bytef *scan = s->window + s->strstart; /* current string */
    register Bytef *match;                       /* matched string */
    register int len;                           /* length of current match */
    int best_len = s->prev_length;              /* best match length so far */
      37:	89 ee                	mov    %ebp,%esi
    int nice_match = s->nice_match;             /* stop if match long enough */
    IPos limit = s->strstart > (IPos)MAX_DIST(s) ?
        s->strstart - (IPos)MAX_DIST(s) : NIL;
      39:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      40:	39 d1                	cmp    %edx,%ecx
      42:	76 0b                	jbe    4f <_longest_match+0x4f>
      44:	8d 91 06 01 00 00    	lea    0x106(%ecx),%edx
      4a:	29 fa                	sub    %edi,%edx
      4c:	89 14 24             	mov    %edx,(%esp)
    /* Stop when cur_match becomes <= limit. To simplify the code,
     * we prevent matches with the string of window index 0.
     */
    Posf *prev = s->prev;
      4f:	8b 7c 24 24          	mov    0x24(%esp),%edi
     */
    register Bytef *strend = s->window + s->strstart + MAX_MATCH - 1;
    register ush scan_start = *(ushf*)scan;
    register ush scan_end   = *(ushf*)(scan+best_len-1);
#else
    register Bytef *strend = s->window + s->strstart + MAX_MATCH;
      53:	8d 8c 0b 02 01 00 00 	lea    0x102(%ebx,%ecx,1),%ecx
      5a:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    IPos limit = s->strstart > (IPos)MAX_DIST(s) ?
        s->strstart - (IPos)MAX_DIST(s) : NIL;
    /* Stop when cur_match becomes <= limit. To simplify the code,
     * we prevent matches with the string of window index 0.
     */
    Posf *prev = s->prev;
      5e:	8b 57 38             	mov    0x38(%edi),%edx
      61:	89 54 24 08          	mov    %edx,0x8(%esp)
    uInt wmask = s->w_mask;
      65:	8b 57 2c             	mov    0x2c(%edi),%edx
      68:	89 54 24 0c          	mov    %edx,0xc(%esp)
    register Bytef *strend = s->window + s->strstart + MAX_MATCH - 1;
    register ush scan_start = *(ushf*)scan;
    register ush scan_end   = *(ushf*)(scan+best_len-1);
#else
    register Bytef *strend = s->window + s->strstart + MAX_MATCH;
    register Byte scan_end1  = scan[best_len-1];
      6c:	8b 54 24 1c          	mov    0x1c(%esp),%edx
      70:	8a 4c 2a ff          	mov    -0x1(%edx,%ebp,1),%cl
      74:	88 4c 24 17          	mov    %cl,0x17(%esp)
    register Byte scan_end   = scan[best_len];
      78:	8a 0c 2a             	mov    (%edx,%ebp,1),%cl
      7b:	88 4c 24 04          	mov    %cl,0x4(%esp)
     */
    Assert(s->hash_bits >= 8 && MAX_MATCH == 258, "Code too clever");

    /* Do not waste too much time if we already have a good match: */
    if (s->prev_length >= s->good_match) {
        chain_length >>= 2;
      7f:	89 c1                	mov    %eax,%ecx
      81:	c1 e9 02             	shr    $0x2,%ecx
      84:	3b af 84 00 00 00    	cmp    0x84(%edi),%ebp
      8a:	0f 43 c1             	cmovae %ecx,%eax
    }
    /* Do not look for matches beyond the end of the input. This is necessary
     * to make deflate deterministic.
     */
    if ((uInt)nice_match > s->lookahead) nice_match = s->lookahead;
      8d:	8b 4f 6c             	mov    0x6c(%edi),%ecx
      90:	8b 7c 24 20          	mov    0x20(%esp),%edi
      94:	39 cf                	cmp    %ecx,%edi
      96:	89 4c 24 28          	mov    %ecx,0x28(%esp)
      9a:	0f 47 f9             	cmova  %ecx,%edi
      9d:	89 7c 24 20          	mov    %edi,0x20(%esp)
      a1:	89 44 24 10          	mov    %eax,0x10(%esp)
      a5:	89 df                	mov    %ebx,%edi
      a7:	8b 54 24 18          	mov    0x18(%esp),%edx
      ab:	eb 2b                	jmp    d8 <_longest_match+0xd8>
      ad:	8d 76 00             	lea    0x0(%esi),%esi
#else
            scan_end1  = scan[best_len-1];
            scan_end   = scan[best_len];
#endif
        }
    } while ((cur_match = prev[cur_match & wmask]) > limit
      b0:	8b 44 24 0c          	mov    0xc(%esp),%eax
      b4:	8b 5c 24 08          	mov    0x8(%esp),%ebx
      b8:	21 c2                	and    %eax,%edx
      ba:	66 8b 04 53          	mov    (%ebx,%edx,2),%ax
      be:	25 ff ff 00 00       	and    $0xffff,%eax
      c3:	89 c2                	mov    %eax,%edx
             && --chain_length != 0);
      c5:	39 04 24             	cmp    %eax,(%esp)
      c8:	0f 83 06 01 00 00    	jae    1d4 <_longest_match+0x1d4>
      ce:	ff 4c 24 10          	decl   0x10(%esp)
      d2:	0f 84 fc 00 00 00    	je     1d4 <_longest_match+0x1d4>

    Assert((ulg)s->strstart <= s->window_size-MIN_LOOKAHEAD, "need lookahead");

    do {
        Assert(cur_match < s->strstart, "no future");
        match = s->window + cur_match;
      d8:	8d 04 17             	lea    (%edi,%edx,1),%eax
      db:	89 f5                	mov    %esi,%ebp
        len = (MAX_MATCH - 1) - (int)(strend-scan);
        scan = strend - (MAX_MATCH-1);

#else /* UNALIGNED_OK */

        if (match[best_len]   != scan_end  ||
      dd:	8a 0c 30             	mov    (%eax,%esi,1),%cl
      e0:	3a 4c 24 04          	cmp    0x4(%esp),%cl
      e4:	75 ca                	jne    b0 <_longest_match+0xb0>
            match[best_len-1] != scan_end1 ||
      e6:	8a 5c 30 ff          	mov    -0x1(%eax,%esi,1),%bl
      ea:	88 5c 24 18          	mov    %bl,0x18(%esp)
        len = (MAX_MATCH - 1) - (int)(strend-scan);
        scan = strend - (MAX_MATCH-1);

#else /* UNALIGNED_OK */

        if (match[best_len]   != scan_end  ||
      ee:	3a 5c 24 17          	cmp    0x17(%esp),%bl
      f2:	75 bc                	jne    b0 <_longest_match+0xb0>
            match[best_len-1] != scan_end1 ||
      f4:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
      f8:	8a 1b                	mov    (%ebx),%bl
      fa:	38 18                	cmp    %bl,(%eax)
      fc:	75 b2                	jne    b0 <_longest_match+0xb0>
            *match            != *scan     ||
      fe:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
     102:	8a 5b 01             	mov    0x1(%ebx),%bl
     105:	38 58 01             	cmp    %bl,0x1(%eax)
     108:	75 a6                	jne    b0 <_longest_match+0xb0>
         * again later. (This heuristic is not always a win.)
         * It is not necessary to compare scan[2] and match[2] since they
         * are always equal when the other bytes match, given that
         * the hash keys are equal and that HASH_BITS >= 8.
         */
        scan += 2, match++;
     10a:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
     10e:	83 c0 02             	add    $0x2,%eax
     111:	83 c5 02             	add    $0x2,%ebp
     114:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     118:	89 54 24 04          	mov    %edx,0x4(%esp)
     11c:	eb 65                	jmp    183 <_longest_match+0x183>
     11e:	66 90                	xchg   %ax,%ax

        /* We check for insufficient lookahead only every 8th comparison;
         * the 256th check will be made at strstart+258.
         */
        do {
        } while (*++scan == *++match && *++scan == *++match &&
     120:	8a 50 02             	mov    0x2(%eax),%dl
     123:	38 55 02             	cmp    %dl,0x2(%ebp)
     126:	0f 85 19 01 00 00    	jne    245 <_longest_match+0x245>
     12c:	8a 50 03             	mov    0x3(%eax),%dl
     12f:	38 55 03             	cmp    %dl,0x3(%ebp)
     132:	0f 85 fd 00 00 00    	jne    235 <_longest_match+0x235>
                 *++scan == *++match && *++scan == *++match &&
     138:	8a 50 04             	mov    0x4(%eax),%dl
     13b:	38 55 04             	cmp    %dl,0x4(%ebp)
     13e:	0f 85 e1 00 00 00    	jne    225 <_longest_match+0x225>
     144:	8a 50 05             	mov    0x5(%eax),%dl
     147:	38 55 05             	cmp    %dl,0x5(%ebp)
     14a:	0f 85 c5 00 00 00    	jne    215 <_longest_match+0x215>
                 *++scan == *++match && *++scan == *++match &&
     150:	8a 50 06             	mov    0x6(%eax),%dl
     153:	38 55 06             	cmp    %dl,0x6(%ebp)
     156:	0f 85 a9 00 00 00    	jne    205 <_longest_match+0x205>
     15c:	8a 50 07             	mov    0x7(%eax),%dl
     15f:	38 55 07             	cmp    %dl,0x7(%ebp)
     162:	0f 85 90 00 00 00    	jne    1f8 <_longest_match+0x1f8>
     168:	83 c0 08             	add    $0x8,%eax
     16b:	83 c5 08             	add    $0x8,%ebp
                 *++scan == *++match && *++scan == *++match &&
     16e:	8a 10                	mov    (%eax),%dl
     170:	38 55 00             	cmp    %dl,0x0(%ebp)
     173:	0f 85 dc 00 00 00    	jne    255 <_longest_match+0x255>
     179:	3b 6c 24 2c          	cmp    0x2c(%esp),%ebp
     17d:	0f 83 d2 00 00 00    	jae    255 <_longest_match+0x255>
                 scan < strend);
     183:	8a 50 01             	mov    0x1(%eax),%dl
     186:	38 55 01             	cmp    %dl,0x1(%ebp)
     189:	74 95                	je     120 <_longest_match+0x120>
     18b:	89 5c 24 10          	mov    %ebx,0x10(%esp)
     18f:	8b 54 24 04          	mov    0x4(%esp),%edx
     193:	45                   	inc    %ebp

        Assert(scan <= s->window+(unsigned)(s->window_size-1), "wild scan");

        len = MAX_MATCH - (int)(strend - scan);
     194:	8b 44 24 2c          	mov    0x2c(%esp),%eax
     198:	29 c5                	sub    %eax,%ebp
        scan = strend - MAX_MATCH;
     19a:	2d 02 01 00 00       	sub    $0x102,%eax
                 *++scan == *++match && *++scan == *++match &&
                 scan < strend);

        Assert(scan <= s->window+(unsigned)(s->window_size-1), "wild scan");

        len = MAX_MATCH - (int)(strend - scan);
     19f:	81 c5 02 01 00 00    	add    $0x102,%ebp
        scan = strend - MAX_MATCH;
     1a5:	89 44 24 1c          	mov    %eax,0x1c(%esp)

#endif /* UNALIGNED_OK */

        if (len > best_len) {
     1a9:	39 ee                	cmp    %ebp,%esi
     1ab:	7d 38                	jge    1e5 <_longest_match+0x1e5>
            s->match_start = cur_match;
     1ad:	8b 44 24 24          	mov    0x24(%esp),%eax
            best_len = len;
            if (len >= nice_match) break;
     1b1:	39 6c 24 20          	cmp    %ebp,0x20(%esp)
        scan = strend - MAX_MATCH;

#endif /* UNALIGNED_OK */

        if (len > best_len) {
            s->match_start = cur_match;
     1b5:	89 50 68             	mov    %edx,0x68(%eax)
            best_len = len;
            if (len >= nice_match) break;
     1b8:	7e 1a                	jle    1d4 <_longest_match+0x1d4>
#ifdef UNALIGNED_OK
            scan_end = *(ushf*)(scan+best_len-1);
#else
            scan_end1  = scan[best_len-1];
     1ba:	8b 74 24 1c          	mov    0x1c(%esp),%esi
     1be:	8a 44 2e ff          	mov    -0x1(%esi,%ebp,1),%al
     1c2:	88 44 24 17          	mov    %al,0x17(%esp)
            scan_end   = scan[best_len];
     1c6:	8a 04 2e             	mov    (%esi,%ebp,1),%al
     1c9:	88 44 24 04          	mov    %al,0x4(%esp)
     1cd:	89 ee                	mov    %ebp,%esi
     1cf:	e9 dc fe ff ff       	jmp    b0 <_longest_match+0xb0>
     1d4:	8b 44 24 28          	mov    0x28(%esp),%eax
     1d8:	39 c5                	cmp    %eax,%ebp
     1da:	0f 46 c5             	cmovbe %ebp,%eax
    } while ((cur_match = prev[cur_match & wmask]) > limit
             && --chain_length != 0);

    if ((uInt)best_len <= s->lookahead) return (uInt)best_len;
    return s->lookahead;
}
     1dd:	83 c4 30             	add    $0x30,%esp
     1e0:	5b                   	pop    %ebx
     1e1:	5e                   	pop    %esi
     1e2:	5f                   	pop    %edi
     1e3:	5d                   	pop    %ebp
     1e4:	c3                   	ret    
     1e5:	8a 44 24 18          	mov    0x18(%esp),%al
     1e9:	89 f5                	mov    %esi,%ebp
     1eb:	88 4c 24 04          	mov    %cl,0x4(%esp)
     1ef:	88 44 24 17          	mov    %al,0x17(%esp)
     1f3:	e9 b8 fe ff ff       	jmp    b0 <_longest_match+0xb0>
     1f8:	89 5c 24 10          	mov    %ebx,0x10(%esp)
     1fc:	8b 54 24 04          	mov    0x4(%esp),%edx
         * the 256th check will be made at strstart+258.
         */
        do {
        } while (*++scan == *++match && *++scan == *++match &&
                 *++scan == *++match && *++scan == *++match &&
                 *++scan == *++match && *++scan == *++match &&
     200:	83 c5 07             	add    $0x7,%ebp
     203:	eb 8f                	jmp    194 <_longest_match+0x194>
     205:	89 5c 24 10          	mov    %ebx,0x10(%esp)
     209:	8b 54 24 04          	mov    0x4(%esp),%edx
     20d:	83 c5 06             	add    $0x6,%ebp
     210:	e9 7f ff ff ff       	jmp    194 <_longest_match+0x194>
     215:	89 5c 24 10          	mov    %ebx,0x10(%esp)
     219:	8b 54 24 04          	mov    0x4(%esp),%edx
        /* We check for insufficient lookahead only every 8th comparison;
         * the 256th check will be made at strstart+258.
         */
        do {
        } while (*++scan == *++match && *++scan == *++match &&
                 *++scan == *++match && *++scan == *++match &&
     21d:	83 c5 05             	add    $0x5,%ebp
     220:	e9 6f ff ff ff       	jmp    194 <_longest_match+0x194>
     225:	89 5c 24 10          	mov    %ebx,0x10(%esp)
     229:	8b 54 24 04          	mov    0x4(%esp),%edx
     22d:	83 c5 04             	add    $0x4,%ebp
     230:	e9 5f ff ff ff       	jmp    194 <_longest_match+0x194>
     235:	89 5c 24 10          	mov    %ebx,0x10(%esp)
     239:	8b 54 24 04          	mov    0x4(%esp),%edx

        /* We check for insufficient lookahead only every 8th comparison;
         * the 256th check will be made at strstart+258.
         */
        do {
        } while (*++scan == *++match && *++scan == *++match &&
     23d:	83 c5 03             	add    $0x3,%ebp
     240:	e9 4f ff ff ff       	jmp    194 <_longest_match+0x194>
     245:	89 5c 24 10          	mov    %ebx,0x10(%esp)
     249:	8b 54 24 04          	mov    0x4(%esp),%edx
     24d:	83 c5 02             	add    $0x2,%ebp
     250:	e9 3f ff ff ff       	jmp    194 <_longest_match+0x194>
     255:	89 5c 24 10          	mov    %ebx,0x10(%esp)
     259:	8b 54 24 04          	mov    0x4(%esp),%edx
     25d:	e9 32 ff ff ff       	jmp    194 <_longest_match+0x194>
     262:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <_fill_window>:
 *    performed for at least two bytes (required for the zip translate_eol
 *    option -- not supported here).
 */
local void fill_window(s)
    deflate_state *s;
{
     270:	55                   	push   %ebp
     271:	57                   	push   %edi
     272:	56                   	push   %esi
     273:	53                   	push   %ebx
     274:	83 ec 3c             	sub    $0x3c,%esp
     277:	89 c6                	mov    %eax,%esi
    register unsigned n, m;
    register Posf *p;
    unsigned more;    /* Amount of free space at the end of the window. */
    uInt wsize = s->w_size;
     279:	8b 78 24             	mov    0x24(%eax),%edi
     27c:	8b 58 6c             	mov    0x6c(%eax),%ebx
		*p = (Pos)(m >= wsize ? m-wsize : NIL);
	    } while (--n);

	    n = wsize;
#ifndef FASTEST
	    p = &s->prev[n];
     27f:	8d 04 3f             	lea    (%edi,%edi,1),%eax
     282:	89 44 24 2c          	mov    %eax,0x2c(%esp)
     286:	eb 7e                	jmp    306 <_fill_window+0x96>

    do {
        more = (unsigned)(s->window_size -(ulg)s->lookahead -(ulg)s->strstart);

        /* Deal with !@#$% 64K limit: */
        if (more == 0 && s->strstart == 0 && s->lookahead == 0) {
     288:	09 c3                	or     %eax,%ebx
     28a:	0f 85 a8 00 00 00    	jne    338 <_fill_window+0xc8>
    deflate_state *s;
{
    register unsigned n, m;
    register Posf *p;
    unsigned more;    /* Amount of free space at the end of the window. */
    uInt wsize = s->w_size;
     290:	89 fd                	mov    %edi,%ebp
		 */
	    } while (--n);
#endif
            more += wsize;
        }
        if (s->strm->avail_in == 0) return;
     292:	8b 1e                	mov    (%esi),%ebx
     294:	8b 53 04             	mov    0x4(%ebx),%edx
     297:	85 d2                	test   %edx,%edx
     299:	0f 84 91 00 00 00    	je     330 <_fill_window+0xc0>
         * Otherwise, window_size == 2*WSIZE so more >= 2.
         * If there was sliding, more >= WSIZE. So in all cases, more >= 2.
         */
        Assert(more >= 2, "more < 2");

        n = read_buf(s->strm, s->window + s->strstart + s->lookahead, more);
     29f:	8b 46 30             	mov    0x30(%esi),%eax
     2a2:	8b 4e 6c             	mov    0x6c(%esi),%ecx
     2a5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     2a9:	8b 46 64             	mov    0x64(%esi),%eax
     2ac:	89 44 24 20          	mov    %eax,0x20(%esp)
    unsigned size;
{
    unsigned len = strm->avail_in;

    if (len > size) len = size;
    if (len == 0) return 0;
     2b0:	31 c0                	xor    %eax,%eax
    Bytef *buf;
    unsigned size;
{
    unsigned len = strm->avail_in;

    if (len > size) len = size;
     2b2:	39 d5                	cmp    %edx,%ebp
     2b4:	0f 83 26 01 00 00    	jae    3e0 <_fill_window+0x170>
    if (len == 0) return 0;
     2ba:	85 ed                	test   %ebp,%ebp
     2bc:	0f 85 11 01 00 00    	jne    3d3 <_fill_window+0x163>
         * If there was sliding, more >= WSIZE. So in all cases, more >= 2.
         */
        Assert(more >= 2, "more < 2");

        n = read_buf(s->strm, s->window + s->strstart + s->lookahead, more);
        s->lookahead += n;
     2c2:	8d 1c 08             	lea    (%eax,%ecx,1),%ebx
     2c5:	89 5e 6c             	mov    %ebx,0x6c(%esi)

        /* Initialize the hash value now that we have some input: */
        if (s->lookahead >= MIN_MATCH) {
     2c8:	83 fb 02             	cmp    $0x2,%ebx
     2cb:	76 30                	jbe    2fd <_fill_window+0x8d>
            s->ins_h = s->window[s->strstart];
     2cd:	8b 4e 30             	mov    0x30(%esi),%ecx
     2d0:	8b 56 64             	mov    0x64(%esi),%edx
     2d3:	31 c0                	xor    %eax,%eax
     2d5:	8a 04 11             	mov    (%ecx,%edx,1),%al
     2d8:	89 46 40             	mov    %eax,0x40(%esi)
            UPDATE_HASH(s, s->ins_h, s->window[s->strstart+1]);
     2db:	0f b6 6c 11 01       	movzbl 0x1(%ecx,%edx,1),%ebp
     2e0:	8b 4e 50             	mov    0x50(%esi),%ecx
     2e3:	81 e5 ff 00 00 00    	and    $0xff,%ebp
     2e9:	d3 e0                	shl    %cl,%eax
     2eb:	31 e8                	xor    %ebp,%eax
     2ed:	8b 56 4c             	mov    0x4c(%esi),%edx
     2f0:	21 d0                	and    %edx,%eax
        }
        /* If the whole input has less than MIN_MATCH bytes, ins_h is garbage,
         * but this is not important since only literal bytes will be emitted.
         */

    } while (s->lookahead < MIN_LOOKAHEAD && s->strm->avail_in != 0);
     2f2:	81 fb 05 01 00 00    	cmp    $0x105,%ebx
        s->lookahead += n;

        /* Initialize the hash value now that we have some input: */
        if (s->lookahead >= MIN_MATCH) {
            s->ins_h = s->window[s->strstart];
            UPDATE_HASH(s, s->ins_h, s->window[s->strstart+1]);
     2f8:	89 46 40             	mov    %eax,0x40(%esi)
        }
        /* If the whole input has less than MIN_MATCH bytes, ins_h is garbage,
         * but this is not important since only literal bytes will be emitted.
         */

    } while (s->lookahead < MIN_LOOKAHEAD && s->strm->avail_in != 0);
     2fb:	77 33                	ja     330 <_fill_window+0xc0>
     2fd:	8b 06                	mov    (%esi),%eax
     2ff:	8b 48 04             	mov    0x4(%eax),%ecx
     302:	85 c9                	test   %ecx,%ecx
     304:	74 2a                	je     330 <_fill_window+0xc0>
    register Posf *p;
    unsigned more;    /* Amount of free space at the end of the window. */
    uInt wsize = s->w_size;

    do {
        more = (unsigned)(s->window_size -(ulg)s->lookahead -(ulg)s->strstart);
     306:	8b 6e 34             	mov    0x34(%esi),%ebp
     309:	8b 46 64             	mov    0x64(%esi),%eax
     30c:	29 dd                	sub    %ebx,%ebp

        /* Deal with !@#$% 64K limit: */
        if (more == 0 && s->strstart == 0 && s->lookahead == 0) {
     30e:	29 c5                	sub    %eax,%ebp
     310:	0f 84 72 ff ff ff    	je     288 <_fill_window+0x18>
            more = wsize;

        } else if (more == (unsigned)(-1)) {
     316:	83 fd ff             	cmp    $0xffffffff,%ebp
     319:	75 1d                	jne    338 <_fill_window+0xc8>
		 */
	    } while (--n);
#endif
            more += wsize;
        }
        if (s->strm->avail_in == 0) return;
     31b:	8b 1e                	mov    (%esi),%ebx

        } else if (more == (unsigned)(-1)) {
            /* Very unlikely, but possible on 16 bit machine if strstart == 0
             * and lookahead == 1 (input done one byte at time)
             */
            more--;
     31d:	bd fe ff ff ff       	mov    $0xfffffffe,%ebp
		 */
	    } while (--n);
#endif
            more += wsize;
        }
        if (s->strm->avail_in == 0) return;
     322:	8b 53 04             	mov    0x4(%ebx),%edx
     325:	85 d2                	test   %edx,%edx
     327:	0f 85 72 ff ff ff    	jne    29f <_fill_window+0x2f>
     32d:	8d 76 00             	lea    0x0(%esi),%esi
        /* If the whole input has less than MIN_MATCH bytes, ins_h is garbage,
         * but this is not important since only literal bytes will be emitted.
         */

    } while (s->lookahead < MIN_LOOKAHEAD && s->strm->avail_in != 0);
}
     330:	83 c4 3c             	add    $0x3c,%esp
     333:	5b                   	pop    %ebx
     334:	5e                   	pop    %esi
     335:	5f                   	pop    %edi
     336:	5d                   	pop    %ebp
     337:	c3                   	ret    
            more--;

        /* If the window is almost full and there is insufficient lookahead,
         * move the upper half to the lower one to make room in the upper half.
         */
        } else if (s->strstart >= wsize+MAX_DIST(s)) {
     338:	8b 56 24             	mov    0x24(%esi),%edx
     33b:	01 fa                	add    %edi,%edx
     33d:	81 ea 06 01 00 00    	sub    $0x106,%edx
     343:	39 d0                	cmp    %edx,%eax
     345:	0f 82 47 ff ff ff    	jb     292 <_fill_window+0x22>

            zmemcpy(s->window, s->window+wsize, (unsigned)wsize);
     34b:	8b 46 30             	mov    0x30(%esi),%eax
     34e:	89 7c 24 08          	mov    %edi,0x8(%esp)
     352:	89 04 24             	mov    %eax,(%esp)
     355:	8d 14 38             	lea    (%eax,%edi,1),%edx
     358:	89 54 24 04          	mov    %edx,0x4(%esp)
     35c:	e8 00 00 00 00       	call   361 <_fill_window+0xf1>
            s->match_start -= wsize;
     361:	8b 46 68             	mov    0x68(%esi),%eax
     364:	29 f8                	sub    %edi,%eax
            s->strstart    -= wsize; /* we now have strstart >= MAX_DIST */
     366:	8b 56 64             	mov    0x64(%esi),%edx
            s->block_start -= (long) wsize;
     369:	8b 4e 54             	mov    0x54(%esi),%ecx
         * move the upper half to the lower one to make room in the upper half.
         */
        } else if (s->strstart >= wsize+MAX_DIST(s)) {

            zmemcpy(s->window, s->window+wsize, (unsigned)wsize);
            s->match_start -= wsize;
     36c:	89 46 68             	mov    %eax,0x68(%esi)
               at the expense of memory usage). We slide even when level == 0
               to keep the hash table consistent if we switch back to level > 0
               later. (Using level 0 permanently is not an optimal usage of
               zlib, so we don't care about this pathological case.)
             */
	    n = s->hash_size;
     36f:	8b 5e 44             	mov    0x44(%esi),%ebx
	    p = &s->head[n];
     372:	8b 46 3c             	mov    0x3c(%esi),%eax
         */
        } else if (s->strstart >= wsize+MAX_DIST(s)) {

            zmemcpy(s->window, s->window+wsize, (unsigned)wsize);
            s->match_start -= wsize;
            s->strstart    -= wsize; /* we now have strstart >= MAX_DIST */
     375:	29 fa                	sub    %edi,%edx
            s->block_start -= (long) wsize;
     377:	29 f9                	sub    %edi,%ecx
         */
        } else if (s->strstart >= wsize+MAX_DIST(s)) {

            zmemcpy(s->window, s->window+wsize, (unsigned)wsize);
            s->match_start -= wsize;
            s->strstart    -= wsize; /* we now have strstart >= MAX_DIST */
     379:	89 56 64             	mov    %edx,0x64(%esi)
            s->block_start -= (long) wsize;
     37c:	89 4e 54             	mov    %ecx,0x54(%esi)
               to keep the hash table consistent if we switch back to level > 0
               later. (Using level 0 permanently is not an optimal usage of
               zlib, so we don't care about this pathological case.)
             */
	    n = s->hash_size;
	    p = &s->head[n];
     37f:	8d 14 58             	lea    (%eax,%ebx,2),%edx
	    do {
		m = *--p;
     382:	83 ea 02             	sub    $0x2,%edx
     385:	31 c9                	xor    %ecx,%ecx
     387:	66 8b 0a             	mov    (%edx),%cx
		*p = (Pos)(m >= wsize ? m-wsize : NIL);
     38a:	89 c8                	mov    %ecx,%eax
     38c:	29 f8                	sub    %edi,%eax
     38e:	39 cf                	cmp    %ecx,%edi
     390:	b9 00 00 00 00       	mov    $0x0,%ecx
     395:	0f 47 c1             	cmova  %ecx,%eax
	    } while (--n);
     398:	4b                   	dec    %ebx
             */
	    n = s->hash_size;
	    p = &s->head[n];
	    do {
		m = *--p;
		*p = (Pos)(m >= wsize ? m-wsize : NIL);
     399:	66 89 02             	mov    %ax,(%edx)
	    } while (--n);
     39c:	75 e4                	jne    382 <_fill_window+0x112>

	    n = wsize;
#ifndef FASTEST
	    p = &s->prev[n];
     39e:	8b 54 24 2c          	mov    0x2c(%esp),%edx
     3a2:	8b 46 38             	mov    0x38(%esi),%eax
     3a5:	01 c2                	add    %eax,%edx
    deflate_state *s;
{
    register unsigned n, m;
    register Posf *p;
    unsigned more;    /* Amount of free space at the end of the window. */
    uInt wsize = s->w_size;
     3a7:	89 fb                	mov    %edi,%ebx
     3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

	    n = wsize;
#ifndef FASTEST
	    p = &s->prev[n];
	    do {
		m = *--p;
     3b0:	83 ea 02             	sub    $0x2,%edx
     3b3:	31 c9                	xor    %ecx,%ecx
     3b5:	66 8b 0a             	mov    (%edx),%cx
		*p = (Pos)(m >= wsize ? m-wsize : NIL);
     3b8:	89 c8                	mov    %ecx,%eax
     3ba:	29 f8                	sub    %edi,%eax
     3bc:	39 cf                	cmp    %ecx,%edi
     3be:	b9 00 00 00 00       	mov    $0x0,%ecx
     3c3:	0f 47 c1             	cmova  %ecx,%eax
		/* If n is not on any hash chain, prev[n] is garbage but
		 * its value will never be used.
		 */
	    } while (--n);
     3c6:	4b                   	dec    %ebx
	    n = wsize;
#ifndef FASTEST
	    p = &s->prev[n];
	    do {
		m = *--p;
		*p = (Pos)(m >= wsize ? m-wsize : NIL);
     3c7:	66 89 02             	mov    %ax,(%edx)
		/* If n is not on any hash chain, prev[n] is garbage but
		 * its value will never be used.
		 */
	    } while (--n);
     3ca:	75 e4                	jne    3b0 <_fill_window+0x140>
#endif
            more += wsize;
     3cc:	01 fd                	add    %edi,%ebp
     3ce:	e9 bf fe ff ff       	jmp    292 <_fill_window+0x22>
     3d3:	89 d0                	mov    %edx,%eax
    unsigned size;
{
    unsigned len = strm->avail_in;

    if (len > size) len = size;
    if (len == 0) return 0;
     3d5:	89 ea                	mov    %ebp,%edx
     3d7:	29 e8                	sub    %ebp,%eax
     3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    strm->avail_in  -= len;
     3e0:	89 43 04             	mov    %eax,0x4(%ebx)

    if (!strm->state->noheader) {
     3e3:	8b 43 1c             	mov    0x1c(%ebx),%eax
     3e6:	8b 40 18             	mov    0x18(%eax),%eax
     3e9:	85 c0                	test   %eax,%eax
     3eb:	74 43                	je     430 <_fill_window+0x1c0>
         * Otherwise, window_size == 2*WSIZE so more >= 2.
         * If there was sliding, more >= WSIZE. So in all cases, more >= 2.
         */
        Assert(more >= 2, "more < 2");

        n = read_buf(s->strm, s->window + s->strstart + s->lookahead, more);
     3ed:	8b 6c 24 20          	mov    0x20(%esp),%ebp
     3f1:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     3f5:	01 e9                	add    %ebp,%ecx
    strm->avail_in  -= len;

    if (!strm->state->noheader) {
        strm->adler = adler32(strm->adler, strm->next_in, len);
    }
    zmemcpy(buf, strm->next_in, len);
     3f7:	89 54 24 1c          	mov    %edx,0x1c(%esp)
         * Otherwise, window_size == 2*WSIZE so more >= 2.
         * If there was sliding, more >= WSIZE. So in all cases, more >= 2.
         */
        Assert(more >= 2, "more < 2");

        n = read_buf(s->strm, s->window + s->strstart + s->lookahead, more);
     3fb:	01 c1                	add    %eax,%ecx
    strm->avail_in  -= len;

    if (!strm->state->noheader) {
        strm->adler = adler32(strm->adler, strm->next_in, len);
    }
    zmemcpy(buf, strm->next_in, len);
     3fd:	8b 03                	mov    (%ebx),%eax
     3ff:	89 44 24 04          	mov    %eax,0x4(%esp)
     403:	89 54 24 08          	mov    %edx,0x8(%esp)
     407:	89 0c 24             	mov    %ecx,(%esp)
     40a:	e8 00 00 00 00       	call   40f <_fill_window+0x19f>
    strm->next_in  += len;
     40f:	8b 54 24 1c          	mov    0x1c(%esp),%edx
     413:	8b 03                	mov    (%ebx),%eax
     415:	8b 4e 6c             	mov    0x6c(%esi),%ecx
     418:	01 d0                	add    %edx,%eax
     41a:	89 03                	mov    %eax,(%ebx)
    strm->total_in += len;
     41c:	8b 43 08             	mov    0x8(%ebx),%eax
     41f:	01 d0                	add    %edx,%eax
     421:	89 43 08             	mov    %eax,0x8(%ebx)
     424:	89 d0                	mov    %edx,%eax
     426:	e9 97 fe ff ff       	jmp    2c2 <_fill_window+0x52>
     42b:	90                   	nop
     42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (len == 0) return 0;

    strm->avail_in  -= len;

    if (!strm->state->noheader) {
        strm->adler = adler32(strm->adler, strm->next_in, len);
     430:	89 54 24 08          	mov    %edx,0x8(%esp)
     434:	89 4c 24 28          	mov    %ecx,0x28(%esp)
     438:	8b 03                	mov    (%ebx),%eax
     43a:	89 54 24 24          	mov    %edx,0x24(%esp)
     43e:	89 44 24 04          	mov    %eax,0x4(%esp)
     442:	8b 43 30             	mov    0x30(%ebx),%eax
     445:	89 04 24             	mov    %eax,(%esp)
     448:	e8 00 00 00 00       	call   44d <_fill_window+0x1dd>
     44d:	8b 4c 24 28          	mov    0x28(%esp),%ecx
     451:	89 43 30             	mov    %eax,0x30(%ebx)
     454:	8b 54 24 24          	mov    0x24(%esp),%edx
     458:	eb 93                	jmp    3ed <_fill_window+0x17d>
     45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000460 <_flush_pending>:
 * to avoid allocating a large strm->next_out buffer and copying into it.
 * (See also read_buf()).
 */
local void flush_pending(strm)
    z_streamp strm;
{
     460:	56                   	push   %esi
     461:	53                   	push   %ebx
     462:	83 ec 14             	sub    $0x14,%esp
    unsigned len = strm->state->pending;
     465:	8b 48 1c             	mov    0x1c(%eax),%ecx

    if (len > strm->avail_out) len = strm->avail_out;
     468:	8b 50 10             	mov    0x10(%eax),%edx
 * (See also read_buf()).
 */
local void flush_pending(strm)
    z_streamp strm;
{
    unsigned len = strm->state->pending;
     46b:	8b 59 14             	mov    0x14(%ecx),%ebx
     46e:	39 d3                	cmp    %edx,%ebx
     470:	0f 47 da             	cmova  %edx,%ebx

    if (len > strm->avail_out) len = strm->avail_out;
    if (len == 0) return;
     473:	85 db                	test   %ebx,%ebx
     475:	75 09                	jne    480 <_flush_pending+0x20>
    strm->avail_out  -= len;
    strm->state->pending -= len;
    if (strm->state->pending == 0) {
        strm->state->pending_out = strm->state->pending_buf;
    }
}
     477:	83 c4 14             	add    $0x14,%esp
     47a:	5b                   	pop    %ebx
     47b:	5e                   	pop    %esi
     47c:	c3                   	ret    
     47d:	8d 76 00             	lea    0x0(%esi),%esi
     480:	89 c6                	mov    %eax,%esi
    unsigned len = strm->state->pending;

    if (len > strm->avail_out) len = strm->avail_out;
    if (len == 0) return;

    zmemcpy(strm->next_out, strm->state->pending_out, len);
     482:	8b 51 10             	mov    0x10(%ecx),%edx
     485:	8b 40 0c             	mov    0xc(%eax),%eax
     488:	89 54 24 04          	mov    %edx,0x4(%esp)
     48c:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     490:	89 04 24             	mov    %eax,(%esp)
     493:	e8 00 00 00 00       	call   498 <_flush_pending+0x38>
    strm->next_out  += len;
     498:	8b 46 0c             	mov    0xc(%esi),%eax
     49b:	01 d8                	add    %ebx,%eax
    strm->state->pending_out  += len;
    strm->total_out += len;
     49d:	8b 4e 14             	mov    0x14(%esi),%ecx

    if (len > strm->avail_out) len = strm->avail_out;
    if (len == 0) return;

    zmemcpy(strm->next_out, strm->state->pending_out, len);
    strm->next_out  += len;
     4a0:	89 46 0c             	mov    %eax,0xc(%esi)
    strm->state->pending_out  += len;
     4a3:	8b 46 1c             	mov    0x1c(%esi),%eax
    strm->total_out += len;
     4a6:	01 d9                	add    %ebx,%ecx
    if (len > strm->avail_out) len = strm->avail_out;
    if (len == 0) return;

    zmemcpy(strm->next_out, strm->state->pending_out, len);
    strm->next_out  += len;
    strm->state->pending_out  += len;
     4a8:	8b 50 10             	mov    0x10(%eax),%edx
     4ab:	01 da                	add    %ebx,%edx
     4ad:	89 50 10             	mov    %edx,0x10(%eax)
    strm->total_out += len;
    strm->avail_out  -= len;
     4b0:	8b 56 10             	mov    0x10(%esi),%edx
     4b3:	29 da                	sub    %ebx,%edx
    if (len == 0) return;

    zmemcpy(strm->next_out, strm->state->pending_out, len);
    strm->next_out  += len;
    strm->state->pending_out  += len;
    strm->total_out += len;
     4b5:	89 4e 14             	mov    %ecx,0x14(%esi)
    strm->avail_out  -= len;
     4b8:	89 56 10             	mov    %edx,0x10(%esi)
    strm->state->pending -= len;
     4bb:	8b 50 14             	mov    0x14(%eax),%edx
     4be:	29 da                	sub    %ebx,%edx
     4c0:	89 50 14             	mov    %edx,0x14(%eax)
    if (strm->state->pending == 0) {
     4c3:	85 d2                	test   %edx,%edx
     4c5:	75 b0                	jne    477 <_flush_pending+0x17>
        strm->state->pending_out = strm->state->pending_buf;
     4c7:	8b 50 08             	mov    0x8(%eax),%edx
     4ca:	89 50 10             	mov    %edx,0x10(%eax)
    }
}
     4cd:	83 c4 14             	add    $0x14,%esp
     4d0:	5b                   	pop    %ebx
     4d1:	5e                   	pop    %esi
     4d2:	c3                   	ret    
     4d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004e0 <_deflate_slow>:
 * no better match at the next window position.
 */
local block_state deflate_slow(s, flush)
    deflate_state *s;
    int flush;
{
     4e0:	55                   	push   %ebp
     4e1:	57                   	push   %edi
     4e2:	56                   	push   %esi
     4e3:	53                   	push   %ebx
     4e4:	83 ec 3c             	sub    $0x3c,%esp
    IPos hash_head = NIL;    /* head of hash chain */
     4e7:	31 f6                	xor    %esi,%esi
 * no better match at the next window position.
 */
local block_state deflate_slow(s, flush)
    deflate_state *s;
    int flush;
{
     4e9:	8b 6c 24 50          	mov    0x50(%esp),%ebp
     4ed:	8b 7d 6c             	mov    0x6c(%ebp),%edi
    IPos hash_head = NIL;    /* head of hash chain */
     4f0:	89 f8                	mov    %edi,%eax
     4f2:	89 f7                	mov    %esi,%edi
     4f4:	89 c6                	mov    %eax,%esi
        /* Make sure that we always have enough lookahead, except
         * at the end of the input file. We need MAX_MATCH bytes
         * for the next match, plus MIN_MATCH bytes to insert the
         * string following the next match.
         */
        if (s->lookahead < MIN_LOOKAHEAD) {
     4f6:	81 fe 05 01 00 00    	cmp    $0x105,%esi
     4fc:	0f 86 3f 02 00 00    	jbe    741 <_deflate_slow+0x261>

        /* Insert the string window[strstart .. strstart+2] in the
         * dictionary, and set hash_head to the head of the hash chain:
         */
        if (s->lookahead >= MIN_MATCH) {
            INSERT_STRING(s, s->strstart, hash_head);
     502:	8b 45 64             	mov    0x64(%ebp),%eax
     505:	8b 55 30             	mov    0x30(%ebp),%edx
     508:	31 db                	xor    %ebx,%ebx
     50a:	8b 4d 50             	mov    0x50(%ebp),%ecx
     50d:	8a 5c 02 02          	mov    0x2(%edx,%eax,1),%bl
     511:	8b 55 40             	mov    0x40(%ebp),%edx
     514:	d3 e2                	shl    %cl,%edx
     516:	8b 75 4c             	mov    0x4c(%ebp),%esi
     519:	31 da                	xor    %ebx,%edx
     51b:	8b 4d 3c             	mov    0x3c(%ebp),%ecx
     51e:	21 f2                	and    %esi,%edx
     520:	89 55 40             	mov    %edx,0x40(%ebp)
     523:	8b 75 2c             	mov    0x2c(%ebp),%esi
     526:	8d 14 51             	lea    (%ecx,%edx,2),%edx
     529:	8b 5d 38             	mov    0x38(%ebp),%ebx
     52c:	21 c6                	and    %eax,%esi
     52e:	31 ff                	xor    %edi,%edi
     530:	66 8b 0a             	mov    (%edx),%cx
     533:	66 89 0c 73          	mov    %cx,(%ebx,%esi,2)
     537:	66 89 cf             	mov    %cx,%di
     53a:	66 89 02             	mov    %ax,(%edx)
        }

        /* Find the longest match, discarding those <= prev_length.
         */
        s->prev_length = s->match_length, s->prev_match = s->match_start;
     53d:	8b 55 58             	mov    0x58(%ebp),%edx
     540:	8b 4d 68             	mov    0x68(%ebp),%ecx
     543:	89 55 70             	mov    %edx,0x70(%ebp)
     546:	89 4d 5c             	mov    %ecx,0x5c(%ebp)
        s->match_length = MIN_MATCH-1;
     549:	c7 45 58 02 00 00 00 	movl   $0x2,0x58(%ebp)

        if (hash_head != NIL && s->prev_length < s->max_lazy_match &&
     550:	85 ff                	test   %edi,%edi
     552:	74 40                	je     594 <_deflate_slow+0xb4>
     554:	3b 55 78             	cmp    0x78(%ebp),%edx
     557:	73 3b                	jae    594 <_deflate_slow+0xb4>
            s->strstart - hash_head <= MAX_DIST(s)) {
     559:	8b 75 24             	mov    0x24(%ebp),%esi
     55c:	89 c3                	mov    %eax,%ebx
     55e:	29 fb                	sub    %edi,%ebx
     560:	8d 8e fa fe ff ff    	lea    -0x106(%esi),%ecx
        /* Find the longest match, discarding those <= prev_length.
         */
        s->prev_length = s->match_length, s->prev_match = s->match_start;
        s->match_length = MIN_MATCH-1;

        if (hash_head != NIL && s->prev_length < s->max_lazy_match &&
     566:	39 cb                	cmp    %ecx,%ebx
     568:	77 2a                	ja     594 <_deflate_slow+0xb4>
            s->strstart - hash_head <= MAX_DIST(s)) {
            /* To simplify the code, we prevent matches with the string
             * of window index 0 (in particular we have to avoid a match
             * of the string with itself at the start of the input file).
             */
            if (s->strategy != Z_HUFFMAN_ONLY) {
     56a:	83 bd 80 00 00 00 02 	cmpl   $0x2,0x80(%ebp)
     571:	0f 84 2c 03 00 00    	je     8a3 <_deflate_slow+0x3c3>
                s->match_length = longest_match (s, hash_head);
     577:	89 fa                	mov    %edi,%edx
     579:	89 e8                	mov    %ebp,%eax
     57b:	e8 80 fa ff ff       	call   0 <_longest_match>
     580:	89 c2                	mov    %eax,%edx
     582:	89 45 58             	mov    %eax,0x58(%ebp)
            }
            /* longest_match() sets match_start */

            if (s->match_length <= 5 && (s->strategy == Z_FILTERED ||
     585:	83 f8 05             	cmp    $0x5,%eax
     588:	0f 86 ee 02 00 00    	jbe    87c <_deflate_slow+0x39c>
     58e:	8b 55 70             	mov    0x70(%ebp),%edx
     591:	8b 45 64             	mov    0x64(%ebp),%eax
            }
        }
        /* If there was a match at the previous step and the current
         * match is not better, output the previous match:
         */
        if (s->prev_length >= MIN_MATCH && s->match_length <= s->prev_length) {
     594:	83 fa 02             	cmp    $0x2,%edx
     597:	0f 86 e3 01 00 00    	jbe    780 <_deflate_slow+0x2a0>
     59d:	39 55 58             	cmp    %edx,0x58(%ebp)
     5a0:	0f 87 da 01 00 00    	ja     780 <_deflate_slow+0x2a0>
     5a6:	8b 4d 6c             	mov    0x6c(%ebp),%ecx
            uInt max_insert = s->strstart + s->lookahead - MIN_MATCH;
            /* Do not insert strings in hash table beyond this. */

            check_match(s, s->strstart-1, s->prev_match, s->prev_length);

            _tr_tally_dist(s, s->strstart -1 - s->prev_match,
     5a9:	83 ea 03             	sub    $0x3,%edx
        }
        /* If there was a match at the previous step and the current
         * match is not better, output the previous match:
         */
        if (s->prev_length >= MIN_MATCH && s->match_length <= s->prev_length) {
            uInt max_insert = s->strstart + s->lookahead - MIN_MATCH;
     5ac:	8d 5c 08 fd          	lea    -0x3(%eax,%ecx,1),%ebx
            /* Do not insert strings in hash table beyond this. */

            check_match(s, s->strstart-1, s->prev_match, s->prev_length);

            _tr_tally_dist(s, s->strstart -1 - s->prev_match,
     5b0:	8b 4d 5c             	mov    0x5c(%ebp),%ecx
     5b3:	29 c8                	sub    %ecx,%eax
        }
        /* If there was a match at the previous step and the current
         * match is not better, output the previous match:
         */
        if (s->prev_length >= MIN_MATCH && s->match_length <= s->prev_length) {
            uInt max_insert = s->strstart + s->lookahead - MIN_MATCH;
     5b5:	89 5c 24 14          	mov    %ebx,0x14(%esp)
            /* Do not insert strings in hash table beyond this. */

            check_match(s, s->strstart-1, s->prev_match, s->prev_length);

            _tr_tally_dist(s, s->strstart -1 - s->prev_match,
     5b9:	8b 8d 98 16 00 00    	mov    0x1698(%ebp),%ecx
     5bf:	8b 9d 9c 16 00 00    	mov    0x169c(%ebp),%ebx
     5c5:	8d 70 ff             	lea    -0x1(%eax),%esi
     5c8:	66 89 34 4b          	mov    %si,(%ebx,%ecx,2)
     5cc:	8b 9d 90 16 00 00    	mov    0x1690(%ebp),%ebx
     5d2:	8d 71 01             	lea    0x1(%ecx),%esi
     5d5:	89 b5 98 16 00 00    	mov    %esi,0x1698(%ebp)
     5db:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
     5de:	8d 58 fe             	lea    -0x2(%eax),%ebx
     5e1:	88 d0                	mov    %dl,%al
     5e3:	31 d2                	xor    %edx,%edx
     5e5:	88 c2                	mov    %al,%dl
     5e7:	8a 82 00 00 00 00    	mov    0x0(%edx),%al
     5ed:	25 ff 00 00 00       	and    $0xff,%eax
     5f2:	66 ff 84 85 90 04 00 	incw   0x490(%ebp,%eax,4)
     5f9:	00 
     5fa:	66 81 fb ff 00       	cmp    $0xff,%bx
     5ff:	0f 87 1b 02 00 00    	ja     820 <_deflate_slow+0x340>
     605:	31 c0                	xor    %eax,%eax
     607:	66 89 d8             	mov    %bx,%ax
     60a:	8a 98 00 00 00 00    	mov    0x0(%eax),%bl
     610:	81 e3 ff 00 00 00    	and    $0xff,%ebx
     616:	89 d8                	mov    %ebx,%eax
     618:	66 ff 84 85 80 09 00 	incw   0x980(%ebp,%eax,4)
     61f:	00 
     620:	89 7c 24 18          	mov    %edi,0x18(%esp)
     624:	8b 85 98 16 00 00    	mov    0x1698(%ebp),%eax
     62a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     62e:	8b 85 94 16 00 00    	mov    0x1694(%ebp),%eax
     634:	48                   	dec    %eax
     635:	89 44 24 20          	mov    %eax,0x20(%esp)
            /* Insert in hash table all strings up to the end of the match.
             * strstart-1 and strstart are already inserted. If there is not
             * enough lookahead, the last two strings are not inserted in
             * the hash table.
             */
            s->lookahead -= s->prev_length-1;
     639:	8b 45 70             	mov    0x70(%ebp),%eax
     63c:	89 c3                	mov    %eax,%ebx
     63e:	89 44 24 24          	mov    %eax,0x24(%esp)
     642:	8b 45 6c             	mov    0x6c(%ebp),%eax
     645:	40                   	inc    %eax
            s->prev_length -= 2;
     646:	8d 53 fe             	lea    -0x2(%ebx),%edx
            /* Insert in hash table all strings up to the end of the match.
             * strstart-1 and strstart are already inserted. If there is not
             * enough lookahead, the last two strings are not inserted in
             * the hash table.
             */
            s->lookahead -= s->prev_length-1;
     649:	29 d8                	sub    %ebx,%eax
            s->prev_length -= 2;
     64b:	89 55 70             	mov    %edx,0x70(%ebp)
            /* Insert in hash table all strings up to the end of the match.
             * strstart-1 and strstart are already inserted. If there is not
             * enough lookahead, the last two strings are not inserted in
             * the hash table.
             */
            s->lookahead -= s->prev_length-1;
     64e:	89 c6                	mov    %eax,%esi
     650:	89 45 6c             	mov    %eax,0x6c(%ebp)
     653:	8b 45 64             	mov    0x64(%ebp),%eax
     656:	89 d3                	mov    %edx,%ebx
     658:	89 44 24 28          	mov    %eax,0x28(%esp)
     65c:	89 74 24 2c          	mov    %esi,0x2c(%esp)
     660:	40                   	inc    %eax
            s->prev_length -= 2;
            do {
                if (++s->strstart <= max_insert) {
     661:	89 45 64             	mov    %eax,0x64(%ebp)
     664:	3b 44 24 14          	cmp    0x14(%esp),%eax
     668:	77 46                	ja     6b0 <_deflate_slow+0x1d0>
                    INSERT_STRING(s, s->strstart, hash_head);
     66a:	8b 55 30             	mov    0x30(%ebp),%edx
     66d:	8b 4d 50             	mov    0x50(%ebp),%ecx
     670:	8b 75 4c             	mov    0x4c(%ebp),%esi
     673:	0f b6 7c 02 02       	movzbl 0x2(%edx,%eax,1),%edi
     678:	81 e7 ff 00 00 00    	and    $0xff,%edi
     67e:	89 fa                	mov    %edi,%edx
     680:	8b 7d 40             	mov    0x40(%ebp),%edi
     683:	d3 e7                	shl    %cl,%edi
     685:	31 fa                	xor    %edi,%edx
     687:	8b 4d 3c             	mov    0x3c(%ebp),%ecx
     68a:	21 f2                	and    %esi,%edx
     68c:	8b 75 2c             	mov    0x2c(%ebp),%esi
     68f:	89 55 40             	mov    %edx,0x40(%ebp)
     692:	21 c6                	and    %eax,%esi
     694:	8d 14 51             	lea    (%ecx,%edx,2),%edx
     697:	66 8b 0a             	mov    (%edx),%cx
     69a:	89 cf                	mov    %ecx,%edi
     69c:	81 e7 ff ff 00 00    	and    $0xffff,%edi
     6a2:	89 7c 24 18          	mov    %edi,0x18(%esp)
     6a6:	8b 7d 38             	mov    0x38(%ebp),%edi
     6a9:	66 89 0c 77          	mov    %cx,(%edi,%esi,2)
     6ad:	66 89 02             	mov    %ax,(%edx)
                }
            } while (--s->prev_length != 0);
     6b0:	4b                   	dec    %ebx
     6b1:	40                   	inc    %eax
     6b2:	89 5d 70             	mov    %ebx,0x70(%ebp)
     6b5:	85 db                	test   %ebx,%ebx
     6b7:	75 a8                	jne    661 <_deflate_slow+0x181>
            s->match_available = 0;
            s->match_length = MIN_MATCH-1;
            s->strstart++;
     6b9:	8b 44 24 24          	mov    0x24(%esp),%eax
     6bd:	8b 5c 24 28          	mov    0x28(%esp),%ebx

            if (bflush) FLUSH_BLOCK(s, 0);
     6c1:	8b 4c 24 20          	mov    0x20(%esp),%ecx
     6c5:	8b 7c 24 18          	mov    0x18(%esp),%edi
                    INSERT_STRING(s, s->strstart, hash_head);
                }
            } while (--s->prev_length != 0);
            s->match_available = 0;
            s->match_length = MIN_MATCH-1;
            s->strstart++;
     6c9:	8d 44 18 ff          	lea    -0x1(%eax,%ebx,1),%eax
     6cd:	8b 74 24 2c          	mov    0x2c(%esp),%esi
            do {
                if (++s->strstart <= max_insert) {
                    INSERT_STRING(s, s->strstart, hash_head);
                }
            } while (--s->prev_length != 0);
            s->match_available = 0;
     6d1:	c7 45 60 00 00 00 00 	movl   $0x0,0x60(%ebp)
            s->match_length = MIN_MATCH-1;
     6d8:	c7 45 58 02 00 00 00 	movl   $0x2,0x58(%ebp)
            s->strstart++;
     6df:	89 45 64             	mov    %eax,0x64(%ebp)

            if (bflush) FLUSH_BLOCK(s, 0);
     6e2:	39 4c 24 1c          	cmp    %ecx,0x1c(%esp)
     6e6:	0f 85 0a fe ff ff    	jne    4f6 <_deflate_slow+0x16>
     6ec:	8b 55 54             	mov    0x54(%ebp),%edx
     6ef:	29 d0                	sub    %edx,%eax
     6f1:	85 d2                	test   %edx,%edx
     6f3:	0f 88 bb 01 00 00    	js     8b4 <_deflate_slow+0x3d4>
     6f9:	8b 4d 30             	mov    0x30(%ebp),%ecx
     6fc:	01 ca                	add    %ecx,%edx
     6fe:	89 44 24 08          	mov    %eax,0x8(%esp)
     702:	89 54 24 04          	mov    %edx,0x4(%esp)
     706:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     70d:	00 
     70e:	89 2c 24             	mov    %ebp,(%esp)
     711:	e8 00 00 00 00       	call   716 <_deflate_slow+0x236>
     716:	8b 45 64             	mov    0x64(%ebp),%eax
     719:	89 45 54             	mov    %eax,0x54(%ebp)
     71c:	8b 45 00             	mov    0x0(%ebp),%eax
     71f:	e8 3c fd ff ff       	call   460 <_flush_pending>
     724:	8b 45 00             	mov    0x0(%ebp),%eax
     727:	8b 70 10             	mov    0x10(%eax),%esi
     72a:	85 f6                	test   %esi,%esi
     72c:	0f 84 bd 00 00 00    	je     7ef <_deflate_slow+0x30f>
     732:	8b 75 6c             	mov    0x6c(%ebp),%esi
        /* Make sure that we always have enough lookahead, except
         * at the end of the input file. We need MAX_MATCH bytes
         * for the next match, plus MIN_MATCH bytes to insert the
         * string following the next match.
         */
        if (s->lookahead < MIN_LOOKAHEAD) {
     735:	81 fe 05 01 00 00    	cmp    $0x105,%esi
     73b:	0f 87 c1 fd ff ff    	ja     502 <_deflate_slow+0x22>
            fill_window(s);
     741:	89 e8                	mov    %ebp,%eax
     743:	e8 28 fb ff ff       	call   270 <_fill_window>
            if (s->lookahead < MIN_LOOKAHEAD && flush == Z_NO_FLUSH) {
     748:	8b 45 6c             	mov    0x6c(%ebp),%eax
     74b:	3d 05 01 00 00       	cmp    $0x105,%eax
     750:	0f 87 ac fd ff ff    	ja     502 <_deflate_slow+0x22>
     756:	8b 54 24 54          	mov    0x54(%esp),%edx
     75a:	85 d2                	test   %edx,%edx
     75c:	0f 84 8d 00 00 00    	je     7ef <_deflate_slow+0x30f>
	        return need_more;
	    }
            if (s->lookahead == 0) break; /* flush the current block */
     762:	85 c0                	test   %eax,%eax
     764:	0f 84 51 01 00 00    	je     8bb <_deflate_slow+0x3db>
        }

        /* Insert the string window[strstart .. strstart+2] in the
         * dictionary, and set hash_head to the head of the hash chain:
         */
        if (s->lookahead >= MIN_MATCH) {
     76a:	83 f8 02             	cmp    $0x2,%eax
     76d:	0f 87 8f fd ff ff    	ja     502 <_deflate_slow+0x22>
     773:	8b 45 64             	mov    0x64(%ebp),%eax
     776:	e9 c2 fd ff ff       	jmp    53d <_deflate_slow+0x5d>
     77b:	90                   	nop
     77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            s->match_length = MIN_MATCH-1;
            s->strstart++;

            if (bflush) FLUSH_BLOCK(s, 0);

        } else if (s->match_available) {
     780:	8b 5d 60             	mov    0x60(%ebp),%ebx
     783:	85 db                	test   %ebx,%ebx
     785:	74 79                	je     800 <_deflate_slow+0x320>
            /* If there was no match at the previous position, output a
             * single literal. If there was a match but the current match
             * is longer, truncate the previous match to a single literal.
             */
            Tracevv((stderr,"%c", s->window[s->strstart-1]));
	    _tr_tally_lit(s, s->window[s->strstart-1], bflush);
     787:	8b 55 30             	mov    0x30(%ebp),%edx
     78a:	8b 8d 9c 16 00 00    	mov    0x169c(%ebp),%ecx
     790:	0f b6 74 02 ff       	movzbl -0x1(%edx,%eax,1),%esi
     795:	8b 95 98 16 00 00    	mov    0x1698(%ebp),%edx
     79b:	89 f0                	mov    %esi,%eax
     79d:	66 c7 04 51 00 00    	movw   $0x0,(%ecx,%edx,2)
     7a3:	8b 8d 90 16 00 00    	mov    0x1690(%ebp),%ecx
     7a9:	8d 5a 01             	lea    0x1(%edx),%ebx
     7ac:	89 9d 98 16 00 00    	mov    %ebx,0x1698(%ebp)
     7b2:	88 04 11             	mov    %al,(%ecx,%edx,1)
     7b5:	25 ff 00 00 00       	and    $0xff,%eax
     7ba:	66 ff 84 85 8c 00 00 	incw   0x8c(%ebp,%eax,4)
     7c1:	00 
     7c2:	8b 85 94 16 00 00    	mov    0x1694(%ebp),%eax
     7c8:	48                   	dec    %eax
	    if (bflush) {
     7c9:	39 85 98 16 00 00    	cmp    %eax,0x1698(%ebp)
     7cf:	74 6f                	je     840 <_deflate_slow+0x360>
                FLUSH_BLOCK_ONLY(s, 0);
            }
            s->strstart++;
     7d1:	8b 45 64             	mov    0x64(%ebp),%eax
     7d4:	40                   	inc    %eax
     7d5:	89 45 64             	mov    %eax,0x64(%ebp)
            s->lookahead--;
     7d8:	8b 45 6c             	mov    0x6c(%ebp),%eax
     7db:	8d 70 ff             	lea    -0x1(%eax),%esi
            if (s->strm->avail_out == 0) return need_more;
     7de:	8b 45 00             	mov    0x0(%ebp),%eax
	    _tr_tally_lit(s, s->window[s->strstart-1], bflush);
	    if (bflush) {
                FLUSH_BLOCK_ONLY(s, 0);
            }
            s->strstart++;
            s->lookahead--;
     7e1:	89 75 6c             	mov    %esi,0x6c(%ebp)
            if (s->strm->avail_out == 0) return need_more;
     7e4:	8b 40 10             	mov    0x10(%eax),%eax
     7e7:	85 c0                	test   %eax,%eax
     7e9:	0f 85 07 fd ff ff    	jne    4f6 <_deflate_slow+0x16>
        _tr_tally_lit(s, s->window[s->strstart-1], bflush);
        s->match_available = 0;
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
}
     7ef:	83 c4 3c             	add    $0x3c,%esp
         * string following the next match.
         */
        if (s->lookahead < MIN_LOOKAHEAD) {
            fill_window(s);
            if (s->lookahead < MIN_LOOKAHEAD && flush == Z_NO_FLUSH) {
	        return need_more;
     7f2:	31 c0                	xor    %eax,%eax
        _tr_tally_lit(s, s->window[s->strstart-1], bflush);
        s->match_available = 0;
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
}
     7f4:	5b                   	pop    %ebx
     7f5:	5e                   	pop    %esi
     7f6:	5f                   	pop    %edi
     7f7:	5d                   	pop    %ebp
     7f8:	c3                   	ret    
     7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        } else {
            /* There is no previous match to compare with, wait for
             * the next step to decide.
             */
            s->match_available = 1;
            s->strstart++;
     800:	40                   	inc    %eax
            if (s->strm->avail_out == 0) return need_more;
        } else {
            /* There is no previous match to compare with, wait for
             * the next step to decide.
             */
            s->match_available = 1;
     801:	c7 45 60 01 00 00 00 	movl   $0x1,0x60(%ebp)
            s->strstart++;
     808:	89 45 64             	mov    %eax,0x64(%ebp)
            s->lookahead--;
     80b:	8b 45 6c             	mov    0x6c(%ebp),%eax
     80e:	8d 70 ff             	lea    -0x1(%eax),%esi
     811:	89 75 6c             	mov    %esi,0x6c(%ebp)
     814:	e9 dd fc ff ff       	jmp    4f6 <_deflate_slow+0x16>
     819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            uInt max_insert = s->strstart + s->lookahead - MIN_MATCH;
            /* Do not insert strings in hash table beyond this. */

            check_match(s, s->strstart-1, s->prev_match, s->prev_length);

            _tr_tally_dist(s, s->strstart -1 - s->prev_match,
     820:	66 c1 eb 07          	shr    $0x7,%bx
     824:	31 c0                	xor    %eax,%eax
     826:	66 89 d8             	mov    %bx,%ax
     829:	8a 98 00 01 00 00    	mov    0x100(%eax),%bl
     82f:	81 e3 ff 00 00 00    	and    $0xff,%ebx
     835:	89 d8                	mov    %ebx,%eax
     837:	e9 dc fd ff ff       	jmp    618 <_deflate_slow+0x138>
     83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
             * is longer, truncate the previous match to a single literal.
             */
            Tracevv((stderr,"%c", s->window[s->strstart-1]));
	    _tr_tally_lit(s, s->window[s->strstart-1], bflush);
	    if (bflush) {
                FLUSH_BLOCK_ONLY(s, 0);
     840:	8b 45 54             	mov    0x54(%ebp),%eax
     843:	8b 55 64             	mov    0x64(%ebp),%edx
     846:	29 c2                	sub    %eax,%edx
     848:	85 c0                	test   %eax,%eax
     84a:	78 64                	js     8b0 <_deflate_slow+0x3d0>
     84c:	8b 4d 30             	mov    0x30(%ebp),%ecx
     84f:	01 c8                	add    %ecx,%eax
     851:	89 44 24 04          	mov    %eax,0x4(%esp)
     855:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     85c:	00 
     85d:	89 54 24 08          	mov    %edx,0x8(%esp)
     861:	89 2c 24             	mov    %ebp,(%esp)
     864:	e8 00 00 00 00       	call   869 <_deflate_slow+0x389>
     869:	8b 45 64             	mov    0x64(%ebp),%eax
     86c:	89 45 54             	mov    %eax,0x54(%ebp)
     86f:	8b 45 00             	mov    0x0(%ebp),%eax
     872:	e8 e9 fb ff ff       	call   460 <_flush_pending>
     877:	e9 55 ff ff ff       	jmp    7d1 <_deflate_slow+0x2f1>
     87c:	8b 45 64             	mov    0x64(%ebp),%eax
            if (s->strategy != Z_HUFFMAN_ONLY) {
                s->match_length = longest_match (s, hash_head);
            }
            /* longest_match() sets match_start */

            if (s->match_length <= 5 && (s->strategy == Z_FILTERED ||
     87f:	83 bd 80 00 00 00 01 	cmpl   $0x1,0x80(%ebp)
     886:	74 14                	je     89c <_deflate_slow+0x3bc>
     888:	83 fa 03             	cmp    $0x3,%edx
     88b:	75 16                	jne    8a3 <_deflate_slow+0x3c3>
                 (s->match_length == MIN_MATCH &&
                  s->strstart - s->match_start > TOO_FAR))) {
     88d:	89 c2                	mov    %eax,%edx
     88f:	8b 5d 68             	mov    0x68(%ebp),%ebx
     892:	29 da                	sub    %ebx,%edx
                s->match_length = longest_match (s, hash_head);
            }
            /* longest_match() sets match_start */

            if (s->match_length <= 5 && (s->strategy == Z_FILTERED ||
                 (s->match_length == MIN_MATCH &&
     894:	81 fa 00 10 00 00    	cmp    $0x1000,%edx
     89a:	76 07                	jbe    8a3 <_deflate_slow+0x3c3>
                  s->strstart - s->match_start > TOO_FAR))) {

                /* If prev_match is also MIN_MATCH, match_start is garbage
                 * but we will ignore the current match anyway.
                 */
                s->match_length = MIN_MATCH-1;
     89c:	c7 45 58 02 00 00 00 	movl   $0x2,0x58(%ebp)
     8a3:	8b 55 70             	mov    0x70(%ebp),%edx
     8a6:	e9 e9 fc ff ff       	jmp    594 <_deflate_slow+0xb4>
     8ab:	90                   	nop
     8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
             * is longer, truncate the previous match to a single literal.
             */
            Tracevv((stderr,"%c", s->window[s->strstart-1]));
	    _tr_tally_lit(s, s->window[s->strstart-1], bflush);
	    if (bflush) {
                FLUSH_BLOCK_ONLY(s, 0);
     8b0:	31 c0                	xor    %eax,%eax
     8b2:	eb 9d                	jmp    851 <_deflate_slow+0x371>
            } while (--s->prev_length != 0);
            s->match_available = 0;
            s->match_length = MIN_MATCH-1;
            s->strstart++;

            if (bflush) FLUSH_BLOCK(s, 0);
     8b4:	31 d2                	xor    %edx,%edx
     8b6:	e9 43 fe ff ff       	jmp    6fe <_deflate_slow+0x21e>
            s->strstart++;
            s->lookahead--;
        }
    }
    Assert (flush != Z_NO_FLUSH, "no flush?");
    if (s->match_available) {
     8bb:	8b 7d 60             	mov    0x60(%ebp),%edi
     8be:	85 ff                	test   %edi,%edi
     8c0:	75 73                	jne    935 <_deflate_slow+0x455>
        Tracevv((stderr,"%c", s->window[s->strstart-1]));
        _tr_tally_lit(s, s->window[s->strstart-1], bflush);
        s->match_available = 0;
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
     8c2:	83 7c 24 54 04       	cmpl   $0x4,0x54(%esp)
     8c7:	8b 45 54             	mov    0x54(%ebp),%eax
     8ca:	8b 55 64             	mov    0x64(%ebp),%edx
     8cd:	0f 94 c3             	sete   %bl
     8d0:	31 c9                	xor    %ecx,%ecx
     8d2:	29 c2                	sub    %eax,%edx
     8d4:	88 d9                	mov    %bl,%cl
     8d6:	85 c0                	test   %eax,%eax
     8d8:	0f 88 a1 00 00 00    	js     97f <_deflate_slow+0x49f>
     8de:	8b 75 30             	mov    0x30(%ebp),%esi
     8e1:	01 f0                	add    %esi,%eax
     8e3:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     8e7:	89 54 24 08          	mov    %edx,0x8(%esp)
     8eb:	89 44 24 04          	mov    %eax,0x4(%esp)
     8ef:	89 2c 24             	mov    %ebp,(%esp)
     8f2:	e8 00 00 00 00       	call   8f7 <_deflate_slow+0x417>
     8f7:	8b 45 64             	mov    0x64(%ebp),%eax
     8fa:	89 45 54             	mov    %eax,0x54(%ebp)
     8fd:	8b 45 00             	mov    0x0(%ebp),%eax
     900:	e8 5b fb ff ff       	call   460 <_flush_pending>
     905:	8b 45 00             	mov    0x0(%ebp),%eax
     908:	8b 40 10             	mov    0x10(%eax),%eax
     90b:	85 c0                	test   %eax,%eax
     90d:	75 13                	jne    922 <_deflate_slow+0x442>
     90f:	89 d8                	mov    %ebx,%eax
    return flush == Z_FINISH ? finish_done : block_done;
}
     911:	83 c4 3c             	add    $0x3c,%esp
    if (s->match_available) {
        Tracevv((stderr,"%c", s->window[s->strstart-1]));
        _tr_tally_lit(s, s->window[s->strstart-1], bflush);
        s->match_available = 0;
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
     914:	c1 e0 1f             	shl    $0x1f,%eax
     917:	c1 f8 1f             	sar    $0x1f,%eax
    return flush == Z_FINISH ? finish_done : block_done;
}
     91a:	5b                   	pop    %ebx
    if (s->match_available) {
        Tracevv((stderr,"%c", s->window[s->strstart-1]));
        _tr_tally_lit(s, s->window[s->strstart-1], bflush);
        s->match_available = 0;
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
     91b:	83 e0 02             	and    $0x2,%eax
    return flush == Z_FINISH ? finish_done : block_done;
}
     91e:	5e                   	pop    %esi
     91f:	5f                   	pop    %edi
     920:	5d                   	pop    %ebp
     921:	c3                   	ret    
        Tracevv((stderr,"%c", s->window[s->strstart-1]));
        _tr_tally_lit(s, s->window[s->strstart-1], bflush);
        s->match_available = 0;
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
     922:	80 fb 01             	cmp    $0x1,%bl
     925:	19 c0                	sbb    %eax,%eax
}
     927:	83 c4 3c             	add    $0x3c,%esp
        Tracevv((stderr,"%c", s->window[s->strstart-1]));
        _tr_tally_lit(s, s->window[s->strstart-1], bflush);
        s->match_available = 0;
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
     92a:	83 e0 fe             	and    $0xfffffffe,%eax
}
     92d:	5b                   	pop    %ebx
        Tracevv((stderr,"%c", s->window[s->strstart-1]));
        _tr_tally_lit(s, s->window[s->strstart-1], bflush);
        s->match_available = 0;
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
     92e:	83 c0 03             	add    $0x3,%eax
}
     931:	5e                   	pop    %esi
     932:	5f                   	pop    %edi
     933:	5d                   	pop    %ebp
     934:	c3                   	ret    
        }
    }
    Assert (flush != Z_NO_FLUSH, "no flush?");
    if (s->match_available) {
        Tracevv((stderr,"%c", s->window[s->strstart-1]));
        _tr_tally_lit(s, s->window[s->strstart-1], bflush);
     935:	8b 55 30             	mov    0x30(%ebp),%edx
     938:	8b 45 64             	mov    0x64(%ebp),%eax
     93b:	8b 8d 9c 16 00 00    	mov    0x169c(%ebp),%ecx
     941:	0f b6 7c 02 ff       	movzbl -0x1(%edx,%eax,1),%edi
     946:	8b 95 98 16 00 00    	mov    0x1698(%ebp),%edx
     94c:	89 f8                	mov    %edi,%eax
     94e:	66 c7 04 51 00 00    	movw   $0x0,(%ecx,%edx,2)
     954:	8b 8d 90 16 00 00    	mov    0x1690(%ebp),%ecx
     95a:	8d 5a 01             	lea    0x1(%edx),%ebx
     95d:	89 9d 98 16 00 00    	mov    %ebx,0x1698(%ebp)
     963:	88 04 11             	mov    %al,(%ecx,%edx,1)
     966:	25 ff 00 00 00       	and    $0xff,%eax
     96b:	66 ff 84 85 8c 00 00 	incw   0x8c(%ebp,%eax,4)
     972:	00 
        s->match_available = 0;
     973:	c7 45 60 00 00 00 00 	movl   $0x0,0x60(%ebp)
     97a:	e9 43 ff ff ff       	jmp    8c2 <_deflate_slow+0x3e2>
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
     97f:	31 c0                	xor    %eax,%eax
     981:	e9 5d ff ff ff       	jmp    8e3 <_deflate_slow+0x403>
     986:	8d 76 00             	lea    0x0(%esi),%esi
     989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000990 <_deflate_fast>:
 * matches. It is used only for the fast compression options.
 */
local block_state deflate_fast(s, flush)
    deflate_state *s;
    int flush;
{
     990:	55                   	push   %ebp
     991:	57                   	push   %edi
     992:	56                   	push   %esi
     993:	53                   	push   %ebx
     994:	83 ec 4c             	sub    $0x4c,%esp
    IPos hash_head = NIL; /* head of the hash chain */
     997:	31 db                	xor    %ebx,%ebx
 * matches. It is used only for the fast compression options.
 */
local block_state deflate_fast(s, flush)
    deflate_state *s;
    int flush;
{
     999:	8b 6c 24 60          	mov    0x60(%esp),%ebp
    IPos hash_head = NIL; /* head of the hash chain */
     99d:	89 5c 24 18          	mov    %ebx,0x18(%esp)
        /* Make sure that we always have enough lookahead, except
         * at the end of the input file. We need MAX_MATCH bytes
         * for the next match, plus MIN_MATCH bytes to insert the
         * string following the next match.
         */
        if (s->lookahead < MIN_LOOKAHEAD) {
     9a1:	81 7d 6c 05 01 00 00 	cmpl   $0x105,0x6c(%ebp)
     9a8:	0f 86 e2 02 00 00    	jbe    c90 <_deflate_fast+0x300>

        /* Insert the string window[strstart .. strstart+2] in the
         * dictionary, and set hash_head to the head of the hash chain:
         */
        if (s->lookahead >= MIN_MATCH) {
            INSERT_STRING(s, s->strstart, hash_head);
     9ae:	8b 55 64             	mov    0x64(%ebp),%edx
     9b1:	8b 45 30             	mov    0x30(%ebp),%eax
     9b4:	31 db                	xor    %ebx,%ebx
     9b6:	8b 4d 50             	mov    0x50(%ebp),%ecx
     9b9:	8a 5c 10 02          	mov    0x2(%eax,%edx,1),%bl
     9bd:	8b 45 40             	mov    0x40(%ebp),%eax
     9c0:	d3 e0                	shl    %cl,%eax
     9c2:	31 d8                	xor    %ebx,%eax
     9c4:	8b 4d 4c             	mov    0x4c(%ebp),%ecx
     9c7:	21 c8                	and    %ecx,%eax
     9c9:	8b 4d 3c             	mov    0x3c(%ebp),%ecx
     9cc:	89 45 40             	mov    %eax,0x40(%ebp)
     9cf:	8b 7d 2c             	mov    0x2c(%ebp),%edi
     9d2:	8d 04 41             	lea    (%ecx,%eax,2),%eax
     9d5:	21 d7                	and    %edx,%edi
     9d7:	66 8b 08             	mov    (%eax),%cx
     9da:	89 ce                	mov    %ecx,%esi
     9dc:	81 e6 ff ff 00 00    	and    $0xffff,%esi
     9e2:	89 74 24 18          	mov    %esi,0x18(%esp)
     9e6:	8b 75 38             	mov    0x38(%ebp),%esi
     9e9:	66 89 0c 7e          	mov    %cx,(%esi,%edi,2)
     9ed:	66 89 10             	mov    %dx,(%eax)
        }

        /* Find the longest match, discarding those <= prev_length.
         * At this point we have always match_length < MIN_MATCH
         */
        if (hash_head != NIL && s->strstart - hash_head <= MAX_DIST(s)) {
     9f0:	8b 44 24 18          	mov    0x18(%esp),%eax
     9f4:	85 c0                	test   %eax,%eax
     9f6:	0f 84 e5 01 00 00    	je     be1 <_deflate_fast+0x251>
     9fc:	8b 44 24 18          	mov    0x18(%esp),%eax
     a00:	89 d1                	mov    %edx,%ecx
     a02:	29 c1                	sub    %eax,%ecx
     a04:	8b 45 24             	mov    0x24(%ebp),%eax
     a07:	2d 06 01 00 00       	sub    $0x106,%eax
     a0c:	39 c1                	cmp    %eax,%ecx
     a0e:	0f 87 cd 01 00 00    	ja     be1 <_deflate_fast+0x251>
            /* To simplify the code, we prevent matches with the string
             * of window index 0 (in particular we have to avoid a match
             * of the string with itself at the start of the input file).
             */
            if (s->strategy != Z_HUFFMAN_ONLY) {
     a14:	83 bd 80 00 00 00 02 	cmpl   $0x2,0x80(%ebp)
     a1b:	0f 84 c0 01 00 00    	je     be1 <_deflate_fast+0x251>
                s->match_length = longest_match (s, hash_head);
     a21:	8b 54 24 18          	mov    0x18(%esp),%edx
     a25:	89 e8                	mov    %ebp,%eax
     a27:	e8 d4 f5 ff ff       	call   0 <_longest_match>
     a2c:	8b 55 64             	mov    0x64(%ebp),%edx
     a2f:	89 45 58             	mov    %eax,0x58(%ebp)
            }
            /* longest_match() sets match_start */
        }
        if (s->match_length >= MIN_MATCH) {
     a32:	83 f8 02             	cmp    $0x2,%eax
     a35:	0f 86 b2 01 00 00    	jbe    bed <_deflate_fast+0x25d>
     a3b:	90                   	nop
     a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            check_match(s, s->strstart, s->match_start, s->match_length);

            _tr_tally_dist(s, s->strstart - s->match_start,
     a40:	8b 8d 98 16 00 00    	mov    0x1698(%ebp),%ecx
     a46:	8b b5 9c 16 00 00    	mov    0x169c(%ebp),%esi
     a4c:	8d 58 fd             	lea    -0x3(%eax),%ebx
     a4f:	8b 45 68             	mov    0x68(%ebp),%eax
     a52:	29 c2                	sub    %eax,%edx
     a54:	31 c0                	xor    %eax,%eax
     a56:	66 89 14 4e          	mov    %dx,(%esi,%ecx,2)
     a5a:	88 d8                	mov    %bl,%al
     a5c:	8b b5 90 16 00 00    	mov    0x1690(%ebp),%esi
     a62:	8d 79 01             	lea    0x1(%ecx),%edi
     a65:	89 bd 98 16 00 00    	mov    %edi,0x1698(%ebp)
     a6b:	8d 7a ff             	lea    -0x1(%edx),%edi
     a6e:	88 1c 0e             	mov    %bl,(%esi,%ecx,1)
     a71:	0f b6 b0 00 00 00 00 	movzbl 0x0(%eax),%esi
     a78:	81 e6 ff 00 00 00    	and    $0xff,%esi
     a7e:	66 ff 84 b5 90 04 00 	incw   0x490(%ebp,%esi,4)
     a85:	00 
     a86:	66 81 ff ff 00       	cmp    $0xff,%di
     a8b:	0f 87 35 02 00 00    	ja     cc6 <_deflate_fast+0x336>
     a91:	31 d2                	xor    %edx,%edx
     a93:	31 c0                	xor    %eax,%eax
     a95:	66 89 fa             	mov    %di,%dx
     a98:	8a 82 00 00 00 00    	mov    0x0(%edx),%al
     a9e:	66 ff 84 85 80 09 00 	incw   0x980(%ebp,%eax,4)
     aa5:	00 
     aa6:	8b 85 94 16 00 00    	mov    0x1694(%ebp),%eax
     aac:	48                   	dec    %eax
     aad:	39 85 98 16 00 00    	cmp    %eax,0x1698(%ebp)
     ab3:	0f 94 c0             	sete   %al
     ab6:	25 ff 00 00 00       	and    $0xff,%eax
     abb:	89 44 24 1c          	mov    %eax,0x1c(%esp)
                           s->match_length - MIN_MATCH, bflush);

            s->lookahead -= s->match_length;
     abf:	8b 45 58             	mov    0x58(%ebp),%eax
     ac2:	89 c6                	mov    %eax,%esi
     ac4:	89 44 24 38          	mov    %eax,0x38(%esp)
     ac8:	8b 45 6c             	mov    0x6c(%ebp),%eax
     acb:	29 f0                	sub    %esi,%eax
     acd:	89 45 6c             	mov    %eax,0x6c(%ebp)

            /* Insert new strings in the hash table only if the match length
             * is not too large. This saves time but degrades compression.
             */
#ifndef FASTEST
            if (s->match_length <= s->max_insert_length &&
     ad0:	83 f8 02             	cmp    $0x2,%eax
     ad3:	0f 86 7a 01 00 00    	jbe    c53 <_deflate_fast+0x2c3>
     ad9:	3b 75 78             	cmp    0x78(%ebp),%esi
     adc:	0f 87 71 01 00 00    	ja     c53 <_deflate_fast+0x2c3>
     ae2:	8b 5d 38             	mov    0x38(%ebp),%ebx
     ae5:	8b 45 64             	mov    0x64(%ebp),%eax
     ae8:	89 5c 24 20          	mov    %ebx,0x20(%esp)
     aec:	8b 5d 2c             	mov    0x2c(%ebp),%ebx
     aef:	89 5c 24 24          	mov    %ebx,0x24(%esp)
     af3:	8b 5d 3c             	mov    0x3c(%ebp),%ebx
     af6:	89 5c 24 28          	mov    %ebx,0x28(%esp)
     afa:	8b 5d 30             	mov    0x30(%ebp),%ebx
     afd:	89 c7                	mov    %eax,%edi
     aff:	89 5c 24 2c          	mov    %ebx,0x2c(%esp)
     b03:	8b 5d 50             	mov    0x50(%ebp),%ebx
                s->lookahead >= MIN_MATCH) {
                s->match_length--; /* string at strstart already in hash table */
     b06:	4e                   	dec    %esi
     b07:	89 5c 24 30          	mov    %ebx,0x30(%esp)
     b0b:	8b 5d 4c             	mov    0x4c(%ebp),%ebx
     b0e:	89 44 24 3c          	mov    %eax,0x3c(%esp)
     b12:	89 75 58             	mov    %esi,0x58(%ebp)
     b15:	8b 45 40             	mov    0x40(%ebp),%eax
     b18:	89 5c 24 34          	mov    %ebx,0x34(%esp)
     b1c:	8d 57 01             	lea    0x1(%edi),%edx
     b1f:	90                   	nop
                do {
                    s->strstart++;
                    INSERT_STRING(s, s->strstart, hash_head);
     b20:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
#ifndef FASTEST
            if (s->match_length <= s->max_insert_length &&
                s->lookahead >= MIN_MATCH) {
                s->match_length--; /* string at strstart already in hash table */
                do {
                    s->strstart++;
     b24:	89 55 64             	mov    %edx,0x64(%ebp)
                    INSERT_STRING(s, s->strstart, hash_head);
     b27:	31 db                	xor    %ebx,%ebx
     b29:	8a 4c 24 30          	mov    0x30(%esp),%cl
     b2d:	8a 5c 17 02          	mov    0x2(%edi,%edx,1),%bl
     b31:	8b 7c 24 34          	mov    0x34(%esp),%edi
     b35:	d3 e0                	shl    %cl,%eax
     b37:	31 d8                	xor    %ebx,%eax
     b39:	8b 5c 24 28          	mov    0x28(%esp),%ebx
     b3d:	21 f8                	and    %edi,%eax
     b3f:	8b 4c 24 20          	mov    0x20(%esp),%ecx
     b43:	89 45 40             	mov    %eax,0x40(%ebp)
                    /* strstart never exceeds WSIZE-MAX_MATCH, so there are
                     * always MIN_MATCH bytes ahead.
                     */
                } while (--s->match_length != 0);
     b46:	4e                   	dec    %esi
            if (s->match_length <= s->max_insert_length &&
                s->lookahead >= MIN_MATCH) {
                s->match_length--; /* string at strstart already in hash table */
                do {
                    s->strstart++;
                    INSERT_STRING(s, s->strstart, hash_head);
     b47:	8d 3c 43             	lea    (%ebx,%eax,2),%edi
     b4a:	89 7c 24 18          	mov    %edi,0x18(%esp)
     b4e:	66 8b 1f             	mov    (%edi),%bx
     b51:	8b 7c 24 24          	mov    0x24(%esp),%edi
     b55:	21 d7                	and    %edx,%edi
     b57:	66 89 1c 79          	mov    %bx,(%ecx,%edi,2)
     b5b:	8b 7c 24 18          	mov    0x18(%esp),%edi
     b5f:	66 89 17             	mov    %dx,(%edi)
     b62:	42                   	inc    %edx
                    /* strstart never exceeds WSIZE-MAX_MATCH, so there are
                     * always MIN_MATCH bytes ahead.
                     */
                } while (--s->match_length != 0);
     b63:	89 75 58             	mov    %esi,0x58(%ebp)
     b66:	85 f6                	test   %esi,%esi
     b68:	75 b6                	jne    b20 <_deflate_fast+0x190>
            if (s->match_length <= s->max_insert_length &&
                s->lookahead >= MIN_MATCH) {
                s->match_length--; /* string at strstart already in hash table */
                do {
                    s->strstart++;
                    INSERT_STRING(s, s->strstart, hash_head);
     b6a:	89 d8                	mov    %ebx,%eax
                    /* strstart never exceeds WSIZE-MAX_MATCH, so there are
                     * always MIN_MATCH bytes ahead.
                     */
                } while (--s->match_length != 0);
                s->strstart++; 
     b6c:	8b 5c 24 38          	mov    0x38(%esp),%ebx
            if (s->match_length <= s->max_insert_length &&
                s->lookahead >= MIN_MATCH) {
                s->match_length--; /* string at strstart already in hash table */
                do {
                    s->strstart++;
                    INSERT_STRING(s, s->strstart, hash_head);
     b70:	25 ff ff 00 00       	and    $0xffff,%eax
     b75:	89 44 24 18          	mov    %eax,0x18(%esp)
                    /* strstart never exceeds WSIZE-MAX_MATCH, so there are
                     * always MIN_MATCH bytes ahead.
                     */
                } while (--s->match_length != 0);
                s->strstart++; 
     b79:	8b 44 24 3c          	mov    0x3c(%esp),%eax
     b7d:	01 d8                	add    %ebx,%eax
     b7f:	89 45 64             	mov    %eax,0x64(%ebp)
            Tracevv((stderr,"%c", s->window[s->strstart]));
            _tr_tally_lit (s, s->window[s->strstart], bflush);
            s->lookahead--;
            s->strstart++; 
        }
        if (bflush) FLUSH_BLOCK(s, 0);
     b82:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
     b86:	85 db                	test   %ebx,%ebx
     b88:	0f 84 13 fe ff ff    	je     9a1 <_deflate_fast+0x11>
     b8e:	8b 45 54             	mov    0x54(%ebp),%eax
     b91:	8b 55 64             	mov    0x64(%ebp),%edx
     b94:	29 c2                	sub    %eax,%edx
     b96:	85 c0                	test   %eax,%eax
     b98:	0f 88 42 01 00 00    	js     ce0 <_deflate_fast+0x350>
     b9e:	8b 4d 30             	mov    0x30(%ebp),%ecx
     ba1:	01 c8                	add    %ecx,%eax
     ba3:	89 54 24 08          	mov    %edx,0x8(%esp)
     ba7:	89 44 24 04          	mov    %eax,0x4(%esp)
     bab:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     bb2:	00 
     bb3:	89 2c 24             	mov    %ebp,(%esp)
     bb6:	e8 00 00 00 00       	call   bbb <_deflate_fast+0x22b>
     bbb:	8b 45 64             	mov    0x64(%ebp),%eax
     bbe:	89 45 54             	mov    %eax,0x54(%ebp)
     bc1:	8b 45 00             	mov    0x0(%ebp),%eax
     bc4:	e8 97 f8 ff ff       	call   460 <_flush_pending>
     bc9:	8b 45 00             	mov    0x0(%ebp),%eax
     bcc:	8b 78 10             	mov    0x10(%eax),%edi
     bcf:	85 ff                	test   %edi,%edi
     bd1:	0f 85 ca fd ff ff    	jne    9a1 <_deflate_fast+0x11>
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
}
     bd7:	83 c4 4c             	add    $0x4c,%esp
         * string following the next match.
         */
        if (s->lookahead < MIN_LOOKAHEAD) {
            fill_window(s);
            if (s->lookahead < MIN_LOOKAHEAD && flush == Z_NO_FLUSH) {
	        return need_more;
     bda:	31 c0                	xor    %eax,%eax
        }
        if (bflush) FLUSH_BLOCK(s, 0);
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
}
     bdc:	5b                   	pop    %ebx
     bdd:	5e                   	pop    %esi
     bde:	5f                   	pop    %edi
     bdf:	5d                   	pop    %ebp
     be0:	c3                   	ret    
     be1:	8b 45 58             	mov    0x58(%ebp),%eax
            if (s->strategy != Z_HUFFMAN_ONLY) {
                s->match_length = longest_match (s, hash_head);
            }
            /* longest_match() sets match_start */
        }
        if (s->match_length >= MIN_MATCH) {
     be4:	83 f8 02             	cmp    $0x2,%eax
     be7:	0f 87 53 fe ff ff    	ja     a40 <_deflate_fast+0xb0>
                 */
            }
        } else {
            /* No match, output a literal byte */
            Tracevv((stderr,"%c", s->window[s->strstart]));
            _tr_tally_lit (s, s->window[s->strstart], bflush);
     bed:	8b 45 30             	mov    0x30(%ebp),%eax
     bf0:	8b 8d 9c 16 00 00    	mov    0x169c(%ebp),%ecx
     bf6:	0f b6 3c 10          	movzbl (%eax,%edx,1),%edi
     bfa:	8b 95 98 16 00 00    	mov    0x1698(%ebp),%edx
     c00:	89 f8                	mov    %edi,%eax
     c02:	66 c7 04 51 00 00    	movw   $0x0,(%ecx,%edx,2)
     c08:	8b 8d 90 16 00 00    	mov    0x1690(%ebp),%ecx
     c0e:	8d 72 01             	lea    0x1(%edx),%esi
     c11:	89 b5 98 16 00 00    	mov    %esi,0x1698(%ebp)
     c17:	88 04 11             	mov    %al,(%ecx,%edx,1)
     c1a:	25 ff 00 00 00       	and    $0xff,%eax
     c1f:	66 ff 84 85 8c 00 00 	incw   0x8c(%ebp,%eax,4)
     c26:	00 
     c27:	8b 85 94 16 00 00    	mov    0x1694(%ebp),%eax
            s->lookahead--;
     c2d:	8b 75 6c             	mov    0x6c(%ebp),%esi
                 */
            }
        } else {
            /* No match, output a literal byte */
            Tracevv((stderr,"%c", s->window[s->strstart]));
            _tr_tally_lit (s, s->window[s->strstart], bflush);
     c30:	48                   	dec    %eax
            s->lookahead--;
            s->strstart++; 
     c31:	8b 7d 64             	mov    0x64(%ebp),%edi
                 */
            }
        } else {
            /* No match, output a literal byte */
            Tracevv((stderr,"%c", s->window[s->strstart]));
            _tr_tally_lit (s, s->window[s->strstart], bflush);
     c34:	39 85 98 16 00 00    	cmp    %eax,0x1698(%ebp)
     c3a:	0f 94 c0             	sete   %al
     c3d:	25 ff 00 00 00       	and    $0xff,%eax
            s->lookahead--;
     c42:	4e                   	dec    %esi
            s->strstart++; 
     c43:	47                   	inc    %edi
                 */
            }
        } else {
            /* No match, output a literal byte */
            Tracevv((stderr,"%c", s->window[s->strstart]));
            _tr_tally_lit (s, s->window[s->strstart], bflush);
     c44:	89 44 24 1c          	mov    %eax,0x1c(%esp)
            s->lookahead--;
     c48:	89 75 6c             	mov    %esi,0x6c(%ebp)
            s->strstart++; 
     c4b:	89 7d 64             	mov    %edi,0x64(%ebp)
     c4e:	e9 2f ff ff ff       	jmp    b82 <_deflate_fast+0x1f2>
                } while (--s->match_length != 0);
                s->strstart++; 
            } else
#endif
	    {
                s->strstart += s->match_length;
     c53:	8b 55 64             	mov    0x64(%ebp),%edx
     c56:	8b 44 24 38          	mov    0x38(%esp),%eax
     c5a:	01 d0                	add    %edx,%eax
                s->match_length = 0;
                s->ins_h = s->window[s->strstart];
     c5c:	8b 4d 30             	mov    0x30(%ebp),%ecx
                } while (--s->match_length != 0);
                s->strstart++; 
            } else
#endif
	    {
                s->strstart += s->match_length;
     c5f:	89 45 64             	mov    %eax,0x64(%ebp)
                s->match_length = 0;
     c62:	c7 45 58 00 00 00 00 	movl   $0x0,0x58(%ebp)
                s->ins_h = s->window[s->strstart];
     c69:	31 d2                	xor    %edx,%edx
     c6b:	8a 14 01             	mov    (%ecx,%eax,1),%dl
     c6e:	89 55 40             	mov    %edx,0x40(%ebp)
                UPDATE_HASH(s, s->ins_h, s->window[s->strstart+1]);
     c71:	8a 5c 01 01          	mov    0x1(%ecx,%eax,1),%bl
     c75:	8b 4d 50             	mov    0x50(%ebp),%ecx
     c78:	d3 e2                	shl    %cl,%edx
     c7a:	81 e3 ff 00 00 00    	and    $0xff,%ebx
     c80:	8b 4d 4c             	mov    0x4c(%ebp),%ecx
     c83:	31 da                	xor    %ebx,%edx
     c85:	21 ca                	and    %ecx,%edx
     c87:	89 55 40             	mov    %edx,0x40(%ebp)
     c8a:	e9 f3 fe ff ff       	jmp    b82 <_deflate_fast+0x1f2>
     c8f:	90                   	nop
         * at the end of the input file. We need MAX_MATCH bytes
         * for the next match, plus MIN_MATCH bytes to insert the
         * string following the next match.
         */
        if (s->lookahead < MIN_LOOKAHEAD) {
            fill_window(s);
     c90:	89 e8                	mov    %ebp,%eax
     c92:	e8 d9 f5 ff ff       	call   270 <_fill_window>
            if (s->lookahead < MIN_LOOKAHEAD && flush == Z_NO_FLUSH) {
     c97:	8b 45 6c             	mov    0x6c(%ebp),%eax
     c9a:	3d 05 01 00 00       	cmp    $0x105,%eax
     c9f:	0f 87 09 fd ff ff    	ja     9ae <_deflate_fast+0x1e>
     ca5:	8b 5c 24 64          	mov    0x64(%esp),%ebx
     ca9:	85 db                	test   %ebx,%ebx
     cab:	0f 84 26 ff ff ff    	je     bd7 <_deflate_fast+0x247>
	        return need_more;
	    }
            if (s->lookahead == 0) break; /* flush the current block */
     cb1:	85 c0                	test   %eax,%eax
     cb3:	74 32                	je     ce7 <_deflate_fast+0x357>
        }

        /* Insert the string window[strstart .. strstart+2] in the
         * dictionary, and set hash_head to the head of the hash chain:
         */
        if (s->lookahead >= MIN_MATCH) {
     cb5:	83 f8 02             	cmp    $0x2,%eax
     cb8:	0f 87 f0 fc ff ff    	ja     9ae <_deflate_fast+0x1e>
     cbe:	8b 55 64             	mov    0x64(%ebp),%edx
     cc1:	e9 2a fd ff ff       	jmp    9f0 <_deflate_fast+0x60>
            /* longest_match() sets match_start */
        }
        if (s->match_length >= MIN_MATCH) {
            check_match(s, s->strstart, s->match_start, s->match_length);

            _tr_tally_dist(s, s->strstart - s->match_start,
     cc6:	89 f8                	mov    %edi,%eax
     cc8:	31 d2                	xor    %edx,%edx
     cca:	66 c1 e8 07          	shr    $0x7,%ax
     cce:	66 89 c2             	mov    %ax,%dx
     cd1:	31 c0                	xor    %eax,%eax
     cd3:	8a 82 00 01 00 00    	mov    0x100(%edx),%al
     cd9:	e9 c0 fd ff ff       	jmp    a9e <_deflate_fast+0x10e>
     cde:	66 90                	xchg   %ax,%ax
            Tracevv((stderr,"%c", s->window[s->strstart]));
            _tr_tally_lit (s, s->window[s->strstart], bflush);
            s->lookahead--;
            s->strstart++; 
        }
        if (bflush) FLUSH_BLOCK(s, 0);
     ce0:	31 c0                	xor    %eax,%eax
     ce2:	e9 bc fe ff ff       	jmp    ba3 <_deflate_fast+0x213>
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
     ce7:	83 7c 24 64 04       	cmpl   $0x4,0x64(%esp)
     cec:	8b 45 54             	mov    0x54(%ebp),%eax
     cef:	8b 55 64             	mov    0x64(%ebp),%edx
     cf2:	0f 94 c3             	sete   %bl
     cf5:	31 c9                	xor    %ecx,%ecx
     cf7:	29 c2                	sub    %eax,%edx
     cf9:	88 d9                	mov    %bl,%cl
     cfb:	85 c0                	test   %eax,%eax
     cfd:	78 57                	js     d56 <_deflate_fast+0x3c6>
     cff:	8b 75 30             	mov    0x30(%ebp),%esi
     d02:	01 f0                	add    %esi,%eax
     d04:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     d08:	89 54 24 08          	mov    %edx,0x8(%esp)
     d0c:	89 44 24 04          	mov    %eax,0x4(%esp)
     d10:	89 2c 24             	mov    %ebp,(%esp)
     d13:	e8 00 00 00 00       	call   d18 <_deflate_fast+0x388>
     d18:	8b 45 64             	mov    0x64(%ebp),%eax
     d1b:	89 45 54             	mov    %eax,0x54(%ebp)
     d1e:	8b 45 00             	mov    0x0(%ebp),%eax
     d21:	e8 3a f7 ff ff       	call   460 <_flush_pending>
     d26:	8b 45 00             	mov    0x0(%ebp),%eax
     d29:	8b 40 10             	mov    0x10(%eax),%eax
     d2c:	85 c0                	test   %eax,%eax
     d2e:	75 13                	jne    d43 <_deflate_fast+0x3b3>
     d30:	89 d8                	mov    %ebx,%eax
    return flush == Z_FINISH ? finish_done : block_done;
}
     d32:	83 c4 4c             	add    $0x4c,%esp
            s->lookahead--;
            s->strstart++; 
        }
        if (bflush) FLUSH_BLOCK(s, 0);
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
     d35:	c1 e0 1f             	shl    $0x1f,%eax
     d38:	c1 f8 1f             	sar    $0x1f,%eax
    return flush == Z_FINISH ? finish_done : block_done;
}
     d3b:	5b                   	pop    %ebx
            s->lookahead--;
            s->strstart++; 
        }
        if (bflush) FLUSH_BLOCK(s, 0);
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
     d3c:	83 e0 02             	and    $0x2,%eax
    return flush == Z_FINISH ? finish_done : block_done;
}
     d3f:	5e                   	pop    %esi
     d40:	5f                   	pop    %edi
     d41:	5d                   	pop    %ebp
     d42:	c3                   	ret    
            s->strstart++; 
        }
        if (bflush) FLUSH_BLOCK(s, 0);
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
     d43:	80 fb 01             	cmp    $0x1,%bl
     d46:	19 c0                	sbb    %eax,%eax
}
     d48:	83 c4 4c             	add    $0x4c,%esp
            s->strstart++; 
        }
        if (bflush) FLUSH_BLOCK(s, 0);
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
     d4b:	83 e0 fe             	and    $0xfffffffe,%eax
}
     d4e:	5b                   	pop    %ebx
            s->strstart++; 
        }
        if (bflush) FLUSH_BLOCK(s, 0);
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
     d4f:	83 c0 03             	add    $0x3,%eax
}
     d52:	5e                   	pop    %esi
     d53:	5f                   	pop    %edi
     d54:	5d                   	pop    %ebp
     d55:	c3                   	ret    
            s->lookahead--;
            s->strstart++; 
        }
        if (bflush) FLUSH_BLOCK(s, 0);
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
     d56:	31 c0                	xor    %eax,%eax
     d58:	eb aa                	jmp    d04 <_deflate_fast+0x374>
     d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d60 <_deflate_stored>:
 * window to pending_buf.
 */
local block_state deflate_stored(s, flush)
    deflate_state *s;
    int flush;
{
     d60:	57                   	push   %edi
     d61:	56                   	push   %esi
     d62:	53                   	push   %ebx
     d63:	83 ec 10             	sub    $0x10,%esp
     d66:	8b 5c 24 20          	mov    0x20(%esp),%ebx
     d6a:	8b 7c 24 24          	mov    0x24(%esp),%edi
     * to pending_buf_size, and each stored block has a 5 byte header:
     */
    ulg max_block_size = 0xffff;
    ulg max_start;

    if (max_block_size > s->pending_buf_size - 5) {
     d6e:	8b 43 0c             	mov    0xc(%ebx),%eax
     d71:	8d 70 fb             	lea    -0x5(%eax),%esi
    int flush;
{
    /* Stored blocks are limited to 0xffff bytes, pending_buf is limited
     * to pending_buf_size, and each stored block has a 5 byte header:
     */
    ulg max_block_size = 0xffff;
     d74:	b8 ff ff 00 00       	mov    $0xffff,%eax
     d79:	81 fe ff ff 00 00    	cmp    $0xffff,%esi
     d7f:	0f 43 f0             	cmovae %eax,%esi
     d82:	eb 13                	jmp    d97 <_deflate_stored+0x37>
	s->strstart += s->lookahead;
	s->lookahead = 0;

	/* Emit a stored block if pending_buf will be full: */
 	max_start = s->block_start + max_block_size;
        if (s->strstart == 0 || (ulg)s->strstart >= max_start) {
     d84:	39 c8                	cmp    %ecx,%eax
     d86:	73 34                	jae    dbc <_deflate_stored+0x5c>
            FLUSH_BLOCK(s, 0);
	}
	/* Flush if we may have to slide, otherwise block_start may become
         * negative and the data will be gone:
         */
        if (s->strstart - (uInt)s->block_start >= MAX_DIST(s)) {
     d88:	8b 4b 24             	mov    0x24(%ebx),%ecx
     d8b:	29 d0                	sub    %edx,%eax
     d8d:	81 e9 06 01 00 00    	sub    $0x106,%ecx
     d93:	39 c8                	cmp    %ecx,%eax
     d95:	73 7f                	jae    e16 <_deflate_stored+0xb6>
    }

    /* Copy as much as possible from input to output: */
    for (;;) {
        /* Fill the window as much as possible: */
        if (s->lookahead <= 1) {
     d97:	8b 43 6c             	mov    0x6c(%ebx),%eax
     d9a:	83 f8 01             	cmp    $0x1,%eax
     d9d:	0f 86 c4 00 00 00    	jbe    e67 <_deflate_stored+0x107>

            if (s->lookahead == 0) break; /* flush the current block */
        }
	Assert(s->block_start >= 0L, "block gone");

	s->strstart += s->lookahead;
     da3:	8b 53 64             	mov    0x64(%ebx),%edx
	s->lookahead = 0;
     da6:	c7 43 6c 00 00 00 00 	movl   $0x0,0x6c(%ebx)

            if (s->lookahead == 0) break; /* flush the current block */
        }
	Assert(s->block_start >= 0L, "block gone");

	s->strstart += s->lookahead;
     dad:	01 d0                	add    %edx,%eax
	s->lookahead = 0;

	/* Emit a stored block if pending_buf will be full: */
 	max_start = s->block_start + max_block_size;
     daf:	8b 53 54             	mov    0x54(%ebx),%edx

            if (s->lookahead == 0) break; /* flush the current block */
        }
	Assert(s->block_start >= 0L, "block gone");

	s->strstart += s->lookahead;
     db2:	89 43 64             	mov    %eax,0x64(%ebx)
	s->lookahead = 0;

	/* Emit a stored block if pending_buf will be full: */
 	max_start = s->block_start + max_block_size;
        if (s->strstart == 0 || (ulg)s->strstart >= max_start) {
     db5:	85 c0                	test   %eax,%eax

	s->strstart += s->lookahead;
	s->lookahead = 0;

	/* Emit a stored block if pending_buf will be full: */
 	max_start = s->block_start + max_block_size;
     db7:	8d 0c 16             	lea    (%esi,%edx,1),%ecx
        if (s->strstart == 0 || (ulg)s->strstart >= max_start) {
     dba:	75 c8                	jne    d84 <_deflate_stored+0x24>
	    /* strstart == 0 is possible when wraparound on 16-bit machine */
	    s->lookahead = (uInt)(s->strstart - max_start);
     dbc:	29 c8                	sub    %ecx,%eax
	    s->strstart = (uInt)max_start;
     dbe:	89 4b 64             	mov    %ecx,0x64(%ebx)

	/* Emit a stored block if pending_buf will be full: */
 	max_start = s->block_start + max_block_size;
        if (s->strstart == 0 || (ulg)s->strstart >= max_start) {
	    /* strstart == 0 is possible when wraparound on 16-bit machine */
	    s->lookahead = (uInt)(s->strstart - max_start);
     dc1:	89 43 6c             	mov    %eax,0x6c(%ebx)
	    s->strstart = (uInt)max_start;
            FLUSH_BLOCK(s, 0);
     dc4:	29 d1                	sub    %edx,%ecx
     dc6:	85 d2                	test   %edx,%edx
     dc8:	0f 88 92 00 00 00    	js     e60 <_deflate_stored+0x100>
     dce:	8b 43 30             	mov    0x30(%ebx),%eax
     dd1:	01 c2                	add    %eax,%edx
     dd3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     dd7:	89 54 24 04          	mov    %edx,0x4(%esp)
     ddb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     de2:	00 
     de3:	89 1c 24             	mov    %ebx,(%esp)
     de6:	e8 00 00 00 00       	call   deb <_deflate_stored+0x8b>
     deb:	8b 43 64             	mov    0x64(%ebx),%eax
     dee:	89 43 54             	mov    %eax,0x54(%ebx)
     df1:	8b 03                	mov    (%ebx),%eax
     df3:	e8 68 f6 ff ff       	call   460 <_flush_pending>
     df8:	8b 03                	mov    (%ebx),%eax
     dfa:	8b 40 10             	mov    0x10(%eax),%eax
     dfd:	85 c0                	test   %eax,%eax
     dff:	74 54                	je     e55 <_deflate_stored+0xf5>
     e01:	8b 43 64             	mov    0x64(%ebx),%eax
     e04:	8b 53 54             	mov    0x54(%ebx),%edx
	}
	/* Flush if we may have to slide, otherwise block_start may become
         * negative and the data will be gone:
         */
        if (s->strstart - (uInt)s->block_start >= MAX_DIST(s)) {
     e07:	8b 4b 24             	mov    0x24(%ebx),%ecx
     e0a:	29 d0                	sub    %edx,%eax
     e0c:	81 e9 06 01 00 00    	sub    $0x106,%ecx
     e12:	39 c8                	cmp    %ecx,%eax
     e14:	72 81                	jb     d97 <_deflate_stored+0x37>
            FLUSH_BLOCK(s, 0);
     e16:	85 d2                	test   %edx,%edx
     e18:	0f 88 ba 00 00 00    	js     ed8 <_deflate_stored+0x178>
     e1e:	8b 4b 30             	mov    0x30(%ebx),%ecx
     e21:	01 ca                	add    %ecx,%edx
     e23:	89 44 24 08          	mov    %eax,0x8(%esp)
     e27:	89 54 24 04          	mov    %edx,0x4(%esp)
     e2b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     e32:	00 
     e33:	89 1c 24             	mov    %ebx,(%esp)
     e36:	e8 00 00 00 00       	call   e3b <_deflate_stored+0xdb>
     e3b:	8b 43 64             	mov    0x64(%ebx),%eax
     e3e:	89 43 54             	mov    %eax,0x54(%ebx)
     e41:	8b 03                	mov    (%ebx),%eax
     e43:	e8 18 f6 ff ff       	call   460 <_flush_pending>
     e48:	8b 03                	mov    (%ebx),%eax
     e4a:	8b 40 10             	mov    0x10(%eax),%eax
     e4d:	85 c0                	test   %eax,%eax
     e4f:	0f 85 42 ff ff ff    	jne    d97 <_deflate_stored+0x37>

            Assert(s->strstart < s->w_size+MAX_DIST(s) ||
		   s->block_start >= (long)s->w_size, "slide too late");

            fill_window(s);
            if (s->lookahead == 0 && flush == Z_NO_FLUSH) return need_more;
     e55:	31 c0                	xor    %eax,%eax
            FLUSH_BLOCK(s, 0);
	}
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
}
     e57:	83 c4 10             	add    $0x10,%esp
     e5a:	5b                   	pop    %ebx
     e5b:	5e                   	pop    %esi
     e5c:	5f                   	pop    %edi
     e5d:	c3                   	ret    
     e5e:	66 90                	xchg   %ax,%ax
 	max_start = s->block_start + max_block_size;
        if (s->strstart == 0 || (ulg)s->strstart >= max_start) {
	    /* strstart == 0 is possible when wraparound on 16-bit machine */
	    s->lookahead = (uInt)(s->strstart - max_start);
	    s->strstart = (uInt)max_start;
            FLUSH_BLOCK(s, 0);
     e60:	31 d2                	xor    %edx,%edx
     e62:	e9 6c ff ff ff       	jmp    dd3 <_deflate_stored+0x73>
        if (s->lookahead <= 1) {

            Assert(s->strstart < s->w_size+MAX_DIST(s) ||
		   s->block_start >= (long)s->w_size, "slide too late");

            fill_window(s);
     e67:	89 d8                	mov    %ebx,%eax
     e69:	e8 02 f4 ff ff       	call   270 <_fill_window>
            if (s->lookahead == 0 && flush == Z_NO_FLUSH) return need_more;
     e6e:	8b 43 6c             	mov    0x6c(%ebx),%eax
     e71:	85 c0                	test   %eax,%eax
     e73:	0f 85 2a ff ff ff    	jne    da3 <_deflate_stored+0x43>
     e79:	85 ff                	test   %edi,%edi
     e7b:	74 d8                	je     e55 <_deflate_stored+0xf5>
         */
        if (s->strstart - (uInt)s->block_start >= MAX_DIST(s)) {
            FLUSH_BLOCK(s, 0);
	}
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
     e7d:	83 ff 04             	cmp    $0x4,%edi
     e80:	8b 53 64             	mov    0x64(%ebx),%edx
     e83:	0f 94 c0             	sete   %al
     e86:	88 c1                	mov    %al,%cl
     e88:	89 c6                	mov    %eax,%esi
     e8a:	8b 43 54             	mov    0x54(%ebx),%eax
     e8d:	81 e1 ff 00 00 00    	and    $0xff,%ecx
     e93:	29 c2                	sub    %eax,%edx
     e95:	85 c0                	test   %eax,%eax
     e97:	78 57                	js     ef0 <_deflate_stored+0x190>
     e99:	8b 7b 30             	mov    0x30(%ebx),%edi
     e9c:	01 f8                	add    %edi,%eax
     e9e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     ea2:	89 54 24 08          	mov    %edx,0x8(%esp)
     ea6:	89 44 24 04          	mov    %eax,0x4(%esp)
     eaa:	89 1c 24             	mov    %ebx,(%esp)
     ead:	e8 00 00 00 00       	call   eb2 <_deflate_stored+0x152>
     eb2:	8b 43 64             	mov    0x64(%ebx),%eax
     eb5:	89 43 54             	mov    %eax,0x54(%ebx)
     eb8:	8b 03                	mov    (%ebx),%eax
     eba:	e8 a1 f5 ff ff       	call   460 <_flush_pending>
     ebf:	8b 03                	mov    (%ebx),%eax
     ec1:	8b 40 10             	mov    0x10(%eax),%eax
     ec4:	85 c0                	test   %eax,%eax
     ec6:	75 17                	jne    edf <_deflate_stored+0x17f>
     ec8:	89 f0                	mov    %esi,%eax
     eca:	c1 e0 1f             	shl    $0x1f,%eax
     ecd:	c1 f8 1f             	sar    $0x1f,%eax
     ed0:	83 e0 02             	and    $0x2,%eax
     ed3:	e9 7f ff ff ff       	jmp    e57 <_deflate_stored+0xf7>
	}
	/* Flush if we may have to slide, otherwise block_start may become
         * negative and the data will be gone:
         */
        if (s->strstart - (uInt)s->block_start >= MAX_DIST(s)) {
            FLUSH_BLOCK(s, 0);
     ed8:	31 d2                	xor    %edx,%edx
     eda:	e9 44 ff ff ff       	jmp    e23 <_deflate_stored+0xc3>
	}
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
    return flush == Z_FINISH ? finish_done : block_done;
     edf:	89 f0                	mov    %esi,%eax
     ee1:	3c 01                	cmp    $0x1,%al
     ee3:	19 c0                	sbb    %eax,%eax
     ee5:	83 e0 fe             	and    $0xfffffffe,%eax
     ee8:	83 c0 03             	add    $0x3,%eax
     eeb:	e9 67 ff ff ff       	jmp    e57 <_deflate_stored+0xf7>
         */
        if (s->strstart - (uInt)s->block_start >= MAX_DIST(s)) {
            FLUSH_BLOCK(s, 0);
	}
    }
    FLUSH_BLOCK(s, flush == Z_FINISH);
     ef0:	31 c0                	xor    %eax,%eax
     ef2:	eb aa                	jmp    e9e <_deflate_stored+0x13e>
     ef4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     efa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000f00 <_deflateSetDictionary>:
/* ========================================================================= */
int ZEXPORT deflateSetDictionary (strm, dictionary, dictLength)
    z_streamp strm;
    const Bytef *dictionary;
    uInt  dictLength;
{
     f00:	55                   	push   %ebp
     f01:	57                   	push   %edi
     f02:	56                   	push   %esi
     f03:	53                   	push   %ebx
     f04:	83 ec 3c             	sub    $0x3c,%esp
     f07:	8b 7c 24 50          	mov    0x50(%esp),%edi
     f0b:	8b 6c 24 54          	mov    0x54(%esp),%ebp
     f0f:	8b 5c 24 58          	mov    0x58(%esp),%ebx
    deflate_state *s;
    uInt length = dictLength;
    uInt n;
    IPos hash_head = 0;

    if (strm == Z_NULL || strm->state == Z_NULL || dictionary == Z_NULL ||
     f13:	85 ff                	test   %edi,%edi
     f15:	0f 84 fc 00 00 00    	je     1017 <_deflateSetDictionary+0x117>
     f1b:	8b 77 1c             	mov    0x1c(%edi),%esi
     f1e:	85 ed                	test   %ebp,%ebp
     f20:	0f 84 f1 00 00 00    	je     1017 <_deflateSetDictionary+0x117>
     f26:	85 f6                	test   %esi,%esi
     f28:	0f 84 e9 00 00 00    	je     1017 <_deflateSetDictionary+0x117>
     f2e:	83 7e 04 2a          	cmpl   $0x2a,0x4(%esi)
     f32:	0f 85 df 00 00 00    	jne    1017 <_deflateSetDictionary+0x117>
        strm->state->status != INIT_STATE) return Z_STREAM_ERROR;

    s = strm->state;
    strm->adler = adler32(strm->adler, dictionary, dictLength);
     f38:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     f3c:	89 6c 24 04          	mov    %ebp,0x4(%esp)
     f40:	8b 47 30             	mov    0x30(%edi),%eax
     f43:	89 04 24             	mov    %eax,(%esp)
     f46:	e8 00 00 00 00       	call   f4b <_deflateSetDictionary+0x4b>

    if (length < MIN_MATCH) return Z_OK;
     f4b:	83 fb 02             	cmp    $0x2,%ebx

    if (strm == Z_NULL || strm->state == Z_NULL || dictionary == Z_NULL ||
        strm->state->status != INIT_STATE) return Z_STREAM_ERROR;

    s = strm->state;
    strm->adler = adler32(strm->adler, dictionary, dictLength);
     f4e:	89 47 30             	mov    %eax,0x30(%edi)

    if (length < MIN_MATCH) return Z_OK;
     f51:	0f 86 b6 00 00 00    	jbe    100d <_deflateSetDictionary+0x10d>
    if (length > MAX_DIST(s)) {
     f57:	8b 46 24             	mov    0x24(%esi),%eax
     f5a:	2d 06 01 00 00       	sub    $0x106,%eax
     f5f:	39 c3                	cmp    %eax,%ebx
     f61:	76 06                	jbe    f69 <_deflateSetDictionary+0x69>
	length = MAX_DIST(s);
#ifndef USE_DICT_HEAD
	dictionary += dictLength - length; /* use the tail of the dictionary */
     f63:	29 c3                	sub    %eax,%ebx
     f65:	01 dd                	add    %ebx,%ebp
     f67:	89 c3                	mov    %eax,%ebx
#endif
    }
    zmemcpy(s->window, dictionary, length);
     f69:	8b 46 30             	mov    0x30(%esi),%eax
     f6c:	89 6c 24 04          	mov    %ebp,0x4(%esp)
     f70:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     f74:	89 04 24             	mov    %eax,(%esp)
     f77:	e8 00 00 00 00       	call   f7c <_deflateSetDictionary+0x7c>

    /* Insert all strings in the hash table (except for the last two bytes).
     * s->lookahead stays null, so s->ins_h will be recomputed at the next
     * call of fill_window.
     */
    s->ins_h = s->window[0];
     f7c:	8b 7e 30             	mov    0x30(%esi),%edi
#ifndef USE_DICT_HEAD
	dictionary += dictLength - length; /* use the tail of the dictionary */
#endif
    }
    zmemcpy(s->window, dictionary, length);
    s->strstart = length;
     f7f:	89 5e 64             	mov    %ebx,0x64(%esi)
    s->block_start = (long)length;
     f82:	89 5e 54             	mov    %ebx,0x54(%esi)

    /* Insert all strings in the hash table (except for the last two bytes).
     * s->lookahead stays null, so s->ins_h will be recomputed at the next
     * call of fill_window.
     */
    s->ins_h = s->window[0];
     f85:	31 c0                	xor    %eax,%eax
    UPDATE_HASH(s, s->ins_h, s->window[1]);
     f87:	8b 56 4c             	mov    0x4c(%esi),%edx

    /* Insert all strings in the hash table (except for the last two bytes).
     * s->lookahead stays null, so s->ins_h will be recomputed at the next
     * call of fill_window.
     */
    s->ins_h = s->window[0];
     f8a:	8a 07                	mov    (%edi),%al
    UPDATE_HASH(s, s->ins_h, s->window[1]);
     f8c:	8b 4e 50             	mov    0x50(%esi),%ecx

    /* Insert all strings in the hash table (except for the last two bytes).
     * s->lookahead stays null, so s->ins_h will be recomputed at the next
     * call of fill_window.
     */
    s->ins_h = s->window[0];
     f8f:	89 46 40             	mov    %eax,0x40(%esi)
    UPDATE_HASH(s, s->ins_h, s->window[1]);
     f92:	89 d5                	mov    %edx,%ebp
     f94:	89 54 24 14          	mov    %edx,0x14(%esp)
     f98:	31 d2                	xor    %edx,%edx
     f9a:	8a 57 01             	mov    0x1(%edi),%dl
    for (n = 0; n <= length - MIN_MATCH; n++) {
     f9d:	89 74 24 28          	mov    %esi,0x28(%esp)
    /* Insert all strings in the hash table (except for the last two bytes).
     * s->lookahead stays null, so s->ins_h will be recomputed at the next
     * call of fill_window.
     */
    s->ins_h = s->window[0];
    UPDATE_HASH(s, s->ins_h, s->window[1]);
     fa1:	d3 e0                	shl    %cl,%eax
     fa3:	31 d0                	xor    %edx,%eax
    for (n = 0; n <= length - MIN_MATCH; n++) {
     fa5:	8d 53 fd             	lea    -0x3(%ebx),%edx
     fa8:	89 54 24 18          	mov    %edx,0x18(%esp)
     fac:	8b 56 38             	mov    0x38(%esi),%edx
     faf:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     fb3:	8b 56 2c             	mov    0x2c(%esi),%edx
    /* Insert all strings in the hash table (except for the last two bytes).
     * s->lookahead stays null, so s->ins_h will be recomputed at the next
     * call of fill_window.
     */
    s->ins_h = s->window[0];
    UPDATE_HASH(s, s->ins_h, s->window[1]);
     fb6:	21 e8                	and    %ebp,%eax
     fb8:	89 54 24 20          	mov    %edx,0x20(%esp)
     fbc:	8b 56 3c             	mov    0x3c(%esi),%edx
     fbf:	89 46 40             	mov    %eax,0x40(%esi)
     fc2:	89 54 24 24          	mov    %edx,0x24(%esp)
    for (n = 0; n <= length - MIN_MATCH; n++) {
     fc6:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
     fca:	31 d2                	xor    %edx,%edx
     fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	INSERT_STRING(s, n, hash_head);
     fd0:	31 db                	xor    %ebx,%ebx
     fd2:	8a 4c 24 2c          	mov    0x2c(%esp),%cl
     fd6:	8a 5c 17 02          	mov    0x2(%edi,%edx,1),%bl
     fda:	8b 6c 24 20          	mov    0x20(%esp),%ebp
     fde:	d3 e0                	shl    %cl,%eax
     fe0:	31 d8                	xor    %ebx,%eax
     fe2:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     fe6:	21 c8                	and    %ecx,%eax
     fe8:	8b 5c 24 24          	mov    0x24(%esp),%ebx
     fec:	8b 4c 24 28          	mov    0x28(%esp),%ecx
     ff0:	21 d5                	and    %edx,%ebp
     ff2:	8d 1c 43             	lea    (%ebx,%eax,2),%ebx
     ff5:	89 41 40             	mov    %eax,0x40(%ecx)
     ff8:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
     ffc:	66 8b 33             	mov    (%ebx),%si
     fff:	66 89 34 69          	mov    %si,(%ecx,%ebp,2)
    1003:	66 89 13             	mov    %dx,(%ebx)
     * s->lookahead stays null, so s->ins_h will be recomputed at the next
     * call of fill_window.
     */
    s->ins_h = s->window[0];
    UPDATE_HASH(s, s->ins_h, s->window[1]);
    for (n = 0; n <= length - MIN_MATCH; n++) {
    1006:	42                   	inc    %edx
    1007:	3b 54 24 18          	cmp    0x18(%esp),%edx
    100b:	76 c3                	jbe    fd0 <_deflateSetDictionary+0xd0>
	INSERT_STRING(s, n, hash_head);
    }
    if (hash_head) hash_head = 0;  /* to make compiler happy */
    return Z_OK;
}
    100d:	83 c4 3c             	add    $0x3c,%esp
        strm->state->status != INIT_STATE) return Z_STREAM_ERROR;

    s = strm->state;
    strm->adler = adler32(strm->adler, dictionary, dictLength);

    if (length < MIN_MATCH) return Z_OK;
    1010:	31 c0                	xor    %eax,%eax
    for (n = 0; n <= length - MIN_MATCH; n++) {
	INSERT_STRING(s, n, hash_head);
    }
    if (hash_head) hash_head = 0;  /* to make compiler happy */
    return Z_OK;
}
    1012:	5b                   	pop    %ebx
    1013:	5e                   	pop    %esi
    1014:	5f                   	pop    %edi
    1015:	5d                   	pop    %ebp
    1016:	c3                   	ret    
    1017:	83 c4 3c             	add    $0x3c,%esp
    uInt length = dictLength;
    uInt n;
    IPos hash_head = 0;

    if (strm == Z_NULL || strm->state == Z_NULL || dictionary == Z_NULL ||
        strm->state->status != INIT_STATE) return Z_STREAM_ERROR;
    101a:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    for (n = 0; n <= length - MIN_MATCH; n++) {
	INSERT_STRING(s, n, hash_head);
    }
    if (hash_head) hash_head = 0;  /* to make compiler happy */
    return Z_OK;
}
    101f:	5b                   	pop    %ebx
    1020:	5e                   	pop    %esi
    1021:	5f                   	pop    %edi
    1022:	5d                   	pop    %ebp
    1023:	c3                   	ret    
    1024:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    102a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001030 <_deflateReset>:

/* ========================================================================= */
int ZEXPORT deflateReset (strm)
    z_streamp strm;
{
    1030:	57                   	push   %edi
    1031:	53                   	push   %ebx
    1032:	83 ec 14             	sub    $0x14,%esp
    1035:	8b 44 24 20          	mov    0x20(%esp),%eax
    deflate_state *s;
    
    if (strm == Z_NULL || strm->state == Z_NULL ||
    1039:	85 c0                	test   %eax,%eax
    103b:	0f 84 8f 01 00 00    	je     11d0 <_deflateReset+0x1a0>
    1041:	8b 58 1c             	mov    0x1c(%eax),%ebx
    1044:	85 db                	test   %ebx,%ebx
    1046:	0f 84 84 01 00 00    	je     11d0 <_deflateReset+0x1a0>
    104c:	8b 48 20             	mov    0x20(%eax),%ecx
    104f:	85 c9                	test   %ecx,%ecx
    1051:	0f 84 79 01 00 00    	je     11d0 <_deflateReset+0x1a0>
        strm->zalloc == Z_NULL || strm->zfree == Z_NULL) return Z_STREAM_ERROR;
    1057:	8b 50 24             	mov    0x24(%eax),%edx
    105a:	85 d2                	test   %edx,%edx
    105c:	0f 84 6e 01 00 00    	je     11d0 <_deflateReset+0x1a0>
    strm->msg = Z_NULL; /* use zfree if we ever allocate msg dynamically */
    strm->data_type = Z_UNKNOWN;

    s = (deflate_state *)strm->state;
    s->pending = 0;
    s->pending_out = s->pending_buf;
    1062:	8b 53 08             	mov    0x8(%ebx),%edx
    deflate_state *s;
    
    if (strm == Z_NULL || strm->state == Z_NULL ||
        strm->zalloc == Z_NULL || strm->zfree == Z_NULL) return Z_STREAM_ERROR;

    strm->total_in = strm->total_out = 0;
    1065:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
    106c:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    strm->msg = Z_NULL; /* use zfree if we ever allocate msg dynamically */
    1073:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
    strm->data_type = Z_UNKNOWN;
    107a:	c7 40 2c 02 00 00 00 	movl   $0x2,0x2c(%eax)

    s = (deflate_state *)strm->state;
    s->pending = 0;
    s->pending_out = s->pending_buf;
    1081:	89 53 10             	mov    %edx,0x10(%ebx)

    if (s->noheader < 0) {
    1084:	8b 53 18             	mov    0x18(%ebx),%edx
    strm->total_in = strm->total_out = 0;
    strm->msg = Z_NULL; /* use zfree if we ever allocate msg dynamically */
    strm->data_type = Z_UNKNOWN;

    s = (deflate_state *)strm->state;
    s->pending = 0;
    1087:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    s->pending_out = s->pending_buf;

    if (s->noheader < 0) {
    108e:	85 d2                	test   %edx,%edx
    1090:	0f 88 0b 01 00 00    	js     11a1 <_deflateReset+0x171>
        s->noheader = 0; /* was set to -1 by deflate(..., Z_FINISH); */
    }
    s->status = s->noheader ? BUSY_STATE : INIT_STATE;
    1096:	83 fa 01             	cmp    $0x1,%edx
    1099:	19 d2                	sbb    %edx,%edx
    109b:	83 e2 b9             	and    $0xffffffb9,%edx
    109e:	83 c2 71             	add    $0x71,%edx
    10a1:	89 53 04             	mov    %edx,0x4(%ebx)
    strm->adler = 1;
    10a4:	c7 40 30 01 00 00 00 	movl   $0x1,0x30(%eax)
    s->last_flush = Z_NO_FLUSH;
    10ab:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

    _tr_init(s);
    10b2:	89 1c 24             	mov    %ebx,(%esp)
    10b5:	e8 00 00 00 00       	call   10ba <_deflateReset+0x8a>
 * Initialize the "longest match" routines for a new zlib stream
 */
local void lm_init (s)
    deflate_state *s;
{
    s->window_size = (ulg)2L*s->w_size;
    10ba:	8b 43 24             	mov    0x24(%ebx),%eax
    10bd:	01 c0                	add    %eax,%eax

    CLEAR_HASH(s);
    10bf:	8b 7b 3c             	mov    0x3c(%ebx),%edi
 * Initialize the "longest match" routines for a new zlib stream
 */
local void lm_init (s)
    deflate_state *s;
{
    s->window_size = (ulg)2L*s->w_size;
    10c2:	89 43 34             	mov    %eax,0x34(%ebx)

    CLEAR_HASH(s);
    10c5:	8b 43 44             	mov    0x44(%ebx),%eax
    10c8:	8d 54 00 fe          	lea    -0x2(%eax,%eax,1),%edx
    10cc:	83 fa 04             	cmp    $0x4,%edx
    10cf:	66 c7 04 17 00 00    	movw   $0x0,(%edi,%edx,1)
    10d5:	0f 83 a8 00 00 00    	jae    1183 <_deflateReset+0x153>
    10db:	f6 c2 02             	test   $0x2,%dl
    10de:	0f 85 8c 00 00 00    	jne    1170 <_deflateReset+0x140>
    10e4:	83 e2 01             	and    $0x1,%edx
    10e7:	75 7b                	jne    1164 <_deflateReset+0x134>

    /* Set the default configuration parameters:
     */
    s->max_lazy_match   = configuration_table[s->level].max_lazy;
    10e9:	8b 43 7c             	mov    0x7c(%ebx),%eax
    10ec:	31 c9                	xor    %ecx,%ecx
    s->good_match       = configuration_table[s->level].good_length;
    s->nice_match       = configuration_table[s->level].nice_length;
    s->max_chain_length = configuration_table[s->level].max_chain;

    s->strstart = 0;
    10ee:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
    s->block_start = 0L;
    10f5:	c7 43 54 00 00 00 00 	movl   $0x0,0x54(%ebx)

    CLEAR_HASH(s);

    /* Set the default configuration parameters:
     */
    s->max_lazy_match   = configuration_table[s->level].max_lazy;
    10fc:	8d 04 40             	lea    (%eax,%eax,2),%eax
    s->nice_match       = configuration_table[s->level].nice_length;
    s->max_chain_length = configuration_table[s->level].max_chain;

    s->strstart = 0;
    s->block_start = 0L;
    s->lookahead = 0;
    10ff:	c7 43 6c 00 00 00 00 	movl   $0x0,0x6c(%ebx)

    CLEAR_HASH(s);

    /* Set the default configuration parameters:
     */
    s->max_lazy_match   = configuration_table[s->level].max_lazy;
    1106:	c1 e0 02             	shl    $0x2,%eax
    s->max_chain_length = configuration_table[s->level].max_chain;

    s->strstart = 0;
    s->block_start = 0L;
    s->lookahead = 0;
    s->match_length = s->prev_length = MIN_MATCH-1;
    1109:	c7 43 70 02 00 00 00 	movl   $0x2,0x70(%ebx)
    1110:	c7 43 58 02 00 00 00 	movl   $0x2,0x58(%ebx)
    s->match_available = 0;
    1117:	c7 43 60 00 00 00 00 	movl   $0x0,0x60(%ebx)

    CLEAR_HASH(s);

    /* Set the default configuration parameters:
     */
    s->max_lazy_match   = configuration_table[s->level].max_lazy;
    111e:	8d 90 00 00 00 00    	lea    0x0(%eax),%edx
    1124:	66 8b 88 02 00 00 00 	mov    0x2(%eax),%cx
    112b:	89 4b 78             	mov    %ecx,0x78(%ebx)
    s->good_match       = configuration_table[s->level].good_length;
    112e:	8b 88 00 00 00 00    	mov    0x0(%eax),%ecx
    s->nice_match       = configuration_table[s->level].nice_length;
    1134:	31 c0                	xor    %eax,%eax
    CLEAR_HASH(s);

    /* Set the default configuration parameters:
     */
    s->max_lazy_match   = configuration_table[s->level].max_lazy;
    s->good_match       = configuration_table[s->level].good_length;
    1136:	81 e1 ff ff 00 00    	and    $0xffff,%ecx
    s->nice_match       = configuration_table[s->level].nice_length;
    113c:	66 8b 42 04          	mov    0x4(%edx),%ax
    CLEAR_HASH(s);

    /* Set the default configuration parameters:
     */
    s->max_lazy_match   = configuration_table[s->level].max_lazy;
    s->good_match       = configuration_table[s->level].good_length;
    1140:	89 8b 84 00 00 00    	mov    %ecx,0x84(%ebx)
    s->nice_match       = configuration_table[s->level].nice_length;
    1146:	89 83 88 00 00 00    	mov    %eax,0x88(%ebx)
    s->max_chain_length = configuration_table[s->level].max_chain;
    114c:	31 c0                	xor    %eax,%eax
    114e:	66 8b 42 06          	mov    0x6(%edx),%ax
    s->strstart = 0;
    s->block_start = 0L;
    s->lookahead = 0;
    s->match_length = s->prev_length = MIN_MATCH-1;
    s->match_available = 0;
    s->ins_h = 0;
    1152:	c7 43 40 00 00 00 00 	movl   $0x0,0x40(%ebx)
    /* Set the default configuration parameters:
     */
    s->max_lazy_match   = configuration_table[s->level].max_lazy;
    s->good_match       = configuration_table[s->level].good_length;
    s->nice_match       = configuration_table[s->level].nice_length;
    s->max_chain_length = configuration_table[s->level].max_chain;
    1159:	89 43 74             	mov    %eax,0x74(%ebx)
    s->last_flush = Z_NO_FLUSH;

    _tr_init(s);
    lm_init(s);

    return Z_OK;
    115c:	31 c0                	xor    %eax,%eax
}
    115e:	83 c4 14             	add    $0x14,%esp
    1161:	5b                   	pop    %ebx
    1162:	5f                   	pop    %edi
    1163:	c3                   	ret    
local void lm_init (s)
    deflate_state *s;
{
    s->window_size = (ulg)2L*s->w_size;

    CLEAR_HASH(s);
    1164:	c6 07 00             	movb   $0x0,(%edi)
    1167:	e9 7d ff ff ff       	jmp    10e9 <_deflateReset+0xb9>
    116c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1170:	66 c7 07 00 00       	movw   $0x0,(%edi)
    1175:	83 c7 02             	add    $0x2,%edi
    1178:	83 e2 01             	and    $0x1,%edx
    117b:	0f 84 68 ff ff ff    	je     10e9 <_deflateReset+0xb9>
    1181:	eb e1                	jmp    1164 <_deflateReset+0x134>
    1183:	f7 c7 01 00 00 00    	test   $0x1,%edi
    1189:	75 27                	jne    11b2 <_deflateReset+0x182>
    118b:	f7 c7 02 00 00 00    	test   $0x2,%edi
    1191:	75 2d                	jne    11c0 <_deflateReset+0x190>
    1193:	89 d1                	mov    %edx,%ecx
    1195:	31 c0                	xor    %eax,%eax
    1197:	c1 e9 02             	shr    $0x2,%ecx
    119a:	f3 ab                	rep stos %eax,%es:(%edi)
    119c:	e9 3a ff ff ff       	jmp    10db <_deflateReset+0xab>
    s = (deflate_state *)strm->state;
    s->pending = 0;
    s->pending_out = s->pending_buf;

    if (s->noheader < 0) {
        s->noheader = 0; /* was set to -1 by deflate(..., Z_FINISH); */
    11a1:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    }
    s->status = s->noheader ? BUSY_STATE : INIT_STATE;
    11a8:	ba 2a 00 00 00       	mov    $0x2a,%edx
    11ad:	e9 ef fe ff ff       	jmp    10a1 <_deflateReset+0x71>
local void lm_init (s)
    deflate_state *s;
{
    s->window_size = (ulg)2L*s->w_size;

    CLEAR_HASH(s);
    11b2:	c6 07 00             	movb   $0x0,(%edi)
    11b5:	4a                   	dec    %edx
    11b6:	47                   	inc    %edi
    11b7:	eb d2                	jmp    118b <_deflateReset+0x15b>
    11b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11c0:	66 c7 07 00 00       	movw   $0x0,(%edi)
    11c5:	83 ea 02             	sub    $0x2,%edx
    11c8:	83 c7 02             	add    $0x2,%edi
    11cb:	eb c6                	jmp    1193 <_deflateReset+0x163>
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
    z_streamp strm;
{
    deflate_state *s;
    
    if (strm == Z_NULL || strm->state == Z_NULL ||
        strm->zalloc == Z_NULL || strm->zfree == Z_NULL) return Z_STREAM_ERROR;
    11d0:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    11d5:	eb 87                	jmp    115e <_deflateReset+0x12e>
    11d7:	89 f6                	mov    %esi,%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <_deflate>:

/* ========================================================================= */
int ZEXPORT deflate (strm, flush)
    z_streamp strm;
    int flush;
{
    11e0:	55                   	push   %ebp
    11e1:	57                   	push   %edi
    11e2:	56                   	push   %esi
    11e3:	53                   	push   %ebx
    11e4:	83 ec 2c             	sub    $0x2c,%esp
    11e7:	8b 74 24 40          	mov    0x40(%esp),%esi
    11eb:	8b 7c 24 44          	mov    0x44(%esp),%edi
    int old_flush; /* value of flush param for previous deflate call */
    deflate_state *s;

    if (strm == Z_NULL || strm->state == Z_NULL ||
    11ef:	85 f6                	test   %esi,%esi
    11f1:	0f 84 40 03 00 00    	je     1537 <_deflate+0x357>
    11f7:	8b 5e 1c             	mov    0x1c(%esi),%ebx
    11fa:	85 db                	test   %ebx,%ebx
    11fc:	0f 84 35 03 00 00    	je     1537 <_deflate+0x357>
	flush > Z_FINISH || flush < 0) {
    1202:	83 ff 04             	cmp    $0x4,%edi
    1205:	0f 87 2c 03 00 00    	ja     1537 <_deflate+0x357>
        return Z_STREAM_ERROR;
    }
    s = strm->state;

    if (strm->next_out == Z_NULL ||
    120b:	8b 46 0c             	mov    0xc(%esi),%eax
    120e:	85 c0                	test   %eax,%eax
    1210:	0f 84 ca 02 00 00    	je     14e0 <_deflate+0x300>
    1216:	8b 06                	mov    (%esi),%eax
    1218:	85 c0                	test   %eax,%eax
    121a:	0f 84 b1 02 00 00    	je     14d1 <_deflate+0x2f1>
        (strm->next_in == Z_NULL && strm->avail_in != 0) ||
	(s->status == FINISH_STATE && flush != Z_FINISH)) {
    1220:	83 ff 04             	cmp    $0x4,%edi
    1223:	8b 43 04             	mov    0x4(%ebx),%eax
    1226:	0f 95 44 24 1b       	setne  0x1b(%esp)
    122b:	74 0b                	je     1238 <_deflate+0x58>
    122d:	3d 9a 02 00 00       	cmp    $0x29a,%eax
    1232:	0f 84 a8 02 00 00    	je     14e0 <_deflate+0x300>
        ERR_RETURN(strm, Z_STREAM_ERROR);
    }
    if (strm->avail_out == 0) ERR_RETURN(strm, Z_BUF_ERROR);
    1238:	8b 6e 10             	mov    0x10(%esi),%ebp
    123b:	85 ed                	test   %ebp,%ebp
    123d:	0f 84 5d 02 00 00    	je     14a0 <_deflate+0x2c0>

    s->strm = strm; /* just in case */
    old_flush = s->last_flush;
    1243:	8b 53 20             	mov    0x20(%ebx),%edx
	(s->status == FINISH_STATE && flush != Z_FINISH)) {
        ERR_RETURN(strm, Z_STREAM_ERROR);
    }
    if (strm->avail_out == 0) ERR_RETURN(strm, Z_BUF_ERROR);

    s->strm = strm; /* just in case */
    1246:	89 33                	mov    %esi,(%ebx)
    old_flush = s->last_flush;
    1248:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    s->last_flush = flush;
    124c:	89 7b 20             	mov    %edi,0x20(%ebx)

    /* Write the zlib header */
    if (s->status == INIT_STATE) {
    124f:	83 f8 2a             	cmp    $0x2a,%eax
    1252:	0f 84 60 01 00 00    	je     13b8 <_deflate+0x1d8>
	}
	strm->adler = 1L;
    }

    /* Flush as much pending output as possible */
    if (s->pending != 0) {
    1258:	8b 43 14             	mov    0x14(%ebx),%eax
    125b:	85 c0                	test   %eax,%eax
    125d:	0f 85 2d 01 00 00    	jne    1390 <_deflate+0x1b0>

    /* Make sure there is something to do and avoid duplicate consecutive
     * flushes. For repeated and useless calls with Z_FINISH, we keep
     * returning Z_STREAM_END instead of Z_BUFF_ERROR.
     */
    } else if (strm->avail_in == 0 && flush <= old_flush &&
    1263:	8b 6e 04             	mov    0x4(%esi),%ebp
    1266:	85 ed                	test   %ebp,%ebp
    1268:	0f 84 c7 00 00 00    	je     1335 <_deflate+0x155>
	       flush != Z_FINISH) {
        ERR_RETURN(strm, Z_BUF_ERROR);
    }

    /* User must not provide more input after the first FINISH: */
    if (s->status == FINISH_STATE && strm->avail_in != 0) {
    126e:	81 7b 04 9a 02 00 00 	cmpl   $0x29a,0x4(%ebx)
    1275:	0f 84 25 02 00 00    	je     14a0 <_deflate+0x2c0>
     */
    if (strm->avail_in != 0 || s->lookahead != 0 ||
        (flush != Z_NO_FLUSH && s->status != FINISH_STATE)) {
        block_state bstate;

	bstate = (*(configuration_table[s->level].func))(s, flush);
    127b:	8b 43 7c             	mov    0x7c(%ebx),%eax
    127e:	89 7c 24 04          	mov    %edi,0x4(%esp)
    1282:	89 1c 24             	mov    %ebx,(%esp)
    1285:	8d 04 40             	lea    (%eax,%eax,2),%eax
    1288:	ff 14 85 08 00 00 00 	call   *0x8(,%eax,4)

        if (bstate == finish_started || bstate == finish_done) {
    128f:	8d 50 fe             	lea    -0x2(%eax),%edx
    1292:	83 fa 01             	cmp    $0x1,%edx
    1295:	0f 86 2a 02 00 00    	jbe    14c5 <_deflate+0x2e5>
            s->status = FINISH_STATE;
        }
        if (bstate == need_more || bstate == finish_started) {
    129b:	a9 fd ff ff ff       	test   $0xfffffffd,%eax
    12a0:	0f 84 da 00 00 00    	je     1380 <_deflate+0x1a0>
	     * empty block here, this will be done at next call. This also
	     * ensures that for a very small output buffer, we emit at most
	     * one empty block.
	     */
	}
        if (bstate == block_done) {
    12a6:	48                   	dec    %eax
    12a7:	0f 84 45 02 00 00    	je     14f2 <_deflate+0x312>
	    }
        }
    }
    Assert(strm->avail_out > 0, "bug2");

    if (flush != Z_FINISH) return Z_OK;
    12ad:	80 7c 24 1b 00       	cmpb   $0x0,0x1b(%esp)
    12b2:	0f 85 a8 00 00 00    	jne    1360 <_deflate+0x180>
    if (s->noheader) return Z_STREAM_END;
    12b8:	8b 4b 18             	mov    0x18(%ebx),%ecx
    12bb:	b8 01 00 00 00       	mov    $0x1,%eax
    12c0:	85 c9                	test   %ecx,%ecx
    12c2:	0f 85 9a 00 00 00    	jne    1362 <_deflate+0x182>
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    12c8:	8b 53 14             	mov    0x14(%ebx),%edx

    if (flush != Z_FINISH) return Z_OK;
    if (s->noheader) return Z_STREAM_END;

    /* Write the zlib trailer (adler32) */
    putShortMSB(s, (uInt)(strm->adler >> 16));
    12cb:	8b 46 30             	mov    0x30(%esi),%eax
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    12ce:	8b 7b 08             	mov    0x8(%ebx),%edi

    if (flush != Z_FINISH) return Z_OK;
    if (s->noheader) return Z_STREAM_END;

    /* Write the zlib trailer (adler32) */
    putShortMSB(s, (uInt)(strm->adler >> 16));
    12d1:	89 c1                	mov    %eax,%ecx
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    12d3:	c1 e8 18             	shr    $0x18,%eax
    12d6:	8d 6a 01             	lea    0x1(%edx),%ebp

    if (flush != Z_FINISH) return Z_OK;
    if (s->noheader) return Z_STREAM_END;

    /* Write the zlib trailer (adler32) */
    putShortMSB(s, (uInt)(strm->adler >> 16));
    12d9:	c1 e9 10             	shr    $0x10,%ecx
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    12dc:	89 6b 14             	mov    %ebp,0x14(%ebx)
    12df:	88 04 17             	mov    %al,(%edi,%edx,1)
    put_byte(s, (Byte)(b & 0xff));
    12e2:	8b 43 14             	mov    0x14(%ebx),%eax
    12e5:	8b 53 08             	mov    0x8(%ebx),%edx
    12e8:	8d 78 01             	lea    0x1(%eax),%edi
    12eb:	89 7b 14             	mov    %edi,0x14(%ebx)
    12ee:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    if (flush != Z_FINISH) return Z_OK;
    if (s->noheader) return Z_STREAM_END;

    /* Write the zlib trailer (adler32) */
    putShortMSB(s, (uInt)(strm->adler >> 16));
    putShortMSB(s, (uInt)(strm->adler & 0xffff));
    12f1:	31 d2                	xor    %edx,%edx
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    12f3:	8b 43 14             	mov    0x14(%ebx),%eax
    if (flush != Z_FINISH) return Z_OK;
    if (s->noheader) return Z_STREAM_END;

    /* Write the zlib trailer (adler32) */
    putShortMSB(s, (uInt)(strm->adler >> 16));
    putShortMSB(s, (uInt)(strm->adler & 0xffff));
    12f6:	66 8b 56 30          	mov    0x30(%esi),%dx
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    12fa:	8b 6b 08             	mov    0x8(%ebx),%ebp
    12fd:	89 d1                	mov    %edx,%ecx
    12ff:	8d 78 01             	lea    0x1(%eax),%edi
    1302:	c1 e9 08             	shr    $0x8,%ecx
    1305:	89 7b 14             	mov    %edi,0x14(%ebx)
    1308:	88 4c 05 00          	mov    %cl,0x0(%ebp,%eax,1)
    put_byte(s, (Byte)(b & 0xff));
    130c:	8b 43 14             	mov    0x14(%ebx),%eax
    130f:	8b 4b 08             	mov    0x8(%ebx),%ecx
    1312:	8d 78 01             	lea    0x1(%eax),%edi
    1315:	89 7b 14             	mov    %edi,0x14(%ebx)
    1318:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    if (s->noheader) return Z_STREAM_END;

    /* Write the zlib trailer (adler32) */
    putShortMSB(s, (uInt)(strm->adler >> 16));
    putShortMSB(s, (uInt)(strm->adler & 0xffff));
    flush_pending(strm);
    131b:	89 f0                	mov    %esi,%eax
    131d:	e8 3e f1 ff ff       	call   460 <_flush_pending>
    /* If avail_out is zero, the application will call deflate again
     * to flush the rest.
     */
    s->noheader = -1; /* write the trailer only once! */
    return s->pending != 0 ? Z_OK : Z_STREAM_END;
    1322:	31 c0                	xor    %eax,%eax
    1324:	8b 53 14             	mov    0x14(%ebx),%edx
    putShortMSB(s, (uInt)(strm->adler & 0xffff));
    flush_pending(strm);
    /* If avail_out is zero, the application will call deflate again
     * to flush the rest.
     */
    s->noheader = -1; /* write the trailer only once! */
    1327:	c7 43 18 ff ff ff ff 	movl   $0xffffffff,0x18(%ebx)
    return s->pending != 0 ? Z_OK : Z_STREAM_END;
    132e:	85 d2                	test   %edx,%edx
    1330:	0f 94 c0             	sete   %al
    1333:	eb 2d                	jmp    1362 <_deflate+0x182>

    /* Make sure there is something to do and avoid duplicate consecutive
     * flushes. For repeated and useless calls with Z_FINISH, we keep
     * returning Z_STREAM_END instead of Z_BUFF_ERROR.
     */
    } else if (strm->avail_in == 0 && flush <= old_flush &&
    1335:	3b 7c 24 1c          	cmp    0x1c(%esp),%edi
    1339:	7f 0b                	jg     1346 <_deflate+0x166>
    133b:	80 7c 24 1b 00       	cmpb   $0x0,0x1b(%esp)
    1340:	0f 85 5a 01 00 00    	jne    14a0 <_deflate+0x2c0>
	       flush != Z_FINISH) {
        ERR_RETURN(strm, Z_BUF_ERROR);
    }

    /* User must not provide more input after the first FINISH: */
    if (s->status == FINISH_STATE && strm->avail_in != 0) {
    1346:	8b 43 04             	mov    0x4(%ebx),%eax
        ERR_RETURN(strm, Z_BUF_ERROR);
    }

    /* Start a new block or continue the current one.
     */
    if (strm->avail_in != 0 || s->lookahead != 0 ||
    1349:	8b 6b 6c             	mov    0x6c(%ebx),%ebp
    134c:	85 ed                	test   %ebp,%ebp
    134e:	0f 85 27 ff ff ff    	jne    127b <_deflate+0x9b>
    1354:	85 ff                	test   %edi,%edi
    1356:	0f 85 59 01 00 00    	jne    14b5 <_deflate+0x2d5>
    135c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                }
            }
            flush_pending(strm);
	    if (strm->avail_out == 0) {
	      s->last_flush = -1; /* avoid BUF_ERROR at next call, see above */
	      return Z_OK;
    1360:	31 c0                	xor    %eax,%eax
    /* If avail_out is zero, the application will call deflate again
     * to flush the rest.
     */
    s->noheader = -1; /* write the trailer only once! */
    return s->pending != 0 ? Z_OK : Z_STREAM_END;
}
    1362:	83 c4 2c             	add    $0x2c,%esp
    1365:	5b                   	pop    %ebx
    1366:	5e                   	pop    %esi
    1367:	5f                   	pop    %edi
    1368:	5d                   	pop    %ebp
    1369:	c3                   	ret    
    136a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	     * one empty block.
	     */
	}
        if (bstate == block_done) {
            if (flush == Z_PARTIAL_FLUSH) {
                _tr_align(s);
    1370:	89 1c 24             	mov    %ebx,(%esp)
    1373:	e8 00 00 00 00       	call   1378 <_deflate+0x198>
                 */
                if (flush == Z_FULL_FLUSH) {
                    CLEAR_HASH(s);             /* forget history */
                }
            }
            flush_pending(strm);
    1378:	89 f0                	mov    %esi,%eax
    137a:	e8 e1 f0 ff ff       	call   460 <_flush_pending>
    137f:	90                   	nop
	    if (strm->avail_out == 0) {
    1380:	8b 46 10             	mov    0x10(%esi),%eax
    1383:	85 c0                	test   %eax,%eax
    1385:	75 d9                	jne    1360 <_deflate+0x180>
	      s->last_flush = -1; /* avoid BUF_ERROR at next call, see above */
    1387:	c7 43 20 ff ff ff ff 	movl   $0xffffffff,0x20(%ebx)
    138e:	eb d0                	jmp    1360 <_deflate+0x180>
	strm->adler = 1L;
    }

    /* Flush as much pending output as possible */
    if (s->pending != 0) {
        flush_pending(strm);
    1390:	89 f0                	mov    %esi,%eax
    1392:	e8 c9 f0 ff ff       	call   460 <_flush_pending>
        if (strm->avail_out == 0) {
    1397:	8b 46 10             	mov    0x10(%esi),%eax
    139a:	85 c0                	test   %eax,%eax
    139c:	74 e9                	je     1387 <_deflate+0x1a7>
	       flush != Z_FINISH) {
        ERR_RETURN(strm, Z_BUF_ERROR);
    }

    /* User must not provide more input after the first FINISH: */
    if (s->status == FINISH_STATE && strm->avail_in != 0) {
    139e:	8b 43 04             	mov    0x4(%ebx),%eax
    13a1:	3d 9a 02 00 00       	cmp    $0x29a,%eax
    13a6:	0f 84 e4 00 00 00    	je     1490 <_deflate+0x2b0>
        ERR_RETURN(strm, Z_BUF_ERROR);
    }

    /* Start a new block or continue the current one.
     */
    if (strm->avail_in != 0 || s->lookahead != 0 ||
    13ac:	8b 56 04             	mov    0x4(%esi),%edx
    13af:	85 d2                	test   %edx,%edx
    13b1:	74 96                	je     1349 <_deflate+0x169>
    13b3:	e9 c3 fe ff ff       	jmp    127b <_deflate+0x9b>
    s->last_flush = flush;

    /* Write the zlib header */
    if (s->status == INIT_STATE) {

        uInt header = (Z_DEFLATED + ((s->w_bits-8)<<4)) << 8;
    13b8:	8b 43 28             	mov    0x28(%ebx),%eax
    13bb:	b9 03 00 00 00       	mov    $0x3,%ecx
    13c0:	c1 e0 0c             	shl    $0xc,%eax
        uInt level_flags = (s->level-1) >> 1;

        if (level_flags > 3) level_flags = 3;
        header |= (level_flags << 6);
	if (s->strstart != 0) header |= PRESET_DICT;
        header += 31 - (header % 31);
    13c3:	bd 1f 00 00 00       	mov    $0x1f,%ebp

        s->status = BUSY_STATE;
    13c8:	c7 43 04 71 00 00 00 	movl   $0x71,0x4(%ebx)
    s->last_flush = flush;

    /* Write the zlib header */
    if (s->status == INIT_STATE) {

        uInt header = (Z_DEFLATED + ((s->w_bits-8)<<4)) << 8;
    13cf:	8d 90 00 88 ff ff    	lea    -0x7800(%eax),%edx
        uInt level_flags = (s->level-1) >> 1;
    13d5:	8b 43 7c             	mov    0x7c(%ebx),%eax
    13d8:	48                   	dec    %eax
    13d9:	d1 f8                	sar    %eax
    13db:	83 f8 03             	cmp    $0x3,%eax
    13de:	0f 46 c8             	cmovbe %eax,%ecx

        if (level_flags > 3) level_flags = 3;
        header |= (level_flags << 6);
    13e1:	c1 e1 06             	shl    $0x6,%ecx
    13e4:	09 d1                	or     %edx,%ecx
	if (s->strstart != 0) header |= PRESET_DICT;
    13e6:	8b 53 64             	mov    0x64(%ebx),%edx
    13e9:	89 c8                	mov    %ecx,%eax
    13eb:	83 c8 20             	or     $0x20,%eax
    13ee:	85 d2                	test   %edx,%edx
    13f0:	0f 45 c8             	cmovne %eax,%ecx
        header += 31 - (header % 31);
    13f3:	89 c8                	mov    %ecx,%eax
    13f5:	31 d2                	xor    %edx,%edx
    13f7:	f7 f5                	div    %ebp
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    13f9:	8b 43 14             	mov    0x14(%ebx),%eax
    13fc:	83 c1 1f             	add    $0x1f,%ecx
        uInt level_flags = (s->level-1) >> 1;

        if (level_flags > 3) level_flags = 3;
        header |= (level_flags << 6);
	if (s->strstart != 0) header |= PRESET_DICT;
        header += 31 - (header % 31);
    13ff:	29 d1                	sub    %edx,%ecx
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    1401:	8b 6b 08             	mov    0x8(%ebx),%ebp
    1404:	8d 50 01             	lea    0x1(%eax),%edx
    1407:	89 53 14             	mov    %edx,0x14(%ebx)
    140a:	89 ca                	mov    %ecx,%edx
    140c:	c1 ea 08             	shr    $0x8,%edx
    140f:	88 54 05 00          	mov    %dl,0x0(%ebp,%eax,1)
    put_byte(s, (Byte)(b & 0xff));
    1413:	8b 43 14             	mov    0x14(%ebx),%eax
    1416:	8b 53 08             	mov    0x8(%ebx),%edx
    1419:	8d 68 01             	lea    0x1(%eax),%ebp
    141c:	89 6b 14             	mov    %ebp,0x14(%ebx)
    141f:	88 0c 02             	mov    %cl,(%edx,%eax,1)

        s->status = BUSY_STATE;
        putShortMSB(s, header);

	/* Save the adler32 of the preset dictionary: */
	if (s->strstart != 0) {
    1422:	8b 4b 64             	mov    0x64(%ebx),%ecx
    1425:	85 c9                	test   %ecx,%ecx
    1427:	74 56                	je     147f <_deflate+0x29f>
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    1429:	8b 53 14             	mov    0x14(%ebx),%edx
        s->status = BUSY_STATE;
        putShortMSB(s, header);

	/* Save the adler32 of the preset dictionary: */
	if (s->strstart != 0) {
	    putShortMSB(s, (uInt)(strm->adler >> 16));
    142c:	8b 46 30             	mov    0x30(%esi),%eax
    142f:	89 c5                	mov    %eax,%ebp
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    1431:	c1 e8 18             	shr    $0x18,%eax
    1434:	8d 4a 01             	lea    0x1(%edx),%ecx
        s->status = BUSY_STATE;
        putShortMSB(s, header);

	/* Save the adler32 of the preset dictionary: */
	if (s->strstart != 0) {
	    putShortMSB(s, (uInt)(strm->adler >> 16));
    1437:	c1 ed 10             	shr    $0x10,%ebp
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    143a:	89 4b 14             	mov    %ecx,0x14(%ebx)
    143d:	8b 4b 08             	mov    0x8(%ebx),%ecx
    1440:	88 04 11             	mov    %al,(%ecx,%edx,1)
    put_byte(s, (Byte)(b & 0xff));
    1443:	8b 43 14             	mov    0x14(%ebx),%eax
    1446:	8b 53 08             	mov    0x8(%ebx),%edx
    1449:	8d 48 01             	lea    0x1(%eax),%ecx
    144c:	89 4b 14             	mov    %ecx,0x14(%ebx)
    144f:	89 e9                	mov    %ebp,%ecx
    1451:	88 0c 02             	mov    %cl,(%edx,%eax,1)
        putShortMSB(s, header);

	/* Save the adler32 of the preset dictionary: */
	if (s->strstart != 0) {
	    putShortMSB(s, (uInt)(strm->adler >> 16));
	    putShortMSB(s, (uInt)(strm->adler & 0xffff));
    1454:	31 ed                	xor    %ebp,%ebp
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    1456:	8b 43 14             	mov    0x14(%ebx),%eax
        putShortMSB(s, header);

	/* Save the adler32 of the preset dictionary: */
	if (s->strstart != 0) {
	    putShortMSB(s, (uInt)(strm->adler >> 16));
	    putShortMSB(s, (uInt)(strm->adler & 0xffff));
    1459:	66 8b 6e 30          	mov    0x30(%esi),%bp
 */
local void putShortMSB (s, b)
    deflate_state *s;
    uInt b;
{
    put_byte(s, (Byte)(b >> 8));
    145d:	8b 4b 08             	mov    0x8(%ebx),%ecx
    1460:	8d 50 01             	lea    0x1(%eax),%edx
    1463:	89 53 14             	mov    %edx,0x14(%ebx)
    1466:	89 ea                	mov    %ebp,%edx
    1468:	c1 ea 08             	shr    $0x8,%edx
    146b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    put_byte(s, (Byte)(b & 0xff));
    146e:	8b 43 14             	mov    0x14(%ebx),%eax
    1471:	8b 53 08             	mov    0x8(%ebx),%edx
    1474:	8d 48 01             	lea    0x1(%eax),%ecx
    1477:	89 4b 14             	mov    %ecx,0x14(%ebx)
    147a:	89 e9                	mov    %ebp,%ecx
    147c:	88 0c 02             	mov    %cl,(%edx,%eax,1)
	/* Save the adler32 of the preset dictionary: */
	if (s->strstart != 0) {
	    putShortMSB(s, (uInt)(strm->adler >> 16));
	    putShortMSB(s, (uInt)(strm->adler & 0xffff));
	}
	strm->adler = 1L;
    147f:	c7 46 30 01 00 00 00 	movl   $0x1,0x30(%esi)
    1486:	e9 cd fd ff ff       	jmp    1258 <_deflate+0x78>
    148b:	90                   	nop
    148c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	       flush != Z_FINISH) {
        ERR_RETURN(strm, Z_BUF_ERROR);
    }

    /* User must not provide more input after the first FINISH: */
    if (s->status == FINISH_STATE && strm->avail_in != 0) {
    1490:	8b 4e 04             	mov    0x4(%esi),%ecx
    1493:	85 c9                	test   %ecx,%ecx
    1495:	0f 84 ae fe ff ff    	je     1349 <_deflate+0x169>
    149b:	90                   	nop
    149c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ERR_RETURN(strm, Z_BUF_ERROR);
    14a0:	a1 1c 00 00 00       	mov    0x1c,%eax
    14a5:	89 46 18             	mov    %eax,0x18(%esi)
    /* If avail_out is zero, the application will call deflate again
     * to flush the rest.
     */
    s->noheader = -1; /* write the trailer only once! */
    return s->pending != 0 ? Z_OK : Z_STREAM_END;
}
    14a8:	83 c4 2c             	add    $0x2c,%esp
        ERR_RETURN(strm, Z_BUF_ERROR);
    }

    /* User must not provide more input after the first FINISH: */
    if (s->status == FINISH_STATE && strm->avail_in != 0) {
        ERR_RETURN(strm, Z_BUF_ERROR);
    14ab:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
    /* If avail_out is zero, the application will call deflate again
     * to flush the rest.
     */
    s->noheader = -1; /* write the trailer only once! */
    return s->pending != 0 ? Z_OK : Z_STREAM_END;
}
    14b0:	5b                   	pop    %ebx
    14b1:	5e                   	pop    %esi
    14b2:	5f                   	pop    %edi
    14b3:	5d                   	pop    %ebp
    14b4:	c3                   	ret    
    }

    /* Start a new block or continue the current one.
     */
    if (strm->avail_in != 0 || s->lookahead != 0 ||
        (flush != Z_NO_FLUSH && s->status != FINISH_STATE)) {
    14b5:	3d 9a 02 00 00       	cmp    $0x29a,%eax
    14ba:	0f 85 bb fd ff ff    	jne    127b <_deflate+0x9b>
    14c0:	e9 e8 fd ff ff       	jmp    12ad <_deflate+0xcd>
        block_state bstate;

	bstate = (*(configuration_table[s->level].func))(s, flush);

        if (bstate == finish_started || bstate == finish_done) {
            s->status = FINISH_STATE;
    14c5:	c7 43 04 9a 02 00 00 	movl   $0x29a,0x4(%ebx)
    14cc:	e9 ca fd ff ff       	jmp    129b <_deflate+0xbb>
        return Z_STREAM_ERROR;
    }
    s = strm->state;

    if (strm->next_out == Z_NULL ||
        (strm->next_in == Z_NULL && strm->avail_in != 0) ||
    14d1:	8b 46 04             	mov    0x4(%esi),%eax
    14d4:	85 c0                	test   %eax,%eax
    14d6:	0f 84 44 fd ff ff    	je     1220 <_deflate+0x40>
    14dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	(s->status == FINISH_STATE && flush != Z_FINISH)) {
        ERR_RETURN(strm, Z_STREAM_ERROR);
    14e0:	a1 10 00 00 00       	mov    0x10,%eax
    14e5:	89 46 18             	mov    %eax,0x18(%esi)
    14e8:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    14ed:	e9 70 fe ff ff       	jmp    1362 <_deflate+0x182>
	     * ensures that for a very small output buffer, we emit at most
	     * one empty block.
	     */
	}
        if (bstate == block_done) {
            if (flush == Z_PARTIAL_FLUSH) {
    14f2:	83 ff 01             	cmp    $0x1,%edi
    14f5:	0f 84 75 fe ff ff    	je     1370 <_deflate+0x190>
                _tr_align(s);
            } else { /* FULL_FLUSH or SYNC_FLUSH */
                _tr_stored_block(s, (char*)0, 0L, 0);
    14fb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1502:	00 
    1503:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    150a:	00 
    150b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1512:	00 
    1513:	89 1c 24             	mov    %ebx,(%esp)
    1516:	e8 00 00 00 00       	call   151b <_deflate+0x33b>
                /* For a full flush, this empty block will be recognized
                 * as a special marker by inflate_sync().
                 */
                if (flush == Z_FULL_FLUSH) {
    151b:	83 ff 03             	cmp    $0x3,%edi
    151e:	74 21                	je     1541 <_deflate+0x361>
                    CLEAR_HASH(s);             /* forget history */
                }
            }
            flush_pending(strm);
    1520:	89 f0                	mov    %esi,%eax
    1522:	e8 39 ef ff ff       	call   460 <_flush_pending>
	    if (strm->avail_out == 0) {
    1527:	8b 7e 10             	mov    0x10(%esi),%edi
    152a:	85 ff                	test   %edi,%edi
    152c:	0f 85 7b fd ff ff    	jne    12ad <_deflate+0xcd>
    1532:	e9 50 fe ff ff       	jmp    1387 <_deflate+0x1a7>
    int old_flush; /* value of flush param for previous deflate call */
    deflate_state *s;

    if (strm == Z_NULL || strm->state == Z_NULL ||
	flush > Z_FINISH || flush < 0) {
        return Z_STREAM_ERROR;
    1537:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    153c:	e9 21 fe ff ff       	jmp    1362 <_deflate+0x182>
                _tr_stored_block(s, (char*)0, 0L, 0);
                /* For a full flush, this empty block will be recognized
                 * as a special marker by inflate_sync().
                 */
                if (flush == Z_FULL_FLUSH) {
                    CLEAR_HASH(s);             /* forget history */
    1541:	8b 43 44             	mov    0x44(%ebx),%eax
    1544:	8b 7b 3c             	mov    0x3c(%ebx),%edi
    1547:	8d 54 00 fe          	lea    -0x2(%eax,%eax,1),%edx
    154b:	83 fa 04             	cmp    $0x4,%edx
    154e:	66 c7 04 17 00 00    	movw   $0x0,(%edi,%edx,1)
    1554:	73 1e                	jae    1574 <_deflate+0x394>
    1556:	f6 c2 02             	test   $0x2,%dl
    1559:	74 08                	je     1563 <_deflate+0x383>
    155b:	66 c7 07 00 00       	movw   $0x0,(%edi)
    1560:	83 c7 02             	add    $0x2,%edi
    1563:	83 e2 01             	and    $0x1,%edx
    1566:	0f 84 0c fe ff ff    	je     1378 <_deflate+0x198>
    156c:	c6 07 00             	movb   $0x0,(%edi)
    156f:	e9 04 fe ff ff       	jmp    1378 <_deflate+0x198>
    1574:	f7 c7 01 00 00 00    	test   $0x1,%edi
    157a:	75 13                	jne    158f <_deflate+0x3af>
    157c:	f7 c7 02 00 00 00    	test   $0x2,%edi
    1582:	75 12                	jne    1596 <_deflate+0x3b6>
    1584:	89 d1                	mov    %edx,%ecx
    1586:	31 c0                	xor    %eax,%eax
    1588:	c1 e9 02             	shr    $0x2,%ecx
    158b:	f3 ab                	rep stos %eax,%es:(%edi)
    158d:	eb c7                	jmp    1556 <_deflate+0x376>
    158f:	c6 07 00             	movb   $0x0,(%edi)
    1592:	4a                   	dec    %edx
    1593:	47                   	inc    %edi
    1594:	eb e6                	jmp    157c <_deflate+0x39c>
    1596:	66 c7 07 00 00       	movw   $0x0,(%edi)
    159b:	83 ea 02             	sub    $0x2,%edx
    159e:	83 c7 02             	add    $0x2,%edi
    15a1:	eb e1                	jmp    1584 <_deflate+0x3a4>
    15a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    15a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000015b0 <_deflateParams>:
/* ========================================================================= */
int ZEXPORT deflateParams(strm, level, strategy)
    z_streamp strm;
    int level;
    int strategy;
{
    15b0:	55                   	push   %ebp
    15b1:	57                   	push   %edi
    15b2:	56                   	push   %esi
    15b3:	53                   	push   %ebx
    15b4:	83 ec 1c             	sub    $0x1c,%esp
    15b7:	8b 54 24 30          	mov    0x30(%esp),%edx
    15bb:	8b 5c 24 34          	mov    0x34(%esp),%ebx
    15bf:	8b 7c 24 38          	mov    0x38(%esp),%edi
    deflate_state *s;
    compress_func func;
    int err = Z_OK;

    if (strm == Z_NULL || strm->state == Z_NULL) return Z_STREAM_ERROR;
    15c3:	85 d2                	test   %edx,%edx
    15c5:	0f 84 ca 00 00 00    	je     1695 <_deflateParams+0xe5>
    15cb:	8b 72 1c             	mov    0x1c(%edx),%esi
    15ce:	85 f6                	test   %esi,%esi
    15d0:	0f 84 bf 00 00 00    	je     1695 <_deflateParams+0xe5>
    s = strm->state;

    if (level == Z_DEFAULT_COMPRESSION) {
    15d6:	83 fb ff             	cmp    $0xffffffff,%ebx
    15d9:	0f 84 91 00 00 00    	je     1670 <_deflateParams+0xc0>
	level = 6;
    }
    if (level < 0 || level > 9 || strategy < 0 || strategy > Z_HUFFMAN_ONLY) {
    15df:	83 fb 09             	cmp    $0x9,%ebx
    15e2:	0f 87 ad 00 00 00    	ja     1695 <_deflateParams+0xe5>
    15e8:	83 ff 02             	cmp    $0x2,%edi
    15eb:	0f 87 a4 00 00 00    	ja     1695 <_deflateParams+0xe5>
	return Z_STREAM_ERROR;
    }
    func = configuration_table[s->level].func;
    15f1:	8b 4e 7c             	mov    0x7c(%esi),%ecx

    if (func != configuration_table[level].func && strm->total_in != 0) {
    15f4:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
	level = 6;
    }
    if (level < 0 || level > 9 || strategy < 0 || strategy > Z_HUFFMAN_ONLY) {
	return Z_STREAM_ERROR;
    }
    func = configuration_table[s->level].func;
    15f7:	8d 2c 49             	lea    (%ecx,%ecx,2),%ebp

    if (func != configuration_table[level].func && strm->total_in != 0) {
    15fa:	8b 2c ad 08 00 00 00 	mov    0x8(,%ebp,4),%ebp
    1601:	39 2c 85 08 00 00 00 	cmp    %ebp,0x8(,%eax,4)
    int level;
    int strategy;
{
    deflate_state *s;
    compress_func func;
    int err = Z_OK;
    1608:	b8 00 00 00 00       	mov    $0x0,%eax
    if (level < 0 || level > 9 || strategy < 0 || strategy > Z_HUFFMAN_ONLY) {
	return Z_STREAM_ERROR;
    }
    func = configuration_table[s->level].func;

    if (func != configuration_table[level].func && strm->total_in != 0) {
    160d:	74 07                	je     1616 <_deflateParams+0x66>
    160f:	8b 6a 08             	mov    0x8(%edx),%ebp
    1612:	85 ed                	test   %ebp,%ebp
    1614:	75 6a                	jne    1680 <_deflateParams+0xd0>
	/* Flush the last buffer: */
	err = deflate(strm, Z_PARTIAL_FLUSH);
    }
    if (s->level != level) {
    1616:	39 cb                	cmp    %ecx,%ebx
    1618:	74 42                	je     165c <_deflateParams+0xac>
	s->level = level;
	s->max_lazy_match   = configuration_table[level].max_lazy;
    161a:	8d 14 5b             	lea    (%ebx,%ebx,2),%edx
    if (func != configuration_table[level].func && strm->total_in != 0) {
	/* Flush the last buffer: */
	err = deflate(strm, Z_PARTIAL_FLUSH);
    }
    if (s->level != level) {
	s->level = level;
    161d:	89 5e 7c             	mov    %ebx,0x7c(%esi)
	s->max_lazy_match   = configuration_table[level].max_lazy;
    1620:	c1 e2 02             	shl    $0x2,%edx
    1623:	31 db                	xor    %ebx,%ebx
    1625:	8d 8a 00 00 00 00    	lea    0x0(%edx),%ecx
    162b:	66 8b 9a 02 00 00 00 	mov    0x2(%edx),%bx
    1632:	89 5e 78             	mov    %ebx,0x78(%esi)
	s->good_match       = configuration_table[level].good_length;
    1635:	8b 9a 00 00 00 00    	mov    0x0(%edx),%ebx
	s->nice_match       = configuration_table[level].nice_length;
    163b:	31 d2                	xor    %edx,%edx
	err = deflate(strm, Z_PARTIAL_FLUSH);
    }
    if (s->level != level) {
	s->level = level;
	s->max_lazy_match   = configuration_table[level].max_lazy;
	s->good_match       = configuration_table[level].good_length;
    163d:	81 e3 ff ff 00 00    	and    $0xffff,%ebx
	s->nice_match       = configuration_table[level].nice_length;
    1643:	66 8b 51 04          	mov    0x4(%ecx),%dx
	err = deflate(strm, Z_PARTIAL_FLUSH);
    }
    if (s->level != level) {
	s->level = level;
	s->max_lazy_match   = configuration_table[level].max_lazy;
	s->good_match       = configuration_table[level].good_length;
    1647:	89 9e 84 00 00 00    	mov    %ebx,0x84(%esi)
	s->nice_match       = configuration_table[level].nice_length;
    164d:	89 96 88 00 00 00    	mov    %edx,0x88(%esi)
	s->max_chain_length = configuration_table[level].max_chain;
    1653:	31 d2                	xor    %edx,%edx
    1655:	66 8b 51 06          	mov    0x6(%ecx),%dx
    1659:	89 56 74             	mov    %edx,0x74(%esi)
    }
    s->strategy = strategy;
    165c:	89 be 80 00 00 00    	mov    %edi,0x80(%esi)
    return err;
}
    1662:	83 c4 1c             	add    $0x1c,%esp
    1665:	5b                   	pop    %ebx
    1666:	5e                   	pop    %esi
    1667:	5f                   	pop    %edi
    1668:	5d                   	pop    %ebp
    1669:	c3                   	ret    
    166a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (strm == Z_NULL || strm->state == Z_NULL) return Z_STREAM_ERROR;
    s = strm->state;

    if (level == Z_DEFAULT_COMPRESSION) {
	level = 6;
    1670:	bb 06 00 00 00       	mov    $0x6,%ebx
    1675:	e9 6e ff ff ff       	jmp    15e8 <_deflateParams+0x38>
    167a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
    func = configuration_table[s->level].func;

    if (func != configuration_table[level].func && strm->total_in != 0) {
	/* Flush the last buffer: */
	err = deflate(strm, Z_PARTIAL_FLUSH);
    1680:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1687:	00 
    1688:	89 14 24             	mov    %edx,(%esp)
    168b:	e8 50 fb ff ff       	call   11e0 <_deflate>
    1690:	8b 4e 7c             	mov    0x7c(%esi),%ecx
    1693:	eb 81                	jmp    1616 <_deflateParams+0x66>
{
    deflate_state *s;
    compress_func func;
    int err = Z_OK;

    if (strm == Z_NULL || strm->state == Z_NULL) return Z_STREAM_ERROR;
    1695:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    169a:	eb c6                	jmp    1662 <_deflateParams+0xb2>
    169c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016a0 <_deflateEnd>:
}

/* ========================================================================= */
int ZEXPORT deflateEnd (strm)
    z_streamp strm;
{
    16a0:	56                   	push   %esi
    16a1:	53                   	push   %ebx
    16a2:	83 ec 14             	sub    $0x14,%esp
    16a5:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    int status;

    if (strm == Z_NULL || strm->state == Z_NULL) return Z_STREAM_ERROR;
    16a9:	85 db                	test   %ebx,%ebx
    16ab:	0f 84 af 00 00 00    	je     1760 <_deflateEnd+0xc0>
    16b1:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
    16b4:	85 c9                	test   %ecx,%ecx
    16b6:	0f 84 a4 00 00 00    	je     1760 <_deflateEnd+0xc0>

    status = strm->state->status;
    16bc:	8b 71 04             	mov    0x4(%ecx),%esi
    if (status != INIT_STATE && status != BUSY_STATE &&
    16bf:	83 fe 71             	cmp    $0x71,%esi
    16c2:	0f 95 c2             	setne  %dl
    16c5:	83 fe 2a             	cmp    $0x2a,%esi
    16c8:	0f 95 c0             	setne  %al
    16cb:	84 c2                	test   %al,%dl
    16cd:	74 0c                	je     16db <_deflateEnd+0x3b>
    16cf:	81 fe 9a 02 00 00    	cmp    $0x29a,%esi
    16d5:	0f 85 85 00 00 00    	jne    1760 <_deflateEnd+0xc0>
	status != FINISH_STATE) {
      return Z_STREAM_ERROR;
    }

    /* Deallocate in reverse order of allocations: */
    TRY_FREE(strm, strm->state->pending_buf);
    16db:	8b 41 08             	mov    0x8(%ecx),%eax
    16de:	85 c0                	test   %eax,%eax
    16e0:	74 10                	je     16f2 <_deflateEnd+0x52>
    16e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    16e6:	8b 43 28             	mov    0x28(%ebx),%eax
    16e9:	89 04 24             	mov    %eax,(%esp)
    16ec:	ff 53 24             	call   *0x24(%ebx)
    16ef:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
    TRY_FREE(strm, strm->state->head);
    16f2:	8b 41 3c             	mov    0x3c(%ecx),%eax
    16f5:	85 c0                	test   %eax,%eax
    16f7:	74 10                	je     1709 <_deflateEnd+0x69>
    16f9:	89 44 24 04          	mov    %eax,0x4(%esp)
    16fd:	8b 43 28             	mov    0x28(%ebx),%eax
    1700:	89 04 24             	mov    %eax,(%esp)
    1703:	ff 53 24             	call   *0x24(%ebx)
    1706:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
    TRY_FREE(strm, strm->state->prev);
    1709:	8b 41 38             	mov    0x38(%ecx),%eax
    170c:	85 c0                	test   %eax,%eax
    170e:	74 10                	je     1720 <_deflateEnd+0x80>
    1710:	89 44 24 04          	mov    %eax,0x4(%esp)
    1714:	8b 43 28             	mov    0x28(%ebx),%eax
    1717:	89 04 24             	mov    %eax,(%esp)
    171a:	ff 53 24             	call   *0x24(%ebx)
    171d:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
    TRY_FREE(strm, strm->state->window);
    1720:	8b 41 30             	mov    0x30(%ecx),%eax
    1723:	85 c0                	test   %eax,%eax
    1725:	74 10                	je     1737 <_deflateEnd+0x97>
    1727:	89 44 24 04          	mov    %eax,0x4(%esp)
    172b:	8b 43 28             	mov    0x28(%ebx),%eax
    172e:	89 04 24             	mov    %eax,(%esp)
    1731:	ff 53 24             	call   *0x24(%ebx)
    1734:	8b 4b 1c             	mov    0x1c(%ebx),%ecx

    ZFREE(strm, strm->state);
    1737:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    173b:	8b 43 28             	mov    0x28(%ebx),%eax
    173e:	89 04 24             	mov    %eax,(%esp)
    1741:	ff 53 24             	call   *0x24(%ebx)
    strm->state = Z_NULL;

    return status == BUSY_STATE ? Z_DATA_ERROR : Z_OK;
    1744:	31 c0                	xor    %eax,%eax
    TRY_FREE(strm, strm->state->head);
    TRY_FREE(strm, strm->state->prev);
    TRY_FREE(strm, strm->state->window);

    ZFREE(strm, strm->state);
    strm->state = Z_NULL;
    1746:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)

    return status == BUSY_STATE ? Z_DATA_ERROR : Z_OK;
    174d:	83 fe 71             	cmp    $0x71,%esi
    1750:	0f 95 c0             	setne  %al
}
    1753:	83 c4 14             	add    $0x14,%esp
    TRY_FREE(strm, strm->state->window);

    ZFREE(strm, strm->state);
    strm->state = Z_NULL;

    return status == BUSY_STATE ? Z_DATA_ERROR : Z_OK;
    1756:	8d 44 40 fd          	lea    -0x3(%eax,%eax,2),%eax
}
    175a:	5b                   	pop    %ebx
    175b:	5e                   	pop    %esi
    175c:	c3                   	ret    
    175d:	8d 76 00             	lea    0x0(%esi),%esi
    1760:	83 c4 14             	add    $0x14,%esp
int ZEXPORT deflateEnd (strm)
    z_streamp strm;
{
    int status;

    if (strm == Z_NULL || strm->state == Z_NULL) return Z_STREAM_ERROR;
    1763:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax

    ZFREE(strm, strm->state);
    strm->state = Z_NULL;

    return status == BUSY_STATE ? Z_DATA_ERROR : Z_OK;
}
    1768:	5b                   	pop    %ebx
    1769:	5e                   	pop    %esi
    176a:	c3                   	ret    
    176b:	90                   	nop
    176c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001770 <_deflateInit2_>:
    int  windowBits;
    int  memLevel;
    int  strategy;
    const char *version;
    int stream_size;
{
    1770:	55                   	push   %ebp
    1771:	57                   	push   %edi
    1772:	56                   	push   %esi
    1773:	53                   	push   %ebx
    1774:	83 ec 2c             	sub    $0x2c,%esp
    1777:	8b 44 24 54          	mov    0x54(%esp),%eax
    177b:	8b 74 24 40          	mov    0x40(%esp),%esi
    177f:	89 44 24 14          	mov    %eax,0x14(%esp)
    1783:	8b 44 24 58          	mov    0x58(%esp),%eax
    1787:	8b 6c 24 44          	mov    0x44(%esp),%ebp
    178b:	8b 5c 24 48          	mov    0x48(%esp),%ebx
    178f:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
    1793:	8b 7c 24 50          	mov    0x50(%esp),%edi
    1797:	8b 54 24 5c          	mov    0x5c(%esp),%edx
    ushf *overlay;
    /* We overlay pending_buf and d_buf+l_buf. This works since the average
     * output size for (length,distance) codes is <= 24 bits.
     */

    if (version == Z_NULL || version[0] != my_version[0] ||
    179b:	85 c0                	test   %eax,%eax
    179d:	0f 84 2d 02 00 00    	je     19d0 <_deflateInit2_+0x260>
    17a3:	80 38 31             	cmpb   $0x31,(%eax)
    17a6:	0f 85 24 02 00 00    	jne    19d0 <_deflateInit2_+0x260>
    17ac:	83 fa 38             	cmp    $0x38,%edx
    17af:	0f 85 1b 02 00 00    	jne    19d0 <_deflateInit2_+0x260>
        stream_size != sizeof(z_stream)) {
	return Z_VERSION_ERROR;
    }
    if (strm == Z_NULL) return Z_STREAM_ERROR;
    17b5:	85 f6                	test   %esi,%esi
    17b7:	0f 84 d3 01 00 00    	je     1990 <_deflateInit2_+0x220>

    strm->msg = Z_NULL;
    if (strm->zalloc == Z_NULL) {
    17bd:	8b 46 20             	mov    0x20(%esi),%eax
        stream_size != sizeof(z_stream)) {
	return Z_VERSION_ERROR;
    }
    if (strm == Z_NULL) return Z_STREAM_ERROR;

    strm->msg = Z_NULL;
    17c0:	c7 46 18 00 00 00 00 	movl   $0x0,0x18(%esi)
    if (strm->zalloc == Z_NULL) {
    17c7:	85 c0                	test   %eax,%eax
    17c9:	0f 84 d1 01 00 00    	je     19a0 <_deflateInit2_+0x230>
	strm->zalloc = zcalloc;
	strm->opaque = (voidpf)0;
    }
    if (strm->zfree == Z_NULL) strm->zfree = zcfree;
    17cf:	8b 46 24             	mov    0x24(%esi),%eax
    17d2:	85 c0                	test   %eax,%eax
    17d4:	0f 84 e6 01 00 00    	je     19c0 <_deflateInit2_+0x250>

    if (level == Z_DEFAULT_COMPRESSION) level = 6;
    17da:	b8 06 00 00 00       	mov    $0x6,%eax
    17df:	83 fd ff             	cmp    $0xffffffff,%ebp
    17e2:	0f 44 e8             	cmove  %eax,%ebp
    int  strategy;
    const char *version;
    int stream_size;
{
    deflate_state *s;
    int noheader = 0;
    17e5:	31 d2                	xor    %edx,%edx
    if (level == Z_DEFAULT_COMPRESSION) level = 6;
#ifdef FASTEST
    level = 1;
#endif

    if (windowBits < 0) { /* undocumented feature: suppress zlib header */
    17e7:	85 c9                	test   %ecx,%ecx
    17e9:	0f 88 96 01 00 00    	js     1985 <_deflateInit2_+0x215>
        noheader = 1;
        windowBits = -windowBits;
    }
    if (memLevel < 1 || memLevel > MAX_MEM_LEVEL || method != Z_DEFLATED ||
    17ef:	8d 47 ff             	lea    -0x1(%edi),%eax
    17f2:	89 54 24 18          	mov    %edx,0x18(%esp)
    17f6:	83 f8 08             	cmp    $0x8,%eax
    17f9:	0f 87 91 01 00 00    	ja     1990 <_deflateInit2_+0x220>
    17ff:	83 fb 08             	cmp    $0x8,%ebx
    1802:	0f 85 88 01 00 00    	jne    1990 <_deflateInit2_+0x220>
        windowBits < 8 || windowBits > 15 || level < 0 || level > 9 ||
    1808:	8d 41 f8             	lea    -0x8(%ecx),%eax
    180b:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)

    if (windowBits < 0) { /* undocumented feature: suppress zlib header */
        noheader = 1;
        windowBits = -windowBits;
    }
    if (memLevel < 1 || memLevel > MAX_MEM_LEVEL || method != Z_DEFLATED ||
    180f:	83 f8 07             	cmp    $0x7,%eax
    1812:	0f 87 78 01 00 00    	ja     1990 <_deflateInit2_+0x220>
        windowBits < 8 || windowBits > 15 || level < 0 || level > 9 ||
	strategy < 0 || strategy > Z_HUFFMAN_ONLY) {
    1818:	83 fd 09             	cmp    $0x9,%ebp
    181b:	0f 87 6f 01 00 00    	ja     1990 <_deflateInit2_+0x220>
    1821:	83 7c 24 14 02       	cmpl   $0x2,0x14(%esp)
    1826:	0f 87 64 01 00 00    	ja     1990 <_deflateInit2_+0x220>
        return Z_STREAM_ERROR;
    }
    s = (deflate_state *) ZALLOC(strm, 1, sizeof(deflate_state));
    182c:	c7 44 24 08 b8 16 00 	movl   $0x16b8,0x8(%esp)
    1833:	00 
    1834:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    183b:	00 
    183c:	8b 46 28             	mov    0x28(%esi),%eax
    183f:	89 04 24             	mov    %eax,(%esp)
    1842:	ff 56 20             	call   *0x20(%esi)
    1845:	89 c3                	mov    %eax,%ebx
    if (s == Z_NULL) return Z_MEM_ERROR;
    1847:	85 c0                	test   %eax,%eax
    1849:	0f 84 a8 01 00 00    	je     19f7 <_deflateInit2_+0x287>
    strm->state = (struct internal_state FAR *)s;
    s->strm = strm;

    s->noheader = noheader;
    184f:	8b 54 24 18          	mov    0x18(%esp),%edx
    s->w_bits = windowBits;
    1853:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
	strategy < 0 || strategy > Z_HUFFMAN_ONLY) {
        return Z_STREAM_ERROR;
    }
    s = (deflate_state *) ZALLOC(strm, 1, sizeof(deflate_state));
    if (s == Z_NULL) return Z_MEM_ERROR;
    strm->state = (struct internal_state FAR *)s;
    1857:	89 46 1c             	mov    %eax,0x1c(%esi)
    s->strm = strm;

    s->noheader = noheader;
    185a:	89 50 18             	mov    %edx,0x18(%eax)
    s->w_bits = windowBits;
    185d:	89 48 28             	mov    %ecx,0x28(%eax)
        return Z_STREAM_ERROR;
    }
    s = (deflate_state *) ZALLOC(strm, 1, sizeof(deflate_state));
    if (s == Z_NULL) return Z_MEM_ERROR;
    strm->state = (struct internal_state FAR *)s;
    s->strm = strm;
    1860:	89 30                	mov    %esi,(%eax)

    s->noheader = noheader;
    s->w_bits = windowBits;
    s->w_size = 1 << s->w_bits;
    1862:	b8 01 00 00 00       	mov    $0x1,%eax
    s->w_mask = s->w_size - 1;

    s->hash_bits = memLevel + 7;
    s->hash_size = 1 << s->hash_bits;
    1867:	ba 01 00 00 00       	mov    $0x1,%edx
    strm->state = (struct internal_state FAR *)s;
    s->strm = strm;

    s->noheader = noheader;
    s->w_bits = windowBits;
    s->w_size = 1 << s->w_bits;
    186c:	d3 e0                	shl    %cl,%eax
    s->w_mask = s->w_size - 1;

    s->hash_bits = memLevel + 7;
    186e:	8d 4f 07             	lea    0x7(%edi),%ecx
    strm->state = (struct internal_state FAR *)s;
    s->strm = strm;

    s->noheader = noheader;
    s->w_bits = windowBits;
    s->w_size = 1 << s->w_bits;
    1871:	89 43 24             	mov    %eax,0x24(%ebx)
    s->w_mask = s->w_size - 1;

    s->hash_bits = memLevel + 7;
    s->hash_size = 1 << s->hash_bits;
    1874:	d3 e2                	shl    %cl,%edx
    s->strm = strm;

    s->noheader = noheader;
    s->w_bits = windowBits;
    s->w_size = 1 << s->w_bits;
    s->w_mask = s->w_size - 1;
    1876:	89 44 24 18          	mov    %eax,0x18(%esp)
    187a:	48                   	dec    %eax
    187b:	89 43 2c             	mov    %eax,0x2c(%ebx)

    s->hash_bits = memLevel + 7;
    s->hash_size = 1 << s->hash_bits;
    187e:	89 d0                	mov    %edx,%eax
    s->hash_mask = s->hash_size - 1;
    1880:	48                   	dec    %eax
    s->w_bits = windowBits;
    s->w_size = 1 << s->w_bits;
    s->w_mask = s->w_size - 1;

    s->hash_bits = memLevel + 7;
    s->hash_size = 1 << s->hash_bits;
    1881:	89 53 44             	mov    %edx,0x44(%ebx)
    s->hash_mask = s->hash_size - 1;
    1884:	89 43 4c             	mov    %eax,0x4c(%ebx)
    s->hash_shift =  ((s->hash_bits+MIN_MATCH-1)/MIN_MATCH);
    1887:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    188c:	8d 47 09             	lea    0x9(%edi),%eax
    s->noheader = noheader;
    s->w_bits = windowBits;
    s->w_size = 1 << s->w_bits;
    s->w_mask = s->w_size - 1;

    s->hash_bits = memLevel + 7;
    188f:	89 4b 48             	mov    %ecx,0x48(%ebx)
    s->hash_size = 1 << s->hash_bits;
    s->hash_mask = s->hash_size - 1;
    s->hash_shift =  ((s->hash_bits+MIN_MATCH-1)/MIN_MATCH);
    1892:	f7 e2                	mul    %edx
    1894:	d1 ea                	shr    %edx

    s->window = (Bytef *) ZALLOC(strm, s->w_size, 2*sizeof(Byte));
    1896:	8b 44 24 18          	mov    0x18(%esp),%eax
    s->w_mask = s->w_size - 1;

    s->hash_bits = memLevel + 7;
    s->hash_size = 1 << s->hash_bits;
    s->hash_mask = s->hash_size - 1;
    s->hash_shift =  ((s->hash_bits+MIN_MATCH-1)/MIN_MATCH);
    189a:	89 53 50             	mov    %edx,0x50(%ebx)

    s->window = (Bytef *) ZALLOC(strm, s->w_size, 2*sizeof(Byte));
    189d:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    18a4:	00 
    18a5:	89 44 24 04          	mov    %eax,0x4(%esp)
    18a9:	8b 46 28             	mov    0x28(%esi),%eax
    18ac:	89 04 24             	mov    %eax,(%esp)
    18af:	ff 56 20             	call   *0x20(%esi)
    18b2:	89 43 30             	mov    %eax,0x30(%ebx)
    s->prev   = (Posf *)  ZALLOC(strm, s->w_size, sizeof(Pos));
    18b5:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    18bc:	00 
    18bd:	8b 43 24             	mov    0x24(%ebx),%eax
    18c0:	89 44 24 04          	mov    %eax,0x4(%esp)
    18c4:	8b 46 28             	mov    0x28(%esi),%eax
    18c7:	89 04 24             	mov    %eax,(%esp)
    18ca:	ff 56 20             	call   *0x20(%esi)
    18cd:	89 43 38             	mov    %eax,0x38(%ebx)
    s->head   = (Posf *)  ZALLOC(strm, s->hash_size, sizeof(Pos));
    18d0:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    18d7:	00 
    18d8:	8b 43 44             	mov    0x44(%ebx),%eax
    18db:	89 44 24 04          	mov    %eax,0x4(%esp)
    18df:	8b 46 28             	mov    0x28(%esi),%eax
    18e2:	89 04 24             	mov    %eax,(%esp)
    18e5:	ff 56 20             	call   *0x20(%esi)

    s->lit_bufsize = 1 << (memLevel + 6); /* 16K elements by default */
    18e8:	8d 4f 06             	lea    0x6(%edi),%ecx
    s->hash_mask = s->hash_size - 1;
    s->hash_shift =  ((s->hash_bits+MIN_MATCH-1)/MIN_MATCH);

    s->window = (Bytef *) ZALLOC(strm, s->w_size, 2*sizeof(Byte));
    s->prev   = (Posf *)  ZALLOC(strm, s->w_size, sizeof(Pos));
    s->head   = (Posf *)  ZALLOC(strm, s->hash_size, sizeof(Pos));
    18eb:	89 43 3c             	mov    %eax,0x3c(%ebx)

    s->lit_bufsize = 1 << (memLevel + 6); /* 16K elements by default */
    18ee:	b8 01 00 00 00       	mov    $0x1,%eax
    18f3:	d3 e0                	shl    %cl,%eax
    18f5:	89 83 94 16 00 00    	mov    %eax,0x1694(%ebx)

    overlay = (ushf *) ZALLOC(strm, s->lit_bufsize, sizeof(ush)+2);
    18fb:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
    1902:	00 
    1903:	89 44 24 04          	mov    %eax,0x4(%esp)
    1907:	8b 46 28             	mov    0x28(%esi),%eax
    190a:	89 04 24             	mov    %eax,(%esp)
    190d:	ff 56 20             	call   *0x20(%esi)
    s->pending_buf = (uchf *) overlay;
    s->pending_buf_size = (ulg)s->lit_bufsize * (sizeof(ush)+2L);
    1910:	8b 93 94 16 00 00    	mov    0x1694(%ebx),%edx
    1916:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
    s->head   = (Posf *)  ZALLOC(strm, s->hash_size, sizeof(Pos));

    s->lit_bufsize = 1 << (memLevel + 6); /* 16K elements by default */

    overlay = (ushf *) ZALLOC(strm, s->lit_bufsize, sizeof(ush)+2);
    s->pending_buf = (uchf *) overlay;
    191d:	89 43 08             	mov    %eax,0x8(%ebx)
    s->pending_buf_size = (ulg)s->lit_bufsize * (sizeof(ush)+2L);
    1920:	89 4b 0c             	mov    %ecx,0xc(%ebx)

    if (s->window == Z_NULL || s->prev == Z_NULL || s->head == Z_NULL ||
    1923:	8b 4b 30             	mov    0x30(%ebx),%ecx
    1926:	85 c9                	test   %ecx,%ecx
    1928:	0f 84 b2 00 00 00    	je     19e0 <_deflateInit2_+0x270>
    192e:	8b 7b 38             	mov    0x38(%ebx),%edi
    1931:	85 ff                	test   %edi,%edi
    1933:	0f 84 a7 00 00 00    	je     19e0 <_deflateInit2_+0x270>
    1939:	85 c0                	test   %eax,%eax
    193b:	0f 84 9f 00 00 00    	je     19e0 <_deflateInit2_+0x270>
    1941:	8b 4b 3c             	mov    0x3c(%ebx),%ecx
    1944:	85 c9                	test   %ecx,%ecx
    1946:	0f 84 94 00 00 00    	je     19e0 <_deflateInit2_+0x270>
        s->pending_buf == Z_NULL) {
        strm->msg = (char*)ERR_MSG(Z_MEM_ERROR);
        deflateEnd (strm);
        return Z_MEM_ERROR;
    }
    s->d_buf = overlay + s->lit_bufsize/sizeof(ush);
    194c:	89 d1                	mov    %edx,%ecx
    s->l_buf = s->pending_buf + (1+sizeof(ush))*s->lit_bufsize;
    194e:	8d 14 52             	lea    (%edx,%edx,2),%edx
        s->pending_buf == Z_NULL) {
        strm->msg = (char*)ERR_MSG(Z_MEM_ERROR);
        deflateEnd (strm);
        return Z_MEM_ERROR;
    }
    s->d_buf = overlay + s->lit_bufsize/sizeof(ush);
    1951:	83 e1 fe             	and    $0xfffffffe,%ecx
    s->l_buf = s->pending_buf + (1+sizeof(ush))*s->lit_bufsize;

    s->level = level;
    1954:	89 6b 7c             	mov    %ebp,0x7c(%ebx)
        s->pending_buf == Z_NULL) {
        strm->msg = (char*)ERR_MSG(Z_MEM_ERROR);
        deflateEnd (strm);
        return Z_MEM_ERROR;
    }
    s->d_buf = overlay + s->lit_bufsize/sizeof(ush);
    1957:	01 c1                	add    %eax,%ecx
    s->l_buf = s->pending_buf + (1+sizeof(ush))*s->lit_bufsize;
    1959:	01 d0                	add    %edx,%eax
    195b:	89 83 90 16 00 00    	mov    %eax,0x1690(%ebx)

    s->level = level;
    s->strategy = strategy;
    1961:	8b 44 24 14          	mov    0x14(%esp),%eax
        s->pending_buf == Z_NULL) {
        strm->msg = (char*)ERR_MSG(Z_MEM_ERROR);
        deflateEnd (strm);
        return Z_MEM_ERROR;
    }
    s->d_buf = overlay + s->lit_bufsize/sizeof(ush);
    1965:	89 8b 9c 16 00 00    	mov    %ecx,0x169c(%ebx)
    s->l_buf = s->pending_buf + (1+sizeof(ush))*s->lit_bufsize;

    s->level = level;
    s->strategy = strategy;
    196b:	89 83 80 00 00 00    	mov    %eax,0x80(%ebx)
    s->method = (Byte)method;
    1971:	c6 43 1d 08          	movb   $0x8,0x1d(%ebx)

    return deflateReset(strm);
    1975:	89 74 24 40          	mov    %esi,0x40(%esp)
}
    1979:	83 c4 2c             	add    $0x2c,%esp
    197c:	5b                   	pop    %ebx
    197d:	5e                   	pop    %esi
    197e:	5f                   	pop    %edi
    197f:	5d                   	pop    %ebp

    s->level = level;
    s->strategy = strategy;
    s->method = (Byte)method;

    return deflateReset(strm);
    1980:	e9 ab f6 ff ff       	jmp    1030 <_deflateReset>
    level = 1;
#endif

    if (windowBits < 0) { /* undocumented feature: suppress zlib header */
        noheader = 1;
        windowBits = -windowBits;
    1985:	f7 d9                	neg    %ecx
#ifdef FASTEST
    level = 1;
#endif

    if (windowBits < 0) { /* undocumented feature: suppress zlib header */
        noheader = 1;
    1987:	b2 01                	mov    $0x1,%dl
    1989:	e9 61 fe ff ff       	jmp    17ef <_deflateInit2_+0x7f>
    198e:	66 90                	xchg   %ax,%ax

    if (version == Z_NULL || version[0] != my_version[0] ||
        stream_size != sizeof(z_stream)) {
	return Z_VERSION_ERROR;
    }
    if (strm == Z_NULL) return Z_STREAM_ERROR;
    1990:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    s->level = level;
    s->strategy = strategy;
    s->method = (Byte)method;

    return deflateReset(strm);
}
    1995:	83 c4 2c             	add    $0x2c,%esp
    1998:	5b                   	pop    %ebx
    1999:	5e                   	pop    %esi
    199a:	5f                   	pop    %edi
    199b:	5d                   	pop    %ebp
    199c:	c3                   	ret    
    199d:	8d 76 00             	lea    0x0(%esi),%esi
    strm->msg = Z_NULL;
    if (strm->zalloc == Z_NULL) {
	strm->zalloc = zcalloc;
	strm->opaque = (voidpf)0;
    }
    if (strm->zfree == Z_NULL) strm->zfree = zcfree;
    19a0:	8b 46 24             	mov    0x24(%esi),%eax
    }
    if (strm == Z_NULL) return Z_STREAM_ERROR;

    strm->msg = Z_NULL;
    if (strm->zalloc == Z_NULL) {
	strm->zalloc = zcalloc;
    19a3:	c7 46 20 00 00 00 00 	movl   $0x0,0x20(%esi)
	strm->opaque = (voidpf)0;
    19aa:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
    }
    if (strm->zfree == Z_NULL) strm->zfree = zcfree;
    19b1:	85 c0                	test   %eax,%eax
    19b3:	0f 85 21 fe ff ff    	jne    17da <_deflateInit2_+0x6a>
    19b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    19c0:	c7 46 24 00 00 00 00 	movl   $0x0,0x24(%esi)
    19c7:	e9 0e fe ff ff       	jmp    17da <_deflateInit2_+0x6a>
    19cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s->level = level;
    s->strategy = strategy;
    s->method = (Byte)method;

    return deflateReset(strm);
}
    19d0:	83 c4 2c             	add    $0x2c,%esp
     * output size for (length,distance) codes is <= 24 bits.
     */

    if (version == Z_NULL || version[0] != my_version[0] ||
        stream_size != sizeof(z_stream)) {
	return Z_VERSION_ERROR;
    19d3:	b8 fa ff ff ff       	mov    $0xfffffffa,%eax
    s->level = level;
    s->strategy = strategy;
    s->method = (Byte)method;

    return deflateReset(strm);
}
    19d8:	5b                   	pop    %ebx
    19d9:	5e                   	pop    %esi
    19da:	5f                   	pop    %edi
    19db:	5d                   	pop    %ebp
    19dc:	c3                   	ret    
    19dd:	8d 76 00             	lea    0x0(%esi),%esi
    s->pending_buf = (uchf *) overlay;
    s->pending_buf_size = (ulg)s->lit_bufsize * (sizeof(ush)+2L);

    if (s->window == Z_NULL || s->prev == Z_NULL || s->head == Z_NULL ||
        s->pending_buf == Z_NULL) {
        strm->msg = (char*)ERR_MSG(Z_MEM_ERROR);
    19e0:	a1 18 00 00 00       	mov    0x18,%eax
    19e5:	89 46 18             	mov    %eax,0x18(%esi)
        deflateEnd (strm);
    19e8:	89 34 24             	mov    %esi,(%esp)
    19eb:	e8 b0 fc ff ff       	call   16a0 <_deflateEnd>
        return Z_MEM_ERROR;
    19f0:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
    19f5:	eb 9e                	jmp    1995 <_deflateInit2_+0x225>
        windowBits < 8 || windowBits > 15 || level < 0 || level > 9 ||
	strategy < 0 || strategy > Z_HUFFMAN_ONLY) {
        return Z_STREAM_ERROR;
    }
    s = (deflate_state *) ZALLOC(strm, 1, sizeof(deflate_state));
    if (s == Z_NULL) return Z_MEM_ERROR;
    19f7:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
    19fc:	eb 97                	jmp    1995 <_deflateInit2_+0x225>
    19fe:	66 90                	xchg   %ax,%ax

00001a00 <_deflateInit_>:
int ZEXPORT deflateInit_(strm, level, version, stream_size)
    z_streamp strm;
    int level;
    const char *version;
    int stream_size;
{
    1a00:	83 ec 2c             	sub    $0x2c,%esp
    return deflateInit2_(strm, level, Z_DEFLATED, MAX_WBITS, DEF_MEM_LEVEL,
    1a03:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    1a07:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    1a0e:	00 
    1a0f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1a13:	8b 44 24 38          	mov    0x38(%esp),%eax
    1a17:	89 44 24 18          	mov    %eax,0x18(%esp)
    1a1b:	8b 44 24 34          	mov    0x34(%esp),%eax
    1a1f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a23:	8b 44 24 30          	mov    0x30(%esp),%eax
    1a27:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
    1a2e:	00 
    1a2f:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    1a36:	00 
    1a37:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
    1a3e:	00 
    1a3f:	89 04 24             	mov    %eax,(%esp)
    1a42:	e8 29 fd ff ff       	call   1770 <_deflateInit2_>
			 Z_DEFAULT_STRATEGY, version, stream_size);
    /* To do: ignore strm->next_in if we use it as window */
}
    1a47:	83 c4 2c             	add    $0x2c,%esp
    1a4a:	c3                   	ret    
    1a4b:	90                   	nop
    1a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001a50 <_deflateCopy>:
 * doesn't have enough memory anyway to duplicate compression states).
 */
int ZEXPORT deflateCopy (dest, source)
    z_streamp dest;
    z_streamp source;
{
    1a50:	55                   	push   %ebp
    1a51:	57                   	push   %edi
    1a52:	56                   	push   %esi
    1a53:	53                   	push   %ebx
    1a54:	83 ec 2c             	sub    $0x2c,%esp
    1a57:	8b 74 24 44          	mov    0x44(%esp),%esi
    1a5b:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    deflate_state *ds;
    deflate_state *ss;
    ushf *overlay;


    if (source == Z_NULL || dest == Z_NULL || source->state == Z_NULL) {
    1a5f:	85 f6                	test   %esi,%esi
    1a61:	0f 84 d9 01 00 00    	je     1c40 <_deflateCopy+0x1f0>
    1a67:	85 ed                	test   %ebp,%ebp
    1a69:	0f 84 d1 01 00 00    	je     1c40 <_deflateCopy+0x1f0>
    1a6f:	8b 56 1c             	mov    0x1c(%esi),%edx
    1a72:	85 d2                	test   %edx,%edx
    1a74:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1a78:	0f 84 c2 01 00 00    	je     1c40 <_deflateCopy+0x1f0>
        return Z_STREAM_ERROR;
    }

    ss = source->state;

    *dest = *source;
    1a7e:	b9 0e 00 00 00       	mov    $0xe,%ecx
    1a83:	89 ef                	mov    %ebp,%edi
    1a85:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

    ds = (deflate_state *) ZALLOC(dest, 1, sizeof(deflate_state));
    1a87:	c7 44 24 08 b8 16 00 	movl   $0x16b8,0x8(%esp)
    1a8e:	00 
    1a8f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1a96:	00 
    1a97:	8b 45 28             	mov    0x28(%ebp),%eax
    1a9a:	89 04 24             	mov    %eax,(%esp)
    1a9d:	ff 55 20             	call   *0x20(%ebp)
    1aa0:	89 c3                	mov    %eax,%ebx
    if (ds == Z_NULL) return Z_MEM_ERROR;
    1aa2:	85 c0                	test   %eax,%eax
    1aa4:	0f 84 ac 01 00 00    	je     1c56 <_deflateCopy+0x206>
    dest->state = (struct internal_state FAR *) ds;
    *ds = *ss;
    1aaa:	8b 54 24 1c          	mov    0x1c(%esp),%edx

    *dest = *source;

    ds = (deflate_state *) ZALLOC(dest, 1, sizeof(deflate_state));
    if (ds == Z_NULL) return Z_MEM_ERROR;
    dest->state = (struct internal_state FAR *) ds;
    1aae:	89 45 1c             	mov    %eax,0x1c(%ebp)
    *ds = *ss;
    1ab1:	89 54 24 04          	mov    %edx,0x4(%esp)
    1ab5:	c7 44 24 08 b8 16 00 	movl   $0x16b8,0x8(%esp)
    1abc:	00 
    1abd:	89 04 24             	mov    %eax,(%esp)
    1ac0:	e8 00 00 00 00       	call   1ac5 <_deflateCopy+0x75>
    ds->strm = dest;
    1ac5:	89 2b                	mov    %ebp,(%ebx)

    ds->window = (Bytef *) ZALLOC(dest, ds->w_size, 2*sizeof(Byte));
    1ac7:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1ace:	00 
    1acf:	8b 43 24             	mov    0x24(%ebx),%eax
    1ad2:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ad6:	8b 45 28             	mov    0x28(%ebp),%eax
    1ad9:	89 04 24             	mov    %eax,(%esp)
    1adc:	ff 55 20             	call   *0x20(%ebp)
    1adf:	89 43 30             	mov    %eax,0x30(%ebx)
    ds->prev   = (Posf *)  ZALLOC(dest, ds->w_size, sizeof(Pos));
    1ae2:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1ae9:	00 
    1aea:	8b 43 24             	mov    0x24(%ebx),%eax
    1aed:	89 44 24 04          	mov    %eax,0x4(%esp)
    1af1:	8b 45 28             	mov    0x28(%ebp),%eax
    1af4:	89 04 24             	mov    %eax,(%esp)
    1af7:	ff 55 20             	call   *0x20(%ebp)
    1afa:	89 43 38             	mov    %eax,0x38(%ebx)
    ds->head   = (Posf *)  ZALLOC(dest, ds->hash_size, sizeof(Pos));
    1afd:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1b04:	00 
    1b05:	8b 43 44             	mov    0x44(%ebx),%eax
    1b08:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b0c:	8b 45 28             	mov    0x28(%ebp),%eax
    1b0f:	89 04 24             	mov    %eax,(%esp)
    1b12:	ff 55 20             	call   *0x20(%ebp)
    1b15:	89 43 3c             	mov    %eax,0x3c(%ebx)
    overlay = (ushf *) ZALLOC(dest, ds->lit_bufsize, sizeof(ush)+2);
    1b18:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
    1b1f:	00 
    1b20:	8b 83 94 16 00 00    	mov    0x1694(%ebx),%eax
    1b26:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b2a:	8b 45 28             	mov    0x28(%ebp),%eax
    1b2d:	89 04 24             	mov    %eax,(%esp)
    1b30:	ff 55 20             	call   *0x20(%ebp)
    ds->pending_buf = (uchf *) overlay;

    if (ds->window == Z_NULL || ds->prev == Z_NULL || ds->head == Z_NULL ||
    1b33:	8b 4b 30             	mov    0x30(%ebx),%ecx
    ds->strm = dest;

    ds->window = (Bytef *) ZALLOC(dest, ds->w_size, 2*sizeof(Byte));
    ds->prev   = (Posf *)  ZALLOC(dest, ds->w_size, sizeof(Pos));
    ds->head   = (Posf *)  ZALLOC(dest, ds->hash_size, sizeof(Pos));
    overlay = (ushf *) ZALLOC(dest, ds->lit_bufsize, sizeof(ush)+2);
    1b36:	89 c6                	mov    %eax,%esi
    ds->pending_buf = (uchf *) overlay;
    1b38:	89 43 08             	mov    %eax,0x8(%ebx)

    if (ds->window == Z_NULL || ds->prev == Z_NULL || ds->head == Z_NULL ||
    1b3b:	85 c9                	test   %ecx,%ecx
    1b3d:	0f 84 04 01 00 00    	je     1c47 <_deflateCopy+0x1f7>
    1b43:	8b 43 38             	mov    0x38(%ebx),%eax
    1b46:	85 c0                	test   %eax,%eax
    1b48:	0f 84 f9 00 00 00    	je     1c47 <_deflateCopy+0x1f7>
    1b4e:	85 f6                	test   %esi,%esi
    1b50:	0f 84 f1 00 00 00    	je     1c47 <_deflateCopy+0x1f7>
    1b56:	8b 43 3c             	mov    0x3c(%ebx),%eax
    1b59:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    1b5d:	85 c0                	test   %eax,%eax
    1b5f:	0f 84 e2 00 00 00    	je     1c47 <_deflateCopy+0x1f7>
        ds->pending_buf == Z_NULL) {
        deflateEnd (dest);
        return Z_MEM_ERROR;
    }
    /* following zmemcpy do not work for 16-bit MSDOS */
    zmemcpy(ds->window, ss->window, ds->w_size * 2 * sizeof(Byte));
    1b65:	8b 43 24             	mov    0x24(%ebx),%eax
    1b68:	8b 6a 30             	mov    0x30(%edx),%ebp
    1b6b:	01 c0                	add    %eax,%eax
    1b6d:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    1b71:	89 0c 24             	mov    %ecx,(%esp)
    1b74:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b78:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1b7c:	e8 00 00 00 00       	call   1b81 <_deflateCopy+0x131>
    zmemcpy(ds->prev, ss->prev, ds->w_size * sizeof(Pos));
    1b81:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    1b85:	8b 43 24             	mov    0x24(%ebx),%eax
    1b88:	8b 4b 38             	mov    0x38(%ebx),%ecx
    1b8b:	01 c0                	add    %eax,%eax
    1b8d:	8b 6a 38             	mov    0x38(%edx),%ebp
    1b90:	89 0c 24             	mov    %ecx,(%esp)
    1b93:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    1b97:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b9b:	e8 00 00 00 00       	call   1ba0 <_deflateCopy+0x150>
    zmemcpy(ds->head, ss->head, ds->hash_size * sizeof(Pos));
    1ba0:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    1ba4:	8b 43 44             	mov    0x44(%ebx),%eax
    1ba7:	8b 6a 3c             	mov    0x3c(%edx),%ebp
    1baa:	8b 4b 3c             	mov    0x3c(%ebx),%ecx
    1bad:	01 c0                	add    %eax,%eax
    1baf:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    1bb3:	89 0c 24             	mov    %ecx,(%esp)
    1bb6:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bba:	e8 00 00 00 00       	call   1bbf <_deflateCopy+0x16f>
    zmemcpy(ds->pending_buf, ss->pending_buf, (uInt)ds->pending_buf_size);
    1bbf:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    1bc3:	8b 6b 0c             	mov    0xc(%ebx),%ebp
    1bc6:	8b 4a 08             	mov    0x8(%edx),%ecx
    1bc9:	8b 43 08             	mov    0x8(%ebx),%eax
    1bcc:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    1bd0:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    1bd4:	89 04 24             	mov    %eax,(%esp)
    1bd7:	e8 00 00 00 00       	call   1bdc <_deflateCopy+0x18c>

    ds->pending_out = ds->pending_buf + (ss->pending_out - ss->pending_buf);
    1bdc:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    1be0:	8b 4b 08             	mov    0x8(%ebx),%ecx
    1be3:	8b 7a 10             	mov    0x10(%edx),%edi
    1be6:	89 c8                	mov    %ecx,%eax
    1be8:	8b 6a 08             	mov    0x8(%edx),%ebp
    1beb:	01 f8                	add    %edi,%eax
    ds->d_buf = overlay + ds->lit_bufsize/sizeof(ush);
    1bed:	8b 93 94 16 00 00    	mov    0x1694(%ebx),%edx
    zmemcpy(ds->window, ss->window, ds->w_size * 2 * sizeof(Byte));
    zmemcpy(ds->prev, ss->prev, ds->w_size * sizeof(Pos));
    zmemcpy(ds->head, ss->head, ds->hash_size * sizeof(Pos));
    zmemcpy(ds->pending_buf, ss->pending_buf, (uInt)ds->pending_buf_size);

    ds->pending_out = ds->pending_buf + (ss->pending_out - ss->pending_buf);
    1bf3:	29 e8                	sub    %ebp,%eax
    1bf5:	89 43 10             	mov    %eax,0x10(%ebx)
    ds->d_buf = overlay + ds->lit_bufsize/sizeof(ush);
    1bf8:	89 d0                	mov    %edx,%eax
    1bfa:	83 e0 fe             	and    $0xfffffffe,%eax
    1bfd:	01 c6                	add    %eax,%esi
    ds->l_buf = ds->pending_buf + (1+sizeof(ush))*ds->lit_bufsize;
    1bff:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1c02:	01 c8                	add    %ecx,%eax
    zmemcpy(ds->prev, ss->prev, ds->w_size * sizeof(Pos));
    zmemcpy(ds->head, ss->head, ds->hash_size * sizeof(Pos));
    zmemcpy(ds->pending_buf, ss->pending_buf, (uInt)ds->pending_buf_size);

    ds->pending_out = ds->pending_buf + (ss->pending_out - ss->pending_buf);
    ds->d_buf = overlay + ds->lit_bufsize/sizeof(ush);
    1c04:	89 b3 9c 16 00 00    	mov    %esi,0x169c(%ebx)
    ds->l_buf = ds->pending_buf + (1+sizeof(ush))*ds->lit_bufsize;
    1c0a:	89 83 90 16 00 00    	mov    %eax,0x1690(%ebx)

    ds->l_desc.dyn_tree = ds->dyn_ltree;
    1c10:	8d 83 8c 00 00 00    	lea    0x8c(%ebx),%eax
    1c16:	89 83 10 0b 00 00    	mov    %eax,0xb10(%ebx)
    ds->d_desc.dyn_tree = ds->dyn_dtree;
    1c1c:	8d 83 80 09 00 00    	lea    0x980(%ebx),%eax
    1c22:	89 83 1c 0b 00 00    	mov    %eax,0xb1c(%ebx)
    ds->bl_desc.dyn_tree = ds->bl_tree;
    1c28:	8d 83 74 0a 00 00    	lea    0xa74(%ebx),%eax
    1c2e:	89 83 28 0b 00 00    	mov    %eax,0xb28(%ebx)

    return Z_OK;
    1c34:	31 c0                	xor    %eax,%eax
#endif
}
    1c36:	83 c4 2c             	add    $0x2c,%esp
    1c39:	5b                   	pop    %ebx
    1c3a:	5e                   	pop    %esi
    1c3b:	5f                   	pop    %edi
    1c3c:	5d                   	pop    %ebp
    1c3d:	c3                   	ret    
    1c3e:	66 90                	xchg   %ax,%ax
    deflate_state *ss;
    ushf *overlay;


    if (source == Z_NULL || dest == Z_NULL || source->state == Z_NULL) {
        return Z_STREAM_ERROR;
    1c40:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1c45:	eb ef                	jmp    1c36 <_deflateCopy+0x1e6>
    overlay = (ushf *) ZALLOC(dest, ds->lit_bufsize, sizeof(ush)+2);
    ds->pending_buf = (uchf *) overlay;

    if (ds->window == Z_NULL || ds->prev == Z_NULL || ds->head == Z_NULL ||
        ds->pending_buf == Z_NULL) {
        deflateEnd (dest);
    1c47:	89 2c 24             	mov    %ebp,(%esp)
    1c4a:	e8 51 fa ff ff       	call   16a0 <_deflateEnd>
        return Z_MEM_ERROR;
    1c4f:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
    1c54:	eb e0                	jmp    1c36 <_deflateCopy+0x1e6>
    ss = source->state;

    *dest = *source;

    ds = (deflate_state *) ZALLOC(dest, 1, sizeof(deflate_state));
    if (ds == Z_NULL) return Z_MEM_ERROR;
    1c56:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
    1c5b:	eb d9                	jmp    1c36 <_deflateCopy+0x1e6>
    1c5d:	90                   	nop
    1c5e:	90                   	nop
    1c5f:	90                   	nop

gzio.o:     file format pe-i386


Disassembly of section .text:

00000000 <_destroy>:
local int destroy (s)
    gz_stream *s;
{
    int err = Z_OK;

    if (!s) return Z_STREAM_ERROR;
       0:	85 c0                	test   %eax,%eax
       2:	0f 84 b9 00 00 00    	je     c1 <_destroy+0xc1>
 * Cleanup then free the given gz_stream. Return a zlib error code.
   Try freeing in the reverse order of allocations.
 */
local int destroy (s)
    gz_stream *s;
{
       8:	56                   	push   %esi
       9:	53                   	push   %ebx
       a:	83 ec 14             	sub    $0x14,%esp
       d:	89 c3                	mov    %eax,%ebx
    int err = Z_OK;

    if (!s) return Z_STREAM_ERROR;

    TRYFREE(s->msg);
       f:	8b 40 50             	mov    0x50(%eax),%eax
      12:	85 c0                	test   %eax,%eax
      14:	74 08                	je     1e <_destroy+0x1e>
      16:	89 04 24             	mov    %eax,(%esp)
      19:	e8 00 00 00 00       	call   1e <_destroy+0x1e>

    if (s->stream.state != NULL) {
      1e:	8b 43 1c             	mov    0x1c(%ebx),%eax
      21:	85 c0                	test   %eax,%eax
      23:	74 7d                	je     a2 <_destroy+0xa2>
  if (s->mode == 'w') {
      25:	8a 43 5c             	mov    0x5c(%ebx),%al
      28:	3c 77                	cmp    $0x77,%al
      2a:	74 7a                	je     a6 <_destroy+0xa6>
   Try freeing in the reverse order of allocations.
 */
local int destroy (s)
    gz_stream *s;
{
    int err = Z_OK;
      2c:	31 f6                	xor    %esi,%esi
#ifdef NO_DEFLATE
      err = Z_STREAM_ERROR;
#else
      err = deflateEnd(&(s->stream));
#endif
  } else if (s->mode == 'r') {
      2e:	3c 72                	cmp    $0x72,%al
      30:	0f 84 7c 00 00 00    	je     b2 <_destroy+0xb2>
      err = inflateEnd(&(s->stream));
  }
    }
    if (s->file != NULL && fclose(s->file)) {
      36:	8b 43 40             	mov    0x40(%ebx),%eax
      39:	85 c0                	test   %eax,%eax
      3b:	74 0c                	je     49 <_destroy+0x49>
      3d:	89 04 24             	mov    %eax,(%esp)
      40:	e8 00 00 00 00       	call   45 <_destroy+0x45>
      45:	85 c0                	test   %eax,%eax
      47:	75 47                	jne    90 <_destroy+0x90>
#ifdef ESPIPE
  if (errno != ESPIPE) /* fclose is broken for pipes in HP/UX */
#endif
      err = Z_ERRNO;
    }
    if (s->z_err < 0) {
      49:	8b 43 38             	mov    0x38(%ebx),%eax
      4c:	85 c0                	test   %eax,%eax
      4e:	0f 48 f0             	cmovs  %eax,%esi
      err = s->z_err;
    }

    TRYFREE(s->inbuf);
      51:	8b 43 44             	mov    0x44(%ebx),%eax
      54:	85 c0                	test   %eax,%eax
      56:	74 08                	je     60 <_destroy+0x60>
      58:	89 04 24             	mov    %eax,(%esp)
      5b:	e8 00 00 00 00       	call   60 <_destroy+0x60>
    TRYFREE(s->outbuf);
      60:	8b 43 48             	mov    0x48(%ebx),%eax
      63:	85 c0                	test   %eax,%eax
      65:	74 08                	je     6f <_destroy+0x6f>
      67:	89 04 24             	mov    %eax,(%esp)
      6a:	e8 00 00 00 00       	call   6f <_destroy+0x6f>
    TRYFREE(s->path);
      6f:	8b 43 54             	mov    0x54(%ebx),%eax
      72:	85 c0                	test   %eax,%eax
      74:	74 08                	je     7e <_destroy+0x7e>
      76:	89 04 24             	mov    %eax,(%esp)
      79:	e8 00 00 00 00       	call   7e <_destroy+0x7e>
    TRYFREE(s);
      7e:	89 1c 24             	mov    %ebx,(%esp)
      81:	e8 00 00 00 00       	call   86 <_destroy+0x86>
    return err;
}
      86:	83 c4 14             	add    $0x14,%esp

    TRYFREE(s->inbuf);
    TRYFREE(s->outbuf);
    TRYFREE(s->path);
    TRYFREE(s);
    return err;
      89:	89 f0                	mov    %esi,%eax
}
      8b:	5b                   	pop    %ebx
      8c:	5e                   	pop    %esi
      8d:	c3                   	ret    
      8e:	66 90                	xchg   %ax,%ax
      err = inflateEnd(&(s->stream));
  }
    }
    if (s->file != NULL && fclose(s->file)) {
#ifdef ESPIPE
  if (errno != ESPIPE) /* fclose is broken for pipes in HP/UX */
      90:	e8 00 00 00 00       	call   95 <_destroy+0x95>
#endif
      err = Z_ERRNO;
      95:	83 38 1d             	cmpl   $0x1d,(%eax)
      98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      9d:	0f 45 f0             	cmovne %eax,%esi
      a0:	eb a7                	jmp    49 <_destroy+0x49>
   Try freeing in the reverse order of allocations.
 */
local int destroy (s)
    gz_stream *s;
{
    int err = Z_OK;
      a2:	31 f6                	xor    %esi,%esi
      a4:	eb 90                	jmp    36 <_destroy+0x36>
    if (s->stream.state != NULL) {
  if (s->mode == 'w') {
#ifdef NO_DEFLATE
      err = Z_STREAM_ERROR;
#else
      err = deflateEnd(&(s->stream));
      a6:	89 1c 24             	mov    %ebx,(%esp)
      a9:	e8 00 00 00 00       	call   ae <_destroy+0xae>
      ae:	89 c6                	mov    %eax,%esi
      b0:	eb 84                	jmp    36 <_destroy+0x36>
#endif
  } else if (s->mode == 'r') {
      err = inflateEnd(&(s->stream));
      b2:	89 1c 24             	mov    %ebx,(%esp)
      b5:	e8 00 00 00 00       	call   ba <_destroy+0xba>
      ba:	89 c6                	mov    %eax,%esi
      bc:	e9 75 ff ff ff       	jmp    36 <_destroy+0x36>
local int destroy (s)
    gz_stream *s;
{
    int err = Z_OK;

    if (!s) return Z_STREAM_ERROR;
      c1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    TRYFREE(s->inbuf);
    TRYFREE(s->outbuf);
    TRYFREE(s->path);
    TRYFREE(s);
    return err;
}
      c6:	c3                   	ret    
      c7:	89 f6                	mov    %esi,%esi
      c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000d0 <_get_byte>:
   IN assertion: the stream s has been sucessfully opened for reading.
*/
local int get_byte(s)
    gz_stream *s;
{
    if (s->z_eof) return EOF;
      d0:	8b 50 3c             	mov    0x3c(%eax),%edx
      d3:	85 d2                	test   %edx,%edx
      d5:	75 7e                	jne    155 <_get_byte+0x85>
   for end of file.
   IN assertion: the stream s has been sucessfully opened for reading.
*/
local int get_byte(s)
    gz_stream *s;
{
      d7:	53                   	push   %ebx
      d8:	89 c3                	mov    %eax,%ebx
      da:	83 ec 18             	sub    $0x18,%esp
    if (s->z_eof) return EOF;
    if (s->stream.avail_in == 0) {
      dd:	8b 40 04             	mov    0x4(%eax),%eax
      e0:	85 c0                	test   %eax,%eax
      e2:	74 14                	je     f8 <_get_byte+0x28>
      e4:	8b 13                	mov    (%ebx),%edx
      if (ferror(s->file)) s->z_err = Z_ERRNO;
      return EOF;
  }
  s->stream.next_in = s->inbuf;
    }
    s->stream.avail_in--;
      e6:	48                   	dec    %eax
      e7:	89 43 04             	mov    %eax,0x4(%ebx)
    return *(s->stream.next_in)++;
      ea:	8d 42 01             	lea    0x1(%edx),%eax
      ed:	89 03                	mov    %eax,(%ebx)
      ef:	31 c0                	xor    %eax,%eax
      f1:	8a 02                	mov    (%edx),%al
}
      f3:	83 c4 18             	add    $0x18,%esp
      f6:	5b                   	pop    %ebx
      f7:	c3                   	ret    
local int get_byte(s)
    gz_stream *s;
{
    if (s->z_eof) return EOF;
    if (s->stream.avail_in == 0) {
  errno = 0;
      f8:	e8 00 00 00 00       	call   fd <_get_byte+0x2d>
      fd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  s->stream.avail_in = fread(s->inbuf, 1, Z_BUFSIZE, s->file);
     103:	8b 43 40             	mov    0x40(%ebx),%eax
     106:	89 44 24 0c          	mov    %eax,0xc(%esp)
     10a:	c7 44 24 08 00 40 00 	movl   $0x4000,0x8(%esp)
     111:	00 
     112:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     119:	00 
     11a:	8b 43 44             	mov    0x44(%ebx),%eax
     11d:	89 04 24             	mov    %eax,(%esp)
     120:	e8 00 00 00 00       	call   125 <_get_byte+0x55>
     125:	89 43 04             	mov    %eax,0x4(%ebx)
  if (s->stream.avail_in == 0) {
     128:	85 c0                	test   %eax,%eax
     12a:	75 24                	jne    150 <_get_byte+0x80>
      s->z_eof = 1;
      if (ferror(s->file)) s->z_err = Z_ERRNO;
     12c:	8b 43 40             	mov    0x40(%ebx),%eax
    if (s->z_eof) return EOF;
    if (s->stream.avail_in == 0) {
  errno = 0;
  s->stream.avail_in = fread(s->inbuf, 1, Z_BUFSIZE, s->file);
  if (s->stream.avail_in == 0) {
      s->z_eof = 1;
     12f:	c7 43 3c 01 00 00 00 	movl   $0x1,0x3c(%ebx)
      if (ferror(s->file)) s->z_err = Z_ERRNO;
     136:	f6 40 0c 20          	testb  $0x20,0xc(%eax)
     13a:	74 07                	je     143 <_get_byte+0x73>
     13c:	c7 43 38 ff ff ff ff 	movl   $0xffffffff,0x38(%ebx)
  }
  s->stream.next_in = s->inbuf;
    }
    s->stream.avail_in--;
    return *(s->stream.next_in)++;
}
     143:	83 c4 18             	add    $0x18,%esp
    if (s->stream.avail_in == 0) {
  errno = 0;
  s->stream.avail_in = fread(s->inbuf, 1, Z_BUFSIZE, s->file);
  if (s->stream.avail_in == 0) {
      s->z_eof = 1;
      if (ferror(s->file)) s->z_err = Z_ERRNO;
     146:	83 c8 ff             	or     $0xffffffff,%eax
  }
  s->stream.next_in = s->inbuf;
    }
    s->stream.avail_in--;
    return *(s->stream.next_in)++;
}
     149:	5b                   	pop    %ebx
     14a:	c3                   	ret    
     14b:	90                   	nop
     14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (s->stream.avail_in == 0) {
      s->z_eof = 1;
      if (ferror(s->file)) s->z_err = Z_ERRNO;
      return EOF;
  }
  s->stream.next_in = s->inbuf;
     150:	8b 53 44             	mov    0x44(%ebx),%edx
     153:	eb 91                	jmp    e6 <_get_byte+0x16>
   IN assertion: the stream s has been sucessfully opened for reading.
*/
local int get_byte(s)
    gz_stream *s;
{
    if (s->z_eof) return EOF;
     155:	83 c8 ff             	or     $0xffffffff,%eax
  }
  s->stream.next_in = s->inbuf;
    }
    s->stream.avail_in--;
    return *(s->stream.next_in)++;
}
     158:	c3                   	ret    
     159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <_check_header>:
       s->stream.avail_in is zero for the first time, but may be non-zero
       for concatenated .gz files.
*/
local void check_header(s)
    gz_stream *s;
{
     160:	55                   	push   %ebp
     161:	57                   	push   %edi
     162:	56                   	push   %esi
     163:	53                   	push   %ebx
     164:	83 ec 0c             	sub    $0xc,%esp
     167:	89 c3                	mov    %eax,%ebx
    uInt len;
    int c;

    /* Check the gzip magic header */
    for (len = 0; len < 2; len++) {
  c = get_byte(s);
     169:	e8 62 ff ff ff       	call   d0 <_get_byte>
  if (c != gz_magic[len]) {
     16e:	83 f8 1f             	cmp    $0x1f,%eax
     171:	0f 85 09 01 00 00    	jne    280 <_check_header+0x120>
    uInt len;
    int c;

    /* Check the gzip magic header */
    for (len = 0; len < 2; len++) {
  c = get_byte(s);
     177:	89 d8                	mov    %ebx,%eax
     179:	e8 52 ff ff ff       	call   d0 <_get_byte>
  if (c != gz_magic[len]) {
     17e:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     183:	0f 85 1c 01 00 00    	jne    2a5 <_check_header+0x145>
      }
      s->z_err = s->stream.avail_in != 0 ? Z_OK : Z_STREAM_END;
      return;
  }
    }
    method = get_byte(s);
     189:	89 d8                	mov    %ebx,%eax
     18b:	e8 40 ff ff ff       	call   d0 <_get_byte>
     190:	89 c7                	mov    %eax,%edi
    flags = get_byte(s);
     192:	89 d8                	mov    %ebx,%eax
     194:	e8 37 ff ff ff       	call   d0 <_get_byte>
    if (method != Z_DEFLATED || (flags & RESERVED) != 0) {
     199:	83 ff 08             	cmp    $0x8,%edi
      s->z_err = s->stream.avail_in != 0 ? Z_OK : Z_STREAM_END;
      return;
  }
    }
    method = get_byte(s);
    flags = get_byte(s);
     19c:	89 c6                	mov    %eax,%esi
    if (method != Z_DEFLATED || (flags & RESERVED) != 0) {
     19e:	74 10                	je     1b0 <_check_header+0x50>
  s->z_err = Z_DATA_ERROR;
     1a0:	c7 43 38 fd ff ff ff 	movl   $0xfffffffd,0x38(%ebx)
    }
    if ((flags & HEAD_CRC) != 0) {  /* skip the header crc */
  for (len = 0; len < 2; len++) (void)get_byte(s);
    }
    s->z_err = s->z_eof ? Z_DATA_ERROR : Z_OK;
}
     1a7:	83 c4 0c             	add    $0xc,%esp
     1aa:	5b                   	pop    %ebx
     1ab:	5e                   	pop    %esi
     1ac:	5f                   	pop    %edi
     1ad:	5d                   	pop    %ebp
     1ae:	c3                   	ret    
     1af:	90                   	nop
     1b0:	bf 06 00 00 00       	mov    $0x6,%edi
      return;
  }
    }
    method = get_byte(s);
    flags = get_byte(s);
    if (method != Z_DEFLATED || (flags & RESERVED) != 0) {
     1b5:	a8 e0                	test   $0xe0,%al
     1b7:	75 e7                	jne    1a0 <_check_header+0x40>
     1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  s->z_err = Z_DATA_ERROR;
  return;
    }

    /* Discard time, xflags and OS code: */
    for (len = 0; len < 6; len++) (void)get_byte(s);
     1c0:	89 d8                	mov    %ebx,%eax
     1c2:	e8 09 ff ff ff       	call   d0 <_get_byte>
     1c7:	4f                   	dec    %edi
     1c8:	75 f6                	jne    1c0 <_check_header+0x60>

    if ((flags & EXTRA_FIELD) != 0) { /* skip the extra field */
     1ca:	f7 c6 04 00 00 00    	test   $0x4,%esi
     1d0:	75 7e                	jne    250 <_check_header+0xf0>
  len  =  (uInt)get_byte(s);
  len += ((uInt)get_byte(s))<<8;
  /* len is garbage if EOF but the loop below will quit anyway */
  while (len-- != 0 && get_byte(s) != EOF) ;
    }
    if ((flags & ORIG_NAME) != 0) { /* skip the original file name */
     1d2:	f7 c6 08 00 00 00    	test   $0x8,%esi
     1d8:	75 36                	jne    210 <_check_header+0xb0>
  while ((c = get_byte(s)) != 0 && c != EOF) ;
    }
    if ((flags & COMMENT) != 0) {   /* skip the .gz file comment */
     1da:	f7 c6 10 00 00 00    	test   $0x10,%esi
     1e0:	75 4e                	jne    230 <_check_header+0xd0>
  while ((c = get_byte(s)) != 0 && c != EOF) ;
    }
    if ((flags & HEAD_CRC) != 0) {  /* skip the header crc */
     1e2:	83 e6 02             	and    $0x2,%esi
     1e5:	74 0e                	je     1f5 <_check_header+0x95>
  for (len = 0; len < 2; len++) (void)get_byte(s);
     1e7:	89 d8                	mov    %ebx,%eax
     1e9:	e8 e2 fe ff ff       	call   d0 <_get_byte>
     1ee:	89 d8                	mov    %ebx,%eax
     1f0:	e8 db fe ff ff       	call   d0 <_get_byte>
    }
    s->z_err = s->z_eof ? Z_DATA_ERROR : Z_OK;
     1f5:	8b 43 3c             	mov    0x3c(%ebx),%eax
     1f8:	ba fd ff ff ff       	mov    $0xfffffffd,%edx
     1fd:	85 c0                	test   %eax,%eax
     1ff:	0f 45 c2             	cmovne %edx,%eax
     202:	89 43 38             	mov    %eax,0x38(%ebx)
}
     205:	83 c4 0c             	add    $0xc,%esp
     208:	5b                   	pop    %ebx
     209:	5e                   	pop    %esi
     20a:	5f                   	pop    %edi
     20b:	5d                   	pop    %ebp
     20c:	c3                   	ret    
     20d:	8d 76 00             	lea    0x0(%esi),%esi
  len += ((uInt)get_byte(s))<<8;
  /* len is garbage if EOF but the loop below will quit anyway */
  while (len-- != 0 && get_byte(s) != EOF) ;
    }
    if ((flags & ORIG_NAME) != 0) { /* skip the original file name */
  while ((c = get_byte(s)) != 0 && c != EOF) ;
     210:	89 d8                	mov    %ebx,%eax
     212:	e8 b9 fe ff ff       	call   d0 <_get_byte>
     217:	40                   	inc    %eax
     218:	83 f8 01             	cmp    $0x1,%eax
     21b:	76 bd                	jbe    1da <_check_header+0x7a>
     21d:	89 d8                	mov    %ebx,%eax
     21f:	e8 ac fe ff ff       	call   d0 <_get_byte>
     224:	40                   	inc    %eax
     225:	83 f8 01             	cmp    $0x1,%eax
     228:	77 e6                	ja     210 <_check_header+0xb0>
     22a:	eb ae                	jmp    1da <_check_header+0x7a>
     22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if ((flags & COMMENT) != 0) {   /* skip the .gz file comment */
  while ((c = get_byte(s)) != 0 && c != EOF) ;
     230:	89 d8                	mov    %ebx,%eax
     232:	e8 99 fe ff ff       	call   d0 <_get_byte>
     237:	8d 50 01             	lea    0x1(%eax),%edx
     23a:	83 fa 01             	cmp    $0x1,%edx
     23d:	76 a3                	jbe    1e2 <_check_header+0x82>
     23f:	89 d8                	mov    %ebx,%eax
     241:	e8 8a fe ff ff       	call   d0 <_get_byte>
     246:	8d 50 01             	lea    0x1(%eax),%edx
     249:	83 fa 01             	cmp    $0x1,%edx
     24c:	77 e2                	ja     230 <_check_header+0xd0>
     24e:	eb 92                	jmp    1e2 <_check_header+0x82>

    /* Discard time, xflags and OS code: */
    for (len = 0; len < 6; len++) (void)get_byte(s);

    if ((flags & EXTRA_FIELD) != 0) { /* skip the extra field */
  len  =  (uInt)get_byte(s);
     250:	89 d8                	mov    %ebx,%eax
     252:	e8 79 fe ff ff       	call   d0 <_get_byte>
     257:	89 c5                	mov    %eax,%ebp
  len += ((uInt)get_byte(s))<<8;
     259:	89 d8                	mov    %ebx,%eax
     25b:	e8 70 fe ff ff       	call   d0 <_get_byte>
     260:	c1 e0 08             	shl    $0x8,%eax
  /* len is garbage if EOF but the loop below will quit anyway */
  while (len-- != 0 && get_byte(s) != EOF) ;
     263:	8d 3c 28             	lea    (%eax,%ebp,1),%edi
     266:	eb 0f                	jmp    277 <_check_header+0x117>
     268:	89 d8                	mov    %ebx,%eax
     26a:	4f                   	dec    %edi
     26b:	e8 60 fe ff ff       	call   d0 <_get_byte>
     270:	40                   	inc    %eax
     271:	0f 84 5b ff ff ff    	je     1d2 <_check_header+0x72>
     277:	85 ff                	test   %edi,%edi
     279:	75 ed                	jne    268 <_check_header+0x108>
     27b:	e9 52 ff ff ff       	jmp    1d2 <_check_header+0x72>
     280:	8b 53 04             	mov    0x4(%ebx),%edx
    /* Check the gzip magic header */
    for (len = 0; len < 2; len++) {
  c = get_byte(s);
  if (c != gz_magic[len]) {
      if (len != 0) s->stream.avail_in++, s->stream.next_in--;
      if (c != EOF) {
     283:	40                   	inc    %eax
     284:	74 10                	je     296 <_check_header+0x136>
    s->stream.avail_in++, s->stream.next_in--;
     286:	8b 33                	mov    (%ebx),%esi
     288:	42                   	inc    %edx
     289:	4e                   	dec    %esi
     28a:	89 53 04             	mov    %edx,0x4(%ebx)
     28d:	89 33                	mov    %esi,(%ebx)
    s->transparent = 1;
     28f:	c7 43 58 01 00 00 00 	movl   $0x1,0x58(%ebx)
      }
      s->z_err = s->stream.avail_in != 0 ? Z_OK : Z_STREAM_END;
     296:	31 c0                	xor    %eax,%eax
     298:	85 d2                	test   %edx,%edx
     29a:	0f 94 c0             	sete   %al
     29d:	89 43 38             	mov    %eax,0x38(%ebx)
      return;
     2a0:	e9 02 ff ff ff       	jmp    1a7 <_check_header+0x47>

    /* Check the gzip magic header */
    for (len = 0; len < 2; len++) {
  c = get_byte(s);
  if (c != gz_magic[len]) {
      if (len != 0) s->stream.avail_in++, s->stream.next_in--;
     2a5:	8b 4b 04             	mov    0x4(%ebx),%ecx
     2a8:	8d 51 01             	lea    0x1(%ecx),%edx
     2ab:	8b 0b                	mov    (%ebx),%ecx
     2ad:	49                   	dec    %ecx
     2ae:	89 53 04             	mov    %edx,0x4(%ebx)
     2b1:	89 0b                	mov    %ecx,(%ebx)
     2b3:	eb ce                	jmp    283 <_check_header+0x123>
     2b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <_gz_open>:
*/
local gzFile gz_open (path, mode, fd)
    const char *path;
    const char *mode;
    int  fd;
{
     2c0:	55                   	push   %ebp
     2c1:	57                   	push   %edi
     2c2:	56                   	push   %esi
     2c3:	53                   	push   %ebx
     2c4:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    char *p = (char*)mode;
    gz_stream *s;
    char fmode[80]; /* copy of mode, without the compression level */
    char *m = fmode;

    if (!path || !mode) return Z_NULL;
     2ca:	85 d2                	test   %edx,%edx
     2cc:	0f 84 ae 02 00 00    	je     580 <_gz_open+0x2c0>
     2d2:	85 c0                	test   %eax,%eax
     2d4:	0f 84 a6 02 00 00    	je     580 <_gz_open+0x2c0>

    s = (gz_stream *)ALLOC(sizeof(gz_stream));
     2da:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
     2e1:	89 4c 24 38          	mov    %ecx,0x38(%esp)
     2e5:	89 d6                	mov    %edx,%esi
     2e7:	89 c7                	mov    %eax,%edi
     2e9:	89 44 24 3c          	mov    %eax,0x3c(%esp)
     2ed:	e8 00 00 00 00       	call   2f2 <_gz_open+0x32>
     2f2:	89 c3                	mov    %eax,%ebx
    if (!s) return Z_NULL;
     2f4:	85 c0                	test   %eax,%eax
     2f6:	0f 84 84 02 00 00    	je     580 <_gz_open+0x2c0>

    s->stream.zalloc = (alloc_func)0;
     2fc:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
    s->stream.zfree = (free_func)0;
     303:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
    s->stream.opaque = (voidpf)0;
     30a:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    s->stream.next_in = s->inbuf = Z_NULL;
     311:	c7 40 44 00 00 00 00 	movl   $0x0,0x44(%eax)
     318:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    s->stream.next_out = s->outbuf = Z_NULL;
     31e:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
     325:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    s->stream.avail_in = s->stream.avail_out = 0;
     32c:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
     333:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    s->file = NULL;
     33a:	c7 40 40 00 00 00 00 	movl   $0x0,0x40(%eax)
    s->z_err = Z_OK;
     341:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
    s->z_eof = 0;
     348:	c7 40 3c 00 00 00 00 	movl   $0x0,0x3c(%eax)
    s->crc = crc32(0L, Z_NULL, 0);
     34f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     356:	00 
     357:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     35e:	00 
     35f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     366:	e8 00 00 00 00       	call   36b <_gz_open+0xab>
    s->msg = NULL;
    s->transparent = 0;

    s->path = (char*)ALLOC(strlen(path)+1);
     36b:	89 3c 24             	mov    %edi,(%esp)
    s->stream.next_out = s->outbuf = Z_NULL;
    s->stream.avail_in = s->stream.avail_out = 0;
    s->file = NULL;
    s->z_err = Z_OK;
    s->z_eof = 0;
    s->crc = crc32(0L, Z_NULL, 0);
     36e:	89 43 4c             	mov    %eax,0x4c(%ebx)
    s->msg = NULL;
     371:	c7 43 50 00 00 00 00 	movl   $0x0,0x50(%ebx)
    s->transparent = 0;
     378:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)

    s->path = (char*)ALLOC(strlen(path)+1);
     37f:	e8 00 00 00 00       	call   384 <_gz_open+0xc4>
     384:	8d 68 01             	lea    0x1(%eax),%ebp
     387:	89 2c 24             	mov    %ebp,(%esp)
     38a:	e8 00 00 00 00       	call   38f <_gz_open+0xcf>
     38f:	89 c7                	mov    %eax,%edi
     391:	89 43 54             	mov    %eax,0x54(%ebx)
    if (s->path == NULL) {
     394:	85 c0                	test   %eax,%eax
     396:	0f 84 98 02 00 00    	je     634 <_gz_open+0x374>
        return destroy(s), (gzFile)Z_NULL;
    }
    strcpy(s->path, path); /* do this early for debugging */
     39c:	8b 44 24 3c          	mov    0x3c(%esp),%eax
     3a0:	89 6c 24 08          	mov    %ebp,0x8(%esp)
     3a4:	89 3c 24             	mov    %edi,(%esp)
     3a7:	89 44 24 04          	mov    %eax,0x4(%esp)
     3ab:	e8 00 00 00 00       	call   3b0 <_gz_open+0xf0>
     3b0:	8d 56 01             	lea    0x1(%esi),%edx

    s->mode = '\0';
    do {
        if (*p == 'r') s->mode = 'r';
     3b3:	0f be 42 ff          	movsbl -0x1(%edx),%eax
{
    int err;
    int skip=0;
    char skip_bytes[40];
    int level = Z_DEFAULT_COMPRESSION; /* compression level */
    int strategy = Z_DEFAULT_STRATEGY; /* compression strategy */
     3b7:	31 ed                	xor    %ebp,%ebp
    int  fd;
{
    int err;
    int skip=0;
    char skip_bytes[40];
    int level = Z_DEFAULT_COMPRESSION; /* compression level */
     3b9:	83 cf ff             	or     $0xffffffff,%edi
    if (s->path == NULL) {
        return destroy(s), (gzFile)Z_NULL;
    }
    strcpy(s->path, path); /* do this early for debugging */

    s->mode = '\0';
     3bc:	c6 43 5c 00          	movb   $0x0,0x5c(%ebx)
    int level = Z_DEFAULT_COMPRESSION; /* compression level */
    int strategy = Z_DEFAULT_STRATEGY; /* compression strategy */
    char *p = (char*)mode;
    gz_stream *s;
    char fmode[80]; /* copy of mode, without the compression level */
    char *m = fmode;
     3c0:	8d 74 24 70          	lea    0x70(%esp),%esi
    const char *path;
    const char *mode;
    int  fd;
{
    int err;
    int skip=0;
     3c4:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
     3cb:	00 
    }
    strcpy(s->path, path); /* do this early for debugging */

    s->mode = '\0';
    do {
        if (*p == 'r') s->mode = 'r';
     3cc:	3c 72                	cmp    $0x72,%al
     3ce:	0f 84 17 01 00 00    	je     4eb <_gz_open+0x22b>
        if (*p == 'w') s->mode = 'w';
     3d4:	3c 77                	cmp    $0x77,%al
     3d6:	74 08                	je     3e0 <_gz_open+0x120>
        if (*p == 'a') s->mode = 'w';
     3d8:	3c 61                	cmp    $0x61,%al
     3da:	0f 85 e4 00 00 00    	jne    4c4 <_gz_open+0x204>
     3e0:	c6 43 5c 77          	movb   $0x77,0x5c(%ebx)
        } else if (*p == '~') {
          skip=32;
        } else if (*p == 'h') {
          strategy = Z_HUFFMAN_ONLY;
        } else {
            *m++ = *p; /* copy the mode */
     3e4:	8d 4e 01             	lea    0x1(%esi),%ecx
     3e7:	88 06                	mov    %al,(%esi)
        }
    } while (*p++ && m != fmode + sizeof(fmode));
     3e9:	84 c0                	test   %al,%al
     3eb:	0f 85 4f 02 00 00    	jne    640 <_gz_open+0x380>
    if (s->mode == '\0') return destroy(s), (gzFile)Z_NULL;
     3f1:	8a 43 5c             	mov    0x5c(%ebx),%al
     3f4:	84 c0                	test   %al,%al
     3f6:	0f 84 7d 01 00 00    	je     579 <_gz_open+0x2b9>

    if (s->mode == 'w') {
     3fc:	3c 77                	cmp    $0x77,%al
     3fe:	0f 84 1d 01 00 00    	je     521 <_gz_open+0x261>
#endif
        if (err != Z_OK || s->outbuf == Z_NULL) {
            return destroy(s), (gzFile)Z_NULL;
        }
    } else {
        s->stream.next_in  = s->inbuf = (Byte*)ALLOC(Z_BUFSIZE);
     404:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
     40b:	e8 00 00 00 00       	call   410 <_gz_open+0x150>

        err = inflateInit2(&(s->stream), -MAX_WBITS);
     410:	c7 44 24 0c 38 00 00 	movl   $0x38,0xc(%esp)
     417:	00 
     418:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     41f:	00 
     420:	c7 44 24 04 f1 ff ff 	movl   $0xfffffff1,0x4(%esp)
     427:	ff 
     428:	89 1c 24             	mov    %ebx,(%esp)
#endif
        if (err != Z_OK || s->outbuf == Z_NULL) {
            return destroy(s), (gzFile)Z_NULL;
        }
    } else {
        s->stream.next_in  = s->inbuf = (Byte*)ALLOC(Z_BUFSIZE);
     42b:	89 43 44             	mov    %eax,0x44(%ebx)
     42e:	89 03                	mov    %eax,(%ebx)

        err = inflateInit2(&(s->stream), -MAX_WBITS);
     430:	e8 00 00 00 00       	call   435 <_gz_open+0x175>
         * Note that in this case inflate *requires* an extra "dummy" byte
         * after the compressed stream in order to complete decompression and
         * return Z_STREAM_END. Here the gzip CRC32 ensures that 4 bytes are
         * present after the compressed stream.
         */
        if (err != Z_OK || s->inbuf == Z_NULL) {
     435:	85 c0                	test   %eax,%eax
     437:	0f 85 3c 01 00 00    	jne    579 <_gz_open+0x2b9>
     43d:	8b 7b 44             	mov    0x44(%ebx),%edi
     440:	85 ff                	test   %edi,%edi
     442:	0f 84 31 01 00 00    	je     579 <_gz_open+0x2b9>
            return destroy(s), (gzFile)Z_NULL;
        }
    }
    s->stream.avail_out = Z_BUFSIZE;
     448:	c7 43 10 00 40 00 00 	movl   $0x4000,0x10(%ebx)

    errno = 0;
     44f:	e8 00 00 00 00       	call   454 <_gz_open+0x194>
    s->file = fd < 0 ? F_OPEN(path, fmode) : (FILE*)fdopen(fd, fmode);
     454:	8b 74 24 38          	mov    0x38(%esp),%esi
            return destroy(s), (gzFile)Z_NULL;
        }
    }
    s->stream.avail_out = Z_BUFSIZE;

    errno = 0;
     458:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    s->file = fd < 0 ? F_OPEN(path, fmode) : (FILE*)fdopen(fd, fmode);
     45e:	8d 44 24 70          	lea    0x70(%esp),%eax
     462:	85 f6                	test   %esi,%esi
     464:	89 44 24 04          	mov    %eax,0x4(%esp)
     468:	0f 88 22 01 00 00    	js     590 <_gz_open+0x2d0>
     46e:	8b 44 24 38          	mov    0x38(%esp),%eax
     472:	89 04 24             	mov    %eax,(%esp)
     475:	e8 00 00 00 00       	call   47a <_gz_open+0x1ba>
     47a:	89 43 40             	mov    %eax,0x40(%ebx)
    if (s->file == NULL) {
     47d:	85 c0                	test   %eax,%eax
     47f:	0f 84 f4 00 00 00    	je     579 <_gz_open+0x2b9>
        return destroy(s), (gzFile)Z_NULL;
    }
    if (s->mode == 'w') {
     485:	80 7b 5c 77          	cmpb   $0x77,0x5c(%ebx)
     489:	0f 84 37 01 00 00    	je     5c6 <_gz_open+0x306>
         * fflush on some systems. This version of the library doesn't use
         * startpos anyway in write mode, so this initialization is not
         * necessary.
         */
    } else {
      if (skip) {
     48f:	8b 4c 24 34          	mov    0x34(%esp),%ecx
     493:	85 c9                	test   %ecx,%ecx
     495:	0f 85 06 01 00 00    	jne    5a1 <_gz_open+0x2e1>
        fread(&skip_bytes,1,32,s->file);
      }
      check_header(s); /* skip the .gz header */
     49b:	89 d8                	mov    %ebx,%eax
      s->startpos = (ftell(s->file) - s->stream.avail_in);
     49d:	89 df                	mov    %ebx,%edi
         */
    } else {
      if (skip) {
        fread(&skip_bytes,1,32,s->file);
      }
      check_header(s); /* skip the .gz header */
     49f:	e8 bc fc ff ff       	call   160 <_check_header>
      s->startpos = (ftell(s->file) - s->stream.avail_in);
     4a4:	8b 43 40             	mov    0x40(%ebx),%eax
     4a7:	89 04 24             	mov    %eax,(%esp)
     4aa:	e8 00 00 00 00       	call   4af <_gz_open+0x1ef>
     4af:	8b 53 04             	mov    0x4(%ebx),%edx
     4b2:	29 d0                	sub    %edx,%eax
     4b4:	89 43 60             	mov    %eax,0x60(%ebx)
    }

    return (gzFile)s;
}
     4b7:	81 c4 cc 00 00 00    	add    $0xcc,%esp
     4bd:	89 f8                	mov    %edi,%eax
     4bf:	5b                   	pop    %ebx
     4c0:	5e                   	pop    %esi
     4c1:	5f                   	pop    %edi
     4c2:	5d                   	pop    %ebp
     4c3:	c3                   	ret    
    do {
        if (*p == 'r') s->mode = 'r';
        if (*p == 'w') s->mode = 'w';
        if (*p == 'a') s->mode = 'w';
/*        if (*p == 'w' || *p == 'a') s->mode = 'w'; */
        if (*p >= '0' && *p <= '9') {
     4c4:	8d 48 d0             	lea    -0x30(%eax),%ecx
     4c7:	80 f9 09             	cmp    $0x9,%cl
     4ca:	77 29                	ja     4f5 <_gz_open+0x235>
          level = *p - '0';
     4cc:	8d 78 d0             	lea    -0x30(%eax),%edi
        } else if (*p == 'h') {
          strategy = Z_HUFFMAN_ONLY;
        } else {
            *m++ = *p; /* copy the mode */
        }
    } while (*p++ && m != fmode + sizeof(fmode));
     4cf:	8d 84 24 c0 00 00 00 	lea    0xc0(%esp),%eax
     4d6:	42                   	inc    %edx
     4d7:	39 c6                	cmp    %eax,%esi
     4d9:	0f 84 12 ff ff ff    	je     3f1 <_gz_open+0x131>
    }
    strcpy(s->path, path); /* do this early for debugging */

    s->mode = '\0';
    do {
        if (*p == 'r') s->mode = 'r';
     4df:	0f be 42 ff          	movsbl -0x1(%edx),%eax
     4e3:	3c 72                	cmp    $0x72,%al
     4e5:	0f 85 e9 fe ff ff    	jne    3d4 <_gz_open+0x114>
        } else if (*p == '~') {
          skip=32;
        } else if (*p == 'h') {
          strategy = Z_HUFFMAN_ONLY;
        } else {
            *m++ = *p; /* copy the mode */
     4eb:	c6 06 72             	movb   $0x72,(%esi)
    }
    strcpy(s->path, path); /* do this early for debugging */

    s->mode = '\0';
    do {
        if (*p == 'r') s->mode = 'r';
     4ee:	c6 43 5c 72          	movb   $0x72,0x5c(%ebx)
        } else if (*p == '~') {
          skip=32;
        } else if (*p == 'h') {
          strategy = Z_HUFFMAN_ONLY;
        } else {
            *m++ = *p; /* copy the mode */
     4f2:	46                   	inc    %esi
     4f3:	eb da                	jmp    4cf <_gz_open+0x20f>
        if (*p == 'w') s->mode = 'w';
        if (*p == 'a') s->mode = 'w';
/*        if (*p == 'w' || *p == 'a') s->mode = 'w'; */
        if (*p >= '0' && *p <= '9') {
          level = *p - '0';
        } else if (*p == 'f') {
     4f5:	3c 66                	cmp    $0x66,%al
     4f7:	74 17                	je     510 <_gz_open+0x250>
          strategy = Z_FILTERED;
        } else if (*p == '~') {
     4f9:	3c 7e                	cmp    $0x7e,%al
     4fb:	74 1a                	je     517 <_gz_open+0x257>
          skip=32;
        } else if (*p == 'h') {
     4fd:	3c 68                	cmp    $0x68,%al
     4ff:	0f 85 df fe ff ff    	jne    3e4 <_gz_open+0x124>
          strategy = Z_HUFFMAN_ONLY;
     505:	bd 02 00 00 00       	mov    $0x2,%ebp
     50a:	eb c3                	jmp    4cf <_gz_open+0x20f>
     50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if (*p == 'a') s->mode = 'w';
/*        if (*p == 'w' || *p == 'a') s->mode = 'w'; */
        if (*p >= '0' && *p <= '9') {
          level = *p - '0';
        } else if (*p == 'f') {
          strategy = Z_FILTERED;
     510:	bd 01 00 00 00       	mov    $0x1,%ebp
     515:	eb b8                	jmp    4cf <_gz_open+0x20f>
        } else if (*p == '~') {
          skip=32;
     517:	c7 44 24 34 20 00 00 	movl   $0x20,0x34(%esp)
     51e:	00 
     51f:	eb ae                	jmp    4cf <_gz_open+0x20f>

    if (s->mode == 'w') {
#ifdef NO_DEFLATE
        err = Z_STREAM_ERROR;
#else
        err = deflateInit2(&(s->stream), level,
     521:	c7 44 24 1c 38 00 00 	movl   $0x38,0x1c(%esp)
     528:	00 
     529:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     530:	00 
     531:	89 6c 24 14          	mov    %ebp,0x14(%esp)
     535:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
     53c:	00 
     53d:	c7 44 24 0c f1 ff ff 	movl   $0xfffffff1,0xc(%esp)
     544:	ff 
     545:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     54c:	00 
     54d:	89 7c 24 04          	mov    %edi,0x4(%esp)
     551:	89 1c 24             	mov    %ebx,(%esp)
     554:	e8 00 00 00 00       	call   559 <_gz_open+0x299>
                           Z_DEFLATED, -MAX_WBITS, DEF_MEM_LEVEL, strategy);
        /* windowBits is passed < 0 to suppress zlib header */

        s->stream.next_out = s->outbuf = (Byte*)ALLOC(Z_BUFSIZE);
     559:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)

    if (s->mode == 'w') {
#ifdef NO_DEFLATE
        err = Z_STREAM_ERROR;
#else
        err = deflateInit2(&(s->stream), level,
     560:	89 c6                	mov    %eax,%esi
                           Z_DEFLATED, -MAX_WBITS, DEF_MEM_LEVEL, strategy);
        /* windowBits is passed < 0 to suppress zlib header */

        s->stream.next_out = s->outbuf = (Byte*)ALLOC(Z_BUFSIZE);
     562:	e8 00 00 00 00       	call   567 <_gz_open+0x2a7>
#endif
        if (err != Z_OK || s->outbuf == Z_NULL) {
     567:	85 f6                	test   %esi,%esi
#else
        err = deflateInit2(&(s->stream), level,
                           Z_DEFLATED, -MAX_WBITS, DEF_MEM_LEVEL, strategy);
        /* windowBits is passed < 0 to suppress zlib header */

        s->stream.next_out = s->outbuf = (Byte*)ALLOC(Z_BUFSIZE);
     569:	89 43 48             	mov    %eax,0x48(%ebx)
     56c:	89 43 0c             	mov    %eax,0xc(%ebx)
#endif
        if (err != Z_OK || s->outbuf == Z_NULL) {
     56f:	75 08                	jne    579 <_gz_open+0x2b9>
     571:	85 c0                	test   %eax,%eax
     573:	0f 85 cf fe ff ff    	jne    448 <_gz_open+0x188>
    s->stream.avail_out = Z_BUFSIZE;

    errno = 0;
    s->file = fd < 0 ? F_OPEN(path, fmode) : (FILE*)fdopen(fd, fmode);
    if (s->file == NULL) {
        return destroy(s), (gzFile)Z_NULL;
     579:	89 d8                	mov    %ebx,%eax
     57b:	e8 80 fa ff ff       	call   0 <_destroy>
      check_header(s); /* skip the .gz header */
      s->startpos = (ftell(s->file) - s->stream.avail_in);
    }

    return (gzFile)s;
}
     580:	81 c4 cc 00 00 00    	add    $0xcc,%esp
    s->stream.avail_out = Z_BUFSIZE;

    errno = 0;
    s->file = fd < 0 ? F_OPEN(path, fmode) : (FILE*)fdopen(fd, fmode);
    if (s->file == NULL) {
        return destroy(s), (gzFile)Z_NULL;
     586:	31 ff                	xor    %edi,%edi
      check_header(s); /* skip the .gz header */
      s->startpos = (ftell(s->file) - s->stream.avail_in);
    }

    return (gzFile)s;
}
     588:	89 f8                	mov    %edi,%eax
     58a:	5b                   	pop    %ebx
     58b:	5e                   	pop    %esi
     58c:	5f                   	pop    %edi
     58d:	5d                   	pop    %ebp
     58e:	c3                   	ret    
     58f:	90                   	nop
        }
    }
    s->stream.avail_out = Z_BUFSIZE;

    errno = 0;
    s->file = fd < 0 ? F_OPEN(path, fmode) : (FILE*)fdopen(fd, fmode);
     590:	8b 44 24 3c          	mov    0x3c(%esp),%eax
     594:	89 04 24             	mov    %eax,(%esp)
     597:	e8 00 00 00 00       	call   59c <_gz_open+0x2dc>
     59c:	e9 d9 fe ff ff       	jmp    47a <_gz_open+0x1ba>
         * startpos anyway in write mode, so this initialization is not
         * necessary.
         */
    } else {
      if (skip) {
        fread(&skip_bytes,1,32,s->file);
     5a1:	89 44 24 0c          	mov    %eax,0xc(%esp)
     5a5:	8d 44 24 48          	lea    0x48(%esp),%eax
     5a9:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
     5b0:	00 
     5b1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     5b8:	00 
     5b9:	89 04 24             	mov    %eax,(%esp)
     5bc:	e8 00 00 00 00       	call   5c1 <_gz_open+0x301>
     5c1:	e9 d5 fe ff ff       	jmp    49b <_gz_open+0x1db>
        return destroy(s), (gzFile)Z_NULL;
    }
    if (s->mode == 'w') {
        /* Write a very simple .gz header:
         */
        fprintf(s->file, "%c%c%c%c%c%c%c%c%c%c", gz_magic[0], gz_magic[1],
     5c6:	c7 44 24 2c 0b 00 00 	movl   $0xb,0x2c(%esp)
     5cd:	00 
     5ce:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
     5d5:	00 
     5d6:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
     5dd:	00 
     5de:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
     5e5:	00 
     5e6:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     5ed:	00 
     5ee:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     5f5:	00 
     5f6:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     5fd:	00 
     5fe:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
     605:	00 
     606:	c7 44 24 0c 8b 00 00 	movl   $0x8b,0xc(%esp)
     60d:	00 
     60e:	c7 44 24 08 1f 00 00 	movl   $0x1f,0x8(%esp)
     615:	00 
     616:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
     61d:	00 
     61e:	89 04 24             	mov    %eax,(%esp)
     621:	e8 00 00 00 00       	call   626 <_gz_open+0x366>
     626:	89 df                	mov    %ebx,%edi
             Z_DEFLATED, 0 /*flags*/, 0,0,0,0 /*time*/, 0 /*xflags*/, OS_CODE);
      s->startpos = 10L;
     628:	c7 43 60 0a 00 00 00 	movl   $0xa,0x60(%ebx)
     62f:	e9 83 fe ff ff       	jmp    4b7 <_gz_open+0x1f7>
    s->msg = NULL;
    s->transparent = 0;

    s->path = (char*)ALLOC(strlen(path)+1);
    if (s->path == NULL) {
        return destroy(s), (gzFile)Z_NULL;
     634:	89 d8                	mov    %ebx,%eax
     636:	e8 c5 f9 ff ff       	call   0 <_destroy>
     63b:	e9 77 fe ff ff       	jmp    4b7 <_gz_open+0x1f7>
        } else if (*p == '~') {
          skip=32;
        } else if (*p == 'h') {
          strategy = Z_HUFFMAN_ONLY;
        } else {
            *m++ = *p; /* copy the mode */
     640:	89 ce                	mov    %ecx,%esi
     642:	e9 88 fe ff ff       	jmp    4cf <_gz_open+0x20f>
     647:	89 f6                	mov    %esi,%esi
     649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000650 <_getLong>:
   Reads a long in LSB order from the given gz_stream. Sets z_err in case
   of error.
*/
local uLong getLong (s)
    gz_stream *s;
{
     650:	57                   	push   %edi
     651:	56                   	push   %esi
     652:	53                   	push   %ebx
     653:	89 c3                	mov    %eax,%ebx
    uLong x = (uLong)get_byte(s);
     655:	e8 76 fa ff ff       	call   d0 <_get_byte>
     65a:	89 c6                	mov    %eax,%esi
    int c;

    x += ((uLong)get_byte(s))<<8;
     65c:	89 d8                	mov    %ebx,%eax
     65e:	e8 6d fa ff ff       	call   d0 <_get_byte>
     663:	89 c7                	mov    %eax,%edi
    x += ((uLong)get_byte(s))<<16;
     665:	89 d8                	mov    %ebx,%eax
    gz_stream *s;
{
    uLong x = (uLong)get_byte(s);
    int c;

    x += ((uLong)get_byte(s))<<8;
     667:	c1 e7 08             	shl    $0x8,%edi
    x += ((uLong)get_byte(s))<<16;
     66a:	e8 61 fa ff ff       	call   d0 <_get_byte>
     66f:	c1 e0 10             	shl    $0x10,%eax
     672:	8d 14 07             	lea    (%edi,%eax,1),%edx
    c = get_byte(s);
     675:	89 d8                	mov    %ebx,%eax
{
    uLong x = (uLong)get_byte(s);
    int c;

    x += ((uLong)get_byte(s))<<8;
    x += ((uLong)get_byte(s))<<16;
     677:	01 d6                	add    %edx,%esi
    c = get_byte(s);
     679:	e8 52 fa ff ff       	call   d0 <_get_byte>
    if (c == EOF) s->z_err = Z_DATA_ERROR;
     67e:	83 f8 ff             	cmp    $0xffffffff,%eax
     681:	75 07                	jne    68a <_getLong+0x3a>
     683:	c7 43 38 fd ff ff ff 	movl   $0xfffffffd,0x38(%ebx)
    x += ((uLong)c)<<24;
     68a:	c1 e0 18             	shl    $0x18,%eax
    return x;
}
     68d:	5b                   	pop    %ebx

    x += ((uLong)get_byte(s))<<8;
    x += ((uLong)get_byte(s))<<16;
    c = get_byte(s);
    if (c == EOF) s->z_err = Z_DATA_ERROR;
    x += ((uLong)c)<<24;
     68e:	8d 04 06             	lea    (%esi,%eax,1),%eax
    return x;
}
     691:	5e                   	pop    %esi
     692:	5f                   	pop    %edi
     693:	c3                   	ret    
     694:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     69a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000006a0 <_do_flush.part.1>:

/* ===========================================================================
     Flushes all pending output into the compressed file. The parameter
   flush is as in the deflate() function.
*/
local int do_flush (file, flush)
     6a0:	55                   	push   %ebp
     6a1:	57                   	push   %edi
     6a2:	56                   	push   %esi
     6a3:	53                   	push   %ebx
     6a4:	83 ec 1c             	sub    $0x1c,%esp
     6a7:	89 c3                	mov    %eax,%ebx
     6a9:	89 d5                	mov    %edx,%ebp
     6ab:	8b 40 10             	mov    0x10(%eax),%eax
    gzFile file;
    int flush;
{
    uInt len;
    int done = 0;
     6ae:	31 f6                	xor    %esi,%esi
    s->stream.avail_in = 0; /* should be zero already anyway */

    for (;;) {
        len = Z_BUFSIZE - s->stream.avail_out;

        if (len != 0) {
     6b0:	bf 00 40 00 00       	mov    $0x4000,%edi
     6b5:	29 c7                	sub    %eax,%edi
     6b7:	75 4c                	jne    705 <_do_flush.part.1+0x65>
     6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                return Z_ERRNO;
            }
            s->stream.next_out = s->outbuf;
            s->stream.avail_out = Z_BUFSIZE;
        }
        if (done) break;
     6c0:	85 f6                	test   %esi,%esi
     6c2:	0f 85 a8 00 00 00    	jne    770 <_do_flush.part.1+0xd0>
        s->z_err = deflate(&(s->stream), flush);
     6c8:	89 6c 24 04          	mov    %ebp,0x4(%esp)
     6cc:	89 1c 24             	mov    %ebx,(%esp)
     6cf:	e8 00 00 00 00       	call   6d4 <_do_flush.part.1+0x34>

  /* Ignore the second of two consecutive flushes: */
  if (len == 0 && s->z_err == Z_BUF_ERROR) s->z_err = Z_OK;
     6d4:	83 f8 fb             	cmp    $0xfffffffb,%eax
     6d7:	74 77                	je     750 <_do_flush.part.1+0xb0>
            }
            s->stream.next_out = s->outbuf;
            s->stream.avail_out = Z_BUFSIZE;
        }
        if (done) break;
        s->z_err = deflate(&(s->stream), flush);
     6d9:	89 43 38             	mov    %eax,0x38(%ebx)
  if (len == 0 && s->z_err == Z_BUF_ERROR) s->z_err = Z_OK;

        /* deflate has finished flushing only when it hasn't used up
         * all the available space in the output buffer:
         */
        done = (s->stream.avail_out != 0 || s->z_err == Z_STREAM_END);
     6dc:	8b 53 10             	mov    0x10(%ebx),%edx
     6df:	be 01 00 00 00       	mov    $0x1,%esi
     6e4:	85 d2                	test   %edx,%edx
     6e6:	75 0a                	jne    6f2 <_do_flush.part.1+0x52>
     6e8:	31 c9                	xor    %ecx,%ecx
     6ea:	83 f8 01             	cmp    $0x1,%eax
     6ed:	0f 94 c1             	sete   %cl
     6f0:	89 ce                	mov    %ecx,%esi

        if (s->z_err != Z_OK && s->z_err != Z_STREAM_END) break;
     6f2:	83 f8 01             	cmp    $0x1,%eax
     6f5:	77 7c                	ja     773 <_do_flush.part.1+0xd3>
     6f7:	8b 53 10             	mov    0x10(%ebx),%edx
     6fa:	89 d0                	mov    %edx,%eax
    s->stream.avail_in = 0; /* should be zero already anyway */

    for (;;) {
        len = Z_BUFSIZE - s->stream.avail_out;

        if (len != 0) {
     6fc:	bf 00 40 00 00       	mov    $0x4000,%edi
     701:	29 c7                	sub    %eax,%edi
     703:	74 bb                	je     6c0 <_do_flush.part.1+0x20>
            if ((uInt)fwrite(s->outbuf, 1, len, s->file) != len) {
     705:	8b 43 40             	mov    0x40(%ebx),%eax
     708:	89 7c 24 08          	mov    %edi,0x8(%esp)
     70c:	89 44 24 0c          	mov    %eax,0xc(%esp)
     710:	8b 43 48             	mov    0x48(%ebx),%eax
     713:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     71a:	00 
     71b:	89 04 24             	mov    %eax,(%esp)
     71e:	e8 00 00 00 00       	call   723 <_do_flush.part.1+0x83>
     723:	39 c7                	cmp    %eax,%edi
     725:	75 5f                	jne    786 <_do_flush.part.1+0xe6>
                s->z_err = Z_ERRNO;
                return Z_ERRNO;
            }
            s->stream.next_out = s->outbuf;
     727:	8b 43 48             	mov    0x48(%ebx),%eax
            s->stream.avail_out = Z_BUFSIZE;
     72a:	c7 43 10 00 40 00 00 	movl   $0x4000,0x10(%ebx)
        if (len != 0) {
            if ((uInt)fwrite(s->outbuf, 1, len, s->file) != len) {
                s->z_err = Z_ERRNO;
                return Z_ERRNO;
            }
            s->stream.next_out = s->outbuf;
     731:	89 43 0c             	mov    %eax,0xc(%ebx)
            s->stream.avail_out = Z_BUFSIZE;
        }
        if (done) break;
     734:	85 f6                	test   %esi,%esi
     736:	75 38                	jne    770 <_do_flush.part.1+0xd0>
        s->z_err = deflate(&(s->stream), flush);
     738:	89 6c 24 04          	mov    %ebp,0x4(%esp)
     73c:	89 1c 24             	mov    %ebx,(%esp)
     73f:	e8 00 00 00 00       	call   744 <_do_flush.part.1+0xa4>
     744:	89 43 38             	mov    %eax,0x38(%ebx)
     747:	eb 93                	jmp    6dc <_do_flush.part.1+0x3c>
     749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if (len == 0 && s->z_err == Z_BUF_ERROR) s->z_err = Z_OK;

        /* deflate has finished flushing only when it hasn't used up
         * all the available space in the output buffer:
         */
        done = (s->stream.avail_out != 0 || s->z_err == Z_STREAM_END);
     750:	8b 43 10             	mov    0x10(%ebx),%eax
        }
        if (done) break;
        s->z_err = deflate(&(s->stream), flush);

  /* Ignore the second of two consecutive flushes: */
  if (len == 0 && s->z_err == Z_BUF_ERROR) s->z_err = Z_OK;
     753:	c7 43 38 00 00 00 00 	movl   $0x0,0x38(%ebx)

        /* deflate has finished flushing only when it hasn't used up
         * all the available space in the output buffer:
         */
        done = (s->stream.avail_out != 0 || s->z_err == Z_STREAM_END);
     75a:	89 c2                	mov    %eax,%edx
     75c:	85 c0                	test   %eax,%eax
     75e:	74 9a                	je     6fa <_do_flush.part.1+0x5a>
     760:	be 01 00 00 00       	mov    $0x1,%esi
     765:	e9 46 ff ff ff       	jmp    6b0 <_do_flush.part.1+0x10>
     76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     770:	8b 43 38             	mov    0x38(%ebx),%eax

        if (s->z_err != Z_OK && s->z_err != Z_STREAM_END) break;
    }
    return  s->z_err == Z_STREAM_END ? Z_OK : s->z_err;
     773:	ba 00 00 00 00       	mov    $0x0,%edx
     778:	83 f8 01             	cmp    $0x1,%eax
     77b:	0f 44 c2             	cmove  %edx,%eax
}
     77e:	83 c4 1c             	add    $0x1c,%esp
     781:	5b                   	pop    %ebx
     782:	5e                   	pop    %esi
     783:	5f                   	pop    %edi
     784:	5d                   	pop    %ebp
     785:	c3                   	ret    
    for (;;) {
        len = Z_BUFSIZE - s->stream.avail_out;

        if (len != 0) {
            if ((uInt)fwrite(s->outbuf, 1, len, s->file) != len) {
                s->z_err = Z_ERRNO;
     786:	c7 43 38 ff ff ff ff 	movl   $0xffffffff,0x38(%ebx)
        done = (s->stream.avail_out != 0 || s->z_err == Z_STREAM_END);

        if (s->z_err != Z_OK && s->z_err != Z_STREAM_END) break;
    }
    return  s->z_err == Z_STREAM_END ? Z_OK : s->z_err;
}
     78d:	83 c4 1c             	add    $0x1c,%esp
        len = Z_BUFSIZE - s->stream.avail_out;

        if (len != 0) {
            if ((uInt)fwrite(s->outbuf, 1, len, s->file) != len) {
                s->z_err = Z_ERRNO;
                return Z_ERRNO;
     790:	83 c8 ff             	or     $0xffffffff,%eax
        done = (s->stream.avail_out != 0 || s->z_err == Z_STREAM_END);

        if (s->z_err != Z_OK && s->z_err != Z_STREAM_END) break;
    }
    return  s->z_err == Z_STREAM_END ? Z_OK : s->z_err;
}
     793:	5b                   	pop    %ebx
     794:	5e                   	pop    %esi
     795:	5f                   	pop    %edi
     796:	5d                   	pop    %ebp
     797:	c3                   	ret    
     798:	90                   	nop
     799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000007a0 <_gzopen>:
*/
gzFile ZEXPORT gzopen (path, mode)
    const char *path;
    const char *mode;
{
    return gz_open (path, mode, -1);
     7a0:	83 c9 ff             	or     $0xffffffff,%ecx
     7a3:	8b 54 24 08          	mov    0x8(%esp),%edx
     7a7:	8b 44 24 04          	mov    0x4(%esp),%eax
     7ab:	e9 10 fb ff ff       	jmp    2c0 <_gz_open>

000007b0 <_gzdopen>:
   to mimic the behavio(u)r of fdopen.
*/
gzFile ZEXPORT gzdopen (fd, mode)
    int fd;
    const char *mode;
{
     7b0:	56                   	push   %esi
     7b1:	53                   	push   %ebx
     7b2:	83 ec 34             	sub    $0x34,%esp
     7b5:	8b 5c 24 40          	mov    0x40(%esp),%ebx
    char name[20];

    if (fd < 0) return (gzFile)Z_NULL;
     7b9:	85 db                	test   %ebx,%ebx
     7bb:	78 2b                	js     7e8 <_gzdopen+0x38>
    sprintf(name, "<fd:%d>", fd); /* for debugging */
     7bd:	8d 74 24 1c          	lea    0x1c(%esp),%esi
     7c1:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     7c5:	c7 44 24 04 1b 00 00 	movl   $0x1b,0x4(%esp)
     7cc:	00 
     7cd:	89 34 24             	mov    %esi,(%esp)
     7d0:	e8 00 00 00 00       	call   7d5 <_gzdopen+0x25>

    return gz_open (name, mode, fd);
     7d5:	89 d9                	mov    %ebx,%ecx
     7d7:	8b 54 24 44          	mov    0x44(%esp),%edx
     7db:	89 f0                	mov    %esi,%eax
     7dd:	e8 de fa ff ff       	call   2c0 <_gz_open>
}
     7e2:	83 c4 34             	add    $0x34,%esp
     7e5:	5b                   	pop    %ebx
     7e6:	5e                   	pop    %esi
     7e7:	c3                   	ret    
    int fd;
    const char *mode;
{
    char name[20];

    if (fd < 0) return (gzFile)Z_NULL;
     7e8:	31 c0                	xor    %eax,%eax
     7ea:	eb f6                	jmp    7e2 <_gzdopen+0x32>
     7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007f0 <_gzsetparams>:
 */
int ZEXPORT gzsetparams (file, level, strategy)
    gzFile file;
    int level;
    int strategy;
{
     7f0:	57                   	push   %edi
     7f1:	56                   	push   %esi
     7f2:	53                   	push   %ebx
     7f3:	83 ec 10             	sub    $0x10,%esp
     7f6:	8b 5c 24 20          	mov    0x20(%esp),%ebx
     7fa:	8b 74 24 24          	mov    0x24(%esp),%esi
     7fe:	8b 7c 24 28          	mov    0x28(%esp),%edi
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || s->mode != 'w') return Z_STREAM_ERROR;
     802:	85 db                	test   %ebx,%ebx
     804:	74 6a                	je     870 <_gzsetparams+0x80>
     806:	80 7b 5c 77          	cmpb   $0x77,0x5c(%ebx)
     80a:	75 64                	jne    870 <_gzsetparams+0x80>

    /* Make room to allow flushing */
    if (s->stream.avail_out == 0) {
     80c:	8b 43 10             	mov    0x10(%ebx),%eax
     80f:	85 c0                	test   %eax,%eax
     811:	74 1d                	je     830 <_gzsetparams+0x40>
      s->z_err = Z_ERRNO;
  }
  s->stream.avail_out = Z_BUFSIZE;
    }

    return deflateParams (&(s->stream), level, strategy);
     813:	89 7c 24 28          	mov    %edi,0x28(%esp)
     817:	89 74 24 24          	mov    %esi,0x24(%esp)
     81b:	89 5c 24 20          	mov    %ebx,0x20(%esp)
}
     81f:	83 c4 10             	add    $0x10,%esp
     822:	5b                   	pop    %ebx
     823:	5e                   	pop    %esi
     824:	5f                   	pop    %edi
      s->z_err = Z_ERRNO;
  }
  s->stream.avail_out = Z_BUFSIZE;
    }

    return deflateParams (&(s->stream), level, strategy);
     825:	e9 00 00 00 00       	jmp    82a <_gzsetparams+0x3a>
     82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (s == NULL || s->mode != 'w') return Z_STREAM_ERROR;

    /* Make room to allow flushing */
    if (s->stream.avail_out == 0) {

  s->stream.next_out = s->outbuf;
     830:	8b 43 48             	mov    0x48(%ebx),%eax
  if (fwrite(s->outbuf, 1, Z_BUFSIZE, s->file) != Z_BUFSIZE) {
     833:	8b 53 40             	mov    0x40(%ebx),%edx
    if (s == NULL || s->mode != 'w') return Z_STREAM_ERROR;

    /* Make room to allow flushing */
    if (s->stream.avail_out == 0) {

  s->stream.next_out = s->outbuf;
     836:	89 43 0c             	mov    %eax,0xc(%ebx)
  if (fwrite(s->outbuf, 1, Z_BUFSIZE, s->file) != Z_BUFSIZE) {
     839:	89 54 24 0c          	mov    %edx,0xc(%esp)
     83d:	c7 44 24 08 00 40 00 	movl   $0x4000,0x8(%esp)
     844:	00 
     845:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     84c:	00 
     84d:	89 04 24             	mov    %eax,(%esp)
     850:	e8 00 00 00 00       	call   855 <_gzsetparams+0x65>
     855:	3d 00 40 00 00       	cmp    $0x4000,%eax
     85a:	74 07                	je     863 <_gzsetparams+0x73>
      s->z_err = Z_ERRNO;
     85c:	c7 43 38 ff ff ff ff 	movl   $0xffffffff,0x38(%ebx)
  }
  s->stream.avail_out = Z_BUFSIZE;
     863:	c7 43 10 00 40 00 00 	movl   $0x4000,0x10(%ebx)
     86a:	eb a7                	jmp    813 <_gzsetparams+0x23>
     86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }

    return deflateParams (&(s->stream), level, strategy);
}
     870:	83 c4 10             	add    $0x10,%esp
     873:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
     878:	5b                   	pop    %ebx
     879:	5e                   	pop    %esi
     87a:	5f                   	pop    %edi
     87b:	c3                   	ret    
     87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000880 <_gzread>:
*/
int ZEXPORT gzread (file, buf, len)
    gzFile file;
    voidp buf;
    unsigned len;
{
     880:	55                   	push   %ebp
     881:	57                   	push   %edi
     882:	56                   	push   %esi
     883:	53                   	push   %ebx
     884:	83 ec 2c             	sub    $0x2c,%esp
     887:	8b 5c 24 40          	mov    0x40(%esp),%ebx
     88b:	8b 6c 24 44          	mov    0x44(%esp),%ebp
     88f:	8b 74 24 48          	mov    0x48(%esp),%esi
    int ok;
    gz_stream *s = (gz_stream*)file;
    Bytef *start = (Bytef*)buf; /* starting point for crc computation */
    Byte  *next_out; /* == stream.next_out but not forced far (for MSDOS) */

    if (s == NULL || s->mode != 'r') return Z_STREAM_ERROR;
     893:	85 db                	test   %ebx,%ebx
     895:	0f 84 d5 01 00 00    	je     a70 <_gzread+0x1f0>
     89b:	80 7b 5c 72          	cmpb   $0x72,0x5c(%ebx)
     89f:	0f 85 cb 01 00 00    	jne    a70 <_gzread+0x1f0>

    if (s->z_err == Z_DATA_ERROR || s->z_err == Z_ERRNO) return -1;
     8a5:	8b 43 38             	mov    0x38(%ebx),%eax
     8a8:	89 c2                	mov    %eax,%edx
     8aa:	83 e2 fd             	and    $0xfffffffd,%edx
     8ad:	83 fa fd             	cmp    $0xfffffffd,%edx
     8b0:	0f 84 43 02 00 00    	je     af9 <_gzread+0x279>
    if (s->z_err == Z_STREAM_END) return 0;  /* EOF */
     8b6:	48                   	dec    %eax
     8b7:	0f 84 33 01 00 00    	je     9f0 <_gzread+0x170>

    next_out = (Byte*)buf;
    s->stream.next_out = (Bytef*)buf;
     8bd:	89 6b 0c             	mov    %ebp,0xc(%ebx)
    s->stream.avail_out = len;
     8c0:	89 73 10             	mov    %esi,0x10(%ebx)
     8c3:	89 f2                	mov    %esi,%edx
    voidp buf;
    unsigned len;
{
    int ok;
    gz_stream *s = (gz_stream*)file;
    Bytef *start = (Bytef*)buf; /* starting point for crc computation */
     8c5:	89 ef                	mov    %ebp,%edi
     8c7:	eb 39                	jmp    902 <_gzread+0x82>
     8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
    }
            }
            s->stream.next_in = s->inbuf;
        }
        s->z_err = inflate(&(s->stream), Z_NO_FLUSH);
     8d0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     8d7:	00 
     8d8:	89 1c 24             	mov    %ebx,(%esp)
     8db:	e8 00 00 00 00       	call   8e0 <_gzread+0x60>
     8e0:	89 43 38             	mov    %eax,0x38(%ebx)

  if (s->z_err == Z_STREAM_END) {
     8e3:	83 f8 01             	cmp    $0x1,%eax
     8e6:	0f 84 89 00 00 00    	je     975 <_gzread+0xf5>
        s->stream.total_out = total_out;
        s->crc = crc32(0L, Z_NULL, 0);
    }
      }
  }
  if (s->z_err != Z_OK || s->z_eof) break;
     8ec:	85 c0                	test   %eax,%eax
     8ee:	0f 85 f5 00 00 00    	jne    9e9 <_gzread+0x169>
     8f4:	8b 4b 3c             	mov    0x3c(%ebx),%ecx
     8f7:	85 c9                	test   %ecx,%ecx
     8f9:	0f 85 ea 00 00 00    	jne    9e9 <_gzread+0x169>
     8ff:	8b 53 10             	mov    0x10(%ebx),%edx

    next_out = (Byte*)buf;
    s->stream.next_out = (Bytef*)buf;
    s->stream.avail_out = len;

    while (s->stream.avail_out != 0) {
     902:	85 d2                	test   %edx,%edx
     904:	0f 84 df 00 00 00    	je     9e9 <_gzread+0x169>

  if (s->transparent) {
     90a:	8b 43 58             	mov    0x58(%ebx),%eax
     90d:	85 c0                	test   %eax,%eax
     90f:	0f 85 eb 00 00 00    	jne    a00 <_gzread+0x180>
      s->stream.total_in  += (uLong)len;
      s->stream.total_out += (uLong)len;
            if (len == 0) s->z_eof = 1;
      return (int)len;
  }
        if (s->stream.avail_in == 0 && !s->z_eof) {
     915:	8b 43 04             	mov    0x4(%ebx),%eax
     918:	85 c0                	test   %eax,%eax
     91a:	75 b4                	jne    8d0 <_gzread+0x50>
     91c:	8b 43 3c             	mov    0x3c(%ebx),%eax
     91f:	85 c0                	test   %eax,%eax
     921:	75 ad                	jne    8d0 <_gzread+0x50>

            errno = 0;
     923:	e8 00 00 00 00       	call   928 <_gzread+0xa8>
     928:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
            s->stream.avail_in = fread(s->inbuf, 1, Z_BUFSIZE, s->file);
     92e:	8b 43 40             	mov    0x40(%ebx),%eax
     931:	89 44 24 0c          	mov    %eax,0xc(%esp)
     935:	c7 44 24 08 00 40 00 	movl   $0x4000,0x8(%esp)
     93c:	00 
     93d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     944:	00 
     945:	8b 43 44             	mov    0x44(%ebx),%eax
     948:	89 04 24             	mov    %eax,(%esp)
     94b:	e8 00 00 00 00       	call   950 <_gzread+0xd0>
     950:	89 43 04             	mov    %eax,0x4(%ebx)
            if (s->stream.avail_in == 0) {
     953:	85 c0                	test   %eax,%eax
     955:	75 14                	jne    96b <_gzread+0xeb>
                s->z_eof = 1;
    if (ferror(s->file)) {
     957:	8b 43 40             	mov    0x40(%ebx),%eax
        if (s->stream.avail_in == 0 && !s->z_eof) {

            errno = 0;
            s->stream.avail_in = fread(s->inbuf, 1, Z_BUFSIZE, s->file);
            if (s->stream.avail_in == 0) {
                s->z_eof = 1;
     95a:	c7 43 3c 01 00 00 00 	movl   $0x1,0x3c(%ebx)
    if (ferror(s->file)) {
     961:	f6 40 0c 20          	testb  $0x20,0xc(%eax)
     965:	0f 85 96 01 00 00    	jne    b01 <_gzread+0x281>
        s->z_err = Z_ERRNO;
        break;
    }
            }
            s->stream.next_in = s->inbuf;
     96b:	8b 43 44             	mov    0x44(%ebx),%eax
     96e:	89 03                	mov    %eax,(%ebx)
     970:	e9 5b ff ff ff       	jmp    8d0 <_gzread+0x50>
        }
        s->z_err = inflate(&(s->stream), Z_NO_FLUSH);

  if (s->z_err == Z_STREAM_END) {
      /* Check CRC and original size */
      s->crc = crc32(s->crc, start, (uInt)(s->stream.next_out - start));
     975:	8b 43 0c             	mov    0xc(%ebx),%eax
     978:	89 7c 24 04          	mov    %edi,0x4(%esp)
     97c:	29 f8                	sub    %edi,%eax
     97e:	89 44 24 08          	mov    %eax,0x8(%esp)
     982:	8b 43 4c             	mov    0x4c(%ebx),%eax
     985:	89 04 24             	mov    %eax,(%esp)
     988:	e8 00 00 00 00       	call   98d <_gzread+0x10d>
      start = s->stream.next_out;
     98d:	8b 7b 0c             	mov    0xc(%ebx),%edi
        }
        s->z_err = inflate(&(s->stream), Z_NO_FLUSH);

  if (s->z_err == Z_STREAM_END) {
      /* Check CRC and original size */
      s->crc = crc32(s->crc, start, (uInt)(s->stream.next_out - start));
     990:	89 43 4c             	mov    %eax,0x4c(%ebx)
      start = s->stream.next_out;

      if (getLong(s) != s->crc) {
     993:	89 d8                	mov    %ebx,%eax
     995:	e8 b6 fc ff ff       	call   650 <_getLong>
     99a:	8b 53 4c             	mov    0x4c(%ebx),%edx
     99d:	39 d0                	cmp    %edx,%eax
     99f:	74 2f                	je     9d0 <_gzread+0x150>
    s->z_err = Z_DATA_ERROR;
     9a1:	c7 43 38 fd ff ff ff 	movl   $0xfffffffd,0x38(%ebx)
    }
      }
  }
  if (s->z_err != Z_OK || s->z_eof) break;
    }
    s->crc = crc32(s->crc, start, (uInt)(s->stream.next_out - start));
     9a8:	8b 43 0c             	mov    0xc(%ebx),%eax
     9ab:	89 14 24             	mov    %edx,(%esp)
     9ae:	29 f8                	sub    %edi,%eax
     9b0:	89 7c 24 04          	mov    %edi,0x4(%esp)
     9b4:	89 44 24 08          	mov    %eax,0x8(%esp)
     9b8:	e8 00 00 00 00       	call   9bd <_gzread+0x13d>

    if (s->z_err != Z_OK) {
      ok=1;
    }
    return (int)(len - s->stream.avail_out);
     9bd:	8b 53 10             	mov    0x10(%ebx),%edx
    }
      }
  }
  if (s->z_err != Z_OK || s->z_eof) break;
    }
    s->crc = crc32(s->crc, start, (uInt)(s->stream.next_out - start));
     9c0:	89 43 4c             	mov    %eax,0x4c(%ebx)

    if (s->z_err != Z_OK) {
      ok=1;
    }
    return (int)(len - s->stream.avail_out);
     9c3:	89 f0                	mov    %esi,%eax
     9c5:	29 d0                	sub    %edx,%eax
}
     9c7:	83 c4 2c             	add    $0x2c,%esp
     9ca:	5b                   	pop    %ebx
     9cb:	5e                   	pop    %esi
     9cc:	5f                   	pop    %edi
     9cd:	5d                   	pop    %ebp
     9ce:	c3                   	ret    
     9cf:	90                   	nop
      start = s->stream.next_out;

      if (getLong(s) != s->crc) {
    s->z_err = Z_DATA_ERROR;
      } else {
          (void)getLong(s);
     9d0:	89 d8                	mov    %ebx,%eax
     9d2:	e8 79 fc ff ff       	call   650 <_getLong>
                /* The uncompressed length returned by above getlong() may
                 * be different from s->stream.total_out) in case of
     * concatenated .gz files. Check for such files:
     */
    check_header(s);
     9d7:	89 d8                	mov    %ebx,%eax
     9d9:	e8 82 f7 ff ff       	call   160 <_check_header>
    if (s->z_err == Z_OK) {
     9de:	8b 43 38             	mov    0x38(%ebx),%eax
     9e1:	85 c0                	test   %eax,%eax
     9e3:	0f 84 c5 00 00 00    	je     aae <_gzread+0x22e>
     9e9:	8b 53 4c             	mov    0x4c(%ebx),%edx
     9ec:	eb ba                	jmp    9a8 <_gzread+0x128>
     9ee:	66 90                	xchg   %ax,%ax

    if (s->z_err != Z_OK) {
      ok=1;
    }
    return (int)(len - s->stream.avail_out);
}
     9f0:	83 c4 2c             	add    $0x2c,%esp
    Byte  *next_out; /* == stream.next_out but not forced far (for MSDOS) */

    if (s == NULL || s->mode != 'r') return Z_STREAM_ERROR;

    if (s->z_err == Z_DATA_ERROR || s->z_err == Z_ERRNO) return -1;
    if (s->z_err == Z_STREAM_END) return 0;  /* EOF */
     9f3:	31 c0                	xor    %eax,%eax

    if (s->z_err != Z_OK) {
      ok=1;
    }
    return (int)(len - s->stream.avail_out);
}
     9f5:	5b                   	pop    %ebx
     9f6:	5e                   	pop    %esi
     9f7:	5f                   	pop    %edi
     9f8:	5d                   	pop    %ebp
     9f9:	c3                   	ret    
     9fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    while (s->stream.avail_out != 0) {

  if (s->transparent) {
      /* Copy first the lookahead bytes: */
      uInt n = s->stream.avail_in;
     a00:	8b 43 04             	mov    0x4(%ebx),%eax
      if (n > s->stream.avail_out) n = s->stream.avail_out;
     a03:	39 d0                	cmp    %edx,%eax
     a05:	76 76                	jbe    a7d <_gzread+0x1fd>
      if (n > 0) {
    zmemcpy(s->stream.next_out, s->stream.next_in, n);
     a07:	8b 0b                	mov    (%ebx),%ecx
     a09:	8b 43 0c             	mov    0xc(%ebx),%eax
     a0c:	89 04 24             	mov    %eax,(%esp)
     a0f:	89 54 24 08          	mov    %edx,0x8(%esp)
     a13:	89 4c 24 04          	mov    %ecx,0x4(%esp)
     a17:	89 54 24 18          	mov    %edx,0x18(%esp)
     a1b:	e8 00 00 00 00       	call   a20 <_gzread+0x1a0>
    next_out += n;
     a20:	8b 54 24 18          	mov    0x18(%esp),%edx
    s->stream.next_out = next_out;
    s->stream.next_in   += n;
     a24:	8b 03                	mov    (%ebx),%eax
    s->stream.avail_out -= n;
    s->stream.avail_in  -= n;
     a26:	8b 4b 04             	mov    0x4(%ebx),%ecx
      if (n > s->stream.avail_out) n = s->stream.avail_out;
      if (n > 0) {
    zmemcpy(s->stream.next_out, s->stream.next_in, n);
    next_out += n;
    s->stream.next_out = next_out;
    s->stream.next_in   += n;
     a29:	01 d0                	add    %edx,%eax
      /* Copy first the lookahead bytes: */
      uInt n = s->stream.avail_in;
      if (n > s->stream.avail_out) n = s->stream.avail_out;
      if (n > 0) {
    zmemcpy(s->stream.next_out, s->stream.next_in, n);
    next_out += n;
     a2b:	01 d5                	add    %edx,%ebp
    s->stream.next_out = next_out;
    s->stream.next_in   += n;
     a2d:	89 03                	mov    %eax,(%ebx)
    s->stream.avail_out -= n;
     a2f:	8b 43 10             	mov    0x10(%ebx),%eax
     a32:	29 d0                	sub    %edx,%eax
    s->stream.avail_in  -= n;
     a34:	29 d1                	sub    %edx,%ecx
      uInt n = s->stream.avail_in;
      if (n > s->stream.avail_out) n = s->stream.avail_out;
      if (n > 0) {
    zmemcpy(s->stream.next_out, s->stream.next_in, n);
    next_out += n;
    s->stream.next_out = next_out;
     a36:	89 6b 0c             	mov    %ebp,0xc(%ebx)
    s->stream.next_in   += n;
    s->stream.avail_out -= n;
     a39:	89 43 10             	mov    %eax,0x10(%ebx)
    s->stream.avail_in  -= n;
     a3c:	89 4b 04             	mov    %ecx,0x4(%ebx)
      }
      if (s->stream.avail_out > 0) {
     a3f:	85 c0                	test   %eax,%eax
     a41:	75 44                	jne    a87 <_gzread+0x207>
    s->stream.avail_out -= fread(next_out, 1, s->stream.avail_out,
               s->file);
      }
      len -= s->stream.avail_out;
     a43:	29 c6                	sub    %eax,%esi
      s->stream.total_in  += (uLong)len;
     a45:	8b 43 08             	mov    0x8(%ebx),%eax
     a48:	01 f0                	add    %esi,%eax
     a4a:	89 43 08             	mov    %eax,0x8(%ebx)
      s->stream.total_out += (uLong)len;
     a4d:	8b 43 14             	mov    0x14(%ebx),%eax
     a50:	01 f0                	add    %esi,%eax
            if (len == 0) s->z_eof = 1;
     a52:	85 f6                	test   %esi,%esi
    s->stream.avail_out -= fread(next_out, 1, s->stream.avail_out,
               s->file);
      }
      len -= s->stream.avail_out;
      s->stream.total_in  += (uLong)len;
      s->stream.total_out += (uLong)len;
     a54:	89 43 14             	mov    %eax,0x14(%ebx)
            if (len == 0) s->z_eof = 1;
     a57:	75 07                	jne    a60 <_gzread+0x1e0>
     a59:	c7 43 3c 01 00 00 00 	movl   $0x1,0x3c(%ebx)

    if (s->z_err != Z_OK) {
      ok=1;
    }
    return (int)(len - s->stream.avail_out);
}
     a60:	83 c4 2c             	add    $0x2c,%esp
      }
      len -= s->stream.avail_out;
      s->stream.total_in  += (uLong)len;
      s->stream.total_out += (uLong)len;
            if (len == 0) s->z_eof = 1;
      return (int)len;
     a63:	89 f0                	mov    %esi,%eax

    if (s->z_err != Z_OK) {
      ok=1;
    }
    return (int)(len - s->stream.avail_out);
}
     a65:	5b                   	pop    %ebx
     a66:	5e                   	pop    %esi
     a67:	5f                   	pop    %edi
     a68:	5d                   	pop    %ebp
     a69:	c3                   	ret    
     a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a70:	83 c4 2c             	add    $0x2c,%esp
    int ok;
    gz_stream *s = (gz_stream*)file;
    Bytef *start = (Bytef*)buf; /* starting point for crc computation */
    Byte  *next_out; /* == stream.next_out but not forced far (for MSDOS) */

    if (s == NULL || s->mode != 'r') return Z_STREAM_ERROR;
     a73:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax

    if (s->z_err != Z_OK) {
      ok=1;
    }
    return (int)(len - s->stream.avail_out);
}
     a78:	5b                   	pop    %ebx
     a79:	5e                   	pop    %esi
     a7a:	5f                   	pop    %edi
     a7b:	5d                   	pop    %ebp
     a7c:	c3                   	ret    

  if (s->transparent) {
      /* Copy first the lookahead bytes: */
      uInt n = s->stream.avail_in;
      if (n > s->stream.avail_out) n = s->stream.avail_out;
      if (n > 0) {
     a7d:	85 c0                	test   %eax,%eax
     a7f:	0f 85 8b 00 00 00    	jne    b10 <_gzread+0x290>
     a85:	89 d0                	mov    %edx,%eax
    s->stream.next_in   += n;
    s->stream.avail_out -= n;
    s->stream.avail_in  -= n;
      }
      if (s->stream.avail_out > 0) {
    s->stream.avail_out -= fread(next_out, 1, s->stream.avail_out,
     a87:	8b 53 40             	mov    0x40(%ebx),%edx
     a8a:	89 44 24 08          	mov    %eax,0x8(%esp)
     a8e:	89 54 24 0c          	mov    %edx,0xc(%esp)
     a92:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     a99:	00 
     a9a:	89 2c 24             	mov    %ebp,(%esp)
     a9d:	e8 00 00 00 00       	call   aa2 <_gzread+0x222>
     aa2:	8b 4b 10             	mov    0x10(%ebx),%ecx
     aa5:	29 c1                	sub    %eax,%ecx
     aa7:	89 c8                	mov    %ecx,%eax
     aa9:	89 4b 10             	mov    %ecx,0x10(%ebx)
     aac:	eb 95                	jmp    a43 <_gzread+0x1c3>
                 * be different from s->stream.total_out) in case of
     * concatenated .gz files. Check for such files:
     */
    check_header(s);
    if (s->z_err == Z_OK) {
        uLong total_in = s->stream.total_in;
     aae:	8b 4b 08             	mov    0x8(%ebx),%ecx
        uLong total_out = s->stream.total_out;
     ab1:	8b 53 14             	mov    0x14(%ebx),%edx

        inflateReset(&(s->stream));
     ab4:	89 1c 24             	mov    %ebx,(%esp)
                 * be different from s->stream.total_out) in case of
     * concatenated .gz files. Check for such files:
     */
    check_header(s);
    if (s->z_err == Z_OK) {
        uLong total_in = s->stream.total_in;
     ab7:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
        uLong total_out = s->stream.total_out;
     abb:	89 54 24 18          	mov    %edx,0x18(%esp)

        inflateReset(&(s->stream));
     abf:	e8 00 00 00 00       	call   ac4 <_gzread+0x244>
        s->stream.total_in = total_in;
     ac4:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
        s->stream.total_out = total_out;
     ac8:	8b 54 24 18          	mov    0x18(%esp),%edx
    if (s->z_err == Z_OK) {
        uLong total_in = s->stream.total_in;
        uLong total_out = s->stream.total_out;

        inflateReset(&(s->stream));
        s->stream.total_in = total_in;
     acc:	89 4b 08             	mov    %ecx,0x8(%ebx)
        s->stream.total_out = total_out;
     acf:	89 53 14             	mov    %edx,0x14(%ebx)
        s->crc = crc32(0L, Z_NULL, 0);
     ad2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     ad9:	00 
     ada:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     ae1:	00 
     ae2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ae9:	e8 00 00 00 00       	call   aee <_gzread+0x26e>
     aee:	89 43 4c             	mov    %eax,0x4c(%ebx)
     af1:	8b 43 38             	mov    0x38(%ebx),%eax
     af4:	e9 f3 fd ff ff       	jmp    8ec <_gzread+0x6c>
    Bytef *start = (Bytef*)buf; /* starting point for crc computation */
    Byte  *next_out; /* == stream.next_out but not forced far (for MSDOS) */

    if (s == NULL || s->mode != 'r') return Z_STREAM_ERROR;

    if (s->z_err == Z_DATA_ERROR || s->z_err == Z_ERRNO) return -1;
     af9:	83 c8 ff             	or     $0xffffffff,%eax
     afc:	e9 c6 fe ff ff       	jmp    9c7 <_gzread+0x147>
            errno = 0;
            s->stream.avail_in = fread(s->inbuf, 1, Z_BUFSIZE, s->file);
            if (s->stream.avail_in == 0) {
                s->z_eof = 1;
    if (ferror(s->file)) {
        s->z_err = Z_ERRNO;
     b01:	c7 43 38 ff ff ff ff 	movl   $0xffffffff,0x38(%ebx)
     b08:	8b 53 4c             	mov    0x4c(%ebx),%edx
     b0b:	e9 98 fe ff ff       	jmp    9a8 <_gzread+0x128>

  if (s->transparent) {
      /* Copy first the lookahead bytes: */
      uInt n = s->stream.avail_in;
      if (n > s->stream.avail_out) n = s->stream.avail_out;
      if (n > 0) {
     b10:	89 c2                	mov    %eax,%edx
     b12:	e9 f0 fe ff ff       	jmp    a07 <_gzread+0x187>
     b17:	89 f6                	mov    %esi,%esi
     b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b20 <_gzgetc>:
      Reads one byte from the compressed file. gzgetc returns this byte
   or -1 in case of end of file or error.
*/
int ZEXPORT gzgetc(file)
    gzFile file;
{
     b20:	83 ec 2c             	sub    $0x2c,%esp
    unsigned char c;

    return gzread(file, &c, 1) == 1 ? c : -1;
     b23:	8d 44 24 1f          	lea    0x1f(%esp),%eax
     b27:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     b2e:	00 
     b2f:	89 44 24 04          	mov    %eax,0x4(%esp)
     b33:	8b 44 24 30          	mov    0x30(%esp),%eax
     b37:	89 04 24             	mov    %eax,(%esp)
     b3a:	e8 41 fd ff ff       	call   880 <_gzread>
     b3f:	48                   	dec    %eax
     b40:	75 0e                	jne    b50 <_gzgetc+0x30>
     b42:	31 c0                	xor    %eax,%eax
     b44:	8a 44 24 1f          	mov    0x1f(%esp),%al
}
     b48:	83 c4 2c             	add    $0x2c,%esp
     b4b:	c3                   	ret    
     b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int ZEXPORT gzgetc(file)
    gzFile file;
{
    unsigned char c;

    return gzread(file, &c, 1) == 1 ? c : -1;
     b50:	83 c8 ff             	or     $0xffffffff,%eax
     b53:	eb f3                	jmp    b48 <_gzgetc+0x28>
     b55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b60 <_gzgets>:
*/
char * ZEXPORT gzgets(file, buf, len)
    gzFile file;
    char *buf;
    int len;
{
     b60:	55                   	push   %ebp
     b61:	57                   	push   %edi
     b62:	56                   	push   %esi
     b63:	53                   	push   %ebx
     b64:	83 ec 1c             	sub    $0x1c,%esp
     b67:	8b 6c 24 34          	mov    0x34(%esp),%ebp
     b6b:	8b 7c 24 30          	mov    0x30(%esp),%edi
     b6f:	8b 74 24 38          	mov    0x38(%esp),%esi
    char *b = buf;
    if (buf == Z_NULL || len <= 0) return Z_NULL;
     b73:	85 ed                	test   %ebp,%ebp
     b75:	74 4e                	je     bc5 <_gzgets+0x65>
     b77:	85 f6                	test   %esi,%esi
     b79:	7e 4a                	jle    bc5 <_gzgets+0x65>
     b7b:	89 eb                	mov    %ebp,%ebx
     b7d:	eb 1f                	jmp    b9e <_gzgets+0x3e>
     b7f:	90                   	nop

    while (--len > 0 && gzread(file, buf, 1) == 1 && *buf++ != '\n') ;
     b80:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     b87:	00 
     b88:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     b8c:	89 3c 24             	mov    %edi,(%esp)
     b8f:	e8 ec fc ff ff       	call   880 <_gzread>
     b94:	48                   	dec    %eax
     b95:	75 19                	jne    bb0 <_gzgets+0x50>
     b97:	43                   	inc    %ebx
     b98:	80 7b ff 0a          	cmpb   $0xa,-0x1(%ebx)
     b9c:	74 12                	je     bb0 <_gzgets+0x50>
     b9e:	4e                   	dec    %esi
     b9f:	75 df                	jne    b80 <_gzgets+0x20>
    *buf = '\0';
     ba1:	c6 03 00             	movb   $0x0,(%ebx)
    return b == buf && len > 0 ? Z_NULL : b;
}
     ba4:	83 c4 1c             	add    $0x1c,%esp
{
    char *b = buf;
    if (buf == Z_NULL || len <= 0) return Z_NULL;

    while (--len > 0 && gzread(file, buf, 1) == 1 && *buf++ != '\n') ;
    *buf = '\0';
     ba7:	89 e8                	mov    %ebp,%eax
    return b == buf && len > 0 ? Z_NULL : b;
}
     ba9:	5b                   	pop    %ebx
     baa:	5e                   	pop    %esi
     bab:	5f                   	pop    %edi
     bac:	5d                   	pop    %ebp
     bad:	c3                   	ret    
     bae:	66 90                	xchg   %ax,%ax
    char *b = buf;
    if (buf == Z_NULL || len <= 0) return Z_NULL;

    while (--len > 0 && gzread(file, buf, 1) == 1 && *buf++ != '\n') ;
    *buf = '\0';
    return b == buf && len > 0 ? Z_NULL : b;
     bb0:	b8 00 00 00 00       	mov    $0x0,%eax
{
    char *b = buf;
    if (buf == Z_NULL || len <= 0) return Z_NULL;

    while (--len > 0 && gzread(file, buf, 1) == 1 && *buf++ != '\n') ;
    *buf = '\0';
     bb5:	c6 03 00             	movb   $0x0,(%ebx)
    return b == buf && len > 0 ? Z_NULL : b;
     bb8:	39 eb                	cmp    %ebp,%ebx
     bba:	0f 45 c5             	cmovne %ebp,%eax
}
     bbd:	83 c4 1c             	add    $0x1c,%esp
     bc0:	5b                   	pop    %ebx
     bc1:	5e                   	pop    %esi
     bc2:	5f                   	pop    %edi
     bc3:	5d                   	pop    %ebp
     bc4:	c3                   	ret    
     bc5:	83 c4 1c             	add    $0x1c,%esp
    gzFile file;
    char *buf;
    int len;
{
    char *b = buf;
    if (buf == Z_NULL || len <= 0) return Z_NULL;
     bc8:	31 c0                	xor    %eax,%eax

    while (--len > 0 && gzread(file, buf, 1) == 1 && *buf++ != '\n') ;
    *buf = '\0';
    return b == buf && len > 0 ? Z_NULL : b;
}
     bca:	5b                   	pop    %ebx
     bcb:	5e                   	pop    %esi
     bcc:	5f                   	pop    %edi
     bcd:	5d                   	pop    %ebp
     bce:	c3                   	ret    
     bcf:	90                   	nop

00000bd0 <_gzwrite>:
*/
int ZEXPORT gzwrite (file, buf, len)
    gzFile file;
    const voidp buf;
    unsigned len;
{
     bd0:	57                   	push   %edi
     bd1:	56                   	push   %esi
     bd2:	53                   	push   %ebx
     bd3:	83 ec 10             	sub    $0x10,%esp
     bd6:	8b 5c 24 20          	mov    0x20(%esp),%ebx
     bda:	8b 7c 24 24          	mov    0x24(%esp),%edi
     bde:	8b 74 24 28          	mov    0x28(%esp),%esi
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || s->mode != 'w') return Z_STREAM_ERROR;
     be2:	85 db                	test   %ebx,%ebx
     be4:	0f 84 9f 00 00 00    	je     c89 <_gzwrite+0xb9>
     bea:	80 7b 5c 77          	cmpb   $0x77,0x5c(%ebx)
     bee:	0f 85 95 00 00 00    	jne    c89 <_gzwrite+0xb9>

    s->stream.next_in = (Bytef*)buf;
     bf4:	89 3b                	mov    %edi,(%ebx)
    s->stream.avail_in = len;
     bf6:	89 73 04             	mov    %esi,0x4(%ebx)
     bf9:	89 f0                	mov    %esi,%eax
     bfb:	eb 57                	jmp    c54 <_gzwrite+0x84>
     bfd:	8d 76 00             	lea    0x0(%esi),%esi

    while (s->stream.avail_in != 0) {

        if (s->stream.avail_out == 0) {
     c00:	8b 4b 10             	mov    0x10(%ebx),%ecx
     c03:	85 c9                	test   %ecx,%ecx
     c05:	75 33                	jne    c3a <_gzwrite+0x6a>

            s->stream.next_out = s->outbuf;
     c07:	8b 43 48             	mov    0x48(%ebx),%eax
            if (fwrite(s->outbuf, 1, Z_BUFSIZE, s->file) != Z_BUFSIZE) {
     c0a:	8b 53 40             	mov    0x40(%ebx),%edx

    while (s->stream.avail_in != 0) {

        if (s->stream.avail_out == 0) {

            s->stream.next_out = s->outbuf;
     c0d:	89 43 0c             	mov    %eax,0xc(%ebx)
            if (fwrite(s->outbuf, 1, Z_BUFSIZE, s->file) != Z_BUFSIZE) {
     c10:	89 54 24 0c          	mov    %edx,0xc(%esp)
     c14:	c7 44 24 08 00 40 00 	movl   $0x4000,0x8(%esp)
     c1b:	00 
     c1c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     c23:	00 
     c24:	89 04 24             	mov    %eax,(%esp)
     c27:	e8 00 00 00 00       	call   c2c <_gzwrite+0x5c>
     c2c:	3d 00 40 00 00       	cmp    $0x4000,%eax
     c31:	75 4d                	jne    c80 <_gzwrite+0xb0>
                s->z_err = Z_ERRNO;
                break;
            }
            s->stream.avail_out = Z_BUFSIZE;
     c33:	c7 43 10 00 40 00 00 	movl   $0x4000,0x10(%ebx)
        }
        s->z_err = deflate(&(s->stream), Z_NO_FLUSH);
     c3a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     c41:	00 
     c42:	89 1c 24             	mov    %ebx,(%esp)
     c45:	e8 00 00 00 00       	call   c4a <_gzwrite+0x7a>
     c4a:	89 43 38             	mov    %eax,0x38(%ebx)
        if (s->z_err != Z_OK) break;
     c4d:	85 c0                	test   %eax,%eax
     c4f:	75 07                	jne    c58 <_gzwrite+0x88>
     c51:	8b 43 04             	mov    0x4(%ebx),%eax
    if (s == NULL || s->mode != 'w') return Z_STREAM_ERROR;

    s->stream.next_in = (Bytef*)buf;
    s->stream.avail_in = len;

    while (s->stream.avail_in != 0) {
     c54:	85 c0                	test   %eax,%eax
     c56:	75 a8                	jne    c00 <_gzwrite+0x30>
            s->stream.avail_out = Z_BUFSIZE;
        }
        s->z_err = deflate(&(s->stream), Z_NO_FLUSH);
        if (s->z_err != Z_OK) break;
    }
    s->crc = crc32(s->crc, (const Bytef *)buf, len);
     c58:	89 74 24 08          	mov    %esi,0x8(%esp)
     c5c:	89 7c 24 04          	mov    %edi,0x4(%esp)
     c60:	8b 43 4c             	mov    0x4c(%ebx),%eax
     c63:	89 04 24             	mov    %eax,(%esp)
     c66:	e8 00 00 00 00       	call   c6b <_gzwrite+0x9b>

    return (int)(len - s->stream.avail_in);
     c6b:	8b 53 04             	mov    0x4(%ebx),%edx
            s->stream.avail_out = Z_BUFSIZE;
        }
        s->z_err = deflate(&(s->stream), Z_NO_FLUSH);
        if (s->z_err != Z_OK) break;
    }
    s->crc = crc32(s->crc, (const Bytef *)buf, len);
     c6e:	89 43 4c             	mov    %eax,0x4c(%ebx)

    return (int)(len - s->stream.avail_in);
}
     c71:	83 c4 10             	add    $0x10,%esp
        s->z_err = deflate(&(s->stream), Z_NO_FLUSH);
        if (s->z_err != Z_OK) break;
    }
    s->crc = crc32(s->crc, (const Bytef *)buf, len);

    return (int)(len - s->stream.avail_in);
     c74:	89 f0                	mov    %esi,%eax
}
     c76:	5b                   	pop    %ebx
        s->z_err = deflate(&(s->stream), Z_NO_FLUSH);
        if (s->z_err != Z_OK) break;
    }
    s->crc = crc32(s->crc, (const Bytef *)buf, len);

    return (int)(len - s->stream.avail_in);
     c77:	29 d0                	sub    %edx,%eax
}
     c79:	5e                   	pop    %esi
     c7a:	5f                   	pop    %edi
     c7b:	c3                   	ret    
     c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

        if (s->stream.avail_out == 0) {

            s->stream.next_out = s->outbuf;
            if (fwrite(s->outbuf, 1, Z_BUFSIZE, s->file) != Z_BUFSIZE) {
                s->z_err = Z_ERRNO;
     c80:	c7 43 38 ff ff ff ff 	movl   $0xffffffff,0x38(%ebx)
     c87:	eb cf                	jmp    c58 <_gzwrite+0x88>
        if (s->z_err != Z_OK) break;
    }
    s->crc = crc32(s->crc, (const Bytef *)buf, len);

    return (int)(len - s->stream.avail_in);
}
     c89:	83 c4 10             	add    $0x10,%esp
    const voidp buf;
    unsigned len;
{
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || s->mode != 'w') return Z_STREAM_ERROR;
     c8c:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
        if (s->z_err != Z_OK) break;
    }
    s->crc = crc32(s->crc, (const Bytef *)buf, len);

    return (int)(len - s->stream.avail_in);
}
     c91:	5b                   	pop    %ebx
     c92:	5e                   	pop    %esi
     c93:	5f                   	pop    %edi
     c94:	c3                   	ret    
     c95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ca0 <_gzprintf>:
*/
#ifdef STDC
#include <stdarg.h>

int ZEXPORTVA gzprintf (gzFile file, const char *format, /* args */ ...)
{
     ca0:	b8 18 10 00 00       	mov    $0x1018,%eax
     ca5:	53                   	push   %ebx
     ca6:	e8 00 00 00 00       	call   cab <_gzprintf+0xb>
     cab:	29 c4                	sub    %eax,%esp
    char buf[Z_PRINTF_BUFSIZE];
    va_list va;
    int len;

    va_start(va, format);
     cad:	8d 84 24 28 10 00 00 	lea    0x1028(%esp),%eax
#ifdef HAS_vsnprintf
    (void)vsnprintf(buf, sizeof(buf), format, va);
#else
    (void)vsprintf(buf, format, va);
     cb4:	8d 5c 24 10          	lea    0x10(%esp),%ebx
     cb8:	89 44 24 08          	mov    %eax,0x8(%esp)
     cbc:	8b 84 24 24 10 00 00 	mov    0x1024(%esp),%eax
     cc3:	89 44 24 04          	mov    %eax,0x4(%esp)
     cc7:	89 1c 24             	mov    %ebx,(%esp)
     cca:	e8 00 00 00 00       	call   ccf <_gzprintf+0x2f>
#endif
    va_end(va);
    len = strlen(buf); /* some *sprintf don't return the nb of bytes written */
     ccf:	89 da                	mov    %ebx,%edx
     cd1:	8b 0a                	mov    (%edx),%ecx
     cd3:	83 c2 04             	add    $0x4,%edx
     cd6:	8d 81 ff fe fe fe    	lea    -0x1010101(%ecx),%eax
     cdc:	83 f1 ff             	xor    $0xffffffff,%ecx
     cdf:	21 c8                	and    %ecx,%eax
     ce1:	25 80 80 80 80       	and    $0x80808080,%eax
     ce6:	74 e9                	je     cd1 <_gzprintf+0x31>
     ce8:	89 c1                	mov    %eax,%ecx
     cea:	c1 e9 10             	shr    $0x10,%ecx
     ced:	a9 80 80 00 00       	test   $0x8080,%eax
     cf2:	0f 44 c1             	cmove  %ecx,%eax
     cf5:	8d 4a 02             	lea    0x2(%edx),%ecx
     cf8:	0f 44 d1             	cmove  %ecx,%edx
     cfb:	00 c0                	add    %al,%al
     cfd:	83 da 03             	sbb    $0x3,%edx
     d00:	29 da                	sub    %ebx,%edx
    if (len <= 0) return 0;
     d02:	85 d2                	test   %edx,%edx
     d04:	7e 1f                	jle    d25 <_gzprintf+0x85>

    return gzwrite(file, buf, (unsigned)len);
     d06:	8b 84 24 20 10 00 00 	mov    0x1020(%esp),%eax
     d0d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     d11:	89 54 24 08          	mov    %edx,0x8(%esp)
     d15:	89 04 24             	mov    %eax,(%esp)
     d18:	e8 b3 fe ff ff       	call   bd0 <_gzwrite>
}
     d1d:	81 c4 18 10 00 00    	add    $0x1018,%esp
     d23:	5b                   	pop    %ebx
     d24:	c3                   	ret    
     d25:	81 c4 18 10 00 00    	add    $0x1018,%esp
#else
    (void)vsprintf(buf, format, va);
#endif
    va_end(va);
    len = strlen(buf); /* some *sprintf don't return the nb of bytes written */
    if (len <= 0) return 0;
     d2b:	31 c0                	xor    %eax,%eax

    return gzwrite(file, buf, (unsigned)len);
}
     d2d:	5b                   	pop    %ebx
     d2e:	c3                   	ret    
     d2f:	90                   	nop

00000d30 <_gzputc>:
   gzputc returns the value that was written, or -1 in case of error.
*/
int ZEXPORT gzputc(file, c)
    gzFile file;
    int c;
{
     d30:	83 ec 2c             	sub    $0x2c,%esp
    unsigned char cc = (unsigned char) c; /* required for big endian systems */
     d33:	8b 44 24 34          	mov    0x34(%esp),%eax

    return gzwrite(file, &cc, 1) == 1 ? (int)cc : -1;
     d37:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     d3e:	00 
*/
int ZEXPORT gzputc(file, c)
    gzFile file;
    int c;
{
    unsigned char cc = (unsigned char) c; /* required for big endian systems */
     d3f:	88 44 24 1f          	mov    %al,0x1f(%esp)

    return gzwrite(file, &cc, 1) == 1 ? (int)cc : -1;
     d43:	8d 44 24 1f          	lea    0x1f(%esp),%eax
     d47:	89 44 24 04          	mov    %eax,0x4(%esp)
     d4b:	8b 44 24 30          	mov    0x30(%esp),%eax
     d4f:	89 04 24             	mov    %eax,(%esp)
     d52:	e8 79 fe ff ff       	call   bd0 <_gzwrite>
     d57:	48                   	dec    %eax
     d58:	75 0a                	jne    d64 <_gzputc+0x34>
     d5a:	31 c0                	xor    %eax,%eax
     d5c:	8a 44 24 1f          	mov    0x1f(%esp),%al
}
     d60:	83 c4 2c             	add    $0x2c,%esp
     d63:	c3                   	ret    
    gzFile file;
    int c;
{
    unsigned char cc = (unsigned char) c; /* required for big endian systems */

    return gzwrite(file, &cc, 1) == 1 ? (int)cc : -1;
     d64:	83 c8 ff             	or     $0xffffffff,%eax
     d67:	eb f7                	jmp    d60 <_gzputc+0x30>
     d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d70 <_gzputs>:
      gzputs returns the number of characters written, or -1 in case of error.
*/
int ZEXPORT gzputs(file, s)
    gzFile file;
    const char *s;
{
     d70:	53                   	push   %ebx
     d71:	83 ec 18             	sub    $0x18,%esp
     d74:	8b 5c 24 24          	mov    0x24(%esp),%ebx
    return gzwrite(file, (char*)s, (unsigned)strlen(s));
     d78:	89 1c 24             	mov    %ebx,(%esp)
     d7b:	e8 00 00 00 00       	call   d80 <_gzputs+0x10>
     d80:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     d84:	89 44 24 08          	mov    %eax,0x8(%esp)
     d88:	8b 44 24 20          	mov    0x20(%esp),%eax
     d8c:	89 04 24             	mov    %eax,(%esp)
     d8f:	e8 3c fe ff ff       	call   bd0 <_gzwrite>
}
     d94:	83 c4 18             	add    $0x18,%esp
     d97:	5b                   	pop    %ebx
     d98:	c3                   	ret    
     d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000da0 <_gzflush>:
}

int ZEXPORT gzflush (file, flush)
     gzFile file;
     int flush;
{
     da0:	56                   	push   %esi
     da1:	53                   	push   %ebx
     da2:	83 ec 14             	sub    $0x14,%esp
{
    uInt len;
    int done = 0;
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || s->mode != 'w') return Z_STREAM_ERROR;
     da5:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
}

int ZEXPORT gzflush (file, flush)
     gzFile file;
     int flush;
{
     daa:	8b 5c 24 20          	mov    0x20(%esp),%ebx
{
    uInt len;
    int done = 0;
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || s->mode != 'w') return Z_STREAM_ERROR;
     dae:	85 db                	test   %ebx,%ebx
     db0:	74 06                	je     db8 <_gzflush+0x18>
     db2:	80 7b 5c 77          	cmpb   $0x77,0x5c(%ebx)
     db6:	74 08                	je     dc0 <_gzflush+0x20>
    int err = do_flush (file, flush);

    if (err) return err;
    fflush(s->file);
    return  s->z_err == Z_STREAM_END ? Z_OK : s->z_err;
}
     db8:	83 c4 14             	add    $0x14,%esp
     dbb:	5b                   	pop    %ebx
     dbc:	5e                   	pop    %esi
     dbd:	c3                   	ret    
     dbe:	66 90                	xchg   %ax,%ax
    int done = 0;
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || s->mode != 'w') return Z_STREAM_ERROR;

    s->stream.avail_in = 0; /* should be zero already anyway */
     dc0:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
     dc7:	8b 54 24 24          	mov    0x24(%esp),%edx
     dcb:	89 d8                	mov    %ebx,%eax
     dcd:	e8 ce f8 ff ff       	call   6a0 <_do_flush.part.1>
     dd2:	89 c6                	mov    %eax,%esi
     int flush;
{
    gz_stream *s = (gz_stream*)file;
    int err = do_flush (file, flush);

    if (err) return err;
     dd4:	85 c0                	test   %eax,%eax
     dd6:	75 e0                	jne    db8 <_gzflush+0x18>
    fflush(s->file);
     dd8:	8b 53 40             	mov    0x40(%ebx),%edx
     ddb:	89 14 24             	mov    %edx,(%esp)
     dde:	e8 00 00 00 00       	call   de3 <_gzflush+0x43>
    return  s->z_err == Z_STREAM_END ? Z_OK : s->z_err;
     de3:	8b 43 38             	mov    0x38(%ebx),%eax
     de6:	83 f8 01             	cmp    $0x1,%eax
     de9:	0f 44 c6             	cmove  %esi,%eax
}
     dec:	83 c4 14             	add    $0x14,%esp
     def:	5b                   	pop    %ebx
     df0:	5e                   	pop    %esi
     df1:	c3                   	ret    
     df2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e00 <_gzrewind>:
/* ===========================================================================
     Rewinds input file.
*/
int ZEXPORT gzrewind (file)
    gzFile file;
{
     e00:	53                   	push   %ebx
     e01:	83 ec 18             	sub    $0x18,%esp
     e04:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || s->mode != 'r') return -1;
     e08:	85 db                	test   %ebx,%ebx
     e0a:	0f 84 82 00 00 00    	je     e92 <_gzrewind+0x92>
     e10:	80 7b 5c 72          	cmpb   $0x72,0x5c(%ebx)
     e14:	75 7c                	jne    e92 <_gzrewind+0x92>

    s->z_err = Z_OK;
    s->z_eof = 0;
    s->stream.avail_in = 0;
    s->stream.next_in = s->inbuf;
     e16:	8b 43 44             	mov    0x44(%ebx),%eax
{
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || s->mode != 'r') return -1;

    s->z_err = Z_OK;
     e19:	c7 43 38 00 00 00 00 	movl   $0x0,0x38(%ebx)
    s->z_eof = 0;
     e20:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
    s->stream.avail_in = 0;
     e27:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
    s->stream.next_in = s->inbuf;
     e2e:	89 03                	mov    %eax,(%ebx)
    s->crc = crc32(0L, Z_NULL, 0);
     e30:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     e37:	00 
     e38:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     e3f:	00 
     e40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e47:	e8 00 00 00 00       	call   e4c <_gzrewind+0x4c>
     e4c:	89 43 4c             	mov    %eax,0x4c(%ebx)

    if (s->startpos == 0) { /* not a compressed file */
     e4f:	8b 43 60             	mov    0x60(%ebx),%eax
     e52:	85 c0                	test   %eax,%eax
     e54:	74 2a                	je     e80 <_gzrewind+0x80>
  rewind(s->file);
  return 0;
    }

    (void) inflateReset(&s->stream);
     e56:	89 1c 24             	mov    %ebx,(%esp)
     e59:	e8 00 00 00 00       	call   e5e <_gzrewind+0x5e>
    return fseek(s->file, s->startpos, SEEK_SET);
     e5e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     e65:	00 
     e66:	8b 43 60             	mov    0x60(%ebx),%eax
     e69:	89 44 24 04          	mov    %eax,0x4(%esp)
     e6d:	8b 43 40             	mov    0x40(%ebx),%eax
     e70:	89 04 24             	mov    %eax,(%esp)
     e73:	e8 00 00 00 00       	call   e78 <_gzrewind+0x78>
}
     e78:	83 c4 18             	add    $0x18,%esp
     e7b:	5b                   	pop    %ebx
     e7c:	c3                   	ret    
     e7d:	8d 76 00             	lea    0x0(%esi),%esi
    s->stream.avail_in = 0;
    s->stream.next_in = s->inbuf;
    s->crc = crc32(0L, Z_NULL, 0);

    if (s->startpos == 0) { /* not a compressed file */
  rewind(s->file);
     e80:	8b 43 40             	mov    0x40(%ebx),%eax
     e83:	89 04 24             	mov    %eax,(%esp)
     e86:	e8 00 00 00 00       	call   e8b <_gzrewind+0x8b>
  return 0;
    }

    (void) inflateReset(&s->stream);
    return fseek(s->file, s->startpos, SEEK_SET);
}
     e8b:	83 c4 18             	add    $0x18,%esp
    s->stream.next_in = s->inbuf;
    s->crc = crc32(0L, Z_NULL, 0);

    if (s->startpos == 0) { /* not a compressed file */
  rewind(s->file);
  return 0;
     e8e:	31 c0                	xor    %eax,%eax
    }

    (void) inflateReset(&s->stream);
    return fseek(s->file, s->startpos, SEEK_SET);
}
     e90:	5b                   	pop    %ebx
     e91:	c3                   	ret    
     e92:	83 c4 18             	add    $0x18,%esp
int ZEXPORT gzrewind (file)
    gzFile file;
{
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || s->mode != 'r') return -1;
     e95:	83 c8 ff             	or     $0xffffffff,%eax
  return 0;
    }

    (void) inflateReset(&s->stream);
    return fseek(s->file, s->startpos, SEEK_SET);
}
     e98:	5b                   	pop    %ebx
     e99:	c3                   	ret    
     e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ea0 <_gzseek>:
*/
z_off_t ZEXPORT gzseek (file, offset, whence)
    gzFile file;
    z_off_t offset;
    int whence;
{
     ea0:	57                   	push   %edi
     ea1:	56                   	push   %esi
     ea2:	53                   	push   %ebx
     ea3:	83 ec 10             	sub    $0x10,%esp
     ea6:	8b 74 24 20          	mov    0x20(%esp),%esi
     eaa:	8b 5c 24 24          	mov    0x24(%esp),%ebx
     eae:	8b 54 24 28          	mov    0x28(%esp),%edx
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || whence == SEEK_END ||
     eb2:	85 f6                	test   %esi,%esi
     eb4:	0f 84 7f 00 00 00    	je     f39 <_gzseek+0x99>
     eba:	83 fa 02             	cmp    $0x2,%edx
     ebd:	74 7a                	je     f39 <_gzseek+0x99>
  s->z_err == Z_ERRNO || s->z_err == Z_DATA_ERROR) {
     ebf:	8b 46 38             	mov    0x38(%esi),%eax
     ec2:	83 e0 fd             	and    $0xfffffffd,%eax
     ec5:	83 f8 fd             	cmp    $0xfffffffd,%eax
     ec8:	74 6f                	je     f39 <_gzseek+0x99>
  return -1L;
    }

    if (s->mode == 'w') {
     eca:	80 7e 5c 77          	cmpb   $0x77,0x5c(%esi)
     ece:	0f 84 7c 00 00 00    	je     f50 <_gzseek+0xb0>
#endif
    }
    /* Rest of function is for reading only */

    /* compute absolute position */
    if (whence == SEEK_CUR) {
     ed4:	4a                   	dec    %edx
     ed5:	0f 84 05 01 00 00    	je     fe0 <_gzseek+0x140>
  offset += s->stream.total_out;
    }
    if (offset < 0) return -1L;
     edb:	85 db                	test   %ebx,%ebx
     edd:	78 5a                	js     f39 <_gzseek+0x99>

    if (s->transparent) {
     edf:	8b 56 58             	mov    0x58(%esi),%edx
     ee2:	85 d2                	test   %edx,%edx
     ee4:	0f 85 b9 00 00 00    	jne    fa3 <_gzseek+0x103>
  s->stream.total_in = s->stream.total_out = (uLong)offset;
  return offset;
    }

    /* For a negative seek, rewind and use positive seek */
    if ((uLong)offset >= s->stream.total_out) {
     eea:	8b 46 14             	mov    0x14(%esi),%eax
     eed:	39 c3                	cmp    %eax,%ebx
     eef:	0f 82 0b 01 00 00    	jb     1000 <_gzseek+0x160>
  offset -= s->stream.total_out;
     ef5:	29 c3                	sub    %eax,%ebx
    } else if (gzrewind(file) < 0) {
  return -1L;
    }
    /* offset is now the number of bytes to skip. */

    if (offset != 0 && s->outbuf == Z_NULL) {
     ef7:	85 db                	test   %ebx,%ebx
     ef9:	74 48                	je     f43 <_gzseek+0xa3>
     efb:	8b 46 48             	mov    0x48(%esi),%eax
     efe:	85 c0                	test   %eax,%eax
     f00:	0f 84 3a 01 00 00    	je     1040 <_gzseek+0x1a0>
  s->outbuf = (Byte*)ALLOC(Z_BUFSIZE);
    }
    while (offset > 0)  {
     f06:	85 db                	test   %ebx,%ebx
     f08:	7e 39                	jle    f43 <_gzseek+0xa3>
     f0a:	bf 00 40 00 00       	mov    $0x4000,%edi
     f0f:	eb 06                	jmp    f17 <_gzseek+0x77>
  int size = Z_BUFSIZE;
  if (offset < Z_BUFSIZE) size = (int)offset;

  size = gzread(file, s->outbuf, (uInt)size);
  if (size <= 0) return -1L;
  offset -= size;
     f11:	29 c3                	sub    %eax,%ebx
    /* offset is now the number of bytes to skip. */

    if (offset != 0 && s->outbuf == Z_NULL) {
  s->outbuf = (Byte*)ALLOC(Z_BUFSIZE);
    }
    while (offset > 0)  {
     f13:	85 db                	test   %ebx,%ebx
     f15:	7e 2c                	jle    f43 <_gzseek+0xa3>
     f17:	89 f8                	mov    %edi,%eax
     f19:	81 fb ff 3f 00 00    	cmp    $0x3fff,%ebx
     f1f:	0f 4e c3             	cmovle %ebx,%eax
  int size = Z_BUFSIZE;
  if (offset < Z_BUFSIZE) size = (int)offset;

  size = gzread(file, s->outbuf, (uInt)size);
     f22:	89 44 24 08          	mov    %eax,0x8(%esp)
     f26:	8b 46 48             	mov    0x48(%esi),%eax
     f29:	89 34 24             	mov    %esi,(%esp)
     f2c:	89 44 24 04          	mov    %eax,0x4(%esp)
     f30:	e8 4b f9 ff ff       	call   880 <_gzread>
  if (size <= 0) return -1L;
     f35:	85 c0                	test   %eax,%eax
     f37:	7f d8                	jg     f11 <_gzseek+0x71>
  offset -= size;
    }
    return (z_off_t)s->stream.total_out;
}
     f39:	83 c4 10             	add    $0x10,%esp
{
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || whence == SEEK_END ||
  s->z_err == Z_ERRNO || s->z_err == Z_DATA_ERROR) {
  return -1L;
     f3c:	83 c8 ff             	or     $0xffffffff,%eax
  size = gzread(file, s->outbuf, (uInt)size);
  if (size <= 0) return -1L;
  offset -= size;
    }
    return (z_off_t)s->stream.total_out;
}
     f3f:	5b                   	pop    %ebx
     f40:	5e                   	pop    %esi
     f41:	5f                   	pop    %edi
     f42:	c3                   	ret    

  size = gzread(file, s->outbuf, (uInt)size);
  if (size <= 0) return -1L;
  offset -= size;
    }
    return (z_off_t)s->stream.total_out;
     f43:	8b 46 14             	mov    0x14(%esi),%eax
}
     f46:	83 c4 10             	add    $0x10,%esp
     f49:	5b                   	pop    %ebx
     f4a:	5e                   	pop    %esi
     f4b:	5f                   	pop    %edi
     f4c:	c3                   	ret    
     f4d:	8d 76 00             	lea    0x0(%esi),%esi

    if (s->mode == 'w') {
#ifdef NO_DEFLATE
  return -1L;
#else
  if (whence == SEEK_SET) {
     f50:	85 d2                	test   %edx,%edx
     f52:	0f 84 98 00 00 00    	je     ff0 <_gzseek+0x150>
      offset -= s->stream.total_in;
  }
  if (offset < 0) return -1L;
     f58:	85 db                	test   %ebx,%ebx
     f5a:	78 dd                	js     f39 <_gzseek+0x99>

  /* At this point, offset is the number of zero bytes to write. */
  if (s->inbuf == Z_NULL) {
     f5c:	8b 7e 44             	mov    0x44(%esi),%edi
     f5f:	85 ff                	test   %edi,%edi
     f61:	0f 84 b8 00 00 00    	je     101f <_gzseek+0x17f>
      s->inbuf = (Byte*)ALLOC(Z_BUFSIZE); /* for seeking */
      zmemzero(s->inbuf, Z_BUFSIZE);
  }
  while (offset > 0)  {
      uInt size = Z_BUFSIZE;
      if (offset < Z_BUFSIZE) size = (uInt)offset;
     f67:	bf 00 40 00 00       	mov    $0x4000,%edi
  /* At this point, offset is the number of zero bytes to write. */
  if (s->inbuf == Z_NULL) {
      s->inbuf = (Byte*)ALLOC(Z_BUFSIZE); /* for seeking */
      zmemzero(s->inbuf, Z_BUFSIZE);
  }
  while (offset > 0)  {
     f6c:	85 db                	test   %ebx,%ebx
     f6e:	75 0f                	jne    f7f <_gzseek+0xdf>
     f70:	e9 a0 00 00 00       	jmp    1015 <_gzseek+0x175>
      if (offset < Z_BUFSIZE) size = (uInt)offset;

      size = gzwrite(file, s->inbuf, size);
      if (size == 0) return -1L;

      offset -= size;
     f75:	29 c3                	sub    %eax,%ebx
  /* At this point, offset is the number of zero bytes to write. */
  if (s->inbuf == Z_NULL) {
      s->inbuf = (Byte*)ALLOC(Z_BUFSIZE); /* for seeking */
      zmemzero(s->inbuf, Z_BUFSIZE);
  }
  while (offset > 0)  {
     f77:	85 db                	test   %ebx,%ebx
     f79:	0f 8e 96 00 00 00    	jle    1015 <_gzseek+0x175>
      uInt size = Z_BUFSIZE;
      if (offset < Z_BUFSIZE) size = (uInt)offset;
     f7f:	89 f8                	mov    %edi,%eax
     f81:	81 fb ff 3f 00 00    	cmp    $0x3fff,%ebx
     f87:	0f 4e c3             	cmovle %ebx,%eax

      size = gzwrite(file, s->inbuf, size);
     f8a:	89 44 24 08          	mov    %eax,0x8(%esp)
     f8e:	8b 46 44             	mov    0x44(%esi),%eax
     f91:	89 34 24             	mov    %esi,(%esp)
     f94:	89 44 24 04          	mov    %eax,0x4(%esp)
     f98:	e8 33 fc ff ff       	call   bd0 <_gzwrite>
      if (size == 0) return -1L;
     f9d:	85 c0                	test   %eax,%eax
     f9f:	75 d4                	jne    f75 <_gzseek+0xd5>
     fa1:	eb 96                	jmp    f39 <_gzseek+0x99>
    if (offset < 0) return -1L;

    if (s->transparent) {
  /* map to fseek */
  s->stream.avail_in = 0;
  s->stream.next_in = s->inbuf;
     fa3:	8b 46 44             	mov    0x44(%esi),%eax
    }
    if (offset < 0) return -1L;

    if (s->transparent) {
  /* map to fseek */
  s->stream.avail_in = 0;
     fa6:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  s->stream.next_in = s->inbuf;
     fad:	89 06                	mov    %eax,(%esi)
        if (fseek(s->file, offset, SEEK_SET) < 0) return -1L;
     faf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     fb6:	00 
     fb7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     fbb:	8b 46 40             	mov    0x40(%esi),%eax
     fbe:	89 04 24             	mov    %eax,(%esp)
     fc1:	e8 00 00 00 00       	call   fc6 <_gzseek+0x126>
     fc6:	85 c0                	test   %eax,%eax
     fc8:	0f 88 6b ff ff ff    	js     f39 <_gzseek+0x99>

  s->stream.total_in = s->stream.total_out = (uLong)offset;
     fce:	89 5e 14             	mov    %ebx,0x14(%esi)
     fd1:	89 5e 08             	mov    %ebx,0x8(%esi)
  size = gzread(file, s->outbuf, (uInt)size);
  if (size <= 0) return -1L;
  offset -= size;
    }
    return (z_off_t)s->stream.total_out;
}
     fd4:	83 c4 10             	add    $0x10,%esp
  s->stream.avail_in = 0;
  s->stream.next_in = s->inbuf;
        if (fseek(s->file, offset, SEEK_SET) < 0) return -1L;

  s->stream.total_in = s->stream.total_out = (uLong)offset;
  return offset;
     fd7:	89 d8                	mov    %ebx,%eax
  size = gzread(file, s->outbuf, (uInt)size);
  if (size <= 0) return -1L;
  offset -= size;
    }
    return (z_off_t)s->stream.total_out;
}
     fd9:	5b                   	pop    %ebx
     fda:	5e                   	pop    %esi
     fdb:	5f                   	pop    %edi
     fdc:	c3                   	ret    
     fdd:	8d 76 00             	lea    0x0(%esi),%esi
    }
    /* Rest of function is for reading only */

    /* compute absolute position */
    if (whence == SEEK_CUR) {
  offset += s->stream.total_out;
     fe0:	8b 4e 14             	mov    0x14(%esi),%ecx
     fe3:	01 cb                	add    %ecx,%ebx
     fe5:	e9 f1 fe ff ff       	jmp    edb <_gzseek+0x3b>
     fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (s->mode == 'w') {
#ifdef NO_DEFLATE
  return -1L;
#else
  if (whence == SEEK_SET) {
      offset -= s->stream.total_in;
     ff0:	8b 46 08             	mov    0x8(%esi),%eax
     ff3:	29 c3                	sub    %eax,%ebx
     ff5:	e9 5e ff ff ff       	jmp    f58 <_gzseek+0xb8>
     ffa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }

    /* For a negative seek, rewind and use positive seek */
    if ((uLong)offset >= s->stream.total_out) {
  offset -= s->stream.total_out;
    } else if (gzrewind(file) < 0) {
    1000:	89 34 24             	mov    %esi,(%esp)
    1003:	e8 f8 fd ff ff       	call   e00 <_gzrewind>
    1008:	85 c0                	test   %eax,%eax
    100a:	0f 89 e7 fe ff ff    	jns    ef7 <_gzseek+0x57>
    1010:	e9 24 ff ff ff       	jmp    f39 <_gzseek+0x99>
      size = gzwrite(file, s->inbuf, size);
      if (size == 0) return -1L;

      offset -= size;
  }
  return (z_off_t)s->stream.total_in;
    1015:	8b 46 08             	mov    0x8(%esi),%eax
  size = gzread(file, s->outbuf, (uInt)size);
  if (size <= 0) return -1L;
  offset -= size;
    }
    return (z_off_t)s->stream.total_out;
}
    1018:	83 c4 10             	add    $0x10,%esp
    101b:	5b                   	pop    %ebx
    101c:	5e                   	pop    %esi
    101d:	5f                   	pop    %edi
    101e:	c3                   	ret    
  }
  if (offset < 0) return -1L;

  /* At this point, offset is the number of zero bytes to write. */
  if (s->inbuf == Z_NULL) {
      s->inbuf = (Byte*)ALLOC(Z_BUFSIZE); /* for seeking */
    101f:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    1026:	e8 00 00 00 00       	call   102b <_gzseek+0x18b>
      zmemzero(s->inbuf, Z_BUFSIZE);
    102b:	b9 00 10 00 00       	mov    $0x1000,%ecx
  }
  if (offset < 0) return -1L;

  /* At this point, offset is the number of zero bytes to write. */
  if (s->inbuf == Z_NULL) {
      s->inbuf = (Byte*)ALLOC(Z_BUFSIZE); /* for seeking */
    1030:	89 c2                	mov    %eax,%edx
    1032:	89 46 44             	mov    %eax,0x44(%esi)
      zmemzero(s->inbuf, Z_BUFSIZE);
    1035:	89 d7                	mov    %edx,%edi
    1037:	31 c0                	xor    %eax,%eax
    1039:	f3 ab                	rep stos %eax,%es:(%edi)
    103b:	e9 27 ff ff ff       	jmp    f67 <_gzseek+0xc7>
  return -1L;
    }
    /* offset is now the number of bytes to skip. */

    if (offset != 0 && s->outbuf == Z_NULL) {
  s->outbuf = (Byte*)ALLOC(Z_BUFSIZE);
    1040:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    1047:	e8 00 00 00 00       	call   104c <_gzseek+0x1ac>
    104c:	89 46 48             	mov    %eax,0x48(%esi)
    104f:	e9 b2 fe ff ff       	jmp    f06 <_gzseek+0x66>
    1054:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    105a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001060 <_gztell>:
   given compressed file. This position represents a number of bytes in the
   uncompressed data stream.
*/
z_off_t ZEXPORT gztell (file)
    gzFile file;
{
    1060:	83 ec 1c             	sub    $0x1c,%esp
    return gzseek(file, 0L, SEEK_CUR);
    1063:	8b 44 24 20          	mov    0x20(%esp),%eax
    1067:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    106e:	00 
    106f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1076:	00 
    1077:	89 04 24             	mov    %eax,(%esp)
    107a:	e8 21 fe ff ff       	call   ea0 <_gzseek>
}
    107f:	83 c4 1c             	add    $0x1c,%esp
    1082:	c3                   	ret    
    1083:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001090 <_gzeof>:
     Returns 1 when EOF has previously been detected reading the given
   input stream, otherwise zero.
*/
int ZEXPORT gzeof (file)
    gzFile file;
{
    1090:	8b 54 24 04          	mov    0x4(%esp),%edx
    gz_stream *s = (gz_stream*)file;

    return (s == NULL || s->mode != 'r') ? 0 : s->z_eof;
    1094:	31 c0                	xor    %eax,%eax
    1096:	85 d2                	test   %edx,%edx
    1098:	74 06                	je     10a0 <_gzeof+0x10>
    109a:	80 7a 5c 72          	cmpb   $0x72,0x5c(%edx)
    109e:	74 01                	je     10a1 <_gzeof+0x11>
}
    10a0:	c3                   	ret    
int ZEXPORT gzeof (file)
    gzFile file;
{
    gz_stream *s = (gz_stream*)file;

    return (s == NULL || s->mode != 'r') ? 0 : s->z_eof;
    10a1:	8b 42 3c             	mov    0x3c(%edx),%eax
    10a4:	c3                   	ret    
    10a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010b0 <_gzclose>:
     Flushes all pending output if necessary, closes the compressed file
   and deallocates all the (de)compression state.
*/
int ZEXPORT gzclose (file)
    gzFile file;
{
    10b0:	55                   	push   %ebp
    10b1:	57                   	push   %edi
    10b2:	56                   	push   %esi
    10b3:	53                   	push   %ebx
    10b4:	83 ec 1c             	sub    $0x1c,%esp
    10b7:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    int err;
    gz_stream *s = (gz_stream*)file;

    if (s == NULL) return Z_STREAM_ERROR;
    10bb:	85 db                	test   %ebx,%ebx
    10bd:	0f 84 81 00 00 00    	je     1144 <_gzclose+0x94>

    if (s->mode == 'w') {
    10c3:	80 7b 5c 77          	cmpb   $0x77,0x5c(%ebx)
    10c7:	74 0e                	je     10d7 <_gzclose+0x27>
        putLong (s->file, s->crc);
        putLong (s->file, s->stream.total_in);
#endif
    }
    return destroy((gz_stream*)file);
}
    10c9:	83 c4 1c             	add    $0x1c,%esp
    if (s->mode == 'w') {
#ifdef NO_DEFLATE
  return Z_STREAM_ERROR;
#else
        err = do_flush (file, Z_FINISH);
        if (err != Z_OK) return destroy((gz_stream*)file);
    10cc:	89 d8                	mov    %ebx,%eax
        putLong (s->file, s->crc);
        putLong (s->file, s->stream.total_in);
#endif
    }
    return destroy((gz_stream*)file);
}
    10ce:	5b                   	pop    %ebx
    10cf:	5e                   	pop    %esi
    10d0:	5f                   	pop    %edi
    10d1:	5d                   	pop    %ebp
    if (s->mode == 'w') {
#ifdef NO_DEFLATE
  return Z_STREAM_ERROR;
#else
        err = do_flush (file, Z_FINISH);
        if (err != Z_OK) return destroy((gz_stream*)file);
    10d2:	e9 29 ef ff ff       	jmp    0 <_destroy>
    int done = 0;
    gz_stream *s = (gz_stream*)file;

    if (s == NULL || s->mode != 'w') return Z_STREAM_ERROR;

    s->stream.avail_in = 0; /* should be zero already anyway */
    10d7:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
    10de:	ba 04 00 00 00       	mov    $0x4,%edx
    10e3:	89 d8                	mov    %ebx,%eax
    10e5:	e8 b6 f5 ff ff       	call   6a0 <_do_flush.part.1>
    if (s->mode == 'w') {
#ifdef NO_DEFLATE
  return Z_STREAM_ERROR;
#else
        err = do_flush (file, Z_FINISH);
        if (err != Z_OK) return destroy((gz_stream*)file);
    10ea:	85 c0                	test   %eax,%eax
    10ec:	75 db                	jne    10c9 <_gzclose+0x19>

        putLong (s->file, s->crc);
    10ee:	8b 7b 4c             	mov    0x4c(%ebx),%edi
    10f1:	8b 6b 40             	mov    0x40(%ebx),%ebp
    10f4:	be 04 00 00 00       	mov    $0x4,%esi
    FILE *file;
    uLong x;
{
    int n;
    for (n = 0; n < 4; n++) {
        fputc((int)(x & 0xff), file);
    10f9:	89 f8                	mov    %edi,%eax
    10fb:	89 6c 24 04          	mov    %ebp,0x4(%esp)
        x >>= 8;
    10ff:	c1 ef 08             	shr    $0x8,%edi
    FILE *file;
    uLong x;
{
    int n;
    for (n = 0; n < 4; n++) {
        fputc((int)(x & 0xff), file);
    1102:	25 ff 00 00 00       	and    $0xff,%eax
    1107:	89 04 24             	mov    %eax,(%esp)
    110a:	e8 00 00 00 00       	call   110f <_gzclose+0x5f>
local void putLong (file, x)
    FILE *file;
    uLong x;
{
    int n;
    for (n = 0; n < 4; n++) {
    110f:	4e                   	dec    %esi
    1110:	75 e7                	jne    10f9 <_gzclose+0x49>
#else
        err = do_flush (file, Z_FINISH);
        if (err != Z_OK) return destroy((gz_stream*)file);

        putLong (s->file, s->crc);
        putLong (s->file, s->stream.total_in);
    1112:	8b 7b 08             	mov    0x8(%ebx),%edi
    1115:	8b 6b 40             	mov    0x40(%ebx),%ebp
    1118:	be 04 00 00 00       	mov    $0x4,%esi
    FILE *file;
    uLong x;
{
    int n;
    for (n = 0; n < 4; n++) {
        fputc((int)(x & 0xff), file);
    111d:	89 f8                	mov    %edi,%eax
    111f:	89 6c 24 04          	mov    %ebp,0x4(%esp)
        x >>= 8;
    1123:	c1 ef 08             	shr    $0x8,%edi
    FILE *file;
    uLong x;
{
    int n;
    for (n = 0; n < 4; n++) {
        fputc((int)(x & 0xff), file);
    1126:	25 ff 00 00 00       	and    $0xff,%eax
    112b:	89 04 24             	mov    %eax,(%esp)
    112e:	e8 00 00 00 00       	call   1133 <_gzclose+0x83>
local void putLong (file, x)
    FILE *file;
    uLong x;
{
    int n;
    for (n = 0; n < 4; n++) {
    1133:	4e                   	dec    %esi
    1134:	75 e7                	jne    111d <_gzclose+0x6d>
        putLong (s->file, s->crc);
        putLong (s->file, s->stream.total_in);
#endif
    }
    return destroy((gz_stream*)file);
}
    1136:	83 c4 1c             	add    $0x1c,%esp
    if (s->mode == 'w') {
#ifdef NO_DEFLATE
  return Z_STREAM_ERROR;
#else
        err = do_flush (file, Z_FINISH);
        if (err != Z_OK) return destroy((gz_stream*)file);
    1139:	89 d8                	mov    %ebx,%eax
        putLong (s->file, s->crc);
        putLong (s->file, s->stream.total_in);
#endif
    }
    return destroy((gz_stream*)file);
}
    113b:	5b                   	pop    %ebx
    113c:	5e                   	pop    %esi
    113d:	5f                   	pop    %edi
    113e:	5d                   	pop    %ebp
    if (s->mode == 'w') {
#ifdef NO_DEFLATE
  return Z_STREAM_ERROR;
#else
        err = do_flush (file, Z_FINISH);
        if (err != Z_OK) return destroy((gz_stream*)file);
    113f:	e9 bc ee ff ff       	jmp    0 <_destroy>
        putLong (s->file, s->crc);
        putLong (s->file, s->stream.total_in);
#endif
    }
    return destroy((gz_stream*)file);
}
    1144:	83 c4 1c             	add    $0x1c,%esp
    1147:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    114c:	5b                   	pop    %ebx
    114d:	5e                   	pop    %esi
    114e:	5f                   	pop    %edi
    114f:	5d                   	pop    %ebp
    1150:	c3                   	ret    
    1151:	eb 0d                	jmp    1160 <_gzerror>
    1153:	90                   	nop
    1154:	90                   	nop
    1155:	90                   	nop
    1156:	90                   	nop
    1157:	90                   	nop
    1158:	90                   	nop
    1159:	90                   	nop
    115a:	90                   	nop
    115b:	90                   	nop
    115c:	90                   	nop
    115d:	90                   	nop
    115e:	90                   	nop
    115f:	90                   	nop

00001160 <_gzerror>:
   to get the exact error code.
*/
const char*  ZEXPORT gzerror (file, errnum)
    gzFile file;
    int *errnum;
{
    1160:	55                   	push   %ebp
    1161:	57                   	push   %edi
    1162:	56                   	push   %esi
    1163:	53                   	push   %ebx
    1164:	83 ec 1c             	sub    $0x1c,%esp
    1167:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    char *m;
    gz_stream *s = (gz_stream*)file;

    if (s == NULL) {
    116b:	85 db                	test   %ebx,%ebx
    116d:	0f 84 dd 00 00 00    	je     1250 <_gzerror+0xf0>
        *errnum = Z_STREAM_ERROR;
        return (const char*)ERR_MSG(Z_STREAM_ERROR);
    }
    *errnum = s->z_err;
    1173:	8b 44 24 34          	mov    0x34(%esp),%eax
    1177:	8b 53 38             	mov    0x38(%ebx),%edx
    if (*errnum == Z_OK) return (const char*)"";
    117a:	85 d2                	test   %edx,%edx

    if (s == NULL) {
        *errnum = Z_STREAM_ERROR;
        return (const char*)ERR_MSG(Z_STREAM_ERROR);
    }
    *errnum = s->z_err;
    117c:	89 10                	mov    %edx,(%eax)
    if (*errnum == Z_OK) return (const char*)"";
    117e:	b8 23 00 00 00       	mov    $0x23,%eax
    1183:	0f 84 b0 00 00 00    	je     1239 <_gzerror+0xd9>

    m =  (char*)(*errnum == Z_ERRNO ? zstrerror(errno) : s->stream.msg);
    1189:	42                   	inc    %edx
    118a:	0f 84 b1 00 00 00    	je     1241 <_gzerror+0xe1>
    1190:	8b 73 18             	mov    0x18(%ebx),%esi

    if (m == NULL || *m == '\0') m = (char*)ERR_MSG(s->z_err);
    1193:	85 f6                	test   %esi,%esi
    1195:	74 05                	je     119c <_gzerror+0x3c>
    1197:	80 3e 00             	cmpb   $0x0,(%esi)
    119a:	75 11                	jne    11ad <_gzerror+0x4d>
    119c:	b8 02 00 00 00       	mov    $0x2,%eax
    11a1:	8b 53 38             	mov    0x38(%ebx),%edx
    11a4:	29 d0                	sub    %edx,%eax
    11a6:	8b 34 85 00 00 00 00 	mov    0x0(,%eax,4),%esi

    TRYFREE(s->msg);
    11ad:	8b 43 50             	mov    0x50(%ebx),%eax
    11b0:	85 c0                	test   %eax,%eax
    11b2:	74 08                	je     11bc <_gzerror+0x5c>
    11b4:	89 04 24             	mov    %eax,(%esp)
    11b7:	e8 00 00 00 00       	call   11bc <_gzerror+0x5c>
    s->msg = (char*)ALLOC(strlen(s->path) + strlen(m) + 3);
    11bc:	8b 6b 54             	mov    0x54(%ebx),%ebp
    11bf:	89 2c 24             	mov    %ebp,(%esp)
    11c2:	e8 00 00 00 00       	call   11c7 <_gzerror+0x67>
    11c7:	89 34 24             	mov    %esi,(%esp)
    11ca:	89 c7                	mov    %eax,%edi
    11cc:	e8 00 00 00 00       	call   11d1 <_gzerror+0x71>
    11d1:	8d 44 07 03          	lea    0x3(%edi,%eax,1),%eax
    11d5:	89 04 24             	mov    %eax,(%esp)
    11d8:	e8 00 00 00 00       	call   11dd <_gzerror+0x7d>
    11dd:	89 43 50             	mov    %eax,0x50(%ebx)
    11e0:	89 c7                	mov    %eax,%edi
    strcpy(s->msg, s->path);
    11e2:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    11e6:	89 04 24             	mov    %eax,(%esp)
    11e9:	e8 00 00 00 00       	call   11ee <_gzerror+0x8e>
    strcat(s->msg, ": ");
    11ee:	89 f9                	mov    %edi,%ecx
    11f0:	8b 01                	mov    (%ecx),%eax
    11f2:	83 c1 04             	add    $0x4,%ecx
    11f5:	8d 90 ff fe fe fe    	lea    -0x1010101(%eax),%edx
    11fb:	83 f0 ff             	xor    $0xffffffff,%eax
    11fe:	21 c2                	and    %eax,%edx
    1200:	81 e2 80 80 80 80    	and    $0x80808080,%edx
    1206:	74 e8                	je     11f0 <_gzerror+0x90>
    1208:	89 d0                	mov    %edx,%eax
    120a:	c1 e8 10             	shr    $0x10,%eax
    120d:	f7 c2 80 80 00 00    	test   $0x8080,%edx
    1213:	0f 44 d0             	cmove  %eax,%edx
    1216:	8d 41 02             	lea    0x2(%ecx),%eax
    1219:	0f 44 c8             	cmove  %eax,%ecx
    121c:	00 d2                	add    %dl,%dl
    121e:	83 d9 03             	sbb    $0x3,%ecx
    1221:	66 c7 01 3a 20       	movw   $0x203a,(%ecx)
    1226:	c6 41 02 00          	movb   $0x0,0x2(%ecx)
    strcat(s->msg, m);
    122a:	89 74 24 04          	mov    %esi,0x4(%esp)
    122e:	89 3c 24             	mov    %edi,(%esp)
    1231:	e8 00 00 00 00       	call   1236 <_gzerror+0xd6>
    return (const char*)s->msg;
    1236:	8b 43 50             	mov    0x50(%ebx),%eax
}
    1239:	83 c4 1c             	add    $0x1c,%esp
    123c:	5b                   	pop    %ebx
    123d:	5e                   	pop    %esi
    123e:	5f                   	pop    %edi
    123f:	5d                   	pop    %ebp
    1240:	c3                   	ret    
        return (const char*)ERR_MSG(Z_STREAM_ERROR);
    }
    *errnum = s->z_err;
    if (*errnum == Z_OK) return (const char*)"";

    m =  (char*)(*errnum == Z_ERRNO ? zstrerror(errno) : s->stream.msg);
    1241:	be 23 00 00 00       	mov    $0x23,%esi
    1246:	e9 4c ff ff ff       	jmp    1197 <_gzerror+0x37>
    124b:	90                   	nop
    124c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
    char *m;
    gz_stream *s = (gz_stream*)file;

    if (s == NULL) {
        *errnum = Z_STREAM_ERROR;
    1250:	8b 44 24 34          	mov    0x34(%esp),%eax
    1254:	c7 00 fe ff ff ff    	movl   $0xfffffffe,(%eax)
        return (const char*)ERR_MSG(Z_STREAM_ERROR);
    125a:	a1 10 00 00 00       	mov    0x10,%eax
    s->msg = (char*)ALLOC(strlen(s->path) + strlen(m) + 3);
    strcpy(s->msg, s->path);
    strcat(s->msg, ": ");
    strcat(s->msg, m);
    return (const char*)s->msg;
}
    125f:	83 c4 1c             	add    $0x1c,%esp
    1262:	5b                   	pop    %ebx
    1263:	5e                   	pop    %esi
    1264:	5f                   	pop    %edi
    1265:	5d                   	pop    %ebp
    1266:	c3                   	ret    
    1267:	90                   	nop
    1268:	90                   	nop
    1269:	90                   	nop
    126a:	90                   	nop
    126b:	90                   	nop
    126c:	90                   	nop
    126d:	90                   	nop
    126e:	90                   	nop
    126f:	90                   	nop

infblock.o:     file format pe-i386


Disassembly of section .text:

00000000 <_inflate_blocks_reset>:

void inflate_blocks_reset(s, z, c)
inflate_blocks_statef *s;
z_streamp z;
uLongf *c;
{
       0:	56                   	push   %esi
       1:	53                   	push   %ebx
       2:	83 ec 14             	sub    $0x14,%esp
       5:	8b 44 24 28          	mov    0x28(%esp),%eax
       9:	8b 5c 24 20          	mov    0x20(%esp),%ebx
       d:	8b 74 24 24          	mov    0x24(%esp),%esi
  if (c != Z_NULL)
      11:	85 c0                	test   %eax,%eax
      13:	74 05                	je     1a <_inflate_blocks_reset+0x1a>
    *c = s->check;
      15:	8b 53 3c             	mov    0x3c(%ebx),%edx
      18:	89 10                	mov    %edx,(%eax)
  if (s->mode == BTREE || s->mode == DTREE)
      1a:	8b 03                	mov    (%ebx),%eax
      1c:	8d 50 fc             	lea    -0x4(%eax),%edx
      1f:	83 fa 01             	cmp    $0x1,%edx
      22:	76 5f                	jbe    83 <_inflate_blocks_reset+0x83>
    ZFREE(z, s->sub.trees.blens);
  if (s->mode == CODES)
      24:	83 f8 06             	cmp    $0x6,%eax
      27:	74 49                	je     72 <_inflate_blocks_reset+0x72>
    inflate_codes_free(s->sub.decode.codes, z);
  s->mode = TYPE;
  s->bitk = 0;
  s->bitb = 0;
  s->read = s->write = s->window;
      29:	8b 43 28             	mov    0x28(%ebx),%eax
    *c = s->check;
  if (s->mode == BTREE || s->mode == DTREE)
    ZFREE(z, s->sub.trees.blens);
  if (s->mode == CODES)
    inflate_codes_free(s->sub.decode.codes, z);
  s->mode = TYPE;
      2c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  s->bitk = 0;
  s->bitb = 0;
  s->read = s->write = s->window;
      32:	89 43 34             	mov    %eax,0x34(%ebx)
      35:	89 43 30             	mov    %eax,0x30(%ebx)
  if (s->checkfn != Z_NULL)
      38:	8b 43 38             	mov    0x38(%ebx),%eax
  if (s->mode == BTREE || s->mode == DTREE)
    ZFREE(z, s->sub.trees.blens);
  if (s->mode == CODES)
    inflate_codes_free(s->sub.decode.codes, z);
  s->mode = TYPE;
  s->bitk = 0;
      3b:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
  s->bitb = 0;
      42:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  s->read = s->write = s->window;
  if (s->checkfn != Z_NULL)
      49:	85 c0                	test   %eax,%eax
      4b:	74 1f                	je     6c <_inflate_blocks_reset+0x6c>
    z->adler = s->check = (*s->checkfn)(0L, (const Bytef *)Z_NULL, 0);
      4d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
      54:	00 
      55:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      5c:	00 
      5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      64:	ff d0                	call   *%eax
      66:	89 43 3c             	mov    %eax,0x3c(%ebx)
      69:	89 46 30             	mov    %eax,0x30(%esi)
  Tracev((stderr, "inflate:   blocks reset\n"));
}
      6c:	83 c4 14             	add    $0x14,%esp
      6f:	5b                   	pop    %ebx
      70:	5e                   	pop    %esi
      71:	c3                   	ret    
  if (c != Z_NULL)
    *c = s->check;
  if (s->mode == BTREE || s->mode == DTREE)
    ZFREE(z, s->sub.trees.blens);
  if (s->mode == CODES)
    inflate_codes_free(s->sub.decode.codes, z);
      72:	89 74 24 04          	mov    %esi,0x4(%esp)
      76:	8b 43 04             	mov    0x4(%ebx),%eax
      79:	89 04 24             	mov    %eax,(%esp)
      7c:	e8 00 00 00 00       	call   81 <_inflate_blocks_reset+0x81>
      81:	eb a6                	jmp    29 <_inflate_blocks_reset+0x29>
uLongf *c;
{
  if (c != Z_NULL)
    *c = s->check;
  if (s->mode == BTREE || s->mode == DTREE)
    ZFREE(z, s->sub.trees.blens);
      83:	8b 43 0c             	mov    0xc(%ebx),%eax
      86:	89 44 24 04          	mov    %eax,0x4(%esp)
      8a:	8b 46 28             	mov    0x28(%esi),%eax
      8d:	89 04 24             	mov    %eax,(%esp)
      90:	ff 56 24             	call   *0x24(%esi)
      93:	8b 03                	mov    (%ebx),%eax
      95:	eb 8d                	jmp    24 <_inflate_blocks_reset+0x24>
      97:	89 f6                	mov    %esi,%esi
      99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000a0 <_inflate_blocks_new>:

inflate_blocks_statef *inflate_blocks_new(z, c, w)
z_streamp z;
check_func c;
uInt w;
{
      a0:	57                   	push   %edi
      a1:	56                   	push   %esi
      a2:	53                   	push   %ebx
      a3:	83 ec 10             	sub    $0x10,%esp
      a6:	8b 74 24 20          	mov    0x20(%esp),%esi
  inflate_blocks_statef *s;

  if ((s = (inflate_blocks_statef *)ZALLOC
      aa:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
      b1:	00 
      b2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
      b9:	00 

inflate_blocks_statef *inflate_blocks_new(z, c, w)
z_streamp z;
check_func c;
uInt w;
{
      ba:	8b 7c 24 28          	mov    0x28(%esp),%edi
  inflate_blocks_statef *s;

  if ((s = (inflate_blocks_statef *)ZALLOC
      be:	8b 46 28             	mov    0x28(%esi),%eax
      c1:	89 04 24             	mov    %eax,(%esp)
      c4:	ff 56 20             	call   *0x20(%esi)
      c7:	89 c3                	mov    %eax,%ebx
      c9:	85 c0                	test   %eax,%eax
      cb:	74 6b                	je     138 <_inflate_blocks_new+0x98>
       (z,1,sizeof(struct inflate_blocks_state))) == Z_NULL)
    return s;
  if ((s->hufts =
       (inflate_huft *)ZALLOC(z, sizeof(inflate_huft), MANY)) == Z_NULL)
      cd:	c7 44 24 08 a0 05 00 	movl   $0x5a0,0x8(%esp)
      d4:	00 
      d5:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
      dc:	00 
      dd:	8b 46 28             	mov    0x28(%esi),%eax
      e0:	89 04 24             	mov    %eax,(%esp)
      e3:	ff 56 20             	call   *0x20(%esi)
  inflate_blocks_statef *s;

  if ((s = (inflate_blocks_statef *)ZALLOC
       (z,1,sizeof(struct inflate_blocks_state))) == Z_NULL)
    return s;
  if ((s->hufts =
      e6:	89 43 24             	mov    %eax,0x24(%ebx)
      e9:	85 c0                	test   %eax,%eax
      eb:	74 64                	je     151 <_inflate_blocks_new+0xb1>
       (inflate_huft *)ZALLOC(z, sizeof(inflate_huft), MANY)) == Z_NULL)
  {
    ZFREE(z, s);
    return Z_NULL;
  }
  if ((s->window = (Bytef *)ZALLOC(z, 1, w)) == Z_NULL)
      ed:	89 7c 24 08          	mov    %edi,0x8(%esp)
      f1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
      f8:	00 
      f9:	8b 46 28             	mov    0x28(%esi),%eax
      fc:	89 04 24             	mov    %eax,(%esp)
      ff:	ff 56 20             	call   *0x20(%esi)
     102:	89 43 28             	mov    %eax,0x28(%ebx)
     105:	85 c0                	test   %eax,%eax
     107:	74 38                	je     141 <_inflate_blocks_new+0xa1>
  {
    ZFREE(z, s->hufts);
    ZFREE(z, s);
    return Z_NULL;
  }
  s->end = s->window + w;
     109:	01 c7                	add    %eax,%edi
  s->checkfn = c;
     10b:	8b 44 24 24          	mov    0x24(%esp),%eax
     10f:	89 43 38             	mov    %eax,0x38(%ebx)
  {
    ZFREE(z, s->hufts);
    ZFREE(z, s);
    return Z_NULL;
  }
  s->end = s->window + w;
     112:	89 7b 2c             	mov    %edi,0x2c(%ebx)
  s->checkfn = c;
  s->mode = TYPE;
     115:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  Tracev((stderr, "inflate:   blocks allocated\n"));
  inflate_blocks_reset(s, z, Z_NULL);
     11b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     122:	00 
     123:	89 74 24 04          	mov    %esi,0x4(%esp)
     127:	89 1c 24             	mov    %ebx,(%esp)
     12a:	e8 d1 fe ff ff       	call   0 <_inflate_blocks_reset>
  return s;
     12f:	89 d8                	mov    %ebx,%eax
}
     131:	83 c4 10             	add    $0x10,%esp
     134:	5b                   	pop    %ebx
     135:	5e                   	pop    %esi
     136:	5f                   	pop    %edi
     137:	c3                   	ret    
     138:	83 c4 10             	add    $0x10,%esp
     13b:	31 c0                	xor    %eax,%eax
     13d:	5b                   	pop    %ebx
     13e:	5e                   	pop    %esi
     13f:	5f                   	pop    %edi
     140:	c3                   	ret    
    ZFREE(z, s);
    return Z_NULL;
  }
  if ((s->window = (Bytef *)ZALLOC(z, 1, w)) == Z_NULL)
  {
    ZFREE(z, s->hufts);
     141:	8b 43 24             	mov    0x24(%ebx),%eax
     144:	89 44 24 04          	mov    %eax,0x4(%esp)
     148:	8b 46 28             	mov    0x28(%esi),%eax
     14b:	89 04 24             	mov    %eax,(%esp)
     14e:	ff 56 24             	call   *0x24(%esi)
    ZFREE(z, s);
     151:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     155:	8b 46 28             	mov    0x28(%esi),%eax
     158:	89 04 24             	mov    %eax,(%esp)
     15b:	ff 56 24             	call   *0x24(%esi)
    return Z_NULL;
     15e:	31 c0                	xor    %eax,%eax
     160:	eb cf                	jmp    131 <_inflate_blocks_new+0x91>
     162:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <_inflate_blocks>:

int inflate_blocks(s, z, r)
inflate_blocks_statef *s;
z_streamp z;
int r;
{
     170:	55                   	push   %ebp
     171:	57                   	push   %edi
     172:	56                   	push   %esi
     173:	53                   	push   %ebx
     174:	83 ec 6c             	sub    $0x6c,%esp
     177:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
  uInt n;               /* bytes available there */
  Bytef *q;             /* output window write pointer */
  uInt m;               /* bytes to end of window or read pointer */

  /* copy input/output information to locals (UPDATE macro restores) */
  LOAD
     17e:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     185:	8b 30                	mov    (%eax),%esi
     187:	8b 50 04             	mov    0x4(%eax),%edx
     18a:	8b 45 34             	mov    0x34(%ebp),%eax
     18d:	8b 7d 20             	mov    0x20(%ebp),%edi
     190:	89 c1                	mov    %eax,%ecx
     192:	89 44 24 30          	mov    %eax,0x30(%esp)
     196:	8b 45 30             	mov    0x30(%ebp),%eax
     199:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
     19c:	39 c1                	cmp    %eax,%ecx
     19e:	73 34                	jae    1d4 <_inflate_blocks+0x64>
     1a0:	29 c8                	sub    %ecx,%eax
     1a2:	48                   	dec    %eax
     1a3:	89 44 24 34          	mov    %eax,0x34(%esp)
     1a7:	89 ac 24 80 00 00 00 	mov    %ebp,0x80(%esp)
     1ae:	8b 45 00             	mov    0x0(%ebp),%eax
     1b1:	89 fd                	mov    %edi,%ebp
     1b3:	89 df                	mov    %ebx,%edi
     1b5:	89 d3                	mov    %edx,%ebx
     1b7:	8b 94 24 80 00 00 00 	mov    0x80(%esp),%edx

  /* process input based on current state */
  while (1) switch (s->mode)
     1be:	83 f8 09             	cmp    $0x9,%eax
     1c1:	0f 87 9a 07 00 00    	ja     961 <_inflate_blocks+0x7f1>
     1c7:	89 f1                	mov    %esi,%ecx
     1c9:	89 fe                	mov    %edi,%esi
     1cb:	89 cf                	mov    %ecx,%edi
     1cd:	ff 24 85 70 00 00 00 	jmp    *0x70(,%eax,4)
  uInt n;               /* bytes available there */
  Bytef *q;             /* output window write pointer */
  uInt m;               /* bytes to end of window or read pointer */

  /* copy input/output information to locals (UPDATE macro restores) */
  LOAD
     1d4:	8b 45 2c             	mov    0x2c(%ebp),%eax
     1d7:	8b 4c 24 30          	mov    0x30(%esp),%ecx
     1db:	29 c8                	sub    %ecx,%eax
     1dd:	89 44 24 34          	mov    %eax,0x34(%esp)
     1e1:	eb c4                	jmp    1a7 <_inflate_blocks+0x37>
     1e3:	8b 94 24 80 00 00 00 	mov    0x80(%esp),%edx
     1ea:	89 44 24 34          	mov    %eax,0x34(%esp)
        inflate_codes_statef *c;

        bl = 9;         /* must be <= 9 for lookahead assumptions */
        bd = 6;         /* must be <= 9 for lookahead assumptions */
        t = s->sub.trees.table;
        t = inflate_trees_dynamic(257 + (t & 0x1f), 1 + ((t >> 5) & 0x1f),
     1ee:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     1f5:	89 54 24 3c          	mov    %edx,0x3c(%esp)
            s->sub.trees.blens[i++] = c;
          } while (--j);
          s->sub.trees.index = i;
        }
      }
      s->sub.trees.tb = Z_NULL;
     1f9:	c7 42 14 00 00 00 00 	movl   $0x0,0x14(%edx)
        inflate_codes_statef *c;

        bl = 9;         /* must be <= 9 for lookahead assumptions */
        bd = 6;         /* must be <= 9 for lookahead assumptions */
        t = s->sub.trees.table;
        t = inflate_trees_dynamic(257 + (t & 0x1f), 1 + ((t >> 5) & 0x1f),
     200:	89 44 24 20          	mov    %eax,0x20(%esp)
     204:	8b 42 24             	mov    0x24(%edx),%eax
      {
        uInt bl, bd;
        inflate_huft *tl, *td;
        inflate_codes_statef *c;

        bl = 9;         /* must be <= 9 for lookahead assumptions */
     207:	c7 44 24 50 09 00 00 	movl   $0x9,0x50(%esp)
     20e:	00 
        bd = 6;         /* must be <= 9 for lookahead assumptions */
        t = s->sub.trees.table;
        t = inflate_trees_dynamic(257 + (t & 0x1f), 1 + ((t >> 5) & 0x1f),
     20f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     213:	8d 44 24 5c          	lea    0x5c(%esp),%eax
     217:	89 44 24 18          	mov    %eax,0x18(%esp)
     21b:	8d 44 24 58          	lea    0x58(%esp),%eax
     21f:	89 44 24 14          	mov    %eax,0x14(%esp)
     223:	8d 44 24 54          	lea    0x54(%esp),%eax
     227:	89 44 24 10          	mov    %eax,0x10(%esp)
     22b:	8d 44 24 50          	lea    0x50(%esp),%eax
     22f:	89 44 24 0c          	mov    %eax,0xc(%esp)
        uInt bl, bd;
        inflate_huft *tl, *td;
        inflate_codes_statef *c;

        bl = 9;         /* must be <= 9 for lookahead assumptions */
        bd = 6;         /* must be <= 9 for lookahead assumptions */
     233:	c7 44 24 54 06 00 00 	movl   $0x6,0x54(%esp)
     23a:	00 
        t = s->sub.trees.table;
        t = inflate_trees_dynamic(257 + (t & 0x1f), 1 + ((t >> 5) & 0x1f),
     23b:	8b 42 0c             	mov    0xc(%edx),%eax
     23e:	89 44 24 08          	mov    %eax,0x8(%esp)
     242:	8b 44 24 34          	mov    0x34(%esp),%eax
     246:	40                   	inc    %eax
     247:	89 44 24 04          	mov    %eax,0x4(%esp)
     24b:	8d 81 01 01 00 00    	lea    0x101(%ecx),%eax
     251:	89 04 24             	mov    %eax,(%esp)
     254:	e8 00 00 00 00       	call   259 <_inflate_blocks+0xe9>
                                  s->sub.trees.blens, &bl, &bd, &tl, &td,
                                  s->hufts, z);
        ZFREE(z, s->sub.trees.blens);
     259:	8b 54 24 3c          	mov    0x3c(%esp),%edx
        inflate_codes_statef *c;

        bl = 9;         /* must be <= 9 for lookahead assumptions */
        bd = 6;         /* must be <= 9 for lookahead assumptions */
        t = s->sub.trees.table;
        t = inflate_trees_dynamic(257 + (t & 0x1f), 1 + ((t >> 5) & 0x1f),
     25d:	89 44 24 38          	mov    %eax,0x38(%esp)
                                  s->sub.trees.blens, &bl, &bd, &tl, &td,
                                  s->hufts, z);
        ZFREE(z, s->sub.trees.blens);
     261:	8b 4a 0c             	mov    0xc(%edx),%ecx
     264:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     26b:	89 4c 24 04          	mov    %ecx,0x4(%esp)
     26f:	89 54 24 34          	mov    %edx,0x34(%esp)
     273:	8b 48 28             	mov    0x28(%eax),%ecx
     276:	89 0c 24             	mov    %ecx,(%esp)
     279:	ff 50 24             	call   *0x24(%eax)
        if (t != Z_OK)
     27c:	8b 44 24 38          	mov    0x38(%esp),%eax
     280:	85 c0                	test   %eax,%eax
     282:	8b 54 24 34          	mov    0x34(%esp),%edx
     286:	0f 85 e1 0d 00 00    	jne    106d <_inflate_blocks+0xefd>
            s->mode = BAD;
          r = t;
          LEAVE
        }
        Tracev((stderr, "inflate:       trees ok\n"));
        if ((c = inflate_codes_new(bl, bd, tl, td, z)) == Z_NULL)
     28c:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     293:	89 54 24 34          	mov    %edx,0x34(%esp)
     297:	89 44 24 10          	mov    %eax,0x10(%esp)
     29b:	8b 44 24 5c          	mov    0x5c(%esp),%eax
     29f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     2a3:	8b 44 24 58          	mov    0x58(%esp),%eax
     2a7:	89 44 24 08          	mov    %eax,0x8(%esp)
     2ab:	8b 44 24 54          	mov    0x54(%esp),%eax
     2af:	89 44 24 04          	mov    %eax,0x4(%esp)
     2b3:	8b 44 24 50          	mov    0x50(%esp),%eax
     2b7:	89 04 24             	mov    %eax,(%esp)
     2ba:	e8 00 00 00 00       	call   2bf <_inflate_blocks+0x14f>
     2bf:	8b 54 24 34          	mov    0x34(%esp),%edx
     2c3:	85 c0                	test   %eax,%eax
     2c5:	0f 84 39 0c 00 00    	je     f04 <_inflate_blocks+0xd94>
        {
          r = Z_MEM_ERROR;
          LEAVE
        }
        s->sub.decode.codes = c;
     2cb:	89 42 04             	mov    %eax,0x4(%edx)
      }
      s->mode = CODES;
     2ce:	c7 02 06 00 00 00    	movl   $0x6,(%edx)
    case CODES:
      UPDATE
     2d4:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     2db:	89 72 1c             	mov    %esi,0x1c(%edx)
     2de:	89 c6                	mov    %eax,%esi
     2e0:	89 6a 20             	mov    %ebp,0x20(%edx)
     2e3:	89 58 04             	mov    %ebx,0x4(%eax)
     2e6:	89 f8                	mov    %edi,%eax
     2e8:	8b 1e                	mov    (%esi),%ebx
     2ea:	8b 6e 08             	mov    0x8(%esi),%ebp
     2ed:	29 d8                	sub    %ebx,%eax
     2ef:	89 3e                	mov    %edi,(%esi)
     2f1:	01 c5                	add    %eax,%ebp
     2f3:	8b 44 24 30          	mov    0x30(%esp),%eax
     2f7:	89 6e 08             	mov    %ebp,0x8(%esi)
     2fa:	89 42 34             	mov    %eax,0x34(%edx)
      if ((r = inflate_codes(s, z, r)) != Z_STREAM_END)
     2fd:	8b 84 24 88 00 00 00 	mov    0x88(%esp),%eax
     304:	89 14 24             	mov    %edx,(%esp)
     307:	89 44 24 08          	mov    %eax,0x8(%esp)
     30b:	89 74 24 04          	mov    %esi,0x4(%esp)
     30f:	89 54 24 30          	mov    %edx,0x30(%esp)
     313:	e8 00 00 00 00       	call   318 <_inflate_blocks+0x1a8>
     318:	8b 54 24 30          	mov    0x30(%esp),%edx
     31c:	83 f8 01             	cmp    $0x1,%eax
     31f:	0f 85 d9 0a 00 00    	jne    dfe <_inflate_blocks+0xc8e>
        return inflate_flush(s, z, r);
      r = Z_OK;
      inflate_codes_free(s->sub.decode.codes, z);
     325:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     32c:	89 54 24 30          	mov    %edx,0x30(%esp)
     330:	89 44 24 04          	mov    %eax,0x4(%esp)
     334:	8b 42 04             	mov    0x4(%edx),%eax
     337:	89 04 24             	mov    %eax,(%esp)
     33a:	e8 00 00 00 00       	call   33f <_inflate_blocks+0x1cf>
      LOAD
     33f:	8b 54 24 30          	mov    0x30(%esp),%edx
     343:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     34a:	8b 6a 20             	mov    0x20(%edx),%ebp
     34d:	8b 72 1c             	mov    0x1c(%edx),%esi
     350:	8b 38                	mov    (%eax),%edi
     352:	8b 58 04             	mov    0x4(%eax),%ebx
     355:	8b 42 34             	mov    0x34(%edx),%eax
     358:	89 c1                	mov    %eax,%ecx
     35a:	89 44 24 30          	mov    %eax,0x30(%esp)
     35e:	8b 42 30             	mov    0x30(%edx),%eax
     361:	39 c1                	cmp    %eax,%ecx
     363:	0f 83 5e 07 00 00    	jae    ac7 <_inflate_blocks+0x957>
     369:	29 c8                	sub    %ecx,%eax
     36b:	48                   	dec    %eax
     36c:	89 44 24 34          	mov    %eax,0x34(%esp)
      Tracev((stderr, "inflate:       codes end, %lu total out\n",
              z->total_out + (q >= s->read ? q - s->read :
              (s->end - s->read) + (q - s->window))));
      if (!s->last)
     370:	8b 42 18             	mov    0x18(%edx),%eax
     373:	85 c0                	test   %eax,%eax
     375:	0f 85 2e 0b 00 00    	jne    ea9 <_inflate_blocks+0xd39>
      {
        s->mode = TYPE;
     37b:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
        break;
     381:	31 c0                	xor    %eax,%eax
      s->mode = CODES;
    case CODES:
      UPDATE
      if ((r = inflate_codes(s, z, r)) != Z_STREAM_END)
        return inflate_flush(s, z, r);
      r = Z_OK;
     383:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     38a:	00 00 00 00 
              z->total_out + (q >= s->read ? q - s->read :
              (s->end - s->read) + (q - s->window))));
      if (!s->last)
      {
        s->mode = TYPE;
        break;
     38e:	e9 3a fe ff ff       	jmp    1cd <_inflate_blocks+0x5d>

  /* process input based on current state */
  while (1) switch (s->mode)
  {
    case TYPE:
      NEEDBITS(3)
     393:	83 fe 02             	cmp    $0x2,%esi
     396:	77 23                	ja     3bb <_inflate_blocks+0x24b>
     398:	85 db                	test   %ebx,%ebx
     39a:	0f 84 46 0a 00 00    	je     de6 <_inflate_blocks+0xc76>
     3a0:	47                   	inc    %edi
     3a1:	31 c0                	xor    %eax,%eax
     3a3:	89 f1                	mov    %esi,%ecx
     3a5:	4b                   	dec    %ebx
     3a6:	8a 47 ff             	mov    -0x1(%edi),%al
     3a9:	83 c6 08             	add    $0x8,%esi
     3ac:	d3 e0                	shl    %cl,%eax
     3ae:	09 c5                	or     %eax,%ebp
     3b0:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     3b7:	00 00 00 00 
      t = (uInt)b & 7;
      s->last = t & 1;
     3bb:	89 e8                	mov    %ebp,%eax
     3bd:	83 e0 01             	and    $0x1,%eax
     3c0:	89 42 18             	mov    %eax,0x18(%edx)
  /* process input based on current state */
  while (1) switch (s->mode)
  {
    case TYPE:
      NEEDBITS(3)
      t = (uInt)b & 7;
     3c3:	89 e8                	mov    %ebp,%eax
     3c5:	83 e0 07             	and    $0x7,%eax
      s->last = t & 1;
      switch (t >> 1)
     3c8:	d1 e8                	shr    %eax
     3ca:	83 f8 02             	cmp    $0x2,%eax
     3cd:	0f 84 ae 08 00 00    	je     c81 <_inflate_blocks+0xb11>
     3d3:	83 f8 03             	cmp    $0x3,%eax
     3d6:	0f 84 a6 09 00 00    	je     d82 <_inflate_blocks+0xc12>
     3dc:	48                   	dec    %eax
     3dd:	0f 84 18 09 00 00    	je     cfb <_inflate_blocks+0xb8b>
      {
        case 0:                         /* stored */
          Tracev((stderr, "inflate:     stored block%s\n",
                 s->last ? " (last)" : ""));
          DUMPBITS(3)
     3e3:	83 ee 03             	sub    $0x3,%esi
     3e6:	89 e8                	mov    %ebp,%eax
          t = k & 7;                    /* go to byte boundary */
     3e8:	89 f1                	mov    %esi,%ecx
          DUMPBITS(t)
          s->mode = LENS;               /* get length of stored block */
     3ea:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
      switch (t >> 1)
      {
        case 0:                         /* stored */
          Tracev((stderr, "inflate:     stored block%s\n",
                 s->last ? " (last)" : ""));
          DUMPBITS(3)
     3f0:	c1 e8 03             	shr    $0x3,%eax
          t = k & 7;                    /* go to byte boundary */
     3f3:	83 e1 07             	and    $0x7,%ecx
          DUMPBITS(t)
     3f6:	d3 e8                	shr    %cl,%eax
     3f8:	89 c5                	mov    %eax,%ebp
     3fa:	29 ce                	sub    %ecx,%esi
          s->mode = LENS;               /* get length of stored block */
          break;
     3fc:	b8 01 00 00 00       	mov    $0x1,%eax
     401:	e9 c7 fd ff ff       	jmp    1cd <_inflate_blocks+0x5d>
     406:	89 f8                	mov    %edi,%eax
     408:	89 f7                	mov    %esi,%edi
          r = Z_DATA_ERROR;
          LEAVE
      }
      break;
    case LENS:
      NEEDBITS(32)
     40a:	83 ff 1f             	cmp    $0x1f,%edi
     40d:	89 c6                	mov    %eax,%esi
     40f:	77 37                	ja     448 <_inflate_blocks+0x2d8>
     411:	85 db                	test   %ebx,%ebx
     413:	0f 84 da 09 00 00    	je     df3 <_inflate_blocks+0xc83>
     419:	89 f9                	mov    %edi,%ecx
     41b:	eb 0b                	jmp    428 <_inflate_blocks+0x2b8>
     41d:	8d 76 00             	lea    0x0(%esi),%esi
     420:	85 db                	test   %ebx,%ebx
     422:	0f 84 d8 07 00 00    	je     c00 <_inflate_blocks+0xa90>
     428:	46                   	inc    %esi
     429:	31 c0                	xor    %eax,%eax
     42b:	4b                   	dec    %ebx
     42c:	8a 46 ff             	mov    -0x1(%esi),%al
     42f:	d3 e0                	shl    %cl,%eax
     431:	83 c1 08             	add    $0x8,%ecx
     434:	09 c5                	or     %eax,%ebp
     436:	83 f9 1f             	cmp    $0x1f,%ecx
     439:	76 e5                	jbe    420 <_inflate_blocks+0x2b0>
     43b:	89 cf                	mov    %ecx,%edi
     43d:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     444:	00 00 00 00 
      if ((((~b) >> 16) & 0xffff) != (b & 0xffff))
     448:	89 e8                	mov    %ebp,%eax
     44a:	83 f0 ff             	xor    $0xffffffff,%eax
     44d:	c1 e8 10             	shr    $0x10,%eax
     450:	89 c1                	mov    %eax,%ecx
     452:	31 c0                	xor    %eax,%eax
     454:	66 89 e8             	mov    %bp,%ax
     457:	39 c1                	cmp    %eax,%ecx
     459:	0f 85 77 0a 00 00    	jne    ed6 <_inflate_blocks+0xd66>
        s->mode = BAD;
        z->msg = (char*)"invalid stored block lengths";
        r = Z_DATA_ERROR;
        LEAVE
      }
      s->sub.left = (uInt)b & 0xffff;
     45f:	89 4a 04             	mov    %ecx,0x4(%edx)
      b = k = 0;                      /* dump bits */
      Tracev((stderr, "inflate:       stored length %u\n", s->sub.left));
      s->mode = s->sub.left ? STORED : (s->last ? DRY : TYPE);
     462:	b8 02 00 00 00       	mov    $0x2,%eax
     467:	85 c9                	test   %ecx,%ecx
     469:	75 0c                	jne    477 <_inflate_blocks+0x307>
     46b:	83 7a 18 01          	cmpl   $0x1,0x18(%edx)
     46f:	19 c0                	sbb    %eax,%eax
     471:	83 f0 ff             	xor    $0xffffffff,%eax
     474:	83 e0 07             	and    $0x7,%eax
     477:	89 02                	mov    %eax,(%edx)
        z->msg = (char*)"invalid stored block lengths";
        r = Z_DATA_ERROR;
        LEAVE
      }
      s->sub.left = (uInt)b & 0xffff;
      b = k = 0;                      /* dump bits */
     479:	31 ff                	xor    %edi,%edi
     47b:	31 ed                	xor    %ebp,%ebp
      Tracev((stderr, "inflate:       stored length %u\n", s->sub.left));
      s->mode = s->sub.left ? STORED : (s->last ? DRY : TYPE);
      break;
     47d:	e9 3c fd ff ff       	jmp    1be <_inflate_blocks+0x4e>
              z->total_out + (q >= s->read ? q - s->read :
              (s->end - s->read) + (q - s->window))));
      s->mode = s->last ? DRY : TYPE;
      break;
    case TABLE:
      NEEDBITS(14)
     482:	83 fe 0d             	cmp    $0xd,%esi
     485:	77 34                	ja     4bb <_inflate_blocks+0x34b>
     487:	85 db                	test   %ebx,%ebx
     489:	0f 84 57 09 00 00    	je     de6 <_inflate_blocks+0xc76>
     48f:	89 f1                	mov    %esi,%ecx
     491:	eb 08                	jmp    49b <_inflate_blocks+0x32b>
     493:	85 db                	test   %ebx,%ebx
     495:	0f 84 c5 07 00 00    	je     c60 <_inflate_blocks+0xaf0>
     49b:	47                   	inc    %edi
     49c:	31 c0                	xor    %eax,%eax
     49e:	4b                   	dec    %ebx
     49f:	8a 47 ff             	mov    -0x1(%edi),%al
     4a2:	d3 e0                	shl    %cl,%eax
     4a4:	83 c1 08             	add    $0x8,%ecx
     4a7:	09 c5                	or     %eax,%ebp
     4a9:	83 f9 0d             	cmp    $0xd,%ecx
     4ac:	76 e5                	jbe    493 <_inflate_blocks+0x323>
     4ae:	89 ce                	mov    %ecx,%esi
     4b0:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     4b7:	00 00 00 00 
      s->sub.trees.table = t = (uInt)b & 0x3fff;
     4bb:	89 e8                	mov    %ebp,%eax
#ifndef PKZIP_BUG_WORKAROUND
      if ((t & 0x1f) > 29 || ((t >> 5) & 0x1f) > 29)
     4bd:	89 e9                	mov    %ebp,%ecx
              (s->end - s->read) + (q - s->window))));
      s->mode = s->last ? DRY : TYPE;
      break;
    case TABLE:
      NEEDBITS(14)
      s->sub.trees.table = t = (uInt)b & 0x3fff;
     4bf:	25 ff 3f 00 00       	and    $0x3fff,%eax
#ifndef PKZIP_BUG_WORKAROUND
      if ((t & 0x1f) > 29 || ((t >> 5) & 0x1f) > 29)
     4c4:	83 e1 1f             	and    $0x1f,%ecx
              (s->end - s->read) + (q - s->window))));
      s->mode = s->last ? DRY : TYPE;
      break;
    case TABLE:
      NEEDBITS(14)
      s->sub.trees.table = t = (uInt)b & 0x3fff;
     4c7:	89 42 04             	mov    %eax,0x4(%edx)
#ifndef PKZIP_BUG_WORKAROUND
      if ((t & 0x1f) > 29 || ((t >> 5) & 0x1f) > 29)
     4ca:	83 f9 1d             	cmp    $0x1d,%ecx
     4cd:	0f 87 6e 09 00 00    	ja     e41 <_inflate_blocks+0xcd1>
     4d3:	c1 e8 05             	shr    $0x5,%eax
     4d6:	83 e0 1f             	and    $0x1f,%eax
     4d9:	83 f8 1d             	cmp    $0x1d,%eax
     4dc:	0f 87 5f 09 00 00    	ja     e41 <_inflate_blocks+0xcd1>
        z->msg = (char*)"too many length or distance symbols";
        r = Z_DATA_ERROR;
        LEAVE
      }
#endif
      t = 258 + (t & 0x1f) + ((t >> 5) & 0x1f);
     4e2:	8d 84 01 02 01 00 00 	lea    0x102(%ecx,%eax,1),%eax
      if ((s->sub.trees.blens = (uIntf*)ZALLOC(z, t, sizeof(uInt))) == Z_NULL)
     4e9:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
     4f0:	00 
     4f1:	89 44 24 04          	mov    %eax,0x4(%esp)
     4f5:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     4fc:	89 54 24 34          	mov    %edx,0x34(%esp)
     500:	8b 40 28             	mov    0x28(%eax),%eax
     503:	89 04 24             	mov    %eax,(%esp)
     506:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     50d:	ff 50 20             	call   *0x20(%eax)
     510:	8b 54 24 34          	mov    0x34(%esp),%edx
     514:	85 c0                	test   %eax,%eax
     516:	89 42 0c             	mov    %eax,0xc(%edx)
     519:	0f 84 e5 09 00 00    	je     f04 <_inflate_blocks+0xd94>
      {
        r = Z_MEM_ERROR;
        LEAVE
      }
      DUMPBITS(14)
     51f:	c1 ed 0e             	shr    $0xe,%ebp
     522:	83 ee 0e             	sub    $0xe,%esi
      s->sub.trees.index = 0;
     525:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
      Tracev((stderr, "inflate:       table sizes ok\n"));
      s->mode = BTREE;
     52c:	c7 02 04 00 00 00    	movl   $0x4,(%edx)
     532:	31 c0                	xor    %eax,%eax
     534:	e9 ca 01 00 00       	jmp    703 <_inflate_blocks+0x593>
     539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     540:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
     547:	89 da                	mov    %ebx,%edx
     549:	89 f3                	mov    %esi,%ebx
     54b:	89 fe                	mov    %edi,%esi
     54d:	89 ef                	mov    %ebp,%edi
     54f:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
        s->mode = TYPE;
        break;
      }
      s->mode = DRY;
    case DRY:
      FLUSH
     556:	8b 44 24 30          	mov    0x30(%esp),%eax
     55a:	89 54 24 34          	mov    %edx,0x34(%esp)
     55e:	89 45 34             	mov    %eax,0x34(%ebp)
     561:	8b 84 24 88 00 00 00 	mov    0x88(%esp),%eax
     568:	89 44 24 08          	mov    %eax,0x8(%esp)
     56c:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     573:	89 44 24 04          	mov    %eax,0x4(%esp)
     577:	89 2c 24             	mov    %ebp,(%esp)
     57a:	e8 00 00 00 00       	call   57f <_inflate_blocks+0x40f>
     57f:	8b 55 34             	mov    0x34(%ebp),%edx
     582:	89 54 24 30          	mov    %edx,0x30(%esp)
      if (s->read != s->write)
     586:	3b 55 30             	cmp    0x30(%ebp),%edx
     589:	8b 54 24 34          	mov    0x34(%esp),%edx
     58d:	0f 84 e2 06 00 00    	je     c75 <_inflate_blocks+0xb05>
        LEAVE
     593:	89 7d 20             	mov    %edi,0x20(%ebp)
     596:	8b bc 24 84 00 00 00 	mov    0x84(%esp),%edi
     59d:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     5a0:	8b 0f                	mov    (%edi),%ecx
     5a2:	89 57 04             	mov    %edx,0x4(%edi)
     5a5:	89 f2                	mov    %esi,%edx
     5a7:	8b 5f 08             	mov    0x8(%edi),%ebx
     5aa:	29 ca                	sub    %ecx,%edx
     5ac:	89 37                	mov    %esi,(%edi)
     5ae:	01 d3                	add    %edx,%ebx
     5b0:	89 5f 08             	mov    %ebx,0x8(%edi)
     5b3:	89 44 24 08          	mov    %eax,0x8(%esp)
     5b7:	89 7c 24 04          	mov    %edi,0x4(%esp)
     5bb:	89 2c 24             	mov    %ebp,(%esp)
     5be:	e8 00 00 00 00       	call   5c3 <_inflate_blocks+0x453>
      LEAVE
    default:
      r = Z_STREAM_ERROR;
      LEAVE
  }
}
     5c3:	83 c4 6c             	add    $0x6c,%esp
     5c6:	5b                   	pop    %ebx
     5c7:	5e                   	pop    %esi
     5c8:	5f                   	pop    %edi
     5c9:	5d                   	pop    %ebp
     5ca:	c3                   	ret    
     5cb:	90                   	nop
     5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     5d0:	89 f8                	mov    %edi,%eax
      b = k = 0;                      /* dump bits */
      Tracev((stderr, "inflate:       stored length %u\n", s->sub.left));
      s->mode = s->sub.left ? STORED : (s->last ? DRY : TYPE);
      break;
    case STORED:
      if (n == 0)
     5d2:	85 db                	test   %ebx,%ebx
     5d4:	89 f7                	mov    %esi,%edi
     5d6:	89 c6                	mov    %eax,%esi
     5d8:	0f 84 15 08 00 00    	je     df3 <_inflate_blocks+0xc83>
        LEAVE
      NEEDOUT
     5de:	8b 44 24 34          	mov    0x34(%esp),%eax
     5e2:	85 c0                	test   %eax,%eax
     5e4:	0f 85 66 04 00 00    	jne    a50 <_inflate_blocks+0x8e0>
     5ea:	8b 42 2c             	mov    0x2c(%edx),%eax
     5ed:	3b 44 24 30          	cmp    0x30(%esp),%eax
     5f1:	0f 84 1a 04 00 00    	je     a11 <_inflate_blocks+0x8a1>
     5f7:	8b 44 24 30          	mov    0x30(%esp),%eax
     5fb:	89 54 24 30          	mov    %edx,0x30(%esp)
     5ff:	89 42 34             	mov    %eax,0x34(%edx)
     602:	8b 84 24 88 00 00 00 	mov    0x88(%esp),%eax
     609:	89 44 24 08          	mov    %eax,0x8(%esp)
     60d:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     614:	89 14 24             	mov    %edx,(%esp)
     617:	89 44 24 04          	mov    %eax,0x4(%esp)
     61b:	e8 00 00 00 00       	call   620 <_inflate_blocks+0x4b0>
     620:	8b 54 24 30          	mov    0x30(%esp),%edx
     624:	89 44 24 3c          	mov    %eax,0x3c(%esp)
     628:	8b 4a 30             	mov    0x30(%edx),%ecx
     62b:	8b 42 34             	mov    0x34(%edx),%eax
     62e:	89 4c 24 38          	mov    %ecx,0x38(%esp)
     632:	89 44 24 30          	mov    %eax,0x30(%esp)
     636:	39 c8                	cmp    %ecx,%eax
     638:	0f 82 6e 06 00 00    	jb     cac <_inflate_blocks+0xb3c>
     63e:	8b 42 2c             	mov    0x2c(%edx),%eax
     641:	89 c1                	mov    %eax,%ecx
     643:	2b 4c 24 30          	sub    0x30(%esp),%ecx
     647:	89 4c 24 34          	mov    %ecx,0x34(%esp)
     64b:	39 44 24 30          	cmp    %eax,0x30(%esp)
     64f:	0f 84 c5 07 00 00    	je     e1a <_inflate_blocks+0xcaa>
     655:	8b 44 24 34          	mov    0x34(%esp),%eax
     659:	85 c0                	test   %eax,%eax
     65b:	0f 85 ef 03 00 00    	jne    a50 <_inflate_blocks+0x8e0>
     661:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
     668:	89 da                	mov    %ebx,%edx
     66a:	89 fb                	mov    %edi,%ebx
     66c:	89 ef                	mov    %ebp,%edi
     66e:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
     675:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     67c:	89 7d 20             	mov    %edi,0x20(%ebp)
     67f:	89 c7                	mov    %eax,%edi
     681:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     684:	89 50 04             	mov    %edx,0x4(%eax)
     687:	89 f0                	mov    %esi,%eax
     689:	89 fb                	mov    %edi,%ebx
     68b:	2b 07                	sub    (%edi),%eax
     68d:	89 37                	mov    %esi,(%edi)
     68f:	01 47 08             	add    %eax,0x8(%edi)
     692:	8b 44 24 30          	mov    0x30(%esp),%eax
     696:	89 45 34             	mov    %eax,0x34(%ebp)
     699:	8b 44 24 3c          	mov    0x3c(%esp),%eax
     69d:	e9 a5 05 00 00       	jmp    c47 <_inflate_blocks+0xad7>
     6a2:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
     6a9:	89 da                	mov    %ebx,%edx
     6ab:	89 f3                	mov    %esi,%ebx
     6ad:	89 fe                	mov    %edi,%esi
     6af:	89 ef                	mov    %ebp,%edi
     6b1:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
      if (s->read != s->write)
        LEAVE
      s->mode = DONE;
    case DONE:
      r = Z_STREAM_END;
      LEAVE
     6b8:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     6bf:	89 7d 20             	mov    %edi,0x20(%ebp)
     6c2:	89 c7                	mov    %eax,%edi
     6c4:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     6c7:	89 50 04             	mov    %edx,0x4(%eax)
     6ca:	89 f0                	mov    %esi,%eax
     6cc:	8b 0f                	mov    (%edi),%ecx
     6ce:	8b 5f 08             	mov    0x8(%edi),%ebx
     6d1:	29 c8                	sub    %ecx,%eax
     6d3:	89 37                	mov    %esi,(%edi)
     6d5:	01 c3                	add    %eax,%ebx
     6d7:	8b 44 24 30          	mov    0x30(%esp),%eax
     6db:	89 5f 08             	mov    %ebx,0x8(%edi)
     6de:	89 45 34             	mov    %eax,0x34(%ebp)
     6e1:	89 7c 24 04          	mov    %edi,0x4(%esp)
     6e5:	89 2c 24             	mov    %ebp,(%esp)
     6e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     6ef:	00 
     6f0:	e8 00 00 00 00       	call   6f5 <_inflate_blocks+0x585>
      LEAVE
    default:
      r = Z_STREAM_ERROR;
      LEAVE
  }
}
     6f5:	83 c4 6c             	add    $0x6c,%esp
     6f8:	5b                   	pop    %ebx
     6f9:	5e                   	pop    %esi
     6fa:	5f                   	pop    %edi
     6fb:	5d                   	pop    %ebp
     6fc:	c3                   	ret    
     6fd:	8d 76 00             	lea    0x0(%esi),%esi
     700:	8b 42 08             	mov    0x8(%edx),%eax
      DUMPBITS(14)
      s->sub.trees.index = 0;
      Tracev((stderr, "inflate:       table sizes ok\n"));
      s->mode = BTREE;
    case BTREE:
      while (s->sub.trees.index < 4 + (s->sub.trees.table >> 10))
     703:	8b 4a 04             	mov    0x4(%edx),%ecx
     706:	c1 e9 0a             	shr    $0xa,%ecx
     709:	83 c1 04             	add    $0x4,%ecx
     70c:	39 c8                	cmp    %ecx,%eax
     70e:	0f 83 96 00 00 00    	jae    7aa <_inflate_blocks+0x63a>
     714:	89 f1                	mov    %esi,%ecx
     716:	89 7c 24 34          	mov    %edi,0x34(%esp)
     71a:	89 d6                	mov    %edx,%esi
     71c:	89 c2                	mov    %eax,%edx
      {
        NEEDBITS(3)
     71e:	83 f9 02             	cmp    $0x2,%ecx
     721:	77 2d                	ja     750 <_inflate_blocks+0x5e0>
     723:	85 db                	test   %ebx,%ebx
     725:	0f 84 96 05 00 00    	je     cc1 <_inflate_blocks+0xb51>
     72b:	8b 44 24 34          	mov    0x34(%esp),%eax
     72f:	4b                   	dec    %ebx
     730:	40                   	inc    %eax
     731:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     738:	00 00 00 00 
     73c:	89 44 24 34          	mov    %eax,0x34(%esp)
     740:	31 c0                	xor    %eax,%eax
     742:	8b 7c 24 34          	mov    0x34(%esp),%edi
     746:	8a 47 ff             	mov    -0x1(%edi),%al
     749:	d3 e0                	shl    %cl,%eax
     74b:	09 c5                	or     %eax,%ebp
     74d:	83 c1 08             	add    $0x8,%ecx
        s->sub.trees.blens[border[s->sub.trees.index++]] = (uInt)b & 7;
     750:	8d 42 01             	lea    0x1(%edx),%eax
     753:	8b 7e 0c             	mov    0xc(%esi),%edi
     756:	89 46 08             	mov    %eax,0x8(%esi)
     759:	8b 04 95 a0 00 00 00 	mov    0xa0(,%edx,4),%eax
     760:	89 ea                	mov    %ebp,%edx
        DUMPBITS(3)
     762:	83 e9 03             	sub    $0x3,%ecx
     765:	c1 ed 03             	shr    $0x3,%ebp
      s->mode = BTREE;
    case BTREE:
      while (s->sub.trees.index < 4 + (s->sub.trees.table >> 10))
      {
        NEEDBITS(3)
        s->sub.trees.blens[border[s->sub.trees.index++]] = (uInt)b & 7;
     768:	83 e2 07             	and    $0x7,%edx
     76b:	89 14 87             	mov    %edx,(%edi,%eax,4)
      DUMPBITS(14)
      s->sub.trees.index = 0;
      Tracev((stderr, "inflate:       table sizes ok\n"));
      s->mode = BTREE;
    case BTREE:
      while (s->sub.trees.index < 4 + (s->sub.trees.table >> 10))
     76e:	8b 46 04             	mov    0x4(%esi),%eax
     771:	8b 56 08             	mov    0x8(%esi),%edx
     774:	c1 e8 0a             	shr    $0xa,%eax
     777:	83 c0 04             	add    $0x4,%eax
     77a:	39 c2                	cmp    %eax,%edx
     77c:	72 a0                	jb     71e <_inflate_blocks+0x5ae>
     77e:	89 d0                	mov    %edx,%eax
     780:	8b 7c 24 34          	mov    0x34(%esp),%edi
     784:	89 f2                	mov    %esi,%edx
     786:	89 ce                	mov    %ecx,%esi
     788:	eb 20                	jmp    7aa <_inflate_blocks+0x63a>
     78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        NEEDBITS(3)
        s->sub.trees.blens[border[s->sub.trees.index++]] = (uInt)b & 7;
        DUMPBITS(3)
      }
      while (s->sub.trees.index < 19)
        s->sub.trees.blens[border[s->sub.trees.index++]] = 0;
     790:	8d 48 01             	lea    0x1(%eax),%ecx
     793:	8b 04 85 a0 00 00 00 	mov    0xa0(,%eax,4),%eax
     79a:	89 4a 08             	mov    %ecx,0x8(%edx)
     79d:	8b 4a 0c             	mov    0xc(%edx),%ecx
     7a0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
      {
        NEEDBITS(3)
        s->sub.trees.blens[border[s->sub.trees.index++]] = (uInt)b & 7;
        DUMPBITS(3)
      }
      while (s->sub.trees.index < 19)
     7a7:	8b 42 08             	mov    0x8(%edx),%eax
     7aa:	83 f8 12             	cmp    $0x12,%eax
     7ad:	76 e1                	jbe    790 <_inflate_blocks+0x620>
        s->sub.trees.blens[border[s->sub.trees.index++]] = 0;
      s->sub.trees.bb = 7;
      t = inflate_trees_bits(s->sub.trees.blens, &s->sub.trees.bb,
     7af:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
        s->sub.trees.blens[border[s->sub.trees.index++]] = (uInt)b & 7;
        DUMPBITS(3)
      }
      while (s->sub.trees.index < 19)
        s->sub.trees.blens[border[s->sub.trees.index++]] = 0;
      s->sub.trees.bb = 7;
     7b6:	c7 42 10 07 00 00 00 	movl   $0x7,0x10(%edx)
      t = inflate_trees_bits(s->sub.trees.blens, &s->sub.trees.bb,
     7bd:	89 44 24 10          	mov    %eax,0x10(%esp)
     7c1:	89 54 24 34          	mov    %edx,0x34(%esp)
     7c5:	8b 42 24             	mov    0x24(%edx),%eax
     7c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     7cc:	8d 42 14             	lea    0x14(%edx),%eax
     7cf:	89 44 24 08          	mov    %eax,0x8(%esp)
     7d3:	8d 42 10             	lea    0x10(%edx),%eax
     7d6:	89 44 24 04          	mov    %eax,0x4(%esp)
     7da:	8b 42 0c             	mov    0xc(%edx),%eax
     7dd:	89 04 24             	mov    %eax,(%esp)
     7e0:	e8 00 00 00 00       	call   7e5 <_inflate_blocks+0x675>
                             &s->sub.trees.tb, s->hufts, z);
      if (t != Z_OK)
     7e5:	8b 54 24 34          	mov    0x34(%esp),%edx
     7e9:	85 c0                	test   %eax,%eax
     7eb:	0f 85 0f 08 00 00    	jne    1000 <_inflate_blocks+0xe90>
        r = t;
        if (r == Z_DATA_ERROR)
          s->mode = BAD;
        LEAVE
      }
      s->sub.trees.index = 0;
     7f1:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
      Tracev((stderr, "inflate:       bits tree ok\n"));
      s->mode = DTREE;
     7f8:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
     7fe:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
     805:	00 
     806:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
     80d:	eb 0f                	jmp    81e <_inflate_blocks+0x6ae>
     80f:	90                   	nop
     810:	8b 42 08             	mov    0x8(%edx),%eax
     813:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
     81a:	89 44 24 34          	mov    %eax,0x34(%esp)
    case DTREE:
      while (t = s->sub.trees.table,
     81e:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
     825:	8b 40 04             	mov    0x4(%eax),%eax
             s->sub.trees.index < 258 + (t & 0x1f) + ((t >> 5) & 0x1f))
     828:	89 c1                	mov    %eax,%ecx
     82a:	c1 e8 05             	shr    $0x5,%eax
     82d:	83 e1 1f             	and    $0x1f,%ecx
     830:	83 e0 1f             	and    $0x1f,%eax
     833:	8d 94 01 02 01 00 00 	lea    0x102(%ecx,%eax,1),%edx
     83a:	89 54 24 38          	mov    %edx,0x38(%esp)
      }
      s->sub.trees.index = 0;
      Tracev((stderr, "inflate:       bits tree ok\n"));
      s->mode = DTREE;
    case DTREE:
      while (t = s->sub.trees.table,
     83e:	3b 54 24 34          	cmp    0x34(%esp),%edx
     842:	0f 86 9b f9 ff ff    	jbe    1e3 <_inflate_blocks+0x73>
             s->sub.trees.index < 258 + (t & 0x1f) + ((t >> 5) & 0x1f))
      {
        inflate_huft *h;
        uInt i, j, c;

        t = s->sub.trees.bb;
     848:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
     84f:	8b 50 10             	mov    0x10(%eax),%edx
        NEEDBITS(t)
     852:	39 d6                	cmp    %edx,%esi
     854:	73 33                	jae    889 <_inflate_blocks+0x719>
     856:	85 db                	test   %ebx,%ebx
     858:	0f 84 76 05 00 00    	je     dd4 <_inflate_blocks+0xc64>
     85e:	89 f1                	mov    %esi,%ecx
     860:	eb 08                	jmp    86a <_inflate_blocks+0x6fa>
     862:	85 db                	test   %ebx,%ebx
     864:	0f 84 56 01 00 00    	je     9c0 <_inflate_blocks+0x850>
     86a:	47                   	inc    %edi
     86b:	31 c0                	xor    %eax,%eax
     86d:	4b                   	dec    %ebx
     86e:	8a 47 ff             	mov    -0x1(%edi),%al
     871:	d3 e0                	shl    %cl,%eax
     873:	83 c1 08             	add    $0x8,%ecx
     876:	09 c5                	or     %eax,%ebp
     878:	39 ca                	cmp    %ecx,%edx
     87a:	77 e6                	ja     862 <_inflate_blocks+0x6f2>
     87c:	89 ce                	mov    %ecx,%esi
     87e:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     885:	00 00 00 00 
        h = s->sub.trees.tb + ((uInt)b & inflate_mask[t]);
     889:	8b 04 95 00 00 00 00 	mov    0x0(,%edx,4),%eax
     890:	21 e8                	and    %ebp,%eax
     892:	89 c2                	mov    %eax,%edx
     894:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
     89b:	8b 40 14             	mov    0x14(%eax),%eax
     89e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        t = h->bits;
     8a1:	8a 50 01             	mov    0x1(%eax),%dl
        c = h->base;
     8a4:	8b 40 04             	mov    0x4(%eax),%eax
        uInt i, j, c;

        t = s->sub.trees.bb;
        NEEDBITS(t)
        h = s->sub.trees.tb + ((uInt)b & inflate_mask[t]);
        t = h->bits;
     8a7:	88 d1                	mov    %dl,%cl
     8a9:	88 54 24 44          	mov    %dl,0x44(%esp)
     8ad:	81 e1 ff 00 00 00    	and    $0xff,%ecx
        c = h->base;
     8b3:	89 44 24 40          	mov    %eax,0x40(%esp)
        uInt i, j, c;

        t = s->sub.trees.bb;
        NEEDBITS(t)
        h = s->sub.trees.tb + ((uInt)b & inflate_mask[t]);
        t = h->bits;
     8b7:	89 4c 24 3c          	mov    %ecx,0x3c(%esp)
        c = h->base;
        if (c < 16)
     8bb:	83 f8 0f             	cmp    $0xf,%eax
     8be:	0f 87 2e 02 00 00    	ja     af2 <_inflate_blocks+0x982>
        {
          DUMPBITS(t)
     8c4:	8b 44 24 3c          	mov    0x3c(%esp),%eax
     8c8:	88 d1                	mov    %dl,%cl
     8ca:	29 c6                	sub    %eax,%esi
          s->sub.trees.blens[s->sub.trees.index++] = c;
     8cc:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
        h = s->sub.trees.tb + ((uInt)b & inflate_mask[t]);
        t = h->bits;
        c = h->base;
        if (c < 16)
        {
          DUMPBITS(t)
     8d3:	d3 ed                	shr    %cl,%ebp
          s->sub.trees.blens[s->sub.trees.index++] = c;
     8d5:	8b 48 0c             	mov    0xc(%eax),%ecx
     8d8:	89 4c 24 38          	mov    %ecx,0x38(%esp)
     8dc:	8b 4c 24 34          	mov    0x34(%esp),%ecx
     8e0:	89 ca                	mov    %ecx,%edx
     8e2:	42                   	inc    %edx
     8e3:	89 50 08             	mov    %edx,0x8(%eax)
     8e6:	89 ca                	mov    %ecx,%edx
     8e8:	8b 4c 24 38          	mov    0x38(%esp),%ecx
     8ec:	8b 44 24 40          	mov    0x40(%esp),%eax
     8f0:	89 04 91             	mov    %eax,(%ecx,%edx,4)
     8f3:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
     8fa:	8b 40 08             	mov    0x8(%eax),%eax
     8fd:	89 44 24 34          	mov    %eax,0x34(%esp)
     901:	e9 18 ff ff ff       	jmp    81e <_inflate_blocks+0x6ae>
     906:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
     90d:	89 da                	mov    %ebx,%edx
     90f:	89 f3                	mov    %esi,%ebx
     911:	89 fe                	mov    %edi,%esi
     913:	89 ef                	mov    %ebp,%edi
     915:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
    case DONE:
      r = Z_STREAM_END;
      LEAVE
    case BAD:
      r = Z_DATA_ERROR;
      LEAVE
     91c:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     923:	89 7d 20             	mov    %edi,0x20(%ebp)
     926:	89 c7                	mov    %eax,%edi
     928:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     92b:	89 50 04             	mov    %edx,0x4(%eax)
     92e:	89 f0                	mov    %esi,%eax
     930:	8b 17                	mov    (%edi),%edx
     932:	29 d0                	sub    %edx,%eax
     934:	8b 5f 08             	mov    0x8(%edi),%ebx
     937:	89 37                	mov    %esi,(%edi)
     939:	01 c3                	add    %eax,%ebx
     93b:	8b 44 24 30          	mov    0x30(%esp),%eax
     93f:	89 5f 08             	mov    %ebx,0x8(%edi)
     942:	89 45 34             	mov    %eax,0x34(%ebp)
     945:	89 7c 24 04          	mov    %edi,0x4(%esp)
     949:	89 2c 24             	mov    %ebp,(%esp)
     94c:	c7 44 24 08 fd ff ff 	movl   $0xfffffffd,0x8(%esp)
     953:	ff 
     954:	e8 00 00 00 00       	call   959 <_inflate_blocks+0x7e9>
    default:
      r = Z_STREAM_ERROR;
      LEAVE
  }
}
     959:	83 c4 6c             	add    $0x6c,%esp
     95c:	5b                   	pop    %ebx
     95d:	5e                   	pop    %esi
     95e:	5f                   	pop    %edi
     95f:	5d                   	pop    %ebp
     960:	c3                   	ret    
     961:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
     968:	89 da                	mov    %ebx,%edx
     96a:	89 fb                	mov    %edi,%ebx
     96c:	89 ef                	mov    %ebp,%edi
     96e:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
    case BAD:
      r = Z_DATA_ERROR;
      LEAVE
    default:
      r = Z_STREAM_ERROR;
      LEAVE
     975:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     97c:	89 7d 20             	mov    %edi,0x20(%ebp)
     97f:	89 c7                	mov    %eax,%edi
     981:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     984:	89 50 04             	mov    %edx,0x4(%eax)
     987:	8b 17                	mov    (%edi),%edx
     989:	89 f0                	mov    %esi,%eax
     98b:	8b 4f 08             	mov    0x8(%edi),%ecx
     98e:	29 d0                	sub    %edx,%eax
     990:	01 c1                	add    %eax,%ecx
     992:	8b 44 24 30          	mov    0x30(%esp),%eax
     996:	89 37                	mov    %esi,(%edi)
     998:	89 4f 08             	mov    %ecx,0x8(%edi)
     99b:	89 45 34             	mov    %eax,0x34(%ebp)
     99e:	89 7c 24 04          	mov    %edi,0x4(%esp)
     9a2:	89 2c 24             	mov    %ebp,(%esp)
     9a5:	c7 44 24 08 fe ff ff 	movl   $0xfffffffe,0x8(%esp)
     9ac:	ff 
     9ad:	e8 00 00 00 00       	call   9b2 <_inflate_blocks+0x842>
  }
}
     9b2:	83 c4 6c             	add    $0x6c,%esp
     9b5:	5b                   	pop    %ebx
     9b6:	5e                   	pop    %esi
     9b7:	5f                   	pop    %edi
     9b8:	5d                   	pop    %ebp
     9b9:	c3                   	ret    
     9ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     9c0:	89 fe                	mov    %edi,%esi
     9c2:	89 cb                	mov    %ecx,%ebx
     9c4:	89 ef                	mov    %ebp,%edi
        }
        else /* c == 16..18 */
        {
          i = c == 18 ? 7 : c - 14;
          j = c == 18 ? 11 : 3;
          NEEDBITS(t + i)
     9c6:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     9cd:	00 00 00 00 
     9d1:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
     9d8:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     9df:	89 7d 20             	mov    %edi,0x20(%ebp)
     9e2:	89 c7                	mov    %eax,%edi
     9e4:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     9e7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
     9ee:	89 f0                	mov    %esi,%eax
     9f0:	8b 0f                	mov    (%edi),%ecx
     9f2:	8b 5f 08             	mov    0x8(%edi),%ebx
     9f5:	29 c8                	sub    %ecx,%eax
     9f7:	89 37                	mov    %esi,(%edi)
     9f9:	01 c3                	add    %eax,%ebx
     9fb:	8b 44 24 30          	mov    0x30(%esp),%eax
     9ff:	89 5f 08             	mov    %ebx,0x8(%edi)
     a02:	89 45 34             	mov    %eax,0x34(%ebp)
     a05:	8b 84 24 88 00 00 00 	mov    0x88(%esp),%eax
     a0c:	e9 a2 fb ff ff       	jmp    5b3 <_inflate_blocks+0x443>
      s->mode = s->sub.left ? STORED : (s->last ? DRY : TYPE);
      break;
    case STORED:
      if (n == 0)
        LEAVE
      NEEDOUT
     a11:	8b 4a 30             	mov    0x30(%edx),%ecx
     a14:	89 4c 24 38          	mov    %ecx,0x38(%esp)
     a18:	8b 4a 28             	mov    0x28(%edx),%ecx
     a1b:	89 4c 24 30          	mov    %ecx,0x30(%esp)
     a1f:	39 4c 24 38          	cmp    %ecx,0x38(%esp)
     a23:	0f 84 35 05 00 00    	je     f5e <_inflate_blocks+0xdee>
     a29:	29 c8                	sub    %ecx,%eax
     a2b:	39 4c 24 38          	cmp    %ecx,0x38(%esp)
     a2f:	89 44 24 34          	mov    %eax,0x34(%esp)
     a33:	76 0b                	jbe    a40 <_inflate_blocks+0x8d0>
     a35:	8b 44 24 38          	mov    0x38(%esp),%eax
     a39:	29 c8                	sub    %ecx,%eax
     a3b:	48                   	dec    %eax
     a3c:	89 44 24 34          	mov    %eax,0x34(%esp)
     a40:	8b 44 24 34          	mov    0x34(%esp),%eax
     a44:	85 c0                	test   %eax,%eax
     a46:	0f 84 ab fb ff ff    	je     5f7 <_inflate_blocks+0x487>
     a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      t = s->sub.left;
     a50:	8b 42 04             	mov    0x4(%edx),%eax
     a53:	89 54 24 3c          	mov    %edx,0x3c(%esp)
     a57:	39 c3                	cmp    %eax,%ebx
     a59:	8b 54 24 34          	mov    0x34(%esp),%edx
     a5d:	0f 46 c3             	cmovbe %ebx,%eax
     a60:	39 d0                	cmp    %edx,%eax
      if (t > n) t = n;
      if (t > m) t = m;
      zmemcpy(q, p, t);
     a62:	89 74 24 04          	mov    %esi,0x4(%esp)
     a66:	0f 47 c2             	cmova  %edx,%eax
     a69:	89 44 24 08          	mov    %eax,0x8(%esp)
     a6d:	89 44 24 38          	mov    %eax,0x38(%esp)
     a71:	8b 44 24 30          	mov    0x30(%esp),%eax
     a75:	89 04 24             	mov    %eax,(%esp)
     a78:	e8 00 00 00 00       	call   a7d <_inflate_blocks+0x90d>
      p += t;  n -= t;
     a7d:	8b 4c 24 38          	mov    0x38(%esp),%ecx
      q += t;  m -= t;
     a81:	8b 44 24 30          	mov    0x30(%esp),%eax
      if ((s->sub.left -= t) != 0)
     a85:	8b 54 24 3c          	mov    0x3c(%esp),%edx
      t = s->sub.left;
      if (t > n) t = n;
      if (t > m) t = m;
      zmemcpy(q, p, t);
      p += t;  n -= t;
      q += t;  m -= t;
     a89:	01 c8                	add    %ecx,%eax
      NEEDOUT
      t = s->sub.left;
      if (t > n) t = n;
      if (t > m) t = m;
      zmemcpy(q, p, t);
      p += t;  n -= t;
     a8b:	01 ce                	add    %ecx,%esi
      q += t;  m -= t;
     a8d:	89 44 24 30          	mov    %eax,0x30(%esp)
     a91:	8b 44 24 34          	mov    0x34(%esp),%eax
     a95:	29 c8                	sub    %ecx,%eax
      NEEDOUT
      t = s->sub.left;
      if (t > n) t = n;
      if (t > m) t = m;
      zmemcpy(q, p, t);
      p += t;  n -= t;
     a97:	29 cb                	sub    %ecx,%ebx
      q += t;  m -= t;
     a99:	89 44 24 34          	mov    %eax,0x34(%esp)
      if ((s->sub.left -= t) != 0)
     a9d:	8b 42 04             	mov    0x4(%edx),%eax
     aa0:	29 c8                	sub    %ecx,%eax
     aa2:	89 42 04             	mov    %eax,0x4(%edx)
     aa5:	85 c0                	test   %eax,%eax
     aa7:	75 37                	jne    ae0 <_inflate_blocks+0x970>
        break;
      Tracev((stderr, "inflate:       stored end, %lu total out\n",
              z->total_out + (q >= s->read ? q - s->read :
              (s->end - s->read) + (q - s->window))));
      s->mode = s->last ? DRY : TYPE;
     aa9:	83 7a 18 01          	cmpl   $0x1,0x18(%edx)
     aad:	19 c0                	sbb    %eax,%eax
      s->mode = s->sub.left ? STORED : (s->last ? DRY : TYPE);
      break;
    case STORED:
      if (n == 0)
        LEAVE
      NEEDOUT
     aaf:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     ab6:	00 00 00 00 
      if ((s->sub.left -= t) != 0)
        break;
      Tracev((stderr, "inflate:       stored end, %lu total out\n",
              z->total_out + (q >= s->read ? q - s->read :
              (s->end - s->read) + (q - s->window))));
      s->mode = s->last ? DRY : TYPE;
     aba:	83 f0 ff             	xor    $0xffffffff,%eax
     abd:	83 e0 07             	and    $0x7,%eax
     ac0:	89 02                	mov    %eax,(%edx)
      break;
     ac2:	e9 f7 f6 ff ff       	jmp    1be <_inflate_blocks+0x4e>
      UPDATE
      if ((r = inflate_codes(s, z, r)) != Z_STREAM_END)
        return inflate_flush(s, z, r);
      r = Z_OK;
      inflate_codes_free(s->sub.decode.codes, z);
      LOAD
     ac7:	8b 42 2c             	mov    0x2c(%edx),%eax
     aca:	8b 4c 24 30          	mov    0x30(%esp),%ecx
     ace:	29 c8                	sub    %ecx,%eax
     ad0:	89 44 24 34          	mov    %eax,0x34(%esp)
     ad4:	e9 97 f8 ff ff       	jmp    370 <_inflate_blocks+0x200>
     ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ae0:	8b 02                	mov    (%edx),%eax
      s->mode = s->sub.left ? STORED : (s->last ? DRY : TYPE);
      break;
    case STORED:
      if (n == 0)
        LEAVE
      NEEDOUT
     ae2:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     ae9:	00 00 00 00 
     aed:	e9 cc f6 ff ff       	jmp    1be <_inflate_blocks+0x4e>
          DUMPBITS(t)
          s->sub.trees.blens[s->sub.trees.index++] = c;
        }
        else /* c == 16..18 */
        {
          i = c == 18 ? 7 : c - 14;
     af2:	8b 44 24 40          	mov    0x40(%esp),%eax
     af6:	83 f8 12             	cmp    $0x12,%eax
     af9:	0f 84 98 01 00 00    	je     c97 <_inflate_blocks+0xb27>
     aff:	83 e8 0e             	sub    $0xe,%eax
          j = c == 18 ? 11 : 3;
     b02:	c7 44 24 4c 03 00 00 	movl   $0x3,0x4c(%esp)
     b09:	00 
          DUMPBITS(t)
          s->sub.trees.blens[s->sub.trees.index++] = c;
        }
        else /* c == 16..18 */
        {
          i = c == 18 ? 7 : c - 14;
     b0a:	89 44 24 48          	mov    %eax,0x48(%esp)
          j = c == 18 ? 11 : 3;
          NEEDBITS(t + i)
     b0e:	8b 54 24 48          	mov    0x48(%esp),%edx
     b12:	8b 44 24 3c          	mov    0x3c(%esp),%eax
     b16:	01 c2                	add    %eax,%edx
     b18:	39 d6                	cmp    %edx,%esi
     b1a:	73 33                	jae    b4f <_inflate_blocks+0x9df>
     b1c:	85 db                	test   %ebx,%ebx
     b1e:	0f 84 b0 02 00 00    	je     dd4 <_inflate_blocks+0xc64>
     b24:	89 f1                	mov    %esi,%ecx
     b26:	eb 08                	jmp    b30 <_inflate_blocks+0x9c0>
     b28:	85 db                	test   %ebx,%ebx
     b2a:	0f 84 90 fe ff ff    	je     9c0 <_inflate_blocks+0x850>
     b30:	47                   	inc    %edi
     b31:	31 c0                	xor    %eax,%eax
     b33:	4b                   	dec    %ebx
     b34:	8a 47 ff             	mov    -0x1(%edi),%al
     b37:	d3 e0                	shl    %cl,%eax
     b39:	83 c1 08             	add    $0x8,%ecx
     b3c:	09 c5                	or     %eax,%ebp
     b3e:	39 d1                	cmp    %edx,%ecx
     b40:	72 e6                	jb     b28 <_inflate_blocks+0x9b8>
     b42:	89 ce                	mov    %ecx,%esi
     b44:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     b4b:	00 00 00 00 
          DUMPBITS(t)
          j += (uInt)b & inflate_mask[i];
     b4f:	8b 54 24 48          	mov    0x48(%esp),%edx
        else /* c == 16..18 */
        {
          i = c == 18 ? 7 : c - 14;
          j = c == 18 ? 11 : 3;
          NEEDBITS(t + i)
          DUMPBITS(t)
     b53:	8a 4c 24 44          	mov    0x44(%esp),%cl
     b57:	d3 ed                	shr    %cl,%ebp
          j += (uInt)b & inflate_mask[i];
     b59:	8b 04 95 00 00 00 00 	mov    0x0(,%edx,4),%eax
        else /* c == 16..18 */
        {
          i = c == 18 ? 7 : c - 14;
          j = c == 18 ? 11 : 3;
          NEEDBITS(t + i)
          DUMPBITS(t)
     b60:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
     b64:	29 ce                	sub    %ecx,%esi
          j += (uInt)b & inflate_mask[i];
     b66:	21 e8                	and    %ebp,%eax
     b68:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
          DUMPBITS(i)
     b6c:	29 d6                	sub    %edx,%esi
        {
          i = c == 18 ? 7 : c - 14;
          j = c == 18 ? 11 : 3;
          NEEDBITS(t + i)
          DUMPBITS(t)
          j += (uInt)b & inflate_mask[i];
     b6e:	01 c8                	add    %ecx,%eax
          DUMPBITS(i)
     b70:	88 d1                	mov    %dl,%cl
          i = s->sub.trees.index;
          t = s->sub.trees.table;
          if (i + j > 258 + (t & 0x1f) + ((t >> 5) & 0x1f) ||
     b72:	8b 54 24 34          	mov    0x34(%esp),%edx
        {
          i = c == 18 ? 7 : c - 14;
          j = c == 18 ? 11 : 3;
          NEEDBITS(t + i)
          DUMPBITS(t)
          j += (uInt)b & inflate_mask[i];
     b76:	89 44 24 3c          	mov    %eax,0x3c(%esp)
          DUMPBITS(i)
          i = s->sub.trees.index;
          t = s->sub.trees.table;
          if (i + j > 258 + (t & 0x1f) + ((t >> 5) & 0x1f) ||
     b7a:	01 d0                	add    %edx,%eax
          i = c == 18 ? 7 : c - 14;
          j = c == 18 ? 11 : 3;
          NEEDBITS(t + i)
          DUMPBITS(t)
          j += (uInt)b & inflate_mask[i];
          DUMPBITS(i)
     b7c:	d3 ed                	shr    %cl,%ebp
          i = s->sub.trees.index;
          t = s->sub.trees.table;
          if (i + j > 258 + (t & 0x1f) + ((t >> 5) & 0x1f) ||
     b7e:	89 44 24 44          	mov    %eax,0x44(%esp)
     b82:	39 44 24 38          	cmp    %eax,0x38(%esp)
     b86:	0f 82 ee 03 00 00    	jb     f7a <_inflate_blocks+0xe0a>
     b8c:	8b 54 24 34          	mov    0x34(%esp),%edx
              (c == 16 && i < 1))
     b90:	83 7c 24 40 10       	cmpl   $0x10,0x40(%esp)
     b95:	0f 94 c0             	sete   %al
          DUMPBITS(t)
          j += (uInt)b & inflate_mask[i];
          DUMPBITS(i)
          i = s->sub.trees.index;
          t = s->sub.trees.table;
          if (i + j > 258 + (t & 0x1f) + ((t >> 5) & 0x1f) ||
     b98:	85 d2                	test   %edx,%edx
     b9a:	0f 85 3c 01 00 00    	jne    cdc <_inflate_blocks+0xb6c>
     ba0:	84 c0                	test   %al,%al
     ba2:	0f 85 d2 03 00 00    	jne    f7a <_inflate_blocks+0xe0a>
     ba8:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
            s->mode = BAD;
            z->msg = (char*)"invalid bit length repeat";
            r = Z_DATA_ERROR;
            LEAVE
          }
          c = c == 16 ? s->sub.trees.blens[i - 1] : 0;
     baf:	31 c9                	xor    %ecx,%ecx
     bb1:	8b 50 0c             	mov    0xc(%eax),%edx
     bb4:	8b 44 24 34          	mov    0x34(%esp),%eax
     bb8:	89 74 24 38          	mov    %esi,0x38(%esp)
     bbc:	89 6c 24 34          	mov    %ebp,0x34(%esp)
     bc0:	8b 74 24 3c          	mov    0x3c(%esp),%esi
     bc4:	c1 e0 02             	shl    $0x2,%eax
     bc7:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
     bce:	eb 03                	jmp    bd3 <_inflate_blocks+0xa63>
     bd0:	8b 55 0c             	mov    0xc(%ebp),%edx
          do {
            s->sub.trees.blens[i++] = c;
     bd3:	89 0c 02             	mov    %ecx,(%edx,%eax,1)
     bd6:	83 c0 04             	add    $0x4,%eax
          } while (--j);
     bd9:	4e                   	dec    %esi
     bda:	75 f4                	jne    bd0 <_inflate_blocks+0xa60>
          s->sub.trees.index = i;
     bdc:	8b 94 24 80 00 00 00 	mov    0x80(%esp),%edx
     be3:	8b 44 24 44          	mov    0x44(%esp),%eax
     be7:	8b 6c 24 34          	mov    0x34(%esp),%ebp
     beb:	8b 74 24 38          	mov    0x38(%esp),%esi
     bef:	89 42 08             	mov    %eax,0x8(%edx)
     bf2:	89 44 24 34          	mov    %eax,0x34(%esp)
     bf6:	e9 23 fc ff ff       	jmp    81e <_inflate_blocks+0x6ae>
     bfb:	90                   	nop
     bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c00:	89 ef                	mov    %ebp,%edi
     c02:	89 cb                	mov    %ecx,%ebx
     c04:	89 d5                	mov    %edx,%ebp
          r = Z_DATA_ERROR;
          LEAVE
      }
      break;
    case LENS:
      NEEDBITS(32)
     c06:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     c0d:	00 00 00 00 
      Tracev((stderr, "inflate:       stored length %u\n", s->sub.left));
      s->mode = s->sub.left ? STORED : (s->last ? DRY : TYPE);
      break;
    case STORED:
      if (n == 0)
        LEAVE
     c11:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     c18:	89 7d 20             	mov    %edi,0x20(%ebp)
     c1b:	89 c7                	mov    %eax,%edi
     c1d:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     c20:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
     c27:	89 f0                	mov    %esi,%eax
     c29:	8b 17                	mov    (%edi),%edx
     c2b:	8b 4f 08             	mov    0x8(%edi),%ecx
     c2e:	29 d0                	sub    %edx,%eax
     c30:	89 37                	mov    %esi,(%edi)
     c32:	01 c1                	add    %eax,%ecx
     c34:	8b 44 24 30          	mov    0x30(%esp),%eax
     c38:	89 4f 08             	mov    %ecx,0x8(%edi)
     c3b:	89 fb                	mov    %edi,%ebx
     c3d:	89 45 34             	mov    %eax,0x34(%ebp)
     c40:	8b 84 24 88 00 00 00 	mov    0x88(%esp),%eax
     c47:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     c4b:	89 2c 24             	mov    %ebp,(%esp)
     c4e:	89 44 24 08          	mov    %eax,0x8(%esp)
     c52:	e8 00 00 00 00       	call   c57 <_inflate_blocks+0xae7>
      LEAVE
    default:
      r = Z_STREAM_ERROR;
      LEAVE
  }
}
     c57:	83 c4 6c             	add    $0x6c,%esp
     c5a:	5b                   	pop    %ebx
     c5b:	5e                   	pop    %esi
     c5c:	5f                   	pop    %edi
     c5d:	5d                   	pop    %ebp
     c5e:	c3                   	ret    
     c5f:	90                   	nop
     c60:	89 fe                	mov    %edi,%esi
     c62:	89 cb                	mov    %ecx,%ebx
     c64:	89 ef                	mov    %ebp,%edi
              z->total_out + (q >= s->read ? q - s->read :
              (s->end - s->read) + (q - s->window))));
      s->mode = s->last ? DRY : TYPE;
      break;
    case TABLE:
      NEEDBITS(14)
     c66:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     c6d:	00 00 00 00 
     c71:	89 d5                	mov    %edx,%ebp
     c73:	eb 9c                	jmp    c11 <_inflate_blocks+0xaa1>
      s->mode = DRY;
    case DRY:
      FLUSH
      if (s->read != s->write)
        LEAVE
      s->mode = DONE;
     c75:	c7 45 00 08 00 00 00 	movl   $0x8,0x0(%ebp)
     c7c:	e9 37 fa ff ff       	jmp    6b8 <_inflate_blocks+0x548>
          s->mode = CODES;
          break;
        case 2:                         /* dynamic */
          Tracev((stderr, "inflate:     dynamic codes block%s\n",
                 s->last ? " (last)" : ""));
          DUMPBITS(3)
     c81:	c1 ed 03             	shr    $0x3,%ebp
     c84:	83 ee 03             	sub    $0x3,%esi
          s->mode = TABLE;
     c87:	c7 02 03 00 00 00    	movl   $0x3,(%edx)
          break;
     c8d:	b8 03 00 00 00       	mov    $0x3,%eax
     c92:	e9 36 f5 ff ff       	jmp    1cd <_inflate_blocks+0x5d>
     c97:	c7 44 24 48 07 00 00 	movl   $0x7,0x48(%esp)
     c9e:	00 
          s->sub.trees.blens[s->sub.trees.index++] = c;
        }
        else /* c == 16..18 */
        {
          i = c == 18 ? 7 : c - 14;
          j = c == 18 ? 11 : 3;
     c9f:	c7 44 24 4c 0b 00 00 	movl   $0xb,0x4c(%esp)
     ca6:	00 
     ca7:	e9 62 fe ff ff       	jmp    b0e <_inflate_blocks+0x99e>
      s->mode = s->sub.left ? STORED : (s->last ? DRY : TYPE);
      break;
    case STORED:
      if (n == 0)
        LEAVE
      NEEDOUT
     cac:	89 c8                	mov    %ecx,%eax
     cae:	8b 4c 24 30          	mov    0x30(%esp),%ecx
     cb2:	29 c8                	sub    %ecx,%eax
     cb4:	48                   	dec    %eax
     cb5:	89 44 24 34          	mov    %eax,0x34(%esp)
     cb9:	8b 42 2c             	mov    0x2c(%edx),%eax
     cbc:	e9 8a f9 ff ff       	jmp    64b <_inflate_blocks+0x4db>
     cc1:	89 b4 24 80 00 00 00 	mov    %esi,0x80(%esp)
     cc8:	89 ef                	mov    %ebp,%edi
     cca:	89 cb                	mov    %ecx,%ebx
     ccc:	8b 74 24 34          	mov    0x34(%esp),%esi
     cd0:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
     cd7:	e9 fc fc ff ff       	jmp    9d8 <_inflate_blocks+0x868>
            s->mode = BAD;
            z->msg = (char*)"invalid bit length repeat";
            r = Z_DATA_ERROR;
            LEAVE
          }
          c = c == 16 ? s->sub.trees.blens[i - 1] : 0;
     cdc:	84 c0                	test   %al,%al
     cde:	0f 84 c4 fe ff ff    	je     ba8 <_inflate_blocks+0xa38>
     ce4:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
     ceb:	8b 50 0c             	mov    0xc(%eax),%edx
     cee:	8b 44 24 34          	mov    0x34(%esp),%eax
     cf2:	8b 4c 82 fc          	mov    -0x4(%edx,%eax,4),%ecx
     cf6:	e9 b9 fe ff ff       	jmp    bb4 <_inflate_blocks+0xa44>
                 s->last ? " (last)" : ""));
          {
            uInt bl, bd;
            inflate_huft *tl, *td;

            inflate_trees_fixed(&bl, &bd, &tl, &td, z);
     cfb:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     d02:	89 54 24 38          	mov    %edx,0x38(%esp)
     d06:	89 44 24 10          	mov    %eax,0x10(%esp)
     d0a:	8d 44 24 5c          	lea    0x5c(%esp),%eax
     d0e:	89 44 24 0c          	mov    %eax,0xc(%esp)
     d12:	8d 44 24 58          	lea    0x58(%esp),%eax
     d16:	89 44 24 08          	mov    %eax,0x8(%esp)
     d1a:	8d 44 24 54          	lea    0x54(%esp),%eax
     d1e:	89 44 24 04          	mov    %eax,0x4(%esp)
     d22:	8d 44 24 50          	lea    0x50(%esp),%eax
     d26:	89 04 24             	mov    %eax,(%esp)
     d29:	e8 00 00 00 00       	call   d2e <_inflate_blocks+0xbbe>
            s->sub.decode.codes = inflate_codes_new(bl, bd, tl, td, z);
     d2e:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     d35:	89 44 24 10          	mov    %eax,0x10(%esp)
     d39:	8b 44 24 5c          	mov    0x5c(%esp),%eax
     d3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     d41:	8b 44 24 58          	mov    0x58(%esp),%eax
     d45:	89 44 24 08          	mov    %eax,0x8(%esp)
     d49:	8b 44 24 54          	mov    0x54(%esp),%eax
     d4d:	89 44 24 04          	mov    %eax,0x4(%esp)
     d51:	8b 44 24 50          	mov    0x50(%esp),%eax
     d55:	89 04 24             	mov    %eax,(%esp)
     d58:	e8 00 00 00 00       	call   d5d <_inflate_blocks+0xbed>
     d5d:	8b 54 24 38          	mov    0x38(%esp),%edx
            if (s->sub.decode.codes == Z_NULL)
     d61:	85 c0                	test   %eax,%eax
          {
            uInt bl, bd;
            inflate_huft *tl, *td;

            inflate_trees_fixed(&bl, &bd, &tl, &td, z);
            s->sub.decode.codes = inflate_codes_new(bl, bd, tl, td, z);
     d63:	89 42 04             	mov    %eax,0x4(%edx)
            if (s->sub.decode.codes == Z_NULL)
     d66:	0f 84 63 02 00 00    	je     fcf <_inflate_blocks+0xe5f>
            {
              r = Z_MEM_ERROR;
              LEAVE
            }
          }
          DUMPBITS(3)
     d6c:	c1 ed 03             	shr    $0x3,%ebp
     d6f:	83 ee 03             	sub    $0x3,%esi
          s->mode = CODES;
     d72:	c7 02 06 00 00 00    	movl   $0x6,(%edx)
          break;
     d78:	b8 06 00 00 00       	mov    $0x6,%eax
     d7d:	e9 4b f4 ff ff       	jmp    1cd <_inflate_blocks+0x5d>
     d82:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
          s->mode = TABLE;
          break;
        case 3:                         /* illegal */
          DUMPBITS(3)
          s->mode = BAD;
          z->msg = (char*)"invalid block type";
     d89:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     d90:	89 da                	mov    %ebx,%edx
     d92:	89 f3                	mov    %esi,%ebx
     d94:	89 fe                	mov    %edi,%esi
     d96:	89 ef                	mov    %ebp,%edi
     d98:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
          DUMPBITS(3)
          s->mode = TABLE;
          break;
        case 3:                         /* illegal */
          DUMPBITS(3)
          s->mode = BAD;
     d9f:	c7 45 00 09 00 00 00 	movl   $0x9,0x0(%ebp)
          z->msg = (char*)"invalid block type";
     da6:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
                 s->last ? " (last)" : ""));
          DUMPBITS(3)
          s->mode = TABLE;
          break;
        case 3:                         /* illegal */
          DUMPBITS(3)
     dad:	89 f8                	mov    %edi,%eax
     daf:	c1 e8 03             	shr    $0x3,%eax
     db2:	89 45 20             	mov    %eax,0x20(%ebp)
     db5:	8d 43 fd             	lea    -0x3(%ebx),%eax
     db8:	89 45 1c             	mov    %eax,0x1c(%ebp)
          s->mode = BAD;
          z->msg = (char*)"invalid block type";
          r = Z_DATA_ERROR;
          LEAVE
     dbb:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     dc2:	89 c3                	mov    %eax,%ebx
     dc4:	89 50 04             	mov    %edx,0x4(%eax)
     dc7:	89 f0                	mov    %esi,%eax
     dc9:	8b 3b                	mov    (%ebx),%edi
     dcb:	29 f8                	sub    %edi,%eax
     dcd:	89 df                	mov    %ebx,%edi
     dcf:	e9 60 fb ff ff       	jmp    934 <_inflate_blocks+0x7c4>
     dd4:	89 f3                	mov    %esi,%ebx
     dd6:	89 fe                	mov    %edi,%esi
     dd8:	89 ef                	mov    %ebp,%edi
     dda:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
     de1:	e9 f2 fb ff ff       	jmp    9d8 <_inflate_blocks+0x868>
     de6:	89 f3                	mov    %esi,%ebx
     de8:	89 fe                	mov    %edi,%esi
     dea:	89 ef                	mov    %ebp,%edi
     dec:	89 d5                	mov    %edx,%ebp
     dee:	e9 1e fe ff ff       	jmp    c11 <_inflate_blocks+0xaa1>
     df3:	89 fb                	mov    %edi,%ebx
     df5:	89 ef                	mov    %ebp,%edi
     df7:	89 d5                	mov    %edx,%ebp
     df9:	e9 13 fe ff ff       	jmp    c11 <_inflate_blocks+0xaa1>
      }
      s->mode = CODES;
    case CODES:
      UPDATE
      if ((r = inflate_codes(s, z, r)) != Z_STREAM_END)
        return inflate_flush(s, z, r);
     dfe:	89 44 24 08          	mov    %eax,0x8(%esp)
     e02:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     e09:	89 44 24 04          	mov    %eax,0x4(%esp)
     e0d:	89 14 24             	mov    %edx,(%esp)
     e10:	e8 00 00 00 00       	call   e15 <_inflate_blocks+0xca5>
     e15:	e9 a9 f7 ff ff       	jmp    5c3 <_inflate_blocks+0x453>
      s->mode = s->sub.left ? STORED : (s->last ? DRY : TYPE);
      break;
    case STORED:
      if (n == 0)
        LEAVE
      NEEDOUT
     e1a:	8b 42 28             	mov    0x28(%edx),%eax
     e1d:	39 44 24 38          	cmp    %eax,0x38(%esp)
     e21:	0f 84 2e f8 ff ff    	je     655 <_inflate_blocks+0x4e5>
     e27:	0f 86 3a 01 00 00    	jbe    f67 <_inflate_blocks+0xdf7>
     e2d:	8b 4c 24 38          	mov    0x38(%esp),%ecx
     e31:	89 44 24 30          	mov    %eax,0x30(%esp)
     e35:	29 c1                	sub    %eax,%ecx
     e37:	49                   	dec    %ecx
     e38:	89 4c 24 34          	mov    %ecx,0x34(%esp)
     e3c:	e9 14 f8 ff ff       	jmp    655 <_inflate_blocks+0x4e5>
     e41:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
      s->sub.trees.table = t = (uInt)b & 0x3fff;
#ifndef PKZIP_BUG_WORKAROUND
      if ((t & 0x1f) > 29 || ((t >> 5) & 0x1f) > 29)
      {
        s->mode = BAD;
        z->msg = (char*)"too many length or distance symbols";
     e48:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     e4f:	89 da                	mov    %ebx,%edx
     e51:	89 f3                	mov    %esi,%ebx
     e53:	89 fe                	mov    %edi,%esi
     e55:	89 ef                	mov    %ebp,%edi
     e57:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
      NEEDBITS(14)
      s->sub.trees.table = t = (uInt)b & 0x3fff;
#ifndef PKZIP_BUG_WORKAROUND
      if ((t & 0x1f) > 29 || ((t >> 5) & 0x1f) > 29)
      {
        s->mode = BAD;
     e5e:	c7 45 00 09 00 00 00 	movl   $0x9,0x0(%ebp)
        z->msg = (char*)"too many length or distance symbols";
     e65:	c7 40 18 30 00 00 00 	movl   $0x30,0x18(%eax)
        r = Z_DATA_ERROR;
        LEAVE
     e6c:	89 7d 20             	mov    %edi,0x20(%ebp)
     e6f:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     e72:	89 c7                	mov    %eax,%edi
     e74:	89 50 04             	mov    %edx,0x4(%eax)
     e77:	89 f0                	mov    %esi,%eax
     e79:	8b 1f                	mov    (%edi),%ebx
     e7b:	29 d8                	sub    %ebx,%eax
     e7d:	89 fb                	mov    %edi,%ebx
     e7f:	8b 7f 08             	mov    0x8(%edi),%edi
     e82:	01 c7                	add    %eax,%edi
     e84:	8b 44 24 30          	mov    0x30(%esp),%eax
     e88:	89 7b 08             	mov    %edi,0x8(%ebx)
     e8b:	89 33                	mov    %esi,(%ebx)
     e8d:	89 45 34             	mov    %eax,0x34(%ebp)
     e90:	c7 44 24 08 fd ff ff 	movl   $0xfffffffd,0x8(%esp)
     e97:	ff 
     e98:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     e9c:	89 2c 24             	mov    %ebp,(%esp)
     e9f:	e8 00 00 00 00       	call   ea4 <_inflate_blocks+0xd34>
     ea4:	e9 1a f7 ff ff       	jmp    5c3 <_inflate_blocks+0x453>
     ea9:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
     eb0:	89 da                	mov    %ebx,%edx
     eb2:	89 f3                	mov    %esi,%ebx
     eb4:	89 fe                	mov    %edi,%esi
     eb6:	89 ef                	mov    %ebp,%edi
     eb8:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
      s->mode = CODES;
    case CODES:
      UPDATE
      if ((r = inflate_codes(s, z, r)) != Z_STREAM_END)
        return inflate_flush(s, z, r);
      r = Z_OK;
     ebf:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
     ec6:	00 00 00 00 
      if (!s->last)
      {
        s->mode = TYPE;
        break;
      }
      s->mode = DRY;
     eca:	c7 45 00 07 00 00 00 	movl   $0x7,0x0(%ebp)
     ed1:	e9 80 f6 ff ff       	jmp    556 <_inflate_blocks+0x3e6>
     ed6:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
    case LENS:
      NEEDBITS(32)
      if ((((~b) >> 16) & 0xffff) != (b & 0xffff))
      {
        s->mode = BAD;
        z->msg = (char*)"invalid stored block lengths";
     edd:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     ee4:	89 da                	mov    %ebx,%edx
     ee6:	89 fb                	mov    %edi,%ebx
     ee8:	89 ef                	mov    %ebp,%edi
     eea:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
      break;
    case LENS:
      NEEDBITS(32)
      if ((((~b) >> 16) & 0xffff) != (b & 0xffff))
      {
        s->mode = BAD;
     ef1:	c7 45 00 09 00 00 00 	movl   $0x9,0x0(%ebp)
        z->msg = (char*)"invalid stored block lengths";
     ef8:	c7 40 18 13 00 00 00 	movl   $0x13,0x18(%eax)
     eff:	e9 68 ff ff ff       	jmp    e6c <_inflate_blocks+0xcfc>
     f04:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
     f0b:	89 da                	mov    %ebx,%edx
     f0d:	89 f3                	mov    %esi,%ebx
     f0f:	89 fe                	mov    %edi,%esi
     f11:	89 ef                	mov    %ebp,%edi
     f13:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
#endif
      t = 258 + (t & 0x1f) + ((t >> 5) & 0x1f);
      if ((s->sub.trees.blens = (uIntf*)ZALLOC(z, t, sizeof(uInt))) == Z_NULL)
      {
        r = Z_MEM_ERROR;
        LEAVE
     f1a:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     f21:	89 7d 20             	mov    %edi,0x20(%ebp)
     f24:	89 c7                	mov    %eax,%edi
     f26:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     f29:	89 50 04             	mov    %edx,0x4(%eax)
     f2c:	8b 0f                	mov    (%edi),%ecx
     f2e:	89 f0                	mov    %esi,%eax
     f30:	29 c8                	sub    %ecx,%eax
     f32:	89 fb                	mov    %edi,%ebx
     f34:	8b 53 08             	mov    0x8(%ebx),%edx
     f37:	89 33                	mov    %esi,(%ebx)
     f39:	01 c2                	add    %eax,%edx
     f3b:	8b 44 24 30          	mov    0x30(%esp),%eax
     f3f:	89 53 08             	mov    %edx,0x8(%ebx)
     f42:	89 45 34             	mov    %eax,0x34(%ebp)
     f45:	c7 44 24 08 fc ff ff 	movl   $0xfffffffc,0x8(%esp)
     f4c:	ff 
     f4d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     f51:	89 2c 24             	mov    %ebp,(%esp)
     f54:	e8 00 00 00 00       	call   f59 <_inflate_blocks+0xde9>
     f59:	e9 65 f6 ff ff       	jmp    5c3 <_inflate_blocks+0x453>
     f5e:	89 44 24 30          	mov    %eax,0x30(%esp)
     f62:	e9 90 f6 ff ff       	jmp    5f7 <_inflate_blocks+0x487>
      s->mode = s->sub.left ? STORED : (s->last ? DRY : TYPE);
      break;
    case STORED:
      if (n == 0)
        LEAVE
      NEEDOUT
     f67:	8b 4c 24 30          	mov    0x30(%esp),%ecx
     f6b:	89 44 24 30          	mov    %eax,0x30(%esp)
     f6f:	29 c1                	sub    %eax,%ecx
     f71:	89 4c 24 34          	mov    %ecx,0x34(%esp)
     f75:	e9 db f6 ff ff       	jmp    655 <_inflate_blocks+0x4e5>
     f7a:	89 da                	mov    %ebx,%edx
     f7c:	89 f3                	mov    %esi,%ebx
     f7e:	89 fe                	mov    %edi,%esi
     f80:	89 ef                	mov    %ebp,%edi
     f82:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
     f89:	89 54 24 34          	mov    %edx,0x34(%esp)
          i = s->sub.trees.index;
          t = s->sub.trees.table;
          if (i + j > 258 + (t & 0x1f) + ((t >> 5) & 0x1f) ||
              (c == 16 && i < 1))
          {
            ZFREE(z, s->sub.trees.blens);
     f8d:	8b 45 0c             	mov    0xc(%ebp),%eax
     f90:	89 44 24 04          	mov    %eax,0x4(%esp)
     f94:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     f9b:	8b 40 28             	mov    0x28(%eax),%eax
     f9e:	89 04 24             	mov    %eax,(%esp)
     fa1:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     fa8:	ff 50 24             	call   *0x24(%eax)
            s->mode = BAD;
            z->msg = (char*)"invalid bit length repeat";
     fab:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
          t = s->sub.trees.table;
          if (i + j > 258 + (t & 0x1f) + ((t >> 5) & 0x1f) ||
              (c == 16 && i < 1))
          {
            ZFREE(z, s->sub.trees.blens);
            s->mode = BAD;
     fb2:	c7 45 00 09 00 00 00 	movl   $0x9,0x0(%ebp)
            z->msg = (char*)"invalid bit length repeat";
            r = Z_DATA_ERROR;
            LEAVE
     fb9:	8b 54 24 34          	mov    0x34(%esp),%edx
          if (i + j > 258 + (t & 0x1f) + ((t >> 5) & 0x1f) ||
              (c == 16 && i < 1))
          {
            ZFREE(z, s->sub.trees.blens);
            s->mode = BAD;
            z->msg = (char*)"invalid bit length repeat";
     fbd:	c7 40 18 54 00 00 00 	movl   $0x54,0x18(%eax)
            r = Z_DATA_ERROR;
            LEAVE
     fc4:	89 7d 20             	mov    %edi,0x20(%ebp)
     fc7:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     fca:	e9 a3 fe ff ff       	jmp    e72 <_inflate_blocks+0xd02>
     fcf:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
     fd6:	89 da                	mov    %ebx,%edx
     fd8:	89 f3                	mov    %esi,%ebx
     fda:	89 fe                	mov    %edi,%esi
     fdc:	89 ef                	mov    %ebp,%edi
     fde:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
            inflate_trees_fixed(&bl, &bd, &tl, &td, z);
            s->sub.decode.codes = inflate_codes_new(bl, bd, tl, td, z);
            if (s->sub.decode.codes == Z_NULL)
            {
              r = Z_MEM_ERROR;
              LEAVE
     fe5:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
     fec:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
     fef:	89 c3                	mov    %eax,%ebx
     ff1:	89 7d 20             	mov    %edi,0x20(%ebp)
     ff4:	89 50 04             	mov    %edx,0x4(%eax)
     ff7:	89 f0                	mov    %esi,%eax
     ff9:	2b 03                	sub    (%ebx),%eax
     ffb:	e9 34 ff ff ff       	jmp    f34 <_inflate_blocks+0xdc4>
    1000:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
    1007:	89 da                	mov    %ebx,%edx
    1009:	89 f3                	mov    %esi,%ebx
    100b:	89 fe                	mov    %edi,%esi
    100d:	89 ef                	mov    %ebp,%edi
    100f:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
    1016:	89 44 24 38          	mov    %eax,0x38(%esp)
      s->sub.trees.bb = 7;
      t = inflate_trees_bits(s->sub.trees.blens, &s->sub.trees.bb,
                             &s->sub.trees.tb, s->hufts, z);
      if (t != Z_OK)
      {
        ZFREE(z, s->sub.trees.blens);
    101a:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
    1021:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1024:	89 54 24 34          	mov    %edx,0x34(%esp)
    1028:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    102c:	8b 48 28             	mov    0x28(%eax),%ecx
    102f:	89 0c 24             	mov    %ecx,(%esp)
    1032:	ff 50 24             	call   *0x24(%eax)
        r = t;
        if (r == Z_DATA_ERROR)
    1035:	8b 44 24 38          	mov    0x38(%esp),%eax
    1039:	83 f8 fd             	cmp    $0xfffffffd,%eax
    103c:	8b 54 24 34          	mov    0x34(%esp),%edx
    1040:	0f 84 82 00 00 00    	je     10c8 <_inflate_blocks+0xf58>
          s->mode = BAD;
        LEAVE
    1046:	89 7d 20             	mov    %edi,0x20(%ebp)
    1049:	8b bc 24 84 00 00 00 	mov    0x84(%esp),%edi
    1050:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
    1053:	89 fb                	mov    %edi,%ebx
    1055:	89 57 04             	mov    %edx,0x4(%edi)
    1058:	89 f2                	mov    %esi,%edx
    105a:	2b 17                	sub    (%edi),%edx
    105c:	89 37                	mov    %esi,(%edi)
    105e:	8b 74 24 30          	mov    0x30(%esp),%esi
    1062:	01 57 08             	add    %edx,0x8(%edi)
    1065:	89 75 34             	mov    %esi,0x34(%ebp)
    1068:	e9 da fb ff ff       	jmp    c47 <_inflate_blocks+0xad7>
    106d:	89 94 24 80 00 00 00 	mov    %edx,0x80(%esp)
    1074:	89 c1                	mov    %eax,%ecx
    1076:	89 da                	mov    %ebx,%edx
                                  s->sub.trees.blens, &bl, &bd, &tl, &td,
                                  s->hufts, z);
        ZFREE(z, s->sub.trees.blens);
        if (t != Z_OK)
        {
          if (t == (uInt)Z_DATA_ERROR)
    1078:	83 f8 fd             	cmp    $0xfffffffd,%eax
    107b:	89 f3                	mov    %esi,%ebx
    107d:	89 fe                	mov    %edi,%esi
    107f:	89 ef                	mov    %ebp,%edi
    1081:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
    1088:	75 07                	jne    1091 <_inflate_blocks+0xf21>
            s->mode = BAD;
    108a:	c7 45 00 09 00 00 00 	movl   $0x9,0x0(%ebp)
          r = t;
          LEAVE
    1091:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
    1098:	89 7d 20             	mov    %edi,0x20(%ebp)
    109b:	89 c7                	mov    %eax,%edi
    109d:	89 5d 1c             	mov    %ebx,0x1c(%ebp)
    10a0:	89 50 04             	mov    %edx,0x4(%eax)
    10a3:	89 f0                	mov    %esi,%eax
    10a5:	2b 07                	sub    (%edi),%eax
    10a7:	89 37                	mov    %esi,(%edi)
    10a9:	01 47 08             	add    %eax,0x8(%edi)
    10ac:	8b 44 24 30          	mov    0x30(%esp),%eax
    10b0:	89 45 34             	mov    %eax,0x34(%ebp)
    10b3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    10b7:	89 7c 24 04          	mov    %edi,0x4(%esp)
    10bb:	89 2c 24             	mov    %ebp,(%esp)
    10be:	e8 00 00 00 00       	call   10c3 <_inflate_blocks+0xf53>
    10c3:	e9 fb f4 ff ff       	jmp    5c3 <_inflate_blocks+0x453>
      if (t != Z_OK)
      {
        ZFREE(z, s->sub.trees.blens);
        r = t;
        if (r == Z_DATA_ERROR)
          s->mode = BAD;
    10c8:	c7 45 00 09 00 00 00 	movl   $0x9,0x0(%ebp)
    10cf:	e9 72 ff ff ff       	jmp    1046 <_inflate_blocks+0xed6>
    10d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010e0 <_inflate_blocks_free>:


int inflate_blocks_free(s, z)
inflate_blocks_statef *s;
z_streamp z;
{
    10e0:	56                   	push   %esi
    10e1:	53                   	push   %ebx
    10e2:	83 ec 14             	sub    $0x14,%esp
    10e5:	8b 5c 24 24          	mov    0x24(%esp),%ebx
    10e9:	8b 74 24 20          	mov    0x20(%esp),%esi
  inflate_blocks_reset(s, z, Z_NULL);
    10ed:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    10f1:	89 34 24             	mov    %esi,(%esp)
    10f4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    10fb:	00 
    10fc:	e8 ff ee ff ff       	call   0 <_inflate_blocks_reset>
  ZFREE(z, s->window);
    1101:	8b 46 28             	mov    0x28(%esi),%eax
    1104:	89 44 24 04          	mov    %eax,0x4(%esp)
    1108:	8b 43 28             	mov    0x28(%ebx),%eax
    110b:	89 04 24             	mov    %eax,(%esp)
    110e:	ff 53 24             	call   *0x24(%ebx)
  ZFREE(z, s->hufts);
    1111:	8b 46 24             	mov    0x24(%esi),%eax
    1114:	89 44 24 04          	mov    %eax,0x4(%esp)
    1118:	8b 43 28             	mov    0x28(%ebx),%eax
    111b:	89 04 24             	mov    %eax,(%esp)
    111e:	ff 53 24             	call   *0x24(%ebx)
  ZFREE(z, s);
    1121:	89 74 24 04          	mov    %esi,0x4(%esp)
    1125:	8b 43 28             	mov    0x28(%ebx),%eax
    1128:	89 04 24             	mov    %eax,(%esp)
    112b:	ff 53 24             	call   *0x24(%ebx)
  Tracev((stderr, "inflate:   blocks freed\n"));
  return Z_OK;
}
    112e:	83 c4 14             	add    $0x14,%esp
    1131:	31 c0                	xor    %eax,%eax
    1133:	5b                   	pop    %ebx
    1134:	5e                   	pop    %esi
    1135:	c3                   	ret    
    1136:	8d 76 00             	lea    0x0(%esi),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <_inflate_set_dictionary>:

void inflate_set_dictionary(s, d, n)
inflate_blocks_statef *s;
const Bytef *d;
uInt  n;
{
    1140:	56                   	push   %esi
    1141:	53                   	push   %ebx
    1142:	83 ec 14             	sub    $0x14,%esp
    1145:	8b 74 24 20          	mov    0x20(%esp),%esi
    1149:	8b 5c 24 28          	mov    0x28(%esp),%ebx
  zmemcpy(s->window, d, n);
    114d:	8b 54 24 24          	mov    0x24(%esp),%edx
    1151:	8b 46 28             	mov    0x28(%esi),%eax
    1154:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    1158:	89 54 24 04          	mov    %edx,0x4(%esp)
    115c:	89 04 24             	mov    %eax,(%esp)
    115f:	e8 00 00 00 00       	call   1164 <_inflate_set_dictionary+0x24>
  s->read = s->write = s->window + n;
    1164:	8b 46 28             	mov    0x28(%esi),%eax
    1167:	01 c3                	add    %eax,%ebx
    1169:	89 5e 34             	mov    %ebx,0x34(%esi)
    116c:	89 5e 30             	mov    %ebx,0x30(%esi)
}
    116f:	83 c4 14             	add    $0x14,%esp
    1172:	5b                   	pop    %ebx
    1173:	5e                   	pop    %esi
    1174:	c3                   	ret    
    1175:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001180 <_inflate_blocks_sync_point>:
 * IN assertion: s != Z_NULL
 */
int inflate_blocks_sync_point(s)
inflate_blocks_statef *s;
{
  return s->mode == LENS;
    1180:	8b 44 24 04          	mov    0x4(%esp),%eax
    1184:	83 38 01             	cmpl   $0x1,(%eax)
    1187:	0f 94 c0             	sete   %al
    118a:	25 ff 00 00 00       	and    $0xff,%eax
}
    118f:	c3                   	ret    

infcodes.o:     file format pe-i386


Disassembly of section .text:

00000000 <_inflate_codes_new>:
inflate_codes_statef *inflate_codes_new(bl, bd, tl, td, z)
uInt bl, bd;
inflate_huft *tl;
inflate_huft *td; /* need separate declaration for Borland C++ */
z_streamp z;
{
   0:	83 ec 1c             	sub    $0x1c,%esp
   3:	8b 44 24 30          	mov    0x30(%esp),%eax
  inflate_codes_statef *c;

  if ((c = (inflate_codes_statef *)
   7:	c7 44 24 08 1c 00 00 	movl   $0x1c,0x8(%esp)
   e:	00 
   f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  16:	00 
  17:	8b 50 28             	mov    0x28(%eax),%edx
  1a:	89 14 24             	mov    %edx,(%esp)
  1d:	ff 50 20             	call   *0x20(%eax)
  20:	85 c0                	test   %eax,%eax
  22:	74 22                	je     46 <_inflate_codes_new+0x46>
       ZALLOC(z,1,sizeof(struct inflate_codes_state))) != Z_NULL)
  {
    c->mode = START;
    c->lbits = (Byte)bl;
  24:	8b 54 24 20          	mov    0x20(%esp),%edx
  inflate_codes_statef *c;

  if ((c = (inflate_codes_statef *)
       ZALLOC(z,1,sizeof(struct inflate_codes_state))) != Z_NULL)
  {
    c->mode = START;
  28:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    c->lbits = (Byte)bl;
  2e:	88 50 10             	mov    %dl,0x10(%eax)
    c->dbits = (Byte)bd;
  31:	8b 54 24 24          	mov    0x24(%esp),%edx
  35:	88 50 11             	mov    %dl,0x11(%eax)
    c->ltree = tl;
  38:	8b 54 24 28          	mov    0x28(%esp),%edx
  3c:	89 50 14             	mov    %edx,0x14(%eax)
    c->dtree = td;
  3f:	8b 54 24 2c          	mov    0x2c(%esp),%edx
  43:	89 50 18             	mov    %edx,0x18(%eax)
    Tracev((stderr, "inflate:       codes new\n"));
  }
  return c;
}
  46:	83 c4 1c             	add    $0x1c,%esp
  49:	c3                   	ret    
  4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000050 <_inflate_codes>:

int inflate_codes(s, z, r)
inflate_blocks_statef *s;
z_streamp z;
int r;
{
  50:	55                   	push   %ebp
  51:	57                   	push   %edi
  52:	56                   	push   %esi
  53:	53                   	push   %ebx
  54:	83 ec 4c             	sub    $0x4c,%esp
  57:	8b 74 24 60          	mov    0x60(%esp),%esi
  5b:	8b 44 24 64          	mov    0x64(%esp),%eax
  5f:	89 44 24 30          	mov    %eax,0x30(%esp)
  63:	8b 7c 24 68          	mov    0x68(%esp),%edi
  uInt m;               /* bytes to end of window or read pointer */
  Bytef *f;             /* pointer to copy strings from */
  inflate_codes_statef *c = s->sub.decode.codes;  /* codes state */

  /* copy input/output information to locals (UPDATE macro restores) */
  LOAD
  67:	8b 10                	mov    (%eax),%edx
  69:	8b 58 04             	mov    0x4(%eax),%ebx
  6c:	8b 46 20             	mov    0x20(%esi),%eax

int inflate_codes(s, z, r)
inflate_blocks_statef *s;
z_streamp z;
int r;
{
  6f:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
  uInt m;               /* bytes to end of window or read pointer */
  Bytef *f;             /* pointer to copy strings from */
  inflate_codes_statef *c = s->sub.decode.codes;  /* codes state */

  /* copy input/output information to locals (UPDATE macro restores) */
  LOAD
  73:	89 44 24 28          	mov    %eax,0x28(%esp)
  77:	8b 46 1c             	mov    0x1c(%esi),%eax
  7a:	89 44 24 20          	mov    %eax,0x20(%esp)
  7e:	8b 46 34             	mov    0x34(%esi),%eax
  81:	89 c7                	mov    %eax,%edi
  83:	89 44 24 24          	mov    %eax,0x24(%esp)
  87:	8b 46 30             	mov    0x30(%esi),%eax
  Bytef *p;             /* input data pointer */
  uInt n;               /* bytes available there */
  Bytef *q;             /* output window write pointer */
  uInt m;               /* bytes to end of window or read pointer */
  Bytef *f;             /* pointer to copy strings from */
  inflate_codes_statef *c = s->sub.decode.codes;  /* codes state */
  8a:	8b 6e 04             	mov    0x4(%esi),%ebp

  /* copy input/output information to locals (UPDATE macro restores) */
  LOAD
  8d:	39 c7                	cmp    %eax,%edi
  8f:	73 1f                	jae    b0 <_inflate_codes+0x60>
  91:	29 f8                	sub    %edi,%eax
  93:	48                   	dec    %eax
  94:	89 44 24 34          	mov    %eax,0x34(%esp)
  98:	8b 45 00             	mov    0x0(%ebp),%eax
  9b:	89 f7                	mov    %esi,%edi

  /* process input and output based on current state */
  while (1) switch (c->mode)
  9d:	83 f8 09             	cmp    $0x9,%eax
  a0:	0f 87 da 05 00 00    	ja     680 <_inflate_codes+0x630>
  a6:	ff 24 85 34 00 00 00 	jmp    *0x34(,%eax,4)
  ad:	8d 76 00             	lea    0x0(%esi),%esi
  uInt m;               /* bytes to end of window or read pointer */
  Bytef *f;             /* pointer to copy strings from */
  inflate_codes_statef *c = s->sub.decode.codes;  /* codes state */

  /* copy input/output information to locals (UPDATE macro restores) */
  LOAD
  b0:	8b 46 2c             	mov    0x2c(%esi),%eax
  b3:	8b 7c 24 24          	mov    0x24(%esp),%edi
  b7:	29 f8                	sub    %edi,%eax
  b9:	89 44 24 34          	mov    %eax,0x34(%esp)
  bd:	eb d9                	jmp    98 <_inflate_codes+0x48>
  bf:	90                   	nop
  c0:	89 fe                	mov    %edi,%esi
      if (s->read != s->write)
        LEAVE
      c->mode = END;
    case END:
      r = Z_STREAM_END;
      LEAVE
  c2:	8b 7c 24 30          	mov    0x30(%esp),%edi
  c6:	8b 44 24 28          	mov    0x28(%esp),%eax
  ca:	89 46 20             	mov    %eax,0x20(%esi)
  cd:	8b 44 24 20          	mov    0x20(%esp),%eax
  d1:	89 46 1c             	mov    %eax,0x1c(%esi)
  d4:	89 5f 04             	mov    %ebx,0x4(%edi)
  d7:	89 d0                	mov    %edx,%eax
  d9:	8b 1f                	mov    (%edi),%ebx
  db:	8b 6f 08             	mov    0x8(%edi),%ebp
  de:	29 d8                	sub    %ebx,%eax
  e0:	01 c5                	add    %eax,%ebp
  e2:	8b 44 24 24          	mov    0x24(%esp),%eax
  e6:	89 6f 08             	mov    %ebp,0x8(%edi)
  e9:	89 17                	mov    %edx,(%edi)
  eb:	89 46 34             	mov    %eax,0x34(%esi)
  ee:	c7 44 24 68 01 00 00 	movl   $0x1,0x68(%esp)
  f5:	00 
    case BADCODE:       /* x: got error */
      r = Z_DATA_ERROR;
      LEAVE
    default:
      r = Z_STREAM_ERROR;
      LEAVE
  f6:	89 7c 24 64          	mov    %edi,0x64(%esp)
  fa:	89 74 24 60          	mov    %esi,0x60(%esp)
  }
#ifdef NEED_DUMMY_RETURN
  return Z_STREAM_ERROR;  /* Some dumb compilers complain without this */
#endif
}
  fe:	83 c4 4c             	add    $0x4c,%esp
 101:	5b                   	pop    %ebx
 102:	5e                   	pop    %esi
 103:	5f                   	pop    %edi
 104:	5d                   	pop    %ebp
    case BADCODE:       /* x: got error */
      r = Z_DATA_ERROR;
      LEAVE
    default:
      r = Z_STREAM_ERROR;
      LEAVE
 105:	e9 00 00 00 00       	jmp    10a <_inflate_codes+0xba>
 10a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    case END:
      r = Z_STREAM_END;
      LEAVE
    case BADCODE:       /* x: got error */
      r = Z_DATA_ERROR;
      LEAVE
 110:	8b 44 24 28          	mov    0x28(%esp),%eax
 114:	89 fe                	mov    %edi,%esi
 116:	89 47 20             	mov    %eax,0x20(%edi)
 119:	8b 44 24 20          	mov    0x20(%esp),%eax
 11d:	89 47 1c             	mov    %eax,0x1c(%edi)
 120:	8b 7c 24 30          	mov    0x30(%esp),%edi
 124:	89 d0                	mov    %edx,%eax
 126:	8b 2f                	mov    (%edi),%ebp
 128:	8b 4f 08             	mov    0x8(%edi),%ecx
 12b:	29 e8                	sub    %ebp,%eax
 12d:	89 5f 04             	mov    %ebx,0x4(%edi)
 130:	01 c1                	add    %eax,%ecx
 132:	8b 44 24 24          	mov    0x24(%esp),%eax
 136:	89 4f 08             	mov    %ecx,0x8(%edi)
 139:	89 17                	mov    %edx,(%edi)
 13b:	89 46 34             	mov    %eax,0x34(%esi)
 13e:	c7 44 24 68 fd ff ff 	movl   $0xfffffffd,0x68(%esp)
 145:	ff 
 146:	eb ae                	jmp    f6 <_inflate_codes+0xa6>
  /* process input and output based on current state */
  while (1) switch (c->mode)
  {             /* waiting for "i:"=input, "o:"=output, "x:"=nothing */
    case START:         /* x: set up for LEN */
#ifndef SLOW
      if (m >= 258 && n >= 10)
 148:	83 fb 09             	cmp    $0x9,%ebx
 14b:	76 0e                	jbe    15b <_inflate_codes+0x10b>
 14d:	81 7c 24 34 01 01 00 	cmpl   $0x101,0x34(%esp)
 154:	00 
 155:	0f 87 d5 06 00 00    	ja     830 <_inflate_codes+0x7e0>
          c->mode = r == Z_STREAM_END ? WASH : BADCODE;
          break;
        }
      }
#endif /* !SLOW */
      c->sub.code.need = c->lbits;
 15b:	0f b6 75 10          	movzbl 0x10(%ebp),%esi
      c->sub.code.tree = c->ltree;
 15f:	8b 45 14             	mov    0x14(%ebp),%eax
          c->mode = r == Z_STREAM_END ? WASH : BADCODE;
          break;
        }
      }
#endif /* !SLOW */
      c->sub.code.need = c->lbits;
 162:	81 e6 ff 00 00 00    	and    $0xff,%esi
 168:	89 75 0c             	mov    %esi,0xc(%ebp)
      c->sub.code.tree = c->ltree;
 16b:	89 45 08             	mov    %eax,0x8(%ebp)
      c->mode = LEN;
 16e:	c7 45 00 01 00 00 00 	movl   $0x1,0x0(%ebp)
    case LEN:           /* i: get length/literal/eob next */
      j = c->sub.code.need;
      NEEDBITS(j)
 175:	39 74 24 20          	cmp    %esi,0x20(%esp)
 179:	73 44                	jae    1bf <_inflate_codes+0x16f>
 17b:	85 db                	test   %ebx,%ebx
 17d:	0f 84 96 07 00 00    	je     919 <_inflate_codes+0x8c9>
 183:	89 6c 24 2c          	mov    %ebp,0x2c(%esp)
 187:	8b 4c 24 20          	mov    0x20(%esp),%ecx
 18b:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 18f:	eb 08                	jmp    199 <_inflate_codes+0x149>
 191:	85 db                	test   %ebx,%ebx
 193:	0f 84 97 04 00 00    	je     630 <_inflate_codes+0x5e0>
 199:	42                   	inc    %edx
 19a:	31 c0                	xor    %eax,%eax
 19c:	4b                   	dec    %ebx
 19d:	8a 42 ff             	mov    -0x1(%edx),%al
 1a0:	d3 e0                	shl    %cl,%eax
 1a2:	83 c1 08             	add    $0x8,%ecx
 1a5:	09 c5                	or     %eax,%ebp
 1a7:	39 f1                	cmp    %esi,%ecx
 1a9:	72 e6                	jb     191 <_inflate_codes+0x141>
 1ab:	89 6c 24 28          	mov    %ebp,0x28(%esp)
 1af:	89 4c 24 20          	mov    %ecx,0x20(%esp)
 1b3:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
 1b7:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 1be:	00 
      t = c->sub.code.tree + ((uInt)b & inflate_mask[j]);
 1bf:	8b 04 b5 00 00 00 00 	mov    0x0(,%esi,4),%eax
 1c6:	8b 4c 24 28          	mov    0x28(%esp),%ecx
 1ca:	21 c1                	and    %eax,%ecx
 1cc:	8b 45 08             	mov    0x8(%ebp),%eax
 1cf:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
      DUMPBITS(t->bits)
 1d2:	31 c0                	xor    %eax,%eax
 1d4:	8a 4e 01             	mov    0x1(%esi),%cl
 1d7:	8a 46 01             	mov    0x1(%esi),%al
 1da:	d3 6c 24 28          	shrl   %cl,0x28(%esp)
 1de:	8b 4c 24 20          	mov    0x20(%esp),%ecx
 1e2:	29 c1                	sub    %eax,%ecx
      e = (uInt)(t->exop);
 1e4:	8a 06                	mov    (%esi),%al
      c->mode = LEN;
    case LEN:           /* i: get length/literal/eob next */
      j = c->sub.code.need;
      NEEDBITS(j)
      t = c->sub.code.tree + ((uInt)b & inflate_mask[j]);
      DUMPBITS(t->bits)
 1e6:	89 4c 24 20          	mov    %ecx,0x20(%esp)
      e = (uInt)(t->exop);
 1ea:	31 c9                	xor    %ecx,%ecx
 1ec:	88 c1                	mov    %al,%cl
      if (e == 0)               /* literal */
 1ee:	85 c9                	test   %ecx,%ecx
 1f0:	0f 85 aa 05 00 00    	jne    7a0 <_inflate_codes+0x750>
      {
        c->sub.lit = t->base;
 1f6:	8b 46 04             	mov    0x4(%esi),%eax
        Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                 "inflate:         literal '%c'\n" :
                 "inflate:         literal 0x%02x\n", t->base));
        c->mode = LIT;
 1f9:	c7 45 00 06 00 00 00 	movl   $0x6,0x0(%ebp)
      t = c->sub.code.tree + ((uInt)b & inflate_mask[j]);
      DUMPBITS(t->bits)
      e = (uInt)(t->exop);
      if (e == 0)               /* literal */
      {
        c->sub.lit = t->base;
 200:	89 45 08             	mov    %eax,0x8(%ebp)
        Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                 "inflate:         literal '%c'\n" :
                 "inflate:         literal 0x%02x\n", t->base));
        c->mode = LIT;
        break;
 203:	b8 06 00 00 00       	mov    $0x6,%eax
 208:	e9 99 fe ff ff       	jmp    a6 <_inflate_codes+0x56>
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	8b 75 0c             	mov    0xc(%ebp),%esi
 213:	e9 5d ff ff ff       	jmp    175 <_inflate_codes+0x125>
      c->mode = BADCODE;        /* invalid code */
      z->msg = (char*)"invalid literal/length code";
      r = Z_DATA_ERROR;
      LEAVE
    case LENEXT:        /* i: getting length extra (have base) */
      j = c->sub.copy.get;
 218:	8b 75 08             	mov    0x8(%ebp),%esi
      NEEDBITS(j)
 21b:	39 74 24 20          	cmp    %esi,0x20(%esp)
 21f:	73 44                	jae    265 <_inflate_codes+0x215>
 221:	85 db                	test   %ebx,%ebx
 223:	0f 84 1f 07 00 00    	je     948 <_inflate_codes+0x8f8>
 229:	89 6c 24 2c          	mov    %ebp,0x2c(%esp)
 22d:	8b 4c 24 20          	mov    0x20(%esp),%ecx
 231:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 235:	eb 08                	jmp    23f <_inflate_codes+0x1ef>
 237:	85 db                	test   %ebx,%ebx
 239:	0f 84 e1 04 00 00    	je     720 <_inflate_codes+0x6d0>
 23f:	42                   	inc    %edx
 240:	31 c0                	xor    %eax,%eax
 242:	4b                   	dec    %ebx
 243:	8a 42 ff             	mov    -0x1(%edx),%al
 246:	d3 e0                	shl    %cl,%eax
 248:	83 c1 08             	add    $0x8,%ecx
 24b:	09 c5                	or     %eax,%ebp
 24d:	39 ce                	cmp    %ecx,%esi
 24f:	77 e6                	ja     237 <_inflate_codes+0x1e7>
 251:	89 6c 24 28          	mov    %ebp,0x28(%esp)
 255:	89 4c 24 20          	mov    %ecx,0x20(%esp)
 259:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
 25d:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 264:	00 
      c->len += (uInt)b & inflate_mask[j];
 265:	8b 04 b5 00 00 00 00 	mov    0x0(,%esi,4),%eax
 26c:	8b 4c 24 28          	mov    0x28(%esp),%ecx
 270:	21 c8                	and    %ecx,%eax
      DUMPBITS(j)
      c->sub.code.need = c->dbits;
      c->sub.code.tree = c->dtree;
      Tracevv((stderr, "inflate:         length %u\n", c->len));
      c->mode = DIST;
 272:	c7 45 00 03 00 00 00 	movl   $0x3,0x0(%ebp)
      r = Z_DATA_ERROR;
      LEAVE
    case LENEXT:        /* i: getting length extra (have base) */
      j = c->sub.copy.get;
      NEEDBITS(j)
      c->len += (uInt)b & inflate_mask[j];
 279:	01 45 04             	add    %eax,0x4(%ebp)
      DUMPBITS(j)
 27c:	89 c8                	mov    %ecx,%eax
 27e:	89 f1                	mov    %esi,%ecx
 280:	d3 e8                	shr    %cl,%eax
 282:	89 44 24 28          	mov    %eax,0x28(%esp)
 286:	8b 44 24 20          	mov    0x20(%esp),%eax
 28a:	29 f0                	sub    %esi,%eax
      c->sub.code.need = c->dbits;
 28c:	0f b6 75 11          	movzbl 0x11(%ebp),%esi
      LEAVE
    case LENEXT:        /* i: getting length extra (have base) */
      j = c->sub.copy.get;
      NEEDBITS(j)
      c->len += (uInt)b & inflate_mask[j];
      DUMPBITS(j)
 290:	89 44 24 20          	mov    %eax,0x20(%esp)
      c->sub.code.need = c->dbits;
 294:	81 e6 ff 00 00 00    	and    $0xff,%esi
      c->sub.code.tree = c->dtree;
 29a:	8b 45 18             	mov    0x18(%ebp),%eax
    case LENEXT:        /* i: getting length extra (have base) */
      j = c->sub.copy.get;
      NEEDBITS(j)
      c->len += (uInt)b & inflate_mask[j];
      DUMPBITS(j)
      c->sub.code.need = c->dbits;
 29d:	89 75 0c             	mov    %esi,0xc(%ebp)
      c->sub.code.tree = c->dtree;
 2a0:	89 45 08             	mov    %eax,0x8(%ebp)
 2a3:	eb 03                	jmp    2a8 <_inflate_codes+0x258>
 2a5:	8b 75 0c             	mov    0xc(%ebp),%esi
      Tracevv((stderr, "inflate:         length %u\n", c->len));
      c->mode = DIST;
    case DIST:          /* i: get distance next */
      j = c->sub.code.need;
      NEEDBITS(j)
 2a8:	39 74 24 20          	cmp    %esi,0x20(%esp)
 2ac:	73 44                	jae    2f2 <_inflate_codes+0x2a2>
 2ae:	85 db                	test   %ebx,%ebx
 2b0:	0f 84 63 06 00 00    	je     919 <_inflate_codes+0x8c9>
 2b6:	89 6c 24 2c          	mov    %ebp,0x2c(%esp)
 2ba:	8b 4c 24 20          	mov    0x20(%esp),%ecx
 2be:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 2c2:	eb 08                	jmp    2cc <_inflate_codes+0x27c>
 2c4:	85 db                	test   %ebx,%ebx
 2c6:	0f 84 64 03 00 00    	je     630 <_inflate_codes+0x5e0>
 2cc:	42                   	inc    %edx
 2cd:	31 c0                	xor    %eax,%eax
 2cf:	4b                   	dec    %ebx
 2d0:	8a 42 ff             	mov    -0x1(%edx),%al
 2d3:	d3 e0                	shl    %cl,%eax
 2d5:	83 c1 08             	add    $0x8,%ecx
 2d8:	09 c5                	or     %eax,%ebp
 2da:	39 f1                	cmp    %esi,%ecx
 2dc:	72 e6                	jb     2c4 <_inflate_codes+0x274>
 2de:	89 6c 24 28          	mov    %ebp,0x28(%esp)
 2e2:	89 4c 24 20          	mov    %ecx,0x20(%esp)
 2e6:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
 2ea:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 2f1:	00 
      t = c->sub.code.tree + ((uInt)b & inflate_mask[j]);
 2f2:	8b 04 b5 00 00 00 00 	mov    0x0(,%esi,4),%eax
 2f9:	8b 4c 24 28          	mov    0x28(%esp),%ecx
 2fd:	21 c1                	and    %eax,%ecx
 2ff:	8b 45 08             	mov    0x8(%ebp),%eax
 302:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
      DUMPBITS(t->bits)
 305:	31 c0                	xor    %eax,%eax
 307:	8a 4e 01             	mov    0x1(%esi),%cl
 30a:	8a 46 01             	mov    0x1(%esi),%al
 30d:	d3 6c 24 28          	shrl   %cl,0x28(%esp)
 311:	8b 4c 24 20          	mov    0x20(%esp),%ecx
 315:	29 c1                	sub    %eax,%ecx
      e = (uInt)(t->exop);
 317:	8a 06                	mov    (%esi),%al
      c->mode = DIST;
    case DIST:          /* i: get distance next */
      j = c->sub.code.need;
      NEEDBITS(j)
      t = c->sub.code.tree + ((uInt)b & inflate_mask[j]);
      DUMPBITS(t->bits)
 319:	89 4c 24 20          	mov    %ecx,0x20(%esp)
      e = (uInt)(t->exop);
      if (e & 16)               /* distance */
 31d:	a8 10                	test   $0x10,%al
 31f:	0f 84 ab 04 00 00    	je     7d0 <_inflate_codes+0x780>
      {
        c->sub.copy.get = e & 15;
 325:	83 e0 0f             	and    $0xf,%eax
 328:	89 45 08             	mov    %eax,0x8(%ebp)
        c->sub.copy.dist = t->base;
 32b:	8b 46 04             	mov    0x4(%esi),%eax
        c->mode = DISTEXT;
 32e:	c7 45 00 04 00 00 00 	movl   $0x4,0x0(%ebp)
      DUMPBITS(t->bits)
      e = (uInt)(t->exop);
      if (e & 16)               /* distance */
      {
        c->sub.copy.get = e & 15;
        c->sub.copy.dist = t->base;
 335:	89 45 0c             	mov    %eax,0xc(%ebp)
        c->mode = DISTEXT;
        break;
 338:	b8 04 00 00 00       	mov    $0x4,%eax
 33d:	e9 64 fd ff ff       	jmp    a6 <_inflate_codes+0x56>
      c->mode = BADCODE;        /* invalid code */
      z->msg = (char*)"invalid distance code";
      r = Z_DATA_ERROR;
      LEAVE
    case DISTEXT:       /* i: getting distance extra */
      j = c->sub.copy.get;
 342:	8b 45 08             	mov    0x8(%ebp),%eax
      NEEDBITS(j)
 345:	39 44 24 20          	cmp    %eax,0x20(%esp)
 349:	73 49                	jae    394 <_inflate_codes+0x344>
 34b:	85 db                	test   %ebx,%ebx
 34d:	0f 84 f5 05 00 00    	je     948 <_inflate_codes+0x8f8>
 353:	89 6c 24 2c          	mov    %ebp,0x2c(%esp)
 357:	8b 4c 24 20          	mov    0x20(%esp),%ecx
 35b:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 35f:	eb 08                	jmp    369 <_inflate_codes+0x319>
 361:	85 db                	test   %ebx,%ebx
 363:	0f 84 b7 03 00 00    	je     720 <_inflate_codes+0x6d0>
 369:	42                   	inc    %edx
 36a:	4b                   	dec    %ebx
 36b:	0f b6 72 ff          	movzbl -0x1(%edx),%esi
 36f:	81 e6 ff 00 00 00    	and    $0xff,%esi
 375:	d3 e6                	shl    %cl,%esi
 377:	83 c1 08             	add    $0x8,%ecx
 37a:	09 f5                	or     %esi,%ebp
 37c:	39 c8                	cmp    %ecx,%eax
 37e:	77 e1                	ja     361 <_inflate_codes+0x311>
 380:	89 6c 24 28          	mov    %ebp,0x28(%esp)
 384:	89 4c 24 20          	mov    %ecx,0x20(%esp)
 388:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
 38c:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 393:	00 
      c->sub.copy.dist += (uInt)b & inflate_mask[j];
 394:	8b 74 24 28          	mov    0x28(%esp),%esi
 398:	8b 0c 85 00 00 00 00 	mov    0x0(,%eax,4),%ecx
 39f:	21 f1                	and    %esi,%ecx
      DUMPBITS(j)
      Tracevv((stderr, "inflate:         distance %u\n", c->sub.copy.dist));
      c->mode = COPY;
 3a1:	c7 45 00 05 00 00 00 	movl   $0x5,0x0(%ebp)
      r = Z_DATA_ERROR;
      LEAVE
    case DISTEXT:       /* i: getting distance extra */
      j = c->sub.copy.get;
      NEEDBITS(j)
      c->sub.copy.dist += (uInt)b & inflate_mask[j];
 3a8:	03 4d 0c             	add    0xc(%ebp),%ecx
 3ab:	89 4c 24 38          	mov    %ecx,0x38(%esp)
 3af:	89 4d 0c             	mov    %ecx,0xc(%ebp)
      DUMPBITS(j)
 3b2:	88 c1                	mov    %al,%cl
 3b4:	d3 ee                	shr    %cl,%esi
 3b6:	8b 4c 24 20          	mov    0x20(%esp),%ecx
 3ba:	89 74 24 28          	mov    %esi,0x28(%esp)
 3be:	29 c1                	sub    %eax,%ecx
 3c0:	89 4c 24 20          	mov    %ecx,0x20(%esp)
 3c4:	eb 07                	jmp    3cd <_inflate_codes+0x37d>
 3c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c9:	89 44 24 38          	mov    %eax,0x38(%esp)
      Tracevv((stderr, "inflate:         distance %u\n", c->sub.copy.dist));
      c->mode = COPY;
    case COPY:          /* o: copying bytes in window, waiting for space */
#ifndef __TURBOC__ /* Turbo C bug for following expression */
      f = (uInt)(q - s->window) < c->sub.copy.dist ?
 3cd:	8b 74 24 24          	mov    0x24(%esp),%esi
 3d1:	8b 47 28             	mov    0x28(%edi),%eax
 3d4:	89 f1                	mov    %esi,%ecx
          s->end - (c->sub.copy.dist - (q - s->window)) :
 3d6:	2b 74 24 38          	sub    0x38(%esp),%esi
      DUMPBITS(j)
      Tracevv((stderr, "inflate:         distance %u\n", c->sub.copy.dist));
      c->mode = COPY;
    case COPY:          /* o: copying bytes in window, waiting for space */
#ifndef __TURBOC__ /* Turbo C bug for following expression */
      f = (uInt)(q - s->window) < c->sub.copy.dist ?
 3da:	29 c1                	sub    %eax,%ecx
          s->end - (c->sub.copy.dist - (q - s->window)) :
 3dc:	3b 4c 24 38          	cmp    0x38(%esp),%ecx
 3e0:	73 11                	jae    3f3 <_inflate_codes+0x3a3>
 3e2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 3e6:	8b 74 24 38          	mov    0x38(%esp),%esi
 3ea:	29 c8                	sub    %ecx,%eax
 3ec:	01 f0                	add    %esi,%eax
 3ee:	8b 77 2c             	mov    0x2c(%edi),%esi
 3f1:	29 c6                	sub    %eax,%esi
#else
      f = q - c->sub.copy.dist;
      if ((uInt)(q - s->window) < c->sub.copy.dist)
        f = s->end - (c->sub.copy.dist - (uInt)(q - s->window));
#endif
      while (c->len)
 3f3:	8b 45 04             	mov    0x4(%ebp),%eax
 3f6:	85 c0                	test   %eax,%eax
 3f8:	0f 84 b6 00 00 00    	je     4b4 <_inflate_codes+0x464>
 3fe:	89 54 24 38          	mov    %edx,0x38(%esp)
 402:	89 5c 24 3c          	mov    %ebx,0x3c(%esp)
 406:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 40a:	8b 54 24 34          	mov    0x34(%esp),%edx
 40e:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
 412:	eb 65                	jmp    479 <_inflate_codes+0x429>
      {
        NEEDOUT
 414:	39 4f 2c             	cmp    %ecx,0x2c(%edi)
 417:	0f 84 d3 01 00 00    	je     5f0 <_inflate_codes+0x5a0>
 41d:	8b 44 24 30          	mov    0x30(%esp),%eax
 421:	89 4f 34             	mov    %ecx,0x34(%edi)
 424:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 428:	89 44 24 04          	mov    %eax,0x4(%esp)
 42c:	89 3c 24             	mov    %edi,(%esp)
 42f:	e8 00 00 00 00       	call   434 <_inflate_codes+0x3e4>
 434:	8b 4f 30             	mov    0x30(%edi),%ecx
 437:	89 44 24 24          	mov    %eax,0x24(%esp)
 43b:	8b 47 34             	mov    0x34(%edi),%eax
 43e:	39 c8                	cmp    %ecx,%eax
 440:	0f 83 de 01 00 00    	jae    624 <_inflate_codes+0x5d4>
 446:	89 ca                	mov    %ecx,%edx
 448:	8b 5f 2c             	mov    0x2c(%edi),%ebx
 44b:	29 c2                	sub    %eax,%edx
 44d:	4a                   	dec    %edx
 44e:	39 d8                	cmp    %ebx,%eax
 450:	0f 84 2a 03 00 00    	je     780 <_inflate_codes+0x730>
 456:	85 d2                	test   %edx,%edx
 458:	0f 84 7c 04 00 00    	je     8da <_inflate_codes+0x88a>
        OUTBYTE(*f++)
 45e:	8a 1e                	mov    (%esi),%bl
 460:	46                   	inc    %esi
 461:	88 18                	mov    %bl,(%eax)
 463:	4a                   	dec    %edx
 464:	8d 48 01             	lea    0x1(%eax),%ecx
        if (f == s->end)
 467:	39 77 2c             	cmp    %esi,0x2c(%edi)
 46a:	74 21                	je     48d <_inflate_codes+0x43d>
          f = s->window;
        c->len--;
 46c:	8b 45 04             	mov    0x4(%ebp),%eax
      if ((uInt)(q - s->window) < c->sub.copy.dist)
        f = s->end - (c->sub.copy.dist - (uInt)(q - s->window));
#endif
      while (c->len)
      {
        NEEDOUT
 46f:	31 db                	xor    %ebx,%ebx
        OUTBYTE(*f++)
        if (f == s->end)
          f = s->window;
        c->len--;
 471:	48                   	dec    %eax
 472:	89 45 04             	mov    %eax,0x4(%ebp)
#else
      f = q - c->sub.copy.dist;
      if ((uInt)(q - s->window) < c->sub.copy.dist)
        f = s->end - (c->sub.copy.dist - (uInt)(q - s->window));
#endif
      while (c->len)
 475:	85 c0                	test   %eax,%eax
 477:	74 27                	je     4a0 <_inflate_codes+0x450>
      {
        NEEDOUT
 479:	85 d2                	test   %edx,%edx
 47b:	74 97                	je     414 <_inflate_codes+0x3c4>
 47d:	89 c8                	mov    %ecx,%eax
        OUTBYTE(*f++)
 47f:	8a 1e                	mov    (%esi),%bl
 481:	46                   	inc    %esi
 482:	4a                   	dec    %edx
 483:	88 18                	mov    %bl,(%eax)
 485:	8d 48 01             	lea    0x1(%eax),%ecx
        if (f == s->end)
 488:	39 77 2c             	cmp    %esi,0x2c(%edi)
 48b:	75 df                	jne    46c <_inflate_codes+0x41c>
          f = s->window;
        c->len--;
 48d:	8b 45 04             	mov    0x4(%ebp),%eax
      while (c->len)
      {
        NEEDOUT
        OUTBYTE(*f++)
        if (f == s->end)
          f = s->window;
 490:	8b 77 28             	mov    0x28(%edi),%esi
        c->len--;
 493:	48                   	dec    %eax
      if ((uInt)(q - s->window) < c->sub.copy.dist)
        f = s->end - (c->sub.copy.dist - (uInt)(q - s->window));
#endif
      while (c->len)
      {
        NEEDOUT
 494:	31 db                	xor    %ebx,%ebx
        OUTBYTE(*f++)
        if (f == s->end)
          f = s->window;
        c->len--;
 496:	89 45 04             	mov    %eax,0x4(%ebp)
#else
      f = q - c->sub.copy.dist;
      if ((uInt)(q - s->window) < c->sub.copy.dist)
        f = s->end - (c->sub.copy.dist - (uInt)(q - s->window));
#endif
      while (c->len)
 499:	85 c0                	test   %eax,%eax
 49b:	75 dc                	jne    479 <_inflate_codes+0x429>
 49d:	8d 76 00             	lea    0x0(%esi),%esi
 4a0:	89 54 24 34          	mov    %edx,0x34(%esp)
 4a4:	89 5c 24 2c          	mov    %ebx,0x2c(%esp)
 4a8:	89 4c 24 24          	mov    %ecx,0x24(%esp)
 4ac:	8b 54 24 38          	mov    0x38(%esp),%edx
 4b0:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
        OUTBYTE(*f++)
        if (f == s->end)
          f = s->window;
        c->len--;
      }
      c->mode = START;
 4b4:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%ebp)
      break;
 4bb:	31 c0                	xor    %eax,%eax
 4bd:	e9 e4 fb ff ff       	jmp    a6 <_inflate_codes+0x56>
    case LIT:           /* o: got literal, waiting for output space */
      NEEDOUT
 4c2:	8b 44 24 34          	mov    0x34(%esp),%eax
 4c6:	85 c0                	test   %eax,%eax
 4c8:	0f 85 22 02 00 00    	jne    6f0 <_inflate_codes+0x6a0>
 4ce:	8b 4f 2c             	mov    0x2c(%edi),%ecx
 4d1:	3b 4c 24 24          	cmp    0x24(%esp),%ecx
 4d5:	0f 84 e0 01 00 00    	je     6bb <_inflate_codes+0x66b>
 4db:	8b 44 24 24          	mov    0x24(%esp),%eax
 4df:	89 54 24 34          	mov    %edx,0x34(%esp)
 4e3:	89 47 34             	mov    %eax,0x34(%edi)
 4e6:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 4ea:	89 44 24 08          	mov    %eax,0x8(%esp)
 4ee:	8b 44 24 30          	mov    0x30(%esp),%eax
 4f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f6:	89 3c 24             	mov    %edi,(%esp)
 4f9:	e8 00 00 00 00       	call   4fe <_inflate_codes+0x4ae>
 4fe:	8b 4f 30             	mov    0x30(%edi),%ecx
 501:	89 44 24 2c          	mov    %eax,0x2c(%esp)
 505:	8b 47 34             	mov    0x34(%edi),%eax
 508:	89 44 24 24          	mov    %eax,0x24(%esp)
 50c:	39 c8                	cmp    %ecx,%eax
 50e:	8b 54 24 34          	mov    0x34(%esp),%edx
 512:	0f 82 02 03 00 00    	jb     81a <_inflate_codes+0x7ca>
 518:	8b 47 2c             	mov    0x2c(%edi),%eax
 51b:	89 c6                	mov    %eax,%esi
 51d:	2b 74 24 24          	sub    0x24(%esp),%esi
 521:	89 74 24 34          	mov    %esi,0x34(%esp)
 525:	39 44 24 24          	cmp    %eax,0x24(%esp)
 529:	0f 84 20 04 00 00    	je     94f <_inflate_codes+0x8ff>
 52f:	8b 44 24 34          	mov    0x34(%esp),%eax
 533:	85 c0                	test   %eax,%eax
 535:	0f 85 b5 01 00 00    	jne    6f0 <_inflate_codes+0x6a0>
 53b:	8b 44 24 28          	mov    0x28(%esp),%eax
 53f:	89 fe                	mov    %edi,%esi
 541:	89 47 20             	mov    %eax,0x20(%edi)
 544:	8b 44 24 20          	mov    0x20(%esp),%eax
 548:	89 47 1c             	mov    %eax,0x1c(%edi)
 54b:	8b 7c 24 30          	mov    0x30(%esp),%edi
 54f:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
 553:	89 5f 04             	mov    %ebx,0x4(%edi)
 556:	89 d3                	mov    %edx,%ebx
 558:	2b 1f                	sub    (%edi),%ebx
 55a:	89 17                	mov    %edx,(%edi)
 55c:	8b 54 24 24          	mov    0x24(%esp),%edx
 560:	01 5f 08             	add    %ebx,0x8(%edi)
 563:	89 56 34             	mov    %edx,0x34(%esi)
 566:	89 4c 24 68          	mov    %ecx,0x68(%esp)
 56a:	89 7c 24 64          	mov    %edi,0x64(%esp)
 56e:	e9 87 fb ff ff       	jmp    fa <_inflate_codes+0xaa>
 573:	89 fe                	mov    %edi,%esi

  /* copy input/output information to locals (UPDATE macro restores) */
  LOAD

  /* process input and output based on current state */
  while (1) switch (c->mode)
 575:	89 df                	mov    %ebx,%edi
      NEEDOUT
      OUTBYTE(c->sub.lit)
      c->mode = START;
      break;
    case WASH:          /* o: got eob, possibly more output */
      if (k > 7)        /* return unused byte, if any */
 577:	83 7c 24 20 07       	cmpl   $0x7,0x20(%esp)
 57c:	76 0d                	jbe    58b <_inflate_codes+0x53b>
      {
        Assert(k < 16, "inflate_codes grabbed too many bytes")
        k -= 8;
 57e:	8b 44 24 20          	mov    0x20(%esp),%eax
        n++;
 582:	47                   	inc    %edi
      break;
    case WASH:          /* o: got eob, possibly more output */
      if (k > 7)        /* return unused byte, if any */
      {
        Assert(k < 16, "inflate_codes grabbed too many bytes")
        k -= 8;
 583:	83 e8 08             	sub    $0x8,%eax
        n++;
        p--;            /* can always return one */
 586:	4a                   	dec    %edx
      break;
    case WASH:          /* o: got eob, possibly more output */
      if (k > 7)        /* return unused byte, if any */
      {
        Assert(k < 16, "inflate_codes grabbed too many bytes")
        k -= 8;
 587:	89 44 24 20          	mov    %eax,0x20(%esp)
        n++;
        p--;            /* can always return one */
      }
      FLUSH
 58b:	8b 44 24 24          	mov    0x24(%esp),%eax
 58f:	8b 5c 24 30          	mov    0x30(%esp),%ebx
 593:	89 46 34             	mov    %eax,0x34(%esi)
 596:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 59a:	89 44 24 08          	mov    %eax,0x8(%esp)
 59e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 5a2:	89 34 24             	mov    %esi,(%esp)
 5a5:	89 54 24 34          	mov    %edx,0x34(%esp)
 5a9:	e8 00 00 00 00       	call   5ae <_inflate_codes+0x55e>
 5ae:	8b 4e 34             	mov    0x34(%esi),%ecx
 5b1:	89 4c 24 24          	mov    %ecx,0x24(%esp)
      if (s->read != s->write)
 5b5:	3b 4e 30             	cmp    0x30(%esi),%ecx
 5b8:	8b 54 24 34          	mov    0x34(%esp),%edx
 5bc:	0f 84 fe 01 00 00    	je     7c0 <_inflate_codes+0x770>
        LEAVE
 5c2:	8b 4c 24 28          	mov    0x28(%esp),%ecx
 5c6:	89 4e 20             	mov    %ecx,0x20(%esi)
 5c9:	8b 4c 24 20          	mov    0x20(%esp),%ecx
 5cd:	89 4e 1c             	mov    %ecx,0x1c(%esi)
 5d0:	89 7b 04             	mov    %edi,0x4(%ebx)
 5d3:	89 df                	mov    %ebx,%edi
 5d5:	89 d1                	mov    %edx,%ecx
 5d7:	8b 1b                	mov    (%ebx),%ebx
 5d9:	8b 6f 08             	mov    0x8(%edi),%ebp
 5dc:	29 d9                	sub    %ebx,%ecx
 5de:	01 cd                	add    %ecx,%ebp
 5e0:	89 17                	mov    %edx,(%edi)
 5e2:	89 6f 08             	mov    %ebp,0x8(%edi)
 5e5:	89 44 24 68          	mov    %eax,0x68(%esp)
 5e9:	e9 08 fb ff ff       	jmp    f6 <_inflate_codes+0xa6>
 5ee:	66 90                	xchg   %ax,%ax
      if ((uInt)(q - s->window) < c->sub.copy.dist)
        f = s->end - (c->sub.copy.dist - (uInt)(q - s->window));
#endif
      while (c->len)
      {
        NEEDOUT
 5f0:	8b 47 30             	mov    0x30(%edi),%eax
 5f3:	89 c2                	mov    %eax,%edx
 5f5:	8b 47 28             	mov    0x28(%edi),%eax
 5f8:	89 54 24 24          	mov    %edx,0x24(%esp)
 5fc:	39 c2                	cmp    %eax,%edx
 5fe:	0f 84 19 fe ff ff    	je     41d <_inflate_codes+0x3cd>
 604:	29 c1                	sub    %eax,%ecx
 606:	39 44 24 24          	cmp    %eax,0x24(%esp)
 60a:	89 ca                	mov    %ecx,%edx
 60c:	76 07                	jbe    615 <_inflate_codes+0x5c5>
 60e:	8b 54 24 24          	mov    0x24(%esp),%edx
 612:	29 c2                	sub    %eax,%edx
 614:	4a                   	dec    %edx
 615:	85 d2                	test   %edx,%edx
 617:	0f 85 41 fe ff ff    	jne    45e <_inflate_codes+0x40e>
 61d:	89 c1                	mov    %eax,%ecx
 61f:	e9 f9 fd ff ff       	jmp    41d <_inflate_codes+0x3cd>
 624:	8b 5f 2c             	mov    0x2c(%edi),%ebx
 627:	89 da                	mov    %ebx,%edx
 629:	29 c2                	sub    %eax,%edx
 62b:	e9 1e fe ff ff       	jmp    44e <_inflate_codes+0x3fe>
 630:	89 6c 24 28          	mov    %ebp,0x28(%esp)
 634:	89 4c 24 20          	mov    %ecx,0x20(%esp)
 638:	89 fe                	mov    %edi,%esi
      c->sub.code.tree = c->dtree;
      Tracevv((stderr, "inflate:         length %u\n", c->len));
      c->mode = DIST;
    case DIST:          /* i: get distance next */
      j = c->sub.code.need;
      NEEDBITS(j)
 63a:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 641:	00 
 642:	8b 7c 24 30          	mov    0x30(%esp),%edi
 646:	8b 44 24 28          	mov    0x28(%esp),%eax
 64a:	89 46 20             	mov    %eax,0x20(%esi)
 64d:	8b 44 24 20          	mov    0x20(%esp),%eax
 651:	89 46 1c             	mov    %eax,0x1c(%esi)
 654:	8b 1f                	mov    (%edi),%ebx
 656:	89 d0                	mov    %edx,%eax
 658:	8b 6f 08             	mov    0x8(%edi),%ebp
 65b:	29 d8                	sub    %ebx,%eax
 65d:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
 664:	01 c5                	add    %eax,%ebp
 666:	8b 44 24 24          	mov    0x24(%esp),%eax
 66a:	89 6f 08             	mov    %ebp,0x8(%edi)
 66d:	89 17                	mov    %edx,(%edi)
 66f:	89 46 34             	mov    %eax,0x34(%esi)
 672:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 676:	89 44 24 68          	mov    %eax,0x68(%esp)
 67a:	e9 77 fa ff ff       	jmp    f6 <_inflate_codes+0xa6>
 67f:	90                   	nop
    case BADCODE:       /* x: got error */
      r = Z_DATA_ERROR;
      LEAVE
    default:
      r = Z_STREAM_ERROR;
      LEAVE
 680:	8b 44 24 28          	mov    0x28(%esp),%eax
 684:	89 fe                	mov    %edi,%esi
 686:	89 47 20             	mov    %eax,0x20(%edi)
 689:	8b 44 24 20          	mov    0x20(%esp),%eax
 68d:	89 47 1c             	mov    %eax,0x1c(%edi)
 690:	8b 7c 24 30          	mov    0x30(%esp),%edi
 694:	89 d0                	mov    %edx,%eax
 696:	8b 0f                	mov    (%edi),%ecx
 698:	89 5f 04             	mov    %ebx,0x4(%edi)
 69b:	29 c8                	sub    %ecx,%eax
 69d:	8b 5f 08             	mov    0x8(%edi),%ebx
 6a0:	01 c3                	add    %eax,%ebx
 6a2:	8b 44 24 24          	mov    0x24(%esp),%eax
 6a6:	89 5f 08             	mov    %ebx,0x8(%edi)
 6a9:	89 17                	mov    %edx,(%edi)
 6ab:	89 46 34             	mov    %eax,0x34(%esi)
 6ae:	c7 44 24 68 fe ff ff 	movl   $0xfffffffe,0x68(%esp)
 6b5:	ff 
 6b6:	e9 3b fa ff ff       	jmp    f6 <_inflate_codes+0xa6>
        c->len--;
      }
      c->mode = START;
      break;
    case LIT:           /* o: got literal, waiting for output space */
      NEEDOUT
 6bb:	8b 77 28             	mov    0x28(%edi),%esi
 6be:	8b 47 30             	mov    0x30(%edi),%eax
 6c1:	89 74 24 24          	mov    %esi,0x24(%esp)
 6c5:	39 f0                	cmp    %esi,%eax
 6c7:	0f 84 9f 02 00 00    	je     96c <_inflate_codes+0x91c>
 6cd:	29 f1                	sub    %esi,%ecx
 6cf:	39 f0                	cmp    %esi,%eax
 6d1:	89 4c 24 34          	mov    %ecx,0x34(%esp)
 6d5:	76 09                	jbe    6e0 <_inflate_codes+0x690>
 6d7:	29 f0                	sub    %esi,%eax
 6d9:	8d 40 ff             	lea    -0x1(%eax),%eax
 6dc:	89 44 24 34          	mov    %eax,0x34(%esp)
 6e0:	8b 44 24 34          	mov    0x34(%esp),%eax
 6e4:	85 c0                	test   %eax,%eax
 6e6:	0f 84 ef fd ff ff    	je     4db <_inflate_codes+0x48b>
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      OUTBYTE(c->sub.lit)
 6f0:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
        c->len--;
      }
      c->mode = START;
      break;
    case LIT:           /* o: got literal, waiting for output space */
      NEEDOUT
 6f7:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 6fe:	00 
      OUTBYTE(c->sub.lit)
 6ff:	88 01                	mov    %al,(%ecx)
 701:	8b 44 24 34          	mov    0x34(%esp),%eax
 705:	48                   	dec    %eax
      c->mode = START;
 706:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%ebp)
      }
      c->mode = START;
      break;
    case LIT:           /* o: got literal, waiting for output space */
      NEEDOUT
      OUTBYTE(c->sub.lit)
 70d:	89 44 24 34          	mov    %eax,0x34(%esp)
 711:	8d 41 01             	lea    0x1(%ecx),%eax
 714:	89 44 24 24          	mov    %eax,0x24(%esp)
      c->mode = START;
      break;
 718:	31 c0                	xor    %eax,%eax
 71a:	e9 87 f9 ff ff       	jmp    a6 <_inflate_codes+0x56>
 71f:	90                   	nop
 720:	89 6c 24 28          	mov    %ebp,0x28(%esp)
 724:	89 4c 24 20          	mov    %ecx,0x20(%esp)
 728:	89 fe                	mov    %edi,%esi
      z->msg = (char*)"invalid distance code";
      r = Z_DATA_ERROR;
      LEAVE
    case DISTEXT:       /* i: getting distance extra */
      j = c->sub.copy.get;
      NEEDBITS(j)
 72a:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 731:	00 
 732:	8b 5c 24 30          	mov    0x30(%esp),%ebx
 736:	8b 44 24 28          	mov    0x28(%esp),%eax
 73a:	89 46 20             	mov    %eax,0x20(%esi)
 73d:	8b 44 24 20          	mov    0x20(%esp),%eax
 741:	89 46 1c             	mov    %eax,0x1c(%esi)
 744:	8b 3b                	mov    (%ebx),%edi
 746:	89 d0                	mov    %edx,%eax
 748:	8b 6b 08             	mov    0x8(%ebx),%ebp
 74b:	29 f8                	sub    %edi,%eax
 74d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 754:	01 c5                	add    %eax,%ebp
 756:	8b 44 24 24          	mov    0x24(%esp),%eax
 75a:	89 6b 08             	mov    %ebp,0x8(%ebx)
 75d:	89 13                	mov    %edx,(%ebx)
 75f:	89 46 34             	mov    %eax,0x34(%esi)
 762:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 766:	89 5c 24 64          	mov    %ebx,0x64(%esp)
    case BADCODE:       /* x: got error */
      r = Z_DATA_ERROR;
      LEAVE
    default:
      r = Z_STREAM_ERROR;
      LEAVE
 76a:	89 74 24 60          	mov    %esi,0x60(%esp)
      z->msg = (char*)"invalid distance code";
      r = Z_DATA_ERROR;
      LEAVE
    case DISTEXT:       /* i: getting distance extra */
      j = c->sub.copy.get;
      NEEDBITS(j)
 76e:	89 44 24 68          	mov    %eax,0x68(%esp)
      LEAVE
  }
#ifdef NEED_DUMMY_RETURN
  return Z_STREAM_ERROR;  /* Some dumb compilers complain without this */
#endif
}
 772:	83 c4 4c             	add    $0x4c,%esp
 775:	5b                   	pop    %ebx
 776:	5e                   	pop    %esi
 777:	5f                   	pop    %edi
 778:	5d                   	pop    %ebp
    case BADCODE:       /* x: got error */
      r = Z_DATA_ERROR;
      LEAVE
    default:
      r = Z_STREAM_ERROR;
      LEAVE
 779:	e9 00 00 00 00       	jmp    77e <_inflate_codes+0x72e>
 77e:	66 90                	xchg   %ax,%ax
      if ((uInt)(q - s->window) < c->sub.copy.dist)
        f = s->end - (c->sub.copy.dist - (uInt)(q - s->window));
#endif
      while (c->len)
      {
        NEEDOUT
 780:	8b 5f 28             	mov    0x28(%edi),%ebx
 783:	39 d9                	cmp    %ebx,%ecx
 785:	0f 84 cb fc ff ff    	je     456 <_inflate_codes+0x406>
 78b:	76 65                	jbe    7f2 <_inflate_codes+0x7a2>
 78d:	29 d9                	sub    %ebx,%ecx
 78f:	89 d8                	mov    %ebx,%eax
 791:	8d 51 ff             	lea    -0x1(%ecx),%edx
 794:	e9 bd fc ff ff       	jmp    456 <_inflate_codes+0x406>
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                 "inflate:         literal '%c'\n" :
                 "inflate:         literal 0x%02x\n", t->base));
        c->mode = LIT;
        break;
      }
      if (e & 16)               /* length */
 7a0:	a8 10                	test   $0x10,%al
 7a2:	75 59                	jne    7fd <_inflate_codes+0x7ad>
        c->sub.copy.get = e & 15;
        c->len = t->base;
        c->mode = LENEXT;
        break;
      }
      if ((e & 64) == 0)        /* next table */
 7a4:	a8 40                	test   $0x40,%al
 7a6:	0f 85 83 01 00 00    	jne    92f <_inflate_codes+0x8df>
      {
        c->sub.code.need = e;
 7ac:	89 4d 0c             	mov    %ecx,0xc(%ebp)
        c->sub.code.tree = t + t->base;
 7af:	8b 46 04             	mov    0x4(%esi),%eax
 7b2:	8d 04 c6             	lea    (%esi,%eax,8),%eax
 7b5:	89 45 08             	mov    %eax,0x8(%ebp)
 7b8:	8b 45 00             	mov    0x0(%ebp),%eax
        break;
 7bb:	e9 dd f8 ff ff       	jmp    9d <_inflate_codes+0x4d>
        p--;            /* can always return one */
      }
      FLUSH
      if (s->read != s->write)
        LEAVE
      c->mode = END;
 7c0:	c7 45 00 08 00 00 00 	movl   $0x8,0x0(%ebp)
 7c7:	89 fb                	mov    %edi,%ebx
 7c9:	e9 f4 f8 ff ff       	jmp    c2 <_inflate_codes+0x72>
 7ce:	66 90                	xchg   %ax,%ax
 7d0:	88 c1                	mov    %al,%cl
        c->sub.copy.get = e & 15;
        c->sub.copy.dist = t->base;
        c->mode = DISTEXT;
        break;
      }
      if ((e & 64) == 0)        /* next table */
 7d2:	a8 40                	test   $0x40,%al
 7d4:	0f 85 9b 01 00 00    	jne    975 <_inflate_codes+0x925>
    case DIST:          /* i: get distance next */
      j = c->sub.code.need;
      NEEDBITS(j)
      t = c->sub.code.tree + ((uInt)b & inflate_mask[j]);
      DUMPBITS(t->bits)
      e = (uInt)(t->exop);
 7da:	31 c0                	xor    %eax,%eax
 7dc:	88 c8                	mov    %cl,%al
 7de:	89 45 0c             	mov    %eax,0xc(%ebp)
        break;
      }
      if ((e & 64) == 0)        /* next table */
      {
        c->sub.code.need = e;
        c->sub.code.tree = t + t->base;
 7e1:	8b 46 04             	mov    0x4(%esi),%eax
 7e4:	8d 04 c6             	lea    (%esi,%eax,8),%eax
 7e7:	89 45 08             	mov    %eax,0x8(%ebp)
 7ea:	8b 45 00             	mov    0x0(%ebp),%eax
        break;
 7ed:	e9 ab f8 ff ff       	jmp    9d <_inflate_codes+0x4d>
      if ((uInt)(q - s->window) < c->sub.copy.dist)
        f = s->end - (c->sub.copy.dist - (uInt)(q - s->window));
#endif
      while (c->len)
      {
        NEEDOUT
 7f2:	29 d8                	sub    %ebx,%eax
 7f4:	89 c2                	mov    %eax,%edx
 7f6:	89 d8                	mov    %ebx,%eax
 7f8:	e9 59 fc ff ff       	jmp    456 <_inflate_codes+0x406>
        c->mode = LIT;
        break;
      }
      if (e & 16)               /* length */
      {
        c->sub.copy.get = e & 15;
 7fd:	83 e0 0f             	and    $0xf,%eax
 800:	89 45 08             	mov    %eax,0x8(%ebp)
        c->len = t->base;
 803:	8b 46 04             	mov    0x4(%esi),%eax
        c->mode = LENEXT;
 806:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%ebp)
        break;
      }
      if (e & 16)               /* length */
      {
        c->sub.copy.get = e & 15;
        c->len = t->base;
 80d:	89 45 04             	mov    %eax,0x4(%ebp)
        c->mode = LENEXT;
        break;
 810:	b8 02 00 00 00       	mov    $0x2,%eax
 815:	e9 8c f8 ff ff       	jmp    a6 <_inflate_codes+0x56>
        c->len--;
      }
      c->mode = START;
      break;
    case LIT:           /* o: got literal, waiting for output space */
      NEEDOUT
 81a:	89 c8                	mov    %ecx,%eax
 81c:	8b 74 24 24          	mov    0x24(%esp),%esi
 820:	29 f0                	sub    %esi,%eax
 822:	48                   	dec    %eax
 823:	89 44 24 34          	mov    %eax,0x34(%esp)
 827:	8b 47 2c             	mov    0x2c(%edi),%eax
 82a:	e9 f6 fc ff ff       	jmp    525 <_inflate_codes+0x4d5>
 82f:	90                   	nop
  {             /* waiting for "i:"=input, "o:"=output, "x:"=nothing */
    case START:         /* x: set up for LEN */
#ifndef SLOW
      if (m >= 258 && n >= 10)
      {
        UPDATE
 830:	8b 44 24 28          	mov    0x28(%esp),%eax
 834:	89 47 20             	mov    %eax,0x20(%edi)
 837:	8b 44 24 20          	mov    0x20(%esp),%eax
 83b:	89 47 1c             	mov    %eax,0x1c(%edi)
 83e:	8b 44 24 30          	mov    0x30(%esp),%eax
 842:	89 58 04             	mov    %ebx,0x4(%eax)
 845:	89 c3                	mov    %eax,%ebx
 847:	89 d0                	mov    %edx,%eax
 849:	8b 33                	mov    (%ebx),%esi
 84b:	8b 4b 08             	mov    0x8(%ebx),%ecx
 84e:	29 f0                	sub    %esi,%eax
 850:	89 13                	mov    %edx,(%ebx)
 852:	01 c1                	add    %eax,%ecx
 854:	8b 44 24 24          	mov    0x24(%esp),%eax
 858:	89 4b 08             	mov    %ecx,0x8(%ebx)
 85b:	89 47 34             	mov    %eax,0x34(%edi)
        r = inflate_fast(c->lbits, c->dbits, c->ltree, c->dtree, s, z);
 85e:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 862:	89 7c 24 10          	mov    %edi,0x10(%esp)
 866:	8b 45 18             	mov    0x18(%ebp),%eax
 869:	89 44 24 0c          	mov    %eax,0xc(%esp)
 86d:	8b 45 14             	mov    0x14(%ebp),%eax
 870:	89 44 24 08          	mov    %eax,0x8(%esp)
 874:	31 c0                	xor    %eax,%eax
 876:	8a 45 11             	mov    0x11(%ebp),%al
 879:	89 44 24 04          	mov    %eax,0x4(%esp)
 87d:	31 c0                	xor    %eax,%eax
 87f:	8a 45 10             	mov    0x10(%ebp),%al
 882:	89 04 24             	mov    %eax,(%esp)
 885:	e8 00 00 00 00       	call   88a <_inflate_codes+0x83a>
        LOAD
 88a:	8b 4f 30             	mov    0x30(%edi),%ecx
    case START:         /* x: set up for LEN */
#ifndef SLOW
      if (m >= 258 && n >= 10)
      {
        UPDATE
        r = inflate_fast(c->lbits, c->dbits, c->ltree, c->dtree, s, z);
 88d:	89 44 24 2c          	mov    %eax,0x2c(%esp)
        LOAD
 891:	8b 47 20             	mov    0x20(%edi),%eax
 894:	89 44 24 28          	mov    %eax,0x28(%esp)
 898:	8b 47 1c             	mov    0x1c(%edi),%eax
 89b:	89 44 24 20          	mov    %eax,0x20(%esp)
 89f:	8b 47 34             	mov    0x34(%edi),%eax
 8a2:	8b 13                	mov    (%ebx),%edx
 8a4:	89 44 24 24          	mov    %eax,0x24(%esp)
 8a8:	8b 5b 04             	mov    0x4(%ebx),%ebx
 8ab:	39 c8                	cmp    %ecx,%eax
 8ad:	73 71                	jae    920 <_inflate_codes+0x8d0>
 8af:	29 c1                	sub    %eax,%ecx
 8b1:	8d 41 ff             	lea    -0x1(%ecx),%eax
 8b4:	89 44 24 34          	mov    %eax,0x34(%esp)
        if (r != Z_OK)
 8b8:	8b 74 24 2c          	mov    0x2c(%esp),%esi
 8bc:	85 f6                	test   %esi,%esi
 8be:	0f 84 97 f8 ff ff    	je     15b <_inflate_codes+0x10b>
        {
          c->mode = r == Z_STREAM_END ? WASH : BADCODE;
 8c4:	31 c0                	xor    %eax,%eax
 8c6:	83 7c 24 2c 01       	cmpl   $0x1,0x2c(%esp)
 8cb:	0f 95 c0             	setne  %al
 8ce:	8d 44 00 07          	lea    0x7(%eax,%eax,1),%eax
 8d2:	89 45 00             	mov    %eax,0x0(%ebp)
          break;
 8d5:	e9 c3 f7 ff ff       	jmp    9d <_inflate_codes+0x4d>
 8da:	89 fe                	mov    %edi,%esi
      if ((uInt)(q - s->window) < c->sub.copy.dist)
        f = s->end - (c->sub.copy.dist - (uInt)(q - s->window));
#endif
      while (c->len)
      {
        NEEDOUT
 8dc:	8b 7c 24 28          	mov    0x28(%esp),%edi
 8e0:	8b 54 24 38          	mov    0x38(%esp),%edx
 8e4:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
 8e8:	89 7e 20             	mov    %edi,0x20(%esi)
 8eb:	8b 7c 24 20          	mov    0x20(%esp),%edi
 8ef:	89 7e 1c             	mov    %edi,0x1c(%esi)
 8f2:	8b 7c 24 30          	mov    0x30(%esp),%edi
 8f6:	89 d1                	mov    %edx,%ecx
 8f8:	89 5f 04             	mov    %ebx,0x4(%edi)
 8fb:	8b 1f                	mov    (%edi),%ebx
 8fd:	8b 6f 08             	mov    0x8(%edi),%ebp
 900:	29 d9                	sub    %ebx,%ecx
 902:	01 cd                	add    %ecx,%ebp
 904:	89 17                	mov    %edx,(%edi)
 906:	89 6f 08             	mov    %ebp,0x8(%edi)
 909:	89 46 34             	mov    %eax,0x34(%esi)
 90c:	8b 44 24 24          	mov    0x24(%esp),%eax
 910:	89 44 24 68          	mov    %eax,0x68(%esp)
 914:	e9 dd f7 ff ff       	jmp    f6 <_inflate_codes+0xa6>
 919:	89 fe                	mov    %edi,%esi
 91b:	e9 22 fd ff ff       	jmp    642 <_inflate_codes+0x5f2>
#ifndef SLOW
      if (m >= 258 && n >= 10)
      {
        UPDATE
        r = inflate_fast(c->lbits, c->dbits, c->ltree, c->dtree, s, z);
        LOAD
 920:	8b 47 2c             	mov    0x2c(%edi),%eax
 923:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 927:	29 c8                	sub    %ecx,%eax
 929:	89 44 24 34          	mov    %eax,0x34(%esp)
 92d:	eb 89                	jmp    8b8 <_inflate_codes+0x868>
      {
        c->sub.code.need = e;
        c->sub.code.tree = t + t->base;
        break;
      }
      if (e & 32)               /* end of block */
 92f:	a8 20                	test   $0x20,%al
 931:	0f 84 a2 00 00 00    	je     9d9 <_inflate_codes+0x989>
      {
        Tracevv((stderr, "inflate:         end of block\n"));
        c->mode = WASH;
 937:	c7 45 00 07 00 00 00 	movl   $0x7,0x0(%ebp)
        break;
 93e:	b8 07 00 00 00       	mov    $0x7,%eax
 943:	e9 5e f7 ff ff       	jmp    a6 <_inflate_codes+0x56>
 948:	89 fe                	mov    %edi,%esi
 94a:	e9 e3 fd ff ff       	jmp    732 <_inflate_codes+0x6e2>
        c->len--;
      }
      c->mode = START;
      break;
    case LIT:           /* o: got literal, waiting for output space */
      NEEDOUT
 94f:	8b 47 28             	mov    0x28(%edi),%eax
 952:	39 c1                	cmp    %eax,%ecx
 954:	0f 84 d5 fb ff ff    	je     52f <_inflate_codes+0x4df>
 95a:	76 6a                	jbe    9c6 <_inflate_codes+0x976>
 95c:	29 c1                	sub    %eax,%ecx
 95e:	89 44 24 24          	mov    %eax,0x24(%esp)
 962:	49                   	dec    %ecx
 963:	89 4c 24 34          	mov    %ecx,0x34(%esp)
 967:	e9 c3 fb ff ff       	jmp    52f <_inflate_codes+0x4df>
 96c:	89 4c 24 24          	mov    %ecx,0x24(%esp)
 970:	e9 66 fb ff ff       	jmp    4db <_inflate_codes+0x48b>
        c->sub.code.need = e;
        c->sub.code.tree = t + t->base;
        break;
      }
      c->mode = BADCODE;        /* invalid code */
      z->msg = (char*)"invalid distance code";
 975:	8b 44 24 30          	mov    0x30(%esp),%eax
      {
        c->sub.code.need = e;
        c->sub.code.tree = t + t->base;
        break;
      }
      c->mode = BADCODE;        /* invalid code */
 979:	c7 45 00 09 00 00 00 	movl   $0x9,0x0(%ebp)
 980:	89 fe                	mov    %edi,%esi
      z->msg = (char*)"invalid distance code";
 982:	c7 40 18 1c 00 00 00 	movl   $0x1c,0x18(%eax)
      r = Z_DATA_ERROR;
      LEAVE
 989:	8b 7c 24 28          	mov    0x28(%esp),%edi
 98d:	8b 08                	mov    (%eax),%ecx
 98f:	89 7e 20             	mov    %edi,0x20(%esi)
 992:	8b 7c 24 20          	mov    0x20(%esp),%edi
 996:	89 7e 1c             	mov    %edi,0x1c(%esi)
 999:	89 58 04             	mov    %ebx,0x4(%eax)
 99c:	89 c7                	mov    %eax,%edi
 99e:	89 d3                	mov    %edx,%ebx
 9a0:	29 cb                	sub    %ecx,%ebx
 9a2:	89 d8                	mov    %ebx,%eax
 9a4:	8b 5f 08             	mov    0x8(%edi),%ebx
 9a7:	89 17                	mov    %edx,(%edi)
 9a9:	01 c3                	add    %eax,%ebx
 9ab:	8b 54 24 24          	mov    0x24(%esp),%edx
 9af:	89 5f 08             	mov    %ebx,0x8(%edi)
 9b2:	89 56 34             	mov    %edx,0x34(%esi)
 9b5:	c7 44 24 68 fd ff ff 	movl   $0xfffffffd,0x68(%esp)
 9bc:	ff 
 9bd:	89 7c 24 64          	mov    %edi,0x64(%esp)
 9c1:	e9 34 f7 ff ff       	jmp    fa <_inflate_codes+0xaa>
        c->len--;
      }
      c->mode = START;
      break;
    case LIT:           /* o: got literal, waiting for output space */
      NEEDOUT
 9c6:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 9ca:	89 44 24 24          	mov    %eax,0x24(%esp)
 9ce:	29 c1                	sub    %eax,%ecx
 9d0:	89 4c 24 34          	mov    %ecx,0x34(%esp)
 9d4:	e9 56 fb ff ff       	jmp    52f <_inflate_codes+0x4df>
        Tracevv((stderr, "inflate:         end of block\n"));
        c->mode = WASH;
        break;
      }
      c->mode = BADCODE;        /* invalid code */
      z->msg = (char*)"invalid literal/length code";
 9d9:	8b 44 24 30          	mov    0x30(%esp),%eax
      {
        Tracevv((stderr, "inflate:         end of block\n"));
        c->mode = WASH;
        break;
      }
      c->mode = BADCODE;        /* invalid code */
 9dd:	c7 45 00 09 00 00 00 	movl   $0x9,0x0(%ebp)
 9e4:	89 fe                	mov    %edi,%esi
      z->msg = (char*)"invalid literal/length code";
 9e6:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
 9ed:	eb 9a                	jmp    989 <_inflate_codes+0x939>
 9ef:	90                   	nop

000009f0 <_inflate_codes_free>:


void inflate_codes_free(c, z)
inflate_codes_statef *c;
z_streamp z;
{
 9f0:	8b 44 24 08          	mov    0x8(%esp),%eax
  ZFREE(z, c);
 9f4:	8b 54 24 04          	mov    0x4(%esp),%edx
 9f8:	89 54 24 08          	mov    %edx,0x8(%esp)
 9fc:	8b 50 28             	mov    0x28(%eax),%edx
 9ff:	89 54 24 04          	mov    %edx,0x4(%esp)
 a03:	8b 40 24             	mov    0x24(%eax),%eax
 a06:	ff e0                	jmp    *%eax
 a08:	90                   	nop
 a09:	90                   	nop
 a0a:	90                   	nop
 a0b:	90                   	nop
 a0c:	90                   	nop
 a0d:	90                   	nop
 a0e:	90                   	nop
 a0f:	90                   	nop

inffast.o:     file format pe-i386


Disassembly of section .text:

00000000 <_inflate_fast>:
uInt bl, bd;
inflate_huft *tl;
inflate_huft *td; /* need separate declaration for Borland C++ */
inflate_blocks_statef *s;
z_streamp z;
{
   0:	55                   	push   %ebp
   1:	57                   	push   %edi
   2:	56                   	push   %esi
   3:	53                   	push   %ebx
   4:	83 ec 28             	sub    $0x28,%esp
  uInt c;               /* bytes to copy */
  uInt d;               /* distance back to copy from */
  Bytef *r;             /* copy source pointer */

  /* load input, output, bit values */
  LOAD
   7:	8b 44 24 50          	mov    0x50(%esp),%eax
   b:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
   f:	8b 38                	mov    (%eax),%edi
  11:	8b 40 04             	mov    0x4(%eax),%eax
  14:	89 04 24             	mov    %eax,(%esp)
  17:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  1b:	8b 73 34             	mov    0x34(%ebx),%esi
  1e:	8b 53 30             	mov    0x30(%ebx),%edx
  21:	8b 68 20             	mov    0x20(%eax),%ebp
  24:	89 74 24 04          	mov    %esi,0x4(%esp)
  28:	8b 40 1c             	mov    0x1c(%eax),%eax
  2b:	39 d6                	cmp    %edx,%esi
  2d:	0f 83 ad 03 00 00    	jae    3e0 <_inflate_fast+0x3e0>
  33:	29 f2                	sub    %esi,%edx
  35:	8d 5a ff             	lea    -0x1(%edx),%ebx
  38:	89 5c 24 08          	mov    %ebx,0x8(%esp)

  /* initialize masks */
  ml = inflate_mask[bl];
  3c:	8b 54 24 3c          	mov    0x3c(%esp),%edx
  40:	8b 1c 95 00 00 00 00 	mov    0x0(,%edx,4),%ebx
  md = inflate_mask[bd];
  47:	8b 54 24 40          	mov    0x40(%esp),%edx

  /* load input, output, bit values */
  LOAD

  /* initialize masks */
  ml = inflate_mask[bl];
  4b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  md = inflate_mask[bd];
  4f:	8b 1c 95 00 00 00 00 	mov    0x0(,%edx,4),%ebx
  56:	89 5c 24 14          	mov    %ebx,0x14(%esp)
  5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  /* do until not enough input or output space for fast loop */
  do {                          /* assume called with m >= 258 && n >= 10 */
    /* get literal/length code */
    GRABBITS(20)                /* max bits for literal/length code */
  60:	83 f8 13             	cmp    $0x13,%eax
  63:	0f 86 b8 02 00 00    	jbe    321 <_inflate_fast+0x321>
    if ((e = (t = tl + ((uInt)b & ml))->exop) == 0)
  69:	8b 54 24 0c          	mov    0xc(%esp),%edx
  6d:	8b 5c 24 44          	mov    0x44(%esp),%ebx
  71:	21 ea                	and    %ebp,%edx
  73:	8d 14 d3             	lea    (%ebx,%edx,8),%edx
  76:	31 db                	xor    %ebx,%ebx
  78:	8a 1a                	mov    (%edx),%bl
  7a:	85 db                	test   %ebx,%ebx
  7c:	0f 85 bb 00 00 00    	jne    13d <_inflate_fast+0x13d>
    {
      DUMPBITS(t->bits)
  82:	31 db                	xor    %ebx,%ebx
      Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                "inflate:         * literal '%c'\n" :
                "inflate:         * literal 0x%02x\n", t->base));
      *q++ = (Byte)t->base;
      m--;
  84:	8b 74 24 08          	mov    0x8(%esp),%esi
  do {                          /* assume called with m >= 258 && n >= 10 */
    /* get literal/length code */
    GRABBITS(20)                /* max bits for literal/length code */
    if ((e = (t = tl + ((uInt)b & ml))->exop) == 0)
    {
      DUMPBITS(t->bits)
  88:	8a 5a 01             	mov    0x1(%edx),%bl
      Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                "inflate:         * literal '%c'\n" :
                "inflate:         * literal 0x%02x\n", t->base));
      *q++ = (Byte)t->base;
      m--;
  8b:	4e                   	dec    %esi
  do {                          /* assume called with m >= 258 && n >= 10 */
    /* get literal/length code */
    GRABBITS(20)                /* max bits for literal/length code */
    if ((e = (t = tl + ((uInt)b & ml))->exop) == 0)
    {
      DUMPBITS(t->bits)
  8c:	29 d8                	sub    %ebx,%eax
      Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                "inflate:         * literal '%c'\n" :
                "inflate:         * literal 0x%02x\n", t->base));
      *q++ = (Byte)t->base;
  8e:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  do {                          /* assume called with m >= 258 && n >= 10 */
    /* get literal/length code */
    GRABBITS(20)                /* max bits for literal/length code */
    if ((e = (t = tl + ((uInt)b & ml))->exop) == 0)
    {
      DUMPBITS(t->bits)
  92:	8a 4a 01             	mov    0x1(%edx),%cl
      Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                "inflate:         * literal '%c'\n" :
                "inflate:         * literal 0x%02x\n", t->base));
      *q++ = (Byte)t->base;
      m--;
  95:	89 74 24 08          	mov    %esi,0x8(%esp)
    {
      DUMPBITS(t->bits)
      Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                "inflate:         * literal '%c'\n" :
                "inflate:         * literal 0x%02x\n", t->base));
      *q++ = (Byte)t->base;
  99:	8b 52 04             	mov    0x4(%edx),%edx
  9c:	8d 73 01             	lea    0x1(%ebx),%esi
  do {                          /* assume called with m >= 258 && n >= 10 */
    /* get literal/length code */
    GRABBITS(20)                /* max bits for literal/length code */
    if ((e = (t = tl + ((uInt)b & ml))->exop) == 0)
    {
      DUMPBITS(t->bits)
  9f:	d3 ed                	shr    %cl,%ebp
      Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                "inflate:         * literal '%c'\n" :
                "inflate:         * literal 0x%02x\n", t->base));
      *q++ = (Byte)t->base;
  a1:	88 13                	mov    %dl,(%ebx)
  a3:	89 74 24 04          	mov    %esi,0x4(%esp)
        UNGRAB
        UPDATE
        return Z_DATA_ERROR;
      }
    } while (1);
  } while (m >= 258 && n >= 10);
  a7:	83 3c 24 09          	cmpl   $0x9,(%esp)
  ab:	76 0a                	jbe    b7 <_inflate_fast+0xb7>
  ad:	81 7c 24 08 01 01 00 	cmpl   $0x101,0x8(%esp)
  b4:	00 
  b5:	77 a9                	ja     60 <_inflate_fast+0x60>

  /* not enough input or output--restore pointers and return */
  UNGRAB
  b7:	8b 5c 24 50          	mov    0x50(%esp),%ebx
  bb:	8b 34 24             	mov    (%esp),%esi
  be:	89 c2                	mov    %eax,%edx
  c0:	c1 ea 03             	shr    $0x3,%edx
  c3:	8b 5b 04             	mov    0x4(%ebx),%ebx
  c6:	89 d9                	mov    %ebx,%ecx
  c8:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  cc:	29 f1                	sub    %esi,%ecx
  ce:	39 ca                	cmp    %ecx,%edx
  d0:	0f 47 d1             	cmova  %ecx,%edx
  d3:	29 d7                	sub    %edx,%edi
  d5:	89 fb                	mov    %edi,%ebx
  d7:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
  UPDATE
  de:	8b 7c 24 4c          	mov    0x4c(%esp),%edi
      }
    } while (1);
  } while (m >= 258 && n >= 10);

  /* not enough input or output--restore pointers and return */
  UNGRAB
  e2:	29 c8                	sub    %ecx,%eax
  e4:	01 f2                	add    %esi,%edx
  e6:	89 47 1c             	mov    %eax,0x1c(%edi)
  e9:	8b 44 24 50          	mov    0x50(%esp),%eax
  UPDATE
  ed:	89 6f 20             	mov    %ebp,0x20(%edi)
  f0:	89 c7                	mov    %eax,%edi
      }
    } while (1);
  } while (m >= 258 && n >= 10);

  /* not enough input or output--restore pointers and return */
  UNGRAB
  f2:	89 50 04             	mov    %edx,0x4(%eax)
  UPDATE
  f5:	89 d8                	mov    %ebx,%eax
  f7:	8b 17                	mov    (%edi),%edx
  f9:	8b 4f 08             	mov    0x8(%edi),%ecx
  fc:	29 d0                	sub    %edx,%eax
  fe:	89 1f                	mov    %ebx,(%edi)
 100:	01 c1                	add    %eax,%ecx
 102:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 106:	89 4f 08             	mov    %ecx,0x8(%edi)
 109:	8b 7c 24 04          	mov    0x4(%esp),%edi
 10d:	89 78 34             	mov    %edi,0x34(%eax)
  return Z_OK;
 110:	31 c0                	xor    %eax,%eax
 112:	e9 91 02 00 00       	jmp    3a8 <_inflate_fast+0x3a8>
            return Z_DATA_ERROR;
          }
        } while (1);
        break;
      }
      if ((e & 64) == 0)
 117:	f6 c3 40             	test   $0x40,%bl
 11a:	0f 85 20 02 00 00    	jne    340 <_inflate_fast+0x340>
      {
        t += t->base;
        if ((e = (t += ((uInt)b & inflate_mask[e]))->exop) == 0)
 120:	8b 0c 9d 00 00 00 00 	mov    0x0(,%ebx,4),%ecx
        } while (1);
        break;
      }
      if ((e & 64) == 0)
      {
        t += t->base;
 127:	8b 5a 04             	mov    0x4(%edx),%ebx
        if ((e = (t += ((uInt)b & inflate_mask[e]))->exop) == 0)
 12a:	21 e9                	and    %ebp,%ecx
        } while (1);
        break;
      }
      if ((e & 64) == 0)
      {
        t += t->base;
 12c:	01 d9                	add    %ebx,%ecx
        if ((e = (t += ((uInt)b & inflate_mask[e]))->exop) == 0)
 12e:	31 db                	xor    %ebx,%ebx
 130:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
 133:	8a 1a                	mov    (%edx),%bl
 135:	85 db                	test   %ebx,%ebx
 137:	0f 84 73 02 00 00    	je     3b0 <_inflate_fast+0x3b0>
      *q++ = (Byte)t->base;
      m--;
      continue;
    }
    do {
      DUMPBITS(t->bits)
 13d:	0f b6 72 01          	movzbl 0x1(%edx),%esi
 141:	8a 4a 01             	mov    0x1(%edx),%cl
 144:	81 e6 ff 00 00 00    	and    $0xff,%esi
 14a:	d3 ed                	shr    %cl,%ebp
 14c:	29 f0                	sub    %esi,%eax
      if (e & 16)
 14e:	f6 c3 10             	test   $0x10,%bl
 151:	74 c4                	je     117 <_inflate_fast+0x117>
      {
        /* get extra bits for length */
        e &= 15;
 153:	83 e3 0f             	and    $0xf,%ebx
 156:	89 d9                	mov    %ebx,%ecx
        c = t->base + ((uInt)b & inflate_mask[e]);
 158:	8b 5a 04             	mov    0x4(%edx),%ebx
 15b:	89 5c 24 20          	mov    %ebx,0x20(%esp)
        DUMPBITS(e)
 15f:	29 c8                	sub    %ecx,%eax
      DUMPBITS(t->bits)
      if (e & 16)
      {
        /* get extra bits for length */
        e &= 15;
        c = t->base + ((uInt)b & inflate_mask[e]);
 161:	8b 1c 8d 00 00 00 00 	mov    0x0(,%ecx,4),%ebx
        DUMPBITS(e)
 168:	89 44 24 10          	mov    %eax,0x10(%esp)
      DUMPBITS(t->bits)
      if (e & 16)
      {
        /* get extra bits for length */
        e &= 15;
        c = t->base + ((uInt)b & inflate_mask[e]);
 16c:	89 5c 24 24          	mov    %ebx,0x24(%esp)
        DUMPBITS(e)
 170:	89 eb                	mov    %ebp,%ebx
 172:	d3 eb                	shr    %cl,%ebx
        Tracevv((stderr, "inflate:         * length %u\n", c));

        /* decode distance base of block to copy */
        GRABBITS(15);           /* max bits for distance code */
 174:	83 f8 0e             	cmp    $0xe,%eax
 177:	77 3c                	ja     1b5 <_inflate_fast+0x1b5>
 179:	89 fa                	mov    %edi,%edx
 17b:	89 c1                	mov    %eax,%ecx
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	42                   	inc    %edx
 181:	31 c0                	xor    %eax,%eax
 183:	8a 42 ff             	mov    -0x1(%edx),%al
 186:	d3 e0                	shl    %cl,%eax
 188:	83 c1 08             	add    $0x8,%ecx
 18b:	09 c3                	or     %eax,%ebx
 18d:	83 f9 0e             	cmp    $0xe,%ecx
 190:	76 ee                	jbe    180 <_inflate_fast+0x180>
 192:	8b 74 24 10          	mov    0x10(%esp),%esi
 196:	b8 0e 00 00 00       	mov    $0xe,%eax
 19b:	29 f0                	sub    %esi,%eax
 19d:	8b 14 24             	mov    (%esp),%edx
 1a0:	c1 e8 03             	shr    $0x3,%eax
 1a3:	4a                   	dec    %edx
 1a4:	29 c2                	sub    %eax,%edx
 1a6:	8d 7c 07 01          	lea    0x1(%edi,%eax,1),%edi
 1aa:	8d 44 c6 08          	lea    0x8(%esi,%eax,8),%eax
 1ae:	89 14 24             	mov    %edx,(%esp)
 1b1:	89 44 24 10          	mov    %eax,0x10(%esp)
        e = (t = td + ((uInt)b & md))->exop;
 1b5:	8b 44 24 14          	mov    0x14(%esp),%eax
 1b9:	8b 74 24 48          	mov    0x48(%esp),%esi
 1bd:	21 d8                	and    %ebx,%eax
        do {
          DUMPBITS(t->bits)
 1bf:	31 c9                	xor    %ecx,%ecx
        DUMPBITS(e)
        Tracevv((stderr, "inflate:         * length %u\n", c));

        /* decode distance base of block to copy */
        GRABBITS(15);           /* max bits for distance code */
        e = (t = td + ((uInt)b & md))->exop;
 1c1:	8d 14 c6             	lea    (%esi,%eax,8),%edx
 1c4:	8a 02                	mov    (%edx),%al
        do {
          DUMPBITS(t->bits)
 1c6:	8a 4a 01             	mov    0x1(%edx),%cl
        DUMPBITS(e)
        Tracevv((stderr, "inflate:         * length %u\n", c));

        /* decode distance base of block to copy */
        GRABBITS(15);           /* max bits for distance code */
        e = (t = td + ((uInt)b & md))->exop;
 1c9:	88 44 24 18          	mov    %al,0x18(%esp)
 1cd:	89 c6                	mov    %eax,%esi
        do {
          DUMPBITS(t->bits)
 1cf:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
 1d3:	89 d8                	mov    %ebx,%eax
 1d5:	8a 4a 01             	mov    0x1(%edx),%cl
 1d8:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
 1dc:	d3 e8                	shr    %cl,%eax
 1de:	8b 4c 24 10          	mov    0x10(%esp),%ecx
        DUMPBITS(e)
        Tracevv((stderr, "inflate:         * length %u\n", c));

        /* decode distance base of block to copy */
        GRABBITS(15);           /* max bits for distance code */
        e = (t = td + ((uInt)b & md))->exop;
 1e2:	81 e6 ff 00 00 00    	and    $0xff,%esi
        do {
          DUMPBITS(t->bits)
 1e8:	29 d9                	sub    %ebx,%ecx
          if (e & 16)
 1ea:	8a 5c 24 18          	mov    0x18(%esp),%bl

        /* decode distance base of block to copy */
        GRABBITS(15);           /* max bits for distance code */
        e = (t = td + ((uInt)b & md))->exop;
        do {
          DUMPBITS(t->bits)
 1ee:	89 4c 24 10          	mov    %ecx,0x10(%esp)
          if (e & 16)
 1f2:	f6 c3 10             	test   $0x10,%bl
 1f5:	75 5f                	jne    256 <_inflate_fast+0x256>
            do {                        /* copy all or what's left */
              *q++ = *r++;
            } while (--c);
            break;
          }
          else if ((e & 64) == 0)
 1f7:	83 e3 40             	and    $0x40,%ebx
 1fa:	0f 85 c5 02 00 00    	jne    4c5 <_inflate_fast+0x4c5>
 200:	89 7c 24 18          	mov    %edi,0x18(%esp)
 204:	89 6c 24 1c          	mov    %ebp,0x1c(%esp)
 208:	8b 7c 24 10          	mov    0x10(%esp),%edi
 20c:	eb 0b                	jmp    219 <_inflate_fast+0x219>
 20e:	66 90                	xchg   %ax,%ax
 210:	83 e3 40             	and    $0x40,%ebx
 213:	0f 85 dd 01 00 00    	jne    3f6 <_inflate_fast+0x3f6>
          {
            t += t->base;
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
 219:	8b 0c b5 00 00 00 00 	mov    0x0(,%esi,4),%ecx
            } while (--c);
            break;
          }
          else if ((e & 64) == 0)
          {
            t += t->base;
 220:	8b 5a 04             	mov    0x4(%edx),%ebx
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
 223:	21 c1                	and    %eax,%ecx
            } while (--c);
            break;
          }
          else if ((e & 64) == 0)
          {
            t += t->base;
 225:	01 d9                	add    %ebx,%ecx
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
 227:	8d 14 ca             	lea    (%edx,%ecx,8),%edx

        /* decode distance base of block to copy */
        GRABBITS(15);           /* max bits for distance code */
        e = (t = td + ((uInt)b & md))->exop;
        do {
          DUMPBITS(t->bits)
 22a:	0f b6 6a 01          	movzbl 0x1(%edx),%ebp
            break;
          }
          else if ((e & 64) == 0)
          {
            t += t->base;
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
 22e:	8a 1a                	mov    (%edx),%bl

        /* decode distance base of block to copy */
        GRABBITS(15);           /* max bits for distance code */
        e = (t = td + ((uInt)b & md))->exop;
        do {
          DUMPBITS(t->bits)
 230:	81 e5 ff 00 00 00    	and    $0xff,%ebp
            break;
          }
          else if ((e & 64) == 0)
          {
            t += t->base;
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
 236:	89 de                	mov    %ebx,%esi

        /* decode distance base of block to copy */
        GRABBITS(15);           /* max bits for distance code */
        e = (t = td + ((uInt)b & md))->exop;
        do {
          DUMPBITS(t->bits)
 238:	8a 4a 01             	mov    0x1(%edx),%cl
            break;
          }
          else if ((e & 64) == 0)
          {
            t += t->base;
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
 23b:	81 e6 ff 00 00 00    	and    $0xff,%esi

        /* decode distance base of block to copy */
        GRABBITS(15);           /* max bits for distance code */
        e = (t = td + ((uInt)b & md))->exop;
        do {
          DUMPBITS(t->bits)
 241:	29 ef                	sub    %ebp,%edi
 243:	d3 e8                	shr    %cl,%eax
          if (e & 16)
 245:	f6 c3 10             	test   $0x10,%bl
 248:	74 c6                	je     210 <_inflate_fast+0x210>
 24a:	89 7c 24 10          	mov    %edi,0x10(%esp)
 24e:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
 252:	8b 7c 24 18          	mov    0x18(%esp),%edi
          {
            /* get extra bits to add to distance base */
            e &= 15;
 256:	83 e6 0f             	and    $0xf,%esi
            GRABBITS(e)         /* get extra bits (up to 13) */
 259:	8b 5c 24 10          	mov    0x10(%esp),%ebx
 25d:	39 de                	cmp    %ebx,%esi
 25f:	76 2c                	jbe    28d <_inflate_fast+0x28d>
 261:	89 6c 24 10          	mov    %ebp,0x10(%esp)
 265:	89 d9                	mov    %ebx,%ecx
 267:	8b 2c 24             	mov    (%esp),%ebp
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 270:	47                   	inc    %edi
 271:	31 db                	xor    %ebx,%ebx
 273:	4d                   	dec    %ebp
 274:	8a 5f ff             	mov    -0x1(%edi),%bl
 277:	d3 e3                	shl    %cl,%ebx
 279:	83 c1 08             	add    $0x8,%ecx
 27c:	09 d8                	or     %ebx,%eax
 27e:	39 ce                	cmp    %ecx,%esi
 280:	77 ee                	ja     270 <_inflate_fast+0x270>
 282:	89 2c 24             	mov    %ebp,(%esp)
 285:	8b 6c 24 10          	mov    0x10(%esp),%ebp
 289:	89 4c 24 10          	mov    %ecx,0x10(%esp)
      DUMPBITS(t->bits)
      if (e & 16)
      {
        /* get extra bits for length */
        e &= 15;
        c = t->base + ((uInt)b & inflate_mask[e]);
 28d:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 291:	8b 5c 24 20          	mov    0x20(%esp),%ebx
 295:	21 cd                	and    %ecx,%ebp
          if (e & 16)
          {
            /* get extra bits to add to distance base */
            e &= 15;
            GRABBITS(e)         /* get extra bits (up to 13) */
            d = t->base + ((uInt)b & inflate_mask[e]);
 297:	8b 0c b5 00 00 00 00 	mov    0x0(,%esi,4),%ecx
      DUMPBITS(t->bits)
      if (e & 16)
      {
        /* get extra bits for length */
        e &= 15;
        c = t->base + ((uInt)b & inflate_mask[e]);
 29e:	01 eb                	add    %ebp,%ebx
          if (e & 16)
          {
            /* get extra bits to add to distance base */
            e &= 15;
            GRABBITS(e)         /* get extra bits (up to 13) */
            d = t->base + ((uInt)b & inflate_mask[e]);
 2a0:	21 c1                	and    %eax,%ecx
 2a2:	8b 6a 04             	mov    0x4(%edx),%ebp
 2a5:	01 e9                	add    %ebp,%ecx
 2a7:	89 ca                	mov    %ecx,%edx
            DUMPBITS(e)
 2a9:	89 f1                	mov    %esi,%ecx
 2ab:	d3 e8                	shr    %cl,%eax
 2ad:	89 c5                	mov    %eax,%ebp
 2af:	8b 44 24 10          	mov    0x10(%esp),%eax
 2b3:	29 f0                	sub    %esi,%eax
            Tracevv((stderr, "inflate:         * distance %u\n", d));

            /* do the copy */
            m -= c;
 2b5:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((uInt)(q - s->window) >= d)     /* offset before dest */
 2b9:	8b 74 24 4c          	mov    0x4c(%esp),%esi
            d = t->base + ((uInt)b & inflate_mask[e]);
            DUMPBITS(e)
            Tracevv((stderr, "inflate:         * distance %u\n", d));

            /* do the copy */
            m -= c;
 2bd:	29 d9                	sub    %ebx,%ecx
 2bf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
            if ((uInt)(q - s->window) >= d)     /* offset before dest */
 2c3:	8b 4e 28             	mov    0x28(%esi),%ecx
 2c6:	8b 74 24 04          	mov    0x4(%esp),%esi
 2ca:	29 ce                	sub    %ecx,%esi
 2cc:	39 f2                	cmp    %esi,%edx
 2ce:	0f 87 a3 01 00 00    	ja     477 <_inflate_fast+0x477>
            {                                   /*  just copy */
              r = q - d;
 2d4:	8b 4c 24 04          	mov    0x4(%esp),%ecx
              *q++ = *r++;  c--;        /* minimum count is three, */
              *q++ = *r++;  c--;        /*  so unroll loop a little */
 2d8:	83 eb 02             	sub    $0x2,%ebx

            /* do the copy */
            m -= c;
            if ((uInt)(q - s->window) >= d)     /* offset before dest */
            {                                   /*  just copy */
              r = q - d;
 2db:	89 ce                	mov    %ecx,%esi
 2dd:	29 d6                	sub    %edx,%esi
 2df:	89 f2                	mov    %esi,%edx
              *q++ = *r++;  c--;        /* minimum count is three, */
 2e1:	89 ce                	mov    %ecx,%esi
 2e3:	8a 0a                	mov    (%edx),%cl
 2e5:	88 0e                	mov    %cl,(%esi)
              *q++ = *r++;  c--;        /*  so unroll loop a little */
 2e7:	8d 4e 02             	lea    0x2(%esi),%ecx
 2ea:	8d 72 02             	lea    0x2(%edx),%esi
 2ed:	8a 52 01             	mov    0x1(%edx),%dl
 2f0:	89 74 24 10          	mov    %esi,0x10(%esp)
 2f4:	8b 74 24 04          	mov    0x4(%esp),%esi
 2f8:	88 54 24 18          	mov    %dl,0x18(%esp)
 2fc:	88 56 01             	mov    %dl,0x1(%esi)
 2ff:	01 cb                	add    %ecx,%ebx
 301:	8b 74 24 10          	mov    0x10(%esp),%esi
 305:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 309:	89 da                	mov    %ebx,%edx
 30b:	90                   	nop
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                } while (--e);
                r = s->window;          /* copy rest from start of window */
              }
            }
            do {                        /* copy all or what's left */
              *q++ = *r++;
 310:	46                   	inc    %esi
 311:	41                   	inc    %ecx
 312:	8a 5e ff             	mov    -0x1(%esi),%bl
            } while (--c);
 315:	39 d1                	cmp    %edx,%ecx
                } while (--e);
                r = s->window;          /* copy rest from start of window */
              }
            }
            do {                        /* copy all or what's left */
              *q++ = *r++;
 317:	88 59 ff             	mov    %bl,-0x1(%ecx)
            } while (--c);
 31a:	75 f4                	jne    310 <_inflate_fast+0x310>
 31c:	e9 86 fd ff ff       	jmp    a7 <_inflate_fast+0xa7>
  md = inflate_mask[bd];

  /* do until not enough input or output space for fast loop */
  do {                          /* assume called with m >= 258 && n >= 10 */
    /* get literal/length code */
    GRABBITS(20)                /* max bits for literal/length code */
 321:	8b 14 24             	mov    (%esp),%edx
 324:	88 c1                	mov    %al,%cl
 326:	4a                   	dec    %edx
 327:	83 c0 08             	add    $0x8,%eax
 32a:	89 14 24             	mov    %edx,(%esp)
 32d:	31 d2                	xor    %edx,%edx
 32f:	8a 17                	mov    (%edi),%dl
 331:	47                   	inc    %edi
 332:	d3 e2                	shl    %cl,%edx
 334:	09 d5                	or     %edx,%ebp
 336:	e9 25 fd ff ff       	jmp    60 <_inflate_fast+0x60>
 33b:	90                   	nop
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
          *q++ = (Byte)t->base;
          m--;
          break;
        }
      }
      else if (e & 32)
 340:	83 e3 20             	and    $0x20,%ebx
 343:	0f 84 83 01 00 00    	je     4cc <_inflate_fast+0x4cc>
      {
        Tracevv((stderr, "inflate:         * end of block\n"));
        UNGRAB
 349:	8b 74 24 50          	mov    0x50(%esp),%esi
 34d:	89 c1                	mov    %eax,%ecx
 34f:	c1 e9 03             	shr    $0x3,%ecx
 352:	8b 5e 04             	mov    0x4(%esi),%ebx
 355:	8b 34 24             	mov    (%esp),%esi
 358:	89 da                	mov    %ebx,%edx
 35a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 35e:	29 f2                	sub    %esi,%edx
 360:	39 d1                	cmp    %edx,%ecx
 362:	0f 46 d1             	cmovbe %ecx,%edx
 365:	29 d7                	sub    %edx,%edi
 367:	89 fb                	mov    %edi,%ebx
 369:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
        UPDATE
 370:	8b 7c 24 4c          	mov    0x4c(%esp),%edi
        }
      }
      else if (e & 32)
      {
        Tracevv((stderr, "inflate:         * end of block\n"));
        UNGRAB
 374:	29 c8                	sub    %ecx,%eax
 376:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
 379:	89 47 1c             	mov    %eax,0x1c(%edi)
 37c:	8b 44 24 50          	mov    0x50(%esp),%eax
        UPDATE
 380:	89 6f 20             	mov    %ebp,0x20(%edi)
 383:	89 c7                	mov    %eax,%edi
        }
      }
      else if (e & 32)
      {
        Tracevv((stderr, "inflate:         * end of block\n"));
        UNGRAB
 385:	89 48 04             	mov    %ecx,0x4(%eax)
        UPDATE
 388:	89 d8                	mov    %ebx,%eax
 38a:	8b 2f                	mov    (%edi),%ebp
 38c:	8b 57 08             	mov    0x8(%edi),%edx
 38f:	29 e8                	sub    %ebp,%eax
 391:	89 1f                	mov    %ebx,(%edi)
 393:	01 c2                	add    %eax,%edx
 395:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 399:	89 57 08             	mov    %edx,0x8(%edi)
 39c:	8b 7c 24 04          	mov    0x4(%esp),%edi
 3a0:	89 78 34             	mov    %edi,0x34(%eax)
        return Z_STREAM_END;
 3a3:	b8 01 00 00 00       	mov    $0x1,%eax

  /* not enough input or output--restore pointers and return */
  UNGRAB
  UPDATE
  return Z_OK;
}
 3a8:	83 c4 28             	add    $0x28,%esp
 3ab:	5b                   	pop    %ebx
 3ac:	5e                   	pop    %esi
 3ad:	5f                   	pop    %edi
 3ae:	5d                   	pop    %ebp
 3af:	c3                   	ret    
      if ((e & 64) == 0)
      {
        t += t->base;
        if ((e = (t += ((uInt)b & inflate_mask[e]))->exop) == 0)
        {
          DUMPBITS(t->bits)
 3b0:	8a 4a 01             	mov    0x1(%edx),%cl
          Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                    "inflate:         * literal '%c'\n" :
                    "inflate:         * literal 0x%02x\n", t->base));
          *q++ = (Byte)t->base;
 3b3:	8b 74 24 04          	mov    0x4(%esp),%esi
      if ((e & 64) == 0)
      {
        t += t->base;
        if ((e = (t += ((uInt)b & inflate_mask[e]))->exop) == 0)
        {
          DUMPBITS(t->bits)
 3b7:	31 db                	xor    %ebx,%ebx
 3b9:	8a 5a 01             	mov    0x1(%edx),%bl
          Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                    "inflate:         * literal '%c'\n" :
                    "inflate:         * literal 0x%02x\n", t->base));
          *q++ = (Byte)t->base;
 3bc:	8b 52 04             	mov    0x4(%edx),%edx
      if ((e & 64) == 0)
      {
        t += t->base;
        if ((e = (t += ((uInt)b & inflate_mask[e]))->exop) == 0)
        {
          DUMPBITS(t->bits)
 3bf:	d3 ed                	shr    %cl,%ebp
          Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                    "inflate:         * literal '%c'\n" :
                    "inflate:         * literal 0x%02x\n", t->base));
          *q++ = (Byte)t->base;
          m--;
 3c1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
      if ((e & 64) == 0)
      {
        t += t->base;
        if ((e = (t += ((uInt)b & inflate_mask[e]))->exop) == 0)
        {
          DUMPBITS(t->bits)
 3c5:	29 d8                	sub    %ebx,%eax
          Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                    "inflate:         * literal '%c'\n" :
                    "inflate:         * literal 0x%02x\n", t->base));
          *q++ = (Byte)t->base;
          m--;
 3c7:	49                   	dec    %ecx
        {
          DUMPBITS(t->bits)
          Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                    "inflate:         * literal '%c'\n" :
                    "inflate:         * literal 0x%02x\n", t->base));
          *q++ = (Byte)t->base;
 3c8:	8d 5e 01             	lea    0x1(%esi),%ebx
 3cb:	88 16                	mov    %dl,(%esi)
          m--;
 3cd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
        {
          DUMPBITS(t->bits)
          Tracevv((stderr, t->base >= 0x20 && t->base < 0x7f ?
                    "inflate:         * literal '%c'\n" :
                    "inflate:         * literal 0x%02x\n", t->base));
          *q++ = (Byte)t->base;
 3d1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
          m--;
          break;
 3d5:	e9 cd fc ff ff       	jmp    a7 <_inflate_fast+0xa7>
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uInt c;               /* bytes to copy */
  uInt d;               /* distance back to copy from */
  Bytef *r;             /* copy source pointer */

  /* load input, output, bit values */
  LOAD
 3e0:	8b 74 24 4c          	mov    0x4c(%esp),%esi
 3e4:	8b 4c 24 04          	mov    0x4(%esp),%ecx
 3e8:	8b 5e 2c             	mov    0x2c(%esi),%ebx
 3eb:	29 cb                	sub    %ecx,%ebx
 3ed:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 3f1:	e9 46 fc ff ff       	jmp    3c <_inflate_fast+0x3c>
 3f6:	89 7c 24 10          	mov    %edi,0x10(%esp)
 3fa:	89 c6                	mov    %eax,%esi
 3fc:	8b 7c 24 18          	mov    0x18(%esp),%edi
            t += t->base;
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
          }
          else
          {
            z->msg = (char*)"invalid distance code";
 400:	8b 44 24 50          	mov    0x50(%esp),%eax
            UNGRAB
 404:	8b 4c 24 10          	mov    0x10(%esp),%ecx
 408:	8b 2c 24             	mov    (%esp),%ebp
 40b:	89 ca                	mov    %ecx,%edx
 40d:	c1 ea 03             	shr    $0x3,%edx
            t += t->base;
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
          }
          else
          {
            z->msg = (char*)"invalid distance code";
 410:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
            UNGRAB
 417:	8b 40 04             	mov    0x4(%eax),%eax
 41a:	89 44 24 08          	mov    %eax,0x8(%esp)
 41e:	29 e8                	sub    %ebp,%eax
 420:	39 c2                	cmp    %eax,%edx
 422:	0f 47 d0             	cmova  %eax,%edx
            UPDATE
 425:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
          }
          else
          {
            z->msg = (char*)"invalid distance code";
            UNGRAB
 429:	29 d7                	sub    %edx,%edi
 42b:	89 fb                	mov    %edi,%ebx
 42d:	89 cf                	mov    %ecx,%edi
            UPDATE
 42f:	89 70 20             	mov    %esi,0x20(%eax)
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
          }
          else
          {
            z->msg = (char*)"invalid distance code";
            UNGRAB
 432:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
 439:	29 c7                	sub    %eax,%edi
 43b:	01 ea                	add    %ebp,%edx
 43d:	89 f8                	mov    %edi,%eax
 43f:	8b 7c 24 4c          	mov    0x4c(%esp),%edi
 443:	89 47 1c             	mov    %eax,0x1c(%edi)
 446:	8b 44 24 50          	mov    0x50(%esp),%eax
            UPDATE
 44a:	89 c7                	mov    %eax,%edi
            e = (t += ((uInt)b & inflate_mask[e]))->exop;
          }
          else
          {
            z->msg = (char*)"invalid distance code";
            UNGRAB
 44c:	89 50 04             	mov    %edx,0x4(%eax)
            UPDATE
 44f:	89 d8                	mov    %ebx,%eax
 451:	8b 37                	mov    (%edi),%esi
 453:	8b 6f 08             	mov    0x8(%edi),%ebp
 456:	29 f0                	sub    %esi,%eax
 458:	89 1f                	mov    %ebx,(%edi)
 45a:	01 c5                	add    %eax,%ebp
 45c:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 460:	89 6f 08             	mov    %ebp,0x8(%edi)
 463:	8b 7c 24 04          	mov    0x4(%esp),%edi
 467:	89 78 34             	mov    %edi,0x34(%eax)

  /* not enough input or output--restore pointers and return */
  UNGRAB
  UPDATE
  return Z_OK;
}
 46a:	83 c4 28             	add    $0x28,%esp
          else
          {
            z->msg = (char*)"invalid distance code";
            UNGRAB
            UPDATE
            return Z_DATA_ERROR;
 46d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax

  /* not enough input or output--restore pointers and return */
  UNGRAB
  UPDATE
  return Z_OK;
}
 472:	5b                   	pop    %ebx
 473:	5e                   	pop    %esi
 474:	5f                   	pop    %edi
 475:	5d                   	pop    %ebp
 476:	c3                   	ret    
              *q++ = *r++;  c--;        /* minimum count is three, */
              *q++ = *r++;  c--;        /*  so unroll loop a little */
            }
            else                        /* else offset after destination */
            {
              e = d - (uInt)(q - s->window); /* bytes from offset to end */
 477:	8b 74 24 04          	mov    0x4(%esp),%esi
 47b:	29 f1                	sub    %esi,%ecx
 47d:	01 ca                	add    %ecx,%edx
              r = s->end - e;           /* pointer to offset */
 47f:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
 483:	8b 49 2c             	mov    0x2c(%ecx),%ecx
 486:	29 d1                	sub    %edx,%ecx
              if (c > e)                /* if source crosses, */
 488:	39 d3                	cmp    %edx,%ebx
              *q++ = *r++;  c--;        /*  so unroll loop a little */
            }
            else                        /* else offset after destination */
            {
              e = d - (uInt)(q - s->window); /* bytes from offset to end */
              r = s->end - e;           /* pointer to offset */
 48a:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 48e:	89 f1                	mov    %esi,%ecx
              if (c > e)                /* if source crosses, */
 490:	0f 86 69 fe ff ff    	jbe    2ff <_inflate_fast+0x2ff>
 496:	8d 0c 16             	lea    (%esi,%edx,1),%ecx
              {
                c -= e;                 /* copy to end of window */
 499:	29 d3                	sub    %edx,%ebx
 49b:	89 44 24 04          	mov    %eax,0x4(%esp)
 49f:	89 f2                	mov    %esi,%edx
 4a1:	8b 74 24 10          	mov    0x10(%esp),%esi
                do {
                  *q++ = *r++;
 4a5:	46                   	inc    %esi
 4a6:	42                   	inc    %edx
 4a7:	8a 46 ff             	mov    -0x1(%esi),%al
                } while (--e);
 4aa:	39 ca                	cmp    %ecx,%edx
              r = s->end - e;           /* pointer to offset */
              if (c > e)                /* if source crosses, */
              {
                c -= e;                 /* copy to end of window */
                do {
                  *q++ = *r++;
 4ac:	88 42 ff             	mov    %al,-0x1(%edx)
                } while (--e);
 4af:	75 f4                	jne    4a5 <_inflate_fast+0x4a5>
                r = s->window;          /* copy rest from start of window */
 4b1:	8b 74 24 4c          	mov    0x4c(%esp),%esi
 4b5:	8b 44 24 04          	mov    0x4(%esp),%eax
 4b9:	8b 76 28             	mov    0x28(%esi),%esi
 4bc:	89 74 24 10          	mov    %esi,0x10(%esp)
 4c0:	e9 3a fe ff ff       	jmp    2ff <_inflate_fast+0x2ff>
 4c5:	89 c6                	mov    %eax,%esi
 4c7:	e9 34 ff ff ff       	jmp    400 <_inflate_fast+0x400>
        UPDATE
        return Z_STREAM_END;
      }
      else
      {
        z->msg = (char*)"invalid literal/length code";
 4cc:	8b 5c 24 50          	mov    0x50(%esp),%ebx
        UNGRAB
 4d0:	8b 34 24             	mov    (%esp),%esi
        UPDATE
        return Z_STREAM_END;
      }
      else
      {
        z->msg = (char*)"invalid literal/length code";
 4d3:	c7 43 18 16 00 00 00 	movl   $0x16,0x18(%ebx)
        UNGRAB
 4da:	8b 5b 04             	mov    0x4(%ebx),%ebx
 4dd:	89 da                	mov    %ebx,%edx
 4df:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 4e3:	89 c3                	mov    %eax,%ebx
 4e5:	29 f2                	sub    %esi,%edx
 4e7:	c1 eb 03             	shr    $0x3,%ebx
 4ea:	39 d3                	cmp    %edx,%ebx
 4ec:	0f 47 da             	cmova  %edx,%ebx
 4ef:	29 df                	sub    %ebx,%edi
 4f1:	89 fa                	mov    %edi,%edx
 4f3:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
        UPDATE
 4fa:	8b 7c 24 4c          	mov    0x4c(%esp),%edi
        return Z_STREAM_END;
      }
      else
      {
        z->msg = (char*)"invalid literal/length code";
        UNGRAB
 4fe:	29 c8                	sub    %ecx,%eax
 500:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
 503:	89 47 1c             	mov    %eax,0x1c(%edi)
 506:	8b 44 24 50          	mov    0x50(%esp),%eax
        UPDATE
 50a:	89 6f 20             	mov    %ebp,0x20(%edi)
 50d:	89 c7                	mov    %eax,%edi
        return Z_STREAM_END;
      }
      else
      {
        z->msg = (char*)"invalid literal/length code";
        UNGRAB
 50f:	89 48 04             	mov    %ecx,0x4(%eax)
        UPDATE
 512:	89 d0                	mov    %edx,%eax
 514:	8b 1f                	mov    (%edi),%ebx
 516:	8b 77 08             	mov    0x8(%edi),%esi
 519:	29 d8                	sub    %ebx,%eax
 51b:	89 17                	mov    %edx,(%edi)
 51d:	01 c6                	add    %eax,%esi
 51f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 523:	89 77 08             	mov    %esi,0x8(%edi)
 526:	8b 7c 24 04          	mov    0x4(%esp),%edi
 52a:	89 78 34             	mov    %edi,0x34(%eax)
        return Z_DATA_ERROR;
 52d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 532:	e9 71 fe ff ff       	jmp    3a8 <_inflate_fast+0x3a8>
 537:	90                   	nop
 538:	90                   	nop
 539:	90                   	nop
 53a:	90                   	nop
 53b:	90                   	nop
 53c:	90                   	nop
 53d:	90                   	nop
 53e:	90                   	nop
 53f:	90                   	nop

inflate.o:     file format pe-i386


Disassembly of section .text:

00000000 <_inflateReset>:
};


int ZEXPORT inflateReset(z)
z_streamp z;
{
   0:	83 ec 1c             	sub    $0x1c,%esp
   3:	8b 44 24 20          	mov    0x20(%esp),%eax
  if (z == Z_NULL || z->state == Z_NULL)
   7:	85 c0                	test   %eax,%eax
   9:	74 47                	je     52 <_inflateReset+0x52>
   b:	8b 48 1c             	mov    0x1c(%eax),%ecx
   e:	85 c9                	test   %ecx,%ecx
  10:	74 40                	je     52 <_inflateReset+0x52>
    return Z_STREAM_ERROR;
  z->total_in = z->total_out = 0;
  z->msg = Z_NULL;
  z->state->mode = z->state->nowrap ? BLOCKS : METHOD;
  12:	83 79 0c 01          	cmpl   $0x1,0xc(%ecx)
  16:	19 d2                	sbb    %edx,%edx
int ZEXPORT inflateReset(z)
z_streamp z;
{
  if (z == Z_NULL || z->state == Z_NULL)
    return Z_STREAM_ERROR;
  z->total_in = z->total_out = 0;
  18:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  z->msg = Z_NULL;
  z->state->mode = z->state->nowrap ? BLOCKS : METHOD;
  1f:	83 f2 ff             	xor    $0xffffffff,%edx
int ZEXPORT inflateReset(z)
z_streamp z;
{
  if (z == Z_NULL || z->state == Z_NULL)
    return Z_STREAM_ERROR;
  z->total_in = z->total_out = 0;
  22:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  z->msg = Z_NULL;
  z->state->mode = z->state->nowrap ? BLOCKS : METHOD;
  29:	83 e2 07             	and    $0x7,%edx
z_streamp z;
{
  if (z == Z_NULL || z->state == Z_NULL)
    return Z_STREAM_ERROR;
  z->total_in = z->total_out = 0;
  z->msg = Z_NULL;
  2c:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  z->state->mode = z->state->nowrap ? BLOCKS : METHOD;
  33:	89 11                	mov    %edx,(%ecx)
  inflate_blocks_reset(z->state->blocks, z, Z_NULL);
  35:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  3c:	00 
  3d:	89 44 24 04          	mov    %eax,0x4(%esp)
  41:	8b 41 14             	mov    0x14(%ecx),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 00 00 00 00       	call   4c <_inflateReset+0x4c>
  Tracev((stderr, "inflate: reset\n"));
  return Z_OK;
  4c:	31 c0                	xor    %eax,%eax
}
  4e:	83 c4 1c             	add    $0x1c,%esp
  51:	c3                   	ret    

int ZEXPORT inflateReset(z)
z_streamp z;
{
  if (z == Z_NULL || z->state == Z_NULL)
    return Z_STREAM_ERROR;
  52:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  57:	eb f5                	jmp    4e <_inflateReset+0x4e>
  59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000060 <_inflateEnd>:
}


int ZEXPORT inflateEnd(z)
z_streamp z;
{
  60:	53                   	push   %ebx
  61:	83 ec 18             	sub    $0x18,%esp
  64:	8b 5c 24 20          	mov    0x20(%esp),%ebx
  if (z == Z_NULL || z->state == Z_NULL || z->zfree == Z_NULL)
  68:	85 db                	test   %ebx,%ebx
  6a:	74 44                	je     b0 <_inflateEnd+0x50>
  6c:	8b 43 1c             	mov    0x1c(%ebx),%eax
  6f:	85 c0                	test   %eax,%eax
  71:	74 3d                	je     b0 <_inflateEnd+0x50>
  73:	8b 53 24             	mov    0x24(%ebx),%edx
  76:	85 d2                	test   %edx,%edx
  78:	74 36                	je     b0 <_inflateEnd+0x50>
    return Z_STREAM_ERROR;
  if (z->state->blocks != Z_NULL)
  7a:	8b 48 14             	mov    0x14(%eax),%ecx
  7d:	85 c9                	test   %ecx,%ecx
  7f:	74 12                	je     93 <_inflateEnd+0x33>
    inflate_blocks_free(z->state->blocks, z);
  81:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  85:	89 0c 24             	mov    %ecx,(%esp)
  88:	e8 00 00 00 00       	call   8d <_inflateEnd+0x2d>
  8d:	8b 53 24             	mov    0x24(%ebx),%edx
  90:	8b 43 1c             	mov    0x1c(%ebx),%eax
  ZFREE(z, z->state);
  93:	89 44 24 04          	mov    %eax,0x4(%esp)
  97:	8b 43 28             	mov    0x28(%ebx),%eax
  9a:	89 04 24             	mov    %eax,(%esp)
  9d:	ff d2                	call   *%edx
  z->state = Z_NULL;
  9f:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
  Tracev((stderr, "inflate: end\n"));
  return Z_OK;
  a6:	31 c0                	xor    %eax,%eax
}
  a8:	83 c4 18             	add    $0x18,%esp
  ab:	5b                   	pop    %ebx
  ac:	c3                   	ret    
  ad:	8d 76 00             	lea    0x0(%esi),%esi

int ZEXPORT inflateEnd(z)
z_streamp z;
{
  if (z == Z_NULL || z->state == Z_NULL || z->zfree == Z_NULL)
    return Z_STREAM_ERROR;
  b0:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  b5:	eb f1                	jmp    a8 <_inflateEnd+0x48>
  b7:	89 f6                	mov    %esi,%esi
  b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000c0 <_inflateInit2_>:
int ZEXPORT inflateInit2_(z, w, version, stream_size)
z_streamp z;
int w;
const char *version;
int stream_size;
{
  c0:	57                   	push   %edi
  c1:	56                   	push   %esi
  c2:	53                   	push   %ebx
  c3:	83 ec 10             	sub    $0x10,%esp
  c6:	8b 44 24 28          	mov    0x28(%esp),%eax
  ca:	8b 5c 24 20          	mov    0x20(%esp),%ebx
  ce:	8b 7c 24 24          	mov    0x24(%esp),%edi
  if (version == Z_NULL || version[0] != ZLIB_VERSION[0] ||
  d2:	85 c0                	test   %eax,%eax
  d4:	0f 84 06 01 00 00    	je     1e0 <_inflateInit2_+0x120>
  da:	80 38 31             	cmpb   $0x31,(%eax)
  dd:	0f 85 fd 00 00 00    	jne    1e0 <_inflateInit2_+0x120>
  e3:	83 7c 24 2c 38       	cmpl   $0x38,0x2c(%esp)
  e8:	0f 85 f2 00 00 00    	jne    1e0 <_inflateInit2_+0x120>
      stream_size != sizeof(z_stream))
      return Z_VERSION_ERROR;

  /* initialize state */
  if (z == Z_NULL)
  ee:	85 db                	test   %ebx,%ebx
  f0:	0f 84 09 01 00 00    	je     1ff <_inflateInit2_+0x13f>
    return Z_STREAM_ERROR;
  z->msg = Z_NULL;
  if (z->zalloc == Z_NULL)
  f6:	8b 43 20             	mov    0x20(%ebx),%eax
      return Z_VERSION_ERROR;

  /* initialize state */
  if (z == Z_NULL)
    return Z_STREAM_ERROR;
  z->msg = Z_NULL;
  f9:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
  if (z->zalloc == Z_NULL)
 100:	85 c0                	test   %eax,%eax
 102:	0f 84 b8 00 00 00    	je     1c0 <_inflateInit2_+0x100>
 108:	8b 53 28             	mov    0x28(%ebx),%edx
  {
    z->zalloc = zcalloc;
    z->opaque = (voidpf)0;
  }
  if (z->zfree == Z_NULL) z->zfree = zcfree;
 10b:	8b 4b 24             	mov    0x24(%ebx),%ecx
 10e:	85 c9                	test   %ecx,%ecx
 110:	0f 84 9a 00 00 00    	je     1b0 <_inflateInit2_+0xf0>
  if ((z->state = (struct internal_state FAR *)
       ZALLOC(z,1,sizeof(struct internal_state))) == Z_NULL)
 116:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
 11d:	00 
 11e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 125:	00 
 126:	89 14 24             	mov    %edx,(%esp)
 129:	ff d0                	call   *%eax
 12b:	89 c6                	mov    %eax,%esi
  {
    z->zalloc = zcalloc;
    z->opaque = (voidpf)0;
  }
  if (z->zfree == Z_NULL) z->zfree = zcfree;
  if ((z->state = (struct internal_state FAR *)
 12d:	89 43 1c             	mov    %eax,0x1c(%ebx)
 130:	85 c0                	test   %eax,%eax
 132:	0f 84 ce 00 00 00    	je     206 <_inflateInit2_+0x146>
       ZALLOC(z,1,sizeof(struct internal_state))) == Z_NULL)
    return Z_MEM_ERROR;
  z->state->blocks = Z_NULL;
 138:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

  /* handle undocumented nowrap option (no zlib header or check) */
  z->state->nowrap = 0;
  if (w < 0)
 13f:	85 ff                	test   %edi,%edi
 141:	78 5d                	js     1a0 <_inflateInit2_+0xe0>
       ZALLOC(z,1,sizeof(struct internal_state))) == Z_NULL)
    return Z_MEM_ERROR;
  z->state->blocks = Z_NULL;

  /* handle undocumented nowrap option (no zlib header or check) */
  z->state->nowrap = 0;
 143:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    w = - w;
    z->state->nowrap = 1;
  }

  /* set window size */
  if (w < 8 || w > 15)
 14a:	8d 47 f8             	lea    -0x8(%edi),%eax
 14d:	83 f8 07             	cmp    $0x7,%eax
 150:	0f 87 9a 00 00 00    	ja     1f0 <_inflateInit2_+0x130>
  }
  z->state->wbits = (uInt)w;

  /* create inflate_blocks state */
  if ((z->state->blocks =
      inflate_blocks_new(z, z->state->nowrap ? Z_NULL : adler32, (uInt)1 << w))
 156:	89 f9                	mov    %edi,%ecx
 158:	b8 01 00 00 00       	mov    $0x1,%eax
 15d:	d3 e0                	shl    %cl,%eax
 15f:	89 c2                	mov    %eax,%edx
 161:	8b 46 0c             	mov    0xc(%esi),%eax
 164:	85 c0                	test   %eax,%eax
 166:	b9 00 00 00 00       	mov    $0x0,%ecx
 16b:	b8 00 00 00 00       	mov    $0x0,%eax
  if (w < 8 || w > 15)
  {
    inflateEnd(z);
    return Z_STREAM_ERROR;
  }
  z->state->wbits = (uInt)w;
 170:	89 7e 10             	mov    %edi,0x10(%esi)

  /* create inflate_blocks state */
  if ((z->state->blocks =
      inflate_blocks_new(z, z->state->nowrap ? Z_NULL : adler32, (uInt)1 << w))
 173:	0f 45 c1             	cmovne %ecx,%eax
 176:	89 54 24 08          	mov    %edx,0x8(%esp)
 17a:	89 44 24 04          	mov    %eax,0x4(%esp)
 17e:	89 1c 24             	mov    %ebx,(%esp)
 181:	e8 00 00 00 00       	call   186 <_inflateInit2_+0xc6>
    return Z_STREAM_ERROR;
  }
  z->state->wbits = (uInt)w;

  /* create inflate_blocks state */
  if ((z->state->blocks =
 186:	89 46 14             	mov    %eax,0x14(%esi)
 189:	85 c0                	test   %eax,%eax
      inflate_blocks_new(z, z->state->nowrap ? Z_NULL : adler32, (uInt)1 << w))
      == Z_NULL)
  {
    inflateEnd(z);
 18b:	89 1c 24             	mov    %ebx,(%esp)
    return Z_STREAM_ERROR;
  }
  z->state->wbits = (uInt)w;

  /* create inflate_blocks state */
  if ((z->state->blocks =
 18e:	74 7d                	je     20d <_inflateInit2_+0x14d>
    return Z_MEM_ERROR;
  }
  Tracev((stderr, "inflate: allocated\n"));

  /* reset state */
  inflateReset(z);
 190:	e8 6b fe ff ff       	call   0 <_inflateReset>
  return Z_OK;
 195:	31 c0                	xor    %eax,%eax
}
 197:	83 c4 10             	add    $0x10,%esp
 19a:	5b                   	pop    %ebx
 19b:	5e                   	pop    %esi
 19c:	5f                   	pop    %edi
 19d:	c3                   	ret    
 19e:	66 90                	xchg   %ax,%ax

  /* handle undocumented nowrap option (no zlib header or check) */
  z->state->nowrap = 0;
  if (w < 0)
  {
    w = - w;
 1a0:	f7 df                	neg    %edi
    z->state->nowrap = 1;
 1a2:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
 1a9:	eb 9f                	jmp    14a <_inflateInit2_+0x8a>
 1ab:	90                   	nop
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (z->zalloc == Z_NULL)
  {
    z->zalloc = zcalloc;
    z->opaque = (voidpf)0;
  }
  if (z->zfree == Z_NULL) z->zfree = zcfree;
 1b0:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
 1b7:	e9 5a ff ff ff       	jmp    116 <_inflateInit2_+0x56>
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (z == Z_NULL)
    return Z_STREAM_ERROR;
  z->msg = Z_NULL;
  if (z->zalloc == Z_NULL)
  {
    z->zalloc = zcalloc;
 1c0:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    z->opaque = (voidpf)0;
 1c7:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
 1ce:	31 d2                	xor    %edx,%edx
 1d0:	b8 00 00 00 00       	mov    $0x0,%eax
 1d5:	e9 31 ff ff ff       	jmp    10b <_inflateInit2_+0x4b>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  Tracev((stderr, "inflate: allocated\n"));

  /* reset state */
  inflateReset(z);
  return Z_OK;
}
 1e0:	83 c4 10             	add    $0x10,%esp
const char *version;
int stream_size;
{
  if (version == Z_NULL || version[0] != ZLIB_VERSION[0] ||
      stream_size != sizeof(z_stream))
      return Z_VERSION_ERROR;
 1e3:	b8 fa ff ff ff       	mov    $0xfffffffa,%eax
  Tracev((stderr, "inflate: allocated\n"));

  /* reset state */
  inflateReset(z);
  return Z_OK;
}
 1e8:	5b                   	pop    %ebx
 1e9:	5e                   	pop    %esi
 1ea:	5f                   	pop    %edi
 1eb:	c3                   	ret    
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  /* set window size */
  if (w < 8 || w > 15)
  {
    inflateEnd(z);
 1f0:	89 1c 24             	mov    %ebx,(%esp)
 1f3:	e8 68 fe ff ff       	call   60 <_inflateEnd>
    return Z_STREAM_ERROR;
 1f8:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
 1fd:	eb 98                	jmp    197 <_inflateInit2_+0xd7>
      stream_size != sizeof(z_stream))
      return Z_VERSION_ERROR;

  /* initialize state */
  if (z == Z_NULL)
    return Z_STREAM_ERROR;
 1ff:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
 204:	eb 91                	jmp    197 <_inflateInit2_+0xd7>
    z->opaque = (voidpf)0;
  }
  if (z->zfree == Z_NULL) z->zfree = zcfree;
  if ((z->state = (struct internal_state FAR *)
       ZALLOC(z,1,sizeof(struct internal_state))) == Z_NULL)
    return Z_MEM_ERROR;
 206:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
 20b:	eb 8a                	jmp    197 <_inflateInit2_+0xd7>
  /* create inflate_blocks state */
  if ((z->state->blocks =
      inflate_blocks_new(z, z->state->nowrap ? Z_NULL : adler32, (uInt)1 << w))
      == Z_NULL)
  {
    inflateEnd(z);
 20d:	e8 4e fe ff ff       	call   60 <_inflateEnd>
    return Z_MEM_ERROR;
 212:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
 217:	e9 7b ff ff ff       	jmp    197 <_inflateInit2_+0xd7>
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000220 <_inflateInit_>:

int ZEXPORT inflateInit_(z, version, stream_size)
z_streamp z;
const char *version;
int stream_size;
{
 220:	83 ec 1c             	sub    $0x1c,%esp
  return inflateInit2_(z, DEF_WBITS, version, stream_size);
 223:	8b 44 24 28          	mov    0x28(%esp),%eax
 227:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
 22e:	00 
 22f:	89 44 24 0c          	mov    %eax,0xc(%esp)
 233:	8b 44 24 24          	mov    0x24(%esp),%eax
 237:	89 44 24 08          	mov    %eax,0x8(%esp)
 23b:	8b 44 24 20          	mov    0x20(%esp),%eax
 23f:	89 04 24             	mov    %eax,(%esp)
 242:	e8 79 fe ff ff       	call   c0 <_inflateInit2_>
}
 247:	83 c4 1c             	add    $0x1c,%esp
 24a:	c3                   	ret    
 24b:	90                   	nop
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <_inflate>:
#define NEXTBYTE (z->avail_in--,z->total_in++,*z->next_in++)

int ZEXPORT inflate(z, f)
z_streamp z;
int f;
{
 250:	55                   	push   %ebp
 251:	57                   	push   %edi
 252:	56                   	push   %esi
 253:	53                   	push   %ebx
 254:	83 ec 2c             	sub    $0x2c,%esp
 257:	8b 5c 24 40          	mov    0x40(%esp),%ebx
  int r;
  uInt b;

  if (z == Z_NULL || z->state == Z_NULL || z->next_in == Z_NULL)
 25b:	85 db                	test   %ebx,%ebx
 25d:	0f 84 cd 03 00 00    	je     630 <_inflate+0x3e0>
 263:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
 266:	85 c9                	test   %ecx,%ecx
 268:	0f 84 c2 03 00 00    	je     630 <_inflate+0x3e0>
 26e:	8b 03                	mov    (%ebx),%eax
 270:	85 c0                	test   %eax,%eax
 272:	0f 84 b8 03 00 00    	je     630 <_inflate+0x3e0>
    return Z_STREAM_ERROR;
  f = f == Z_FINISH ? Z_BUF_ERROR : Z_OK;
 278:	31 c0                	xor    %eax,%eax
 27a:	8b 11                	mov    (%ecx),%edx
 27c:	83 7c 24 44 04       	cmpl   $0x4,0x44(%esp)
 281:	0f 95 c0             	setne  %al
 284:	89 c6                	mov    %eax,%esi
      }
      z->state->mode = FLAG;
    case FLAG:
      NEEDBYTE
      b = NEXTBYTE;
      if (((z->state->sub.method << 8) + b) % 31)
 286:	bf 1f 00 00 00       	mov    $0x1f,%edi
  uInt b;

  if (z == Z_NULL || z->state == Z_NULL || z->next_in == Z_NULL)
    return Z_STREAM_ERROR;
  f = f == Z_FINISH ? Z_BUF_ERROR : Z_OK;
  r = Z_BUF_ERROR;
 28b:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
  while (1) switch (z->state->mode)
 290:	83 fa 0d             	cmp    $0xd,%edx
  int r;
  uInt b;

  if (z == Z_NULL || z->state == Z_NULL || z->next_in == Z_NULL)
    return Z_STREAM_ERROR;
  f = f == Z_FINISH ? Z_BUF_ERROR : Z_OK;
 293:	8d 74 b6 fb          	lea    -0x5(%esi,%esi,4),%esi
  r = Z_BUF_ERROR;
  while (1) switch (z->state->mode)
 297:	0f 87 93 03 00 00    	ja     630 <_inflate+0x3e0>
 29d:	ff 24 95 6c 00 00 00 	jmp    *0x6c(,%edx,4)
      if (z->state->nowrap)
      {
        z->state->mode = DONE;
        break;
      }
      z->state->mode = CHECK4;
 2a4:	c7 01 08 00 00 00    	movl   $0x8,(%ecx)
      }
      if (r == Z_OK)
        r = f;
      if (r != Z_STREAM_END)
        return r;
      r = f;
 2aa:	89 f0                	mov    %esi,%eax
        z->state->mode = DONE;
        break;
      }
      z->state->mode = CHECK4;
    case CHECK4:
      NEEDBYTE
 2ac:	8b 53 04             	mov    0x4(%ebx),%edx
 2af:	85 d2                	test   %edx,%edx
 2b1:	0f 84 fe 00 00 00    	je     3b5 <_inflate+0x165>
      z->state->sub.check.need = (uLong)NEXTBYTE << 24;
 2b7:	8b 43 08             	mov    0x8(%ebx),%eax
 2ba:	4a                   	dec    %edx
 2bb:	40                   	inc    %eax
 2bc:	89 53 04             	mov    %edx,0x4(%ebx)
 2bf:	89 43 08             	mov    %eax,0x8(%ebx)
 2c2:	8b 03                	mov    (%ebx),%eax
 2c4:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
 2c7:	8d 68 01             	lea    0x1(%eax),%ebp
 2ca:	89 2b                	mov    %ebp,(%ebx)
 2cc:	0f b6 28             	movzbl (%eax),%ebp
 2cf:	81 e5 ff 00 00 00    	and    $0xff,%ebp
      z->state->mode = CHECK3;
 2d5:	c7 01 09 00 00 00    	movl   $0x9,(%ecx)
        break;
      }
      z->state->mode = CHECK4;
    case CHECK4:
      NEEDBYTE
      z->state->sub.check.need = (uLong)NEXTBYTE << 24;
 2db:	89 e8                	mov    %ebp,%eax
 2dd:	c1 e0 18             	shl    $0x18,%eax
 2e0:	89 41 08             	mov    %eax,0x8(%ecx)
        z->state->mode = DONE;
        break;
      }
      z->state->mode = CHECK4;
    case CHECK4:
      NEEDBYTE
 2e3:	89 f0                	mov    %esi,%eax
      z->state->sub.check.need = (uLong)NEXTBYTE << 24;
      z->state->mode = CHECK3;
    case CHECK3:
      NEEDBYTE
 2e5:	85 d2                	test   %edx,%edx
 2e7:	0f 84 c8 00 00 00    	je     3b5 <_inflate+0x165>
      z->state->sub.check.need += (uLong)NEXTBYTE << 16;
 2ed:	8b 0b                	mov    (%ebx),%ecx
 2ef:	8b 43 08             	mov    0x8(%ebx),%eax
 2f2:	40                   	inc    %eax
 2f3:	4a                   	dec    %edx
 2f4:	89 43 08             	mov    %eax,0x8(%ebx)
 2f7:	8d 41 01             	lea    0x1(%ecx),%eax
 2fa:	89 03                	mov    %eax,(%ebx)
 2fc:	89 53 04             	mov    %edx,0x4(%ebx)
 2ff:	0f b6 29             	movzbl (%ecx),%ebp
 302:	8b 43 1c             	mov    0x1c(%ebx),%eax
 305:	81 e5 ff 00 00 00    	and    $0xff,%ebp
 30b:	89 e9                	mov    %ebp,%ecx
 30d:	c1 e1 10             	shl    $0x10,%ecx
 310:	8b 68 08             	mov    0x8(%eax),%ebp
 313:	01 cd                	add    %ecx,%ebp
      z->state->mode = CHECK2;
 315:	c7 00 0a 00 00 00    	movl   $0xa,(%eax)
      NEEDBYTE
      z->state->sub.check.need = (uLong)NEXTBYTE << 24;
      z->state->mode = CHECK3;
    case CHECK3:
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE << 16;
 31b:	89 68 08             	mov    %ebp,0x8(%eax)
    case CHECK4:
      NEEDBYTE
      z->state->sub.check.need = (uLong)NEXTBYTE << 24;
      z->state->mode = CHECK3;
    case CHECK3:
      NEEDBYTE
 31e:	89 f0                	mov    %esi,%eax
      z->state->sub.check.need += (uLong)NEXTBYTE << 16;
      z->state->mode = CHECK2;
    case CHECK2:
      NEEDBYTE
 320:	85 d2                	test   %edx,%edx
 322:	0f 84 8d 00 00 00    	je     3b5 <_inflate+0x165>
      z->state->sub.check.need += (uLong)NEXTBYTE << 8;
 328:	8b 03                	mov    (%ebx),%eax
 32a:	8b 4b 08             	mov    0x8(%ebx),%ecx
 32d:	41                   	inc    %ecx
 32e:	4a                   	dec    %edx
 32f:	89 4b 08             	mov    %ecx,0x8(%ebx)
 332:	8d 48 01             	lea    0x1(%eax),%ecx
 335:	89 0b                	mov    %ecx,(%ebx)
 337:	89 53 04             	mov    %edx,0x4(%ebx)
 33a:	0f b6 28             	movzbl (%eax),%ebp
 33d:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
 340:	81 e5 ff 00 00 00    	and    $0xff,%ebp
 346:	89 e8                	mov    %ebp,%eax
 348:	c1 e0 08             	shl    $0x8,%eax
 34b:	8b 69 08             	mov    0x8(%ecx),%ebp
 34e:	01 c5                	add    %eax,%ebp
      z->state->mode = CHECK1;
 350:	c7 01 0b 00 00 00    	movl   $0xb,(%ecx)
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE << 16;
      z->state->mode = CHECK2;
    case CHECK2:
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE << 8;
 356:	89 69 08             	mov    %ebp,0x8(%ecx)
    case CHECK3:
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE << 16;
      z->state->mode = CHECK2;
    case CHECK2:
      NEEDBYTE
 359:	89 f0                	mov    %esi,%eax
      z->state->sub.check.need += (uLong)NEXTBYTE << 8;
      z->state->mode = CHECK1;
    case CHECK1:
      NEEDBYTE
 35b:	85 d2                	test   %edx,%edx
 35d:	74 56                	je     3b5 <_inflate+0x165>
      z->state->sub.check.need += (uLong)NEXTBYTE;
 35f:	8b 43 08             	mov    0x8(%ebx),%eax
 362:	4a                   	dec    %edx
 363:	40                   	inc    %eax
 364:	89 53 04             	mov    %edx,0x4(%ebx)
 367:	89 43 08             	mov    %eax,0x8(%ebx)
 36a:	8b 03                	mov    (%ebx),%eax
 36c:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
 36f:	8d 50 01             	lea    0x1(%eax),%edx
 372:	89 13                	mov    %edx,(%ebx)
 374:	8a 10                	mov    (%eax),%dl
 376:	8b 41 08             	mov    0x8(%ecx),%eax
 379:	81 e2 ff 00 00 00    	and    $0xff,%edx
 37f:	01 d0                	add    %edx,%eax
 381:	89 41 08             	mov    %eax,0x8(%ecx)

      if (z->state->sub.check.was != z->state->sub.check.need)
 384:	3b 41 04             	cmp    0x4(%ecx),%eax
 387:	74 20                	je     3a9 <_inflate+0x159>
      {
        z->state->mode = BAD;
 389:	c7 01 0d 00 00 00    	movl   $0xd,(%ecx)
    case CHECK2:
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE << 8;
      z->state->mode = CHECK1;
    case CHECK1:
      NEEDBYTE
 38f:	89 f0                	mov    %esi,%eax
      z->state->sub.check.need += (uLong)NEXTBYTE;

      if (z->state->sub.check.was != z->state->sub.check.need)
      {
        z->state->mode = BAD;
        z->msg = (char*)"incorrect data check";
 391:	c7 43 18 56 00 00 00 	movl   $0x56,0x18(%ebx)
        z->state->sub.marker = 5;       /* can't try inflateSync */
        break;
 398:	ba 0d 00 00 00       	mov    $0xd,%edx

      if (z->state->sub.check.was != z->state->sub.check.need)
      {
        z->state->mode = BAD;
        z->msg = (char*)"incorrect data check";
        z->state->sub.marker = 5;       /* can't try inflateSync */
 39d:	c7 41 04 05 00 00 00 	movl   $0x5,0x4(%ecx)
        break;
 3a4:	e9 f4 fe ff ff       	jmp    29d <_inflate+0x4d>
      }
      Tracev((stderr, "inflate: zlib check ok\n"));
      z->state->mode = DONE;
 3a9:	c7 01 0c 00 00 00    	movl   $0xc,(%ecx)
 3af:	90                   	nop
    case DONE:
      return Z_STREAM_END;
 3b0:	b8 01 00 00 00       	mov    $0x1,%eax
      return Z_STREAM_ERROR;
  }
#ifdef NEED_DUMMY_RETURN
  return Z_STREAM_ERROR;  /* Some dumb compilers complain without this */
#endif
}
 3b5:	83 c4 2c             	add    $0x2c,%esp
 3b8:	5b                   	pop    %ebx
 3b9:	5e                   	pop    %esi
 3ba:	5f                   	pop    %edi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	83 c4 2c             	add    $0x2c,%esp
      Tracev((stderr, "inflate: zlib check ok\n"));
      z->state->mode = DONE;
    case DONE:
      return Z_STREAM_END;
    case BAD:
      return Z_DATA_ERROR;
 3c3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
      return Z_STREAM_ERROR;
  }
#ifdef NEED_DUMMY_RETURN
  return Z_STREAM_ERROR;  /* Some dumb compilers complain without this */
#endif
}
 3c8:	5b                   	pop    %ebx
 3c9:	5e                   	pop    %esi
 3ca:	5f                   	pop    %edi
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	8b 53 04             	mov    0x4(%ebx),%edx
 3d3:	e9 0d ff ff ff       	jmp    2e5 <_inflate+0x95>
 3d8:	8b 53 04             	mov    0x4(%ebx),%edx
    case DICT3:
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE << 16;
      z->state->mode = DICT2;
    case DICT2:
      NEEDBYTE
 3db:	85 d2                	test   %edx,%edx
 3dd:	74 d6                	je     3b5 <_inflate+0x165>
      z->state->sub.check.need += (uLong)NEXTBYTE << 8;
 3df:	8b 43 08             	mov    0x8(%ebx),%eax
 3e2:	4a                   	dec    %edx
 3e3:	40                   	inc    %eax
 3e4:	89 53 04             	mov    %edx,0x4(%ebx)
 3e7:	89 43 08             	mov    %eax,0x8(%ebx)
 3ea:	8b 03                	mov    (%ebx),%eax
 3ec:	8d 78 01             	lea    0x1(%eax),%edi
 3ef:	89 3b                	mov    %edi,(%ebx)
 3f1:	0f b6 38             	movzbl (%eax),%edi
 3f4:	81 e7 ff 00 00 00    	and    $0xff,%edi
      z->state->mode = DICT1;
 3fa:	c7 01 05 00 00 00    	movl   $0x5,(%ecx)
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE << 16;
      z->state->mode = DICT2;
    case DICT2:
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE << 8;
 400:	89 f8                	mov    %edi,%eax
 402:	8b 79 08             	mov    0x8(%ecx),%edi
 405:	c1 e0 08             	shl    $0x8,%eax
 408:	01 c7                	add    %eax,%edi
 40a:	89 79 08             	mov    %edi,0x8(%ecx)
      z->state->mode = DICT1;
    case DICT1:
      NEEDBYTE
 40d:	85 d2                	test   %edx,%edx
 40f:	0f 84 12 02 00 00    	je     627 <_inflate+0x3d7>
      z->state->sub.check.need += (uLong)NEXTBYTE;
 415:	8b 43 08             	mov    0x8(%ebx),%eax
 418:	4a                   	dec    %edx
 419:	40                   	inc    %eax
 41a:	89 53 04             	mov    %edx,0x4(%ebx)
 41d:	89 43 08             	mov    %eax,0x8(%ebx)
 420:	8b 03                	mov    (%ebx),%eax
 422:	8d 50 01             	lea    0x1(%eax),%edx
 425:	89 13                	mov    %edx,(%ebx)
 427:	0f b6 38             	movzbl (%eax),%edi
 42a:	8b 41 08             	mov    0x8(%ecx),%eax
 42d:	81 e7 ff 00 00 00    	and    $0xff,%edi
 433:	01 f8                	add    %edi,%eax
 435:	89 41 08             	mov    %eax,0x8(%ecx)
      z->adler = z->state->sub.check.need;
 438:	89 43 30             	mov    %eax,0x30(%ebx)
      z->state->mode = DICT0;
 43b:	c7 01 06 00 00 00    	movl   $0x6,(%ecx)
      return Z_STREAM_ERROR;
  }
#ifdef NEED_DUMMY_RETURN
  return Z_STREAM_ERROR;  /* Some dumb compilers complain without this */
#endif
}
 441:	83 c4 2c             	add    $0x2c,%esp
    case DICT1:
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE;
      z->adler = z->state->sub.check.need;
      z->state->mode = DICT0;
      return Z_NEED_DICT;
 444:	b8 02 00 00 00       	mov    $0x2,%eax
      return Z_STREAM_ERROR;
  }
#ifdef NEED_DUMMY_RETURN
  return Z_STREAM_ERROR;  /* Some dumb compilers complain without this */
#endif
}
 449:	5b                   	pop    %ebx
 44a:	5e                   	pop    %esi
 44b:	5f                   	pop    %edi
 44c:	5d                   	pop    %ebp
 44d:	c3                   	ret    
 44e:	66 90                	xchg   %ax,%ax
 450:	8b 53 04             	mov    0x4(%ebx),%edx

  if (z == Z_NULL || z->state == Z_NULL || z->next_in == Z_NULL)
    return Z_STREAM_ERROR;
  f = f == Z_FINISH ? Z_BUF_ERROR : Z_OK;
  r = Z_BUF_ERROR;
  while (1) switch (z->state->mode)
 453:	89 c6                	mov    %eax,%esi
 455:	eb b6                	jmp    40d <_inflate+0x1bd>
 457:	8b 53 04             	mov    0x4(%ebx),%edx
 45a:	e9 c1 fe ff ff       	jmp    320 <_inflate+0xd0>
 45f:	90                   	nop
      z->state->sub.check.need += (uLong)NEXTBYTE;
      z->adler = z->state->sub.check.need;
      z->state->mode = DICT0;
      return Z_NEED_DICT;
    case DICT0:
      z->state->mode = BAD;
 460:	c7 01 0d 00 00 00    	movl   $0xd,(%ecx)
      z->msg = (char*)"need dictionary";
 466:	c7 43 18 46 00 00 00 	movl   $0x46,0x18(%ebx)
      z->state->sub.marker = 0;       /* can try inflateSync */
 46d:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
      return Z_STREAM_ERROR;
  }
#ifdef NEED_DUMMY_RETURN
  return Z_STREAM_ERROR;  /* Some dumb compilers complain without this */
#endif
}
 474:	83 c4 2c             	add    $0x2c,%esp
      return Z_NEED_DICT;
    case DICT0:
      z->state->mode = BAD;
      z->msg = (char*)"need dictionary";
      z->state->sub.marker = 0;       /* can try inflateSync */
      return Z_STREAM_ERROR;
 477:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
      return Z_STREAM_ERROR;
  }
#ifdef NEED_DUMMY_RETURN
  return Z_STREAM_ERROR;  /* Some dumb compilers complain without this */
#endif
}
 47c:	5b                   	pop    %ebx
 47d:	5e                   	pop    %esi
 47e:	5f                   	pop    %edi
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    
      z->state->mode = BAD;
      z->msg = (char*)"need dictionary";
      z->state->sub.marker = 0;       /* can try inflateSync */
      return Z_STREAM_ERROR;
    case BLOCKS:
      r = inflate_blocks(z->state->blocks, z, r);
 481:	89 44 24 08          	mov    %eax,0x8(%esp)
 485:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 489:	8b 41 14             	mov    0x14(%ecx),%eax
 48c:	89 04 24             	mov    %eax,(%esp)
 48f:	e8 00 00 00 00       	call   494 <_inflate+0x244>
      if (r == Z_DATA_ERROR)
 494:	83 f8 fd             	cmp    $0xfffffffd,%eax
 497:	0f 84 c3 01 00 00    	je     660 <_inflate+0x410>
      {
        z->state->mode = BAD;
        z->state->sub.marker = 0;       /* can try inflateSync */
        break;
      }
      if (r == Z_OK)
 49d:	85 c0                	test   %eax,%eax
 49f:	0f 84 82 01 00 00    	je     627 <_inflate+0x3d7>
        r = f;
      if (r != Z_STREAM_END)
 4a5:	83 f8 01             	cmp    $0x1,%eax
 4a8:	0f 85 77 01 00 00    	jne    625 <_inflate+0x3d5>
        return r;
      r = f;
      inflate_blocks_reset(z->state->blocks, z, &z->state->sub.check.was);
 4ae:	8b 43 1c             	mov    0x1c(%ebx),%eax
 4b1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4b5:	8d 50 04             	lea    0x4(%eax),%edx
 4b8:	89 54 24 08          	mov    %edx,0x8(%esp)
 4bc:	8b 40 14             	mov    0x14(%eax),%eax
 4bf:	89 04 24             	mov    %eax,(%esp)
 4c2:	e8 00 00 00 00       	call   4c7 <_inflate+0x277>
      if (z->state->nowrap)
 4c7:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
 4ca:	8b 41 0c             	mov    0xc(%ecx),%eax
 4cd:	85 c0                	test   %eax,%eax
 4cf:	0f 84 cf fd ff ff    	je     2a4 <_inflate+0x54>
      {
        z->state->mode = DONE;
 4d5:	c7 01 0c 00 00 00    	movl   $0xc,(%ecx)
      }
      if (r == Z_OK)
        r = f;
      if (r != Z_STREAM_END)
        return r;
      r = f;
 4db:	89 f0                	mov    %esi,%eax
      inflate_blocks_reset(z->state->blocks, z, &z->state->sub.check.was);
      if (z->state->nowrap)
      {
        z->state->mode = DONE;
        break;
 4dd:	ba 0c 00 00 00       	mov    $0xc,%edx
 4e2:	e9 b6 fd ff ff       	jmp    29d <_inflate+0x4d>
  f = f == Z_FINISH ? Z_BUF_ERROR : Z_OK;
  r = Z_BUF_ERROR;
  while (1) switch (z->state->mode)
  {
    case METHOD:
      NEEDBYTE
 4e7:	8b 53 04             	mov    0x4(%ebx),%edx
 4ea:	85 d2                	test   %edx,%edx
 4ec:	0f 84 c3 fe ff ff    	je     3b5 <_inflate+0x165>
      if (((z->state->sub.method = NEXTBYTE) & 0xf) != Z_DEFLATED)
 4f2:	8b 43 08             	mov    0x8(%ebx),%eax
 4f5:	4a                   	dec    %edx
 4f6:	40                   	inc    %eax
 4f7:	89 53 04             	mov    %edx,0x4(%ebx)
 4fa:	89 43 08             	mov    %eax,0x8(%ebx)
 4fd:	8b 03                	mov    (%ebx),%eax
 4ff:	8d 68 01             	lea    0x1(%eax),%ebp
 502:	89 2b                	mov    %ebp,(%ebx)
 504:	8a 00                	mov    (%eax),%al
 506:	89 c5                	mov    %eax,%ebp
 508:	83 e0 0f             	and    $0xf,%eax
 50b:	81 e5 ff 00 00 00    	and    $0xff,%ebp
 511:	3c 08                	cmp    $0x8,%al
 513:	89 69 04             	mov    %ebp,0x4(%ecx)
 516:	0f 84 64 01 00 00    	je     680 <_inflate+0x430>
      {
        z->state->mode = BAD;
 51c:	c7 01 0d 00 00 00    	movl   $0xd,(%ecx)
  f = f == Z_FINISH ? Z_BUF_ERROR : Z_OK;
  r = Z_BUF_ERROR;
  while (1) switch (z->state->mode)
  {
    case METHOD:
      NEEDBYTE
 522:	89 f0                	mov    %esi,%eax
      if (((z->state->sub.method = NEXTBYTE) & 0xf) != Z_DEFLATED)
      {
        z->state->mode = BAD;
        z->msg = (char*)"unknown compression method";
 524:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
        z->state->sub.marker = 5;       /* can't try inflateSync */
        break;
 52b:	ba 0d 00 00 00       	mov    $0xd,%edx
      NEEDBYTE
      if (((z->state->sub.method = NEXTBYTE) & 0xf) != Z_DEFLATED)
      {
        z->state->mode = BAD;
        z->msg = (char*)"unknown compression method";
        z->state->sub.marker = 5;       /* can't try inflateSync */
 530:	c7 41 04 05 00 00 00 	movl   $0x5,0x4(%ecx)
        break;
 537:	e9 61 fd ff ff       	jmp    29d <_inflate+0x4d>
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 540:	8b 53 04             	mov    0x4(%ebx),%edx
        z->state->sub.marker = 5;       /* can't try inflateSync */
        break;
      }
      z->state->mode = FLAG;
    case FLAG:
      NEEDBYTE
 543:	85 d2                	test   %edx,%edx
 545:	0f 84 6a fe ff ff    	je     3b5 <_inflate+0x165>
      b = NEXTBYTE;
 54b:	8b 43 08             	mov    0x8(%ebx),%eax
 54e:	8d 6a ff             	lea    -0x1(%edx),%ebp
 551:	40                   	inc    %eax
 552:	89 6b 04             	mov    %ebp,0x4(%ebx)
 555:	89 43 08             	mov    %eax,0x8(%ebx)
 558:	8b 03                	mov    (%ebx),%eax
 55a:	8d 50 01             	lea    0x1(%eax),%edx
 55d:	89 13                	mov    %edx,(%ebx)
 55f:	31 d2                	xor    %edx,%edx
 561:	8a 00                	mov    (%eax),%al
 563:	88 c2                	mov    %al,%dl
 565:	88 44 24 1f          	mov    %al,0x1f(%esp)
      if (((z->state->sub.method << 8) + b) % 31)
 569:	8b 41 04             	mov    0x4(%ecx),%eax
 56c:	c1 e0 08             	shl    $0x8,%eax
 56f:	01 d0                	add    %edx,%eax
 571:	31 d2                	xor    %edx,%edx
 573:	f7 f7                	div    %edi
 575:	85 d2                	test   %edx,%edx
 577:	0f 84 c3 00 00 00    	je     640 <_inflate+0x3f0>
      {
        z->state->mode = BAD;
 57d:	c7 01 0d 00 00 00    	movl   $0xd,(%ecx)
        z->state->sub.marker = 5;       /* can't try inflateSync */
        break;
      }
      z->state->mode = FLAG;
    case FLAG:
      NEEDBYTE
 583:	89 f0                	mov    %esi,%eax
      b = NEXTBYTE;
      if (((z->state->sub.method << 8) + b) % 31)
      {
        z->state->mode = BAD;
        z->msg = (char*)"incorrect header check";
 585:	c7 43 18 2f 00 00 00 	movl   $0x2f,0x18(%ebx)
        z->state->sub.marker = 5;       /* can't try inflateSync */
        break;
 58c:	ba 0d 00 00 00       	mov    $0xd,%edx
      b = NEXTBYTE;
      if (((z->state->sub.method << 8) + b) % 31)
      {
        z->state->mode = BAD;
        z->msg = (char*)"incorrect header check";
        z->state->sub.marker = 5;       /* can't try inflateSync */
 591:	c7 41 04 05 00 00 00 	movl   $0x5,0x4(%ecx)
        break;
 598:	e9 00 fd ff ff       	jmp    29d <_inflate+0x4d>
 59d:	8d 76 00             	lea    0x0(%esi),%esi
 5a0:	8b 53 04             	mov    0x4(%ebx),%edx
 5a3:	e9 b3 fd ff ff       	jmp    35b <_inflate+0x10b>
 5a8:	8b 6b 04             	mov    0x4(%ebx),%ebp
        z->state->mode = BLOCKS;
        break;
      }
      z->state->mode = DICT4;
    case DICT4:
      NEEDBYTE
 5ab:	85 ed                	test   %ebp,%ebp
 5ad:	0f 84 02 fe ff ff    	je     3b5 <_inflate+0x165>
      z->state->sub.check.need = (uLong)NEXTBYTE << 24;
 5b3:	8b 03                	mov    (%ebx),%eax
 5b5:	8d 55 ff             	lea    -0x1(%ebp),%edx
 5b8:	8b 6b 08             	mov    0x8(%ebx),%ebp
 5bb:	89 53 04             	mov    %edx,0x4(%ebx)
 5be:	8d 78 01             	lea    0x1(%eax),%edi
 5c1:	45                   	inc    %ebp
 5c2:	89 6b 08             	mov    %ebp,0x8(%ebx)
 5c5:	89 3b                	mov    %edi,(%ebx)
 5c7:	0f b6 38             	movzbl (%eax),%edi
 5ca:	81 e7 ff 00 00 00    	and    $0xff,%edi
      z->state->mode = DICT3;
 5d0:	c7 01 03 00 00 00    	movl   $0x3,(%ecx)
        break;
      }
      z->state->mode = DICT4;
    case DICT4:
      NEEDBYTE
      z->state->sub.check.need = (uLong)NEXTBYTE << 24;
 5d6:	89 f8                	mov    %edi,%eax
 5d8:	c1 e0 18             	shl    $0x18,%eax
 5db:	89 41 08             	mov    %eax,0x8(%ecx)
        z->state->mode = BLOCKS;
        break;
      }
      z->state->mode = DICT4;
    case DICT4:
      NEEDBYTE
 5de:	89 f0                	mov    %esi,%eax
      z->state->sub.check.need = (uLong)NEXTBYTE << 24;
      z->state->mode = DICT3;
    case DICT3:
      NEEDBYTE
 5e0:	85 d2                	test   %edx,%edx
 5e2:	0f 84 cd fd ff ff    	je     3b5 <_inflate+0x165>
      z->state->sub.check.need += (uLong)NEXTBYTE << 16;
 5e8:	8b 03                	mov    (%ebx),%eax
 5ea:	8b 6b 08             	mov    0x8(%ebx),%ebp
 5ed:	4a                   	dec    %edx
 5ee:	45                   	inc    %ebp
 5ef:	8d 78 01             	lea    0x1(%eax),%edi
 5f2:	89 53 04             	mov    %edx,0x4(%ebx)
 5f5:	89 6b 08             	mov    %ebp,0x8(%ebx)
 5f8:	89 3b                	mov    %edi,(%ebx)
 5fa:	0f b6 38             	movzbl (%eax),%edi
 5fd:	81 e7 ff 00 00 00    	and    $0xff,%edi
      z->state->mode = DICT2;
 603:	c7 01 04 00 00 00    	movl   $0x4,(%ecx)
      NEEDBYTE
      z->state->sub.check.need = (uLong)NEXTBYTE << 24;
      z->state->mode = DICT3;
    case DICT3:
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE << 16;
 609:	89 f8                	mov    %edi,%eax
 60b:	8b 79 08             	mov    0x8(%ecx),%edi
 60e:	c1 e0 10             	shl    $0x10,%eax
 611:	01 c7                	add    %eax,%edi
    case DICT4:
      NEEDBYTE
      z->state->sub.check.need = (uLong)NEXTBYTE << 24;
      z->state->mode = DICT3;
    case DICT3:
      NEEDBYTE
 613:	89 f0                	mov    %esi,%eax
      z->state->sub.check.need += (uLong)NEXTBYTE << 16;
 615:	89 79 08             	mov    %edi,0x8(%ecx)
 618:	e9 be fd ff ff       	jmp    3db <_inflate+0x18b>
 61d:	8d 76 00             	lea    0x0(%esi),%esi
 620:	8b 53 04             	mov    0x4(%ebx),%edx
 623:	eb bb                	jmp    5e0 <_inflate+0x390>
 625:	89 c6                	mov    %eax,%esi
    case DICT2:
      NEEDBYTE
      z->state->sub.check.need += (uLong)NEXTBYTE << 8;
      z->state->mode = DICT1;
    case DICT1:
      NEEDBYTE
 627:	89 f0                	mov    %esi,%eax
 629:	e9 87 fd ff ff       	jmp    3b5 <_inflate+0x165>
 62e:	66 90                	xchg   %ax,%ax
      return Z_STREAM_ERROR;
  }
#ifdef NEED_DUMMY_RETURN
  return Z_STREAM_ERROR;  /* Some dumb compilers complain without this */
#endif
}
 630:	83 c4 2c             	add    $0x2c,%esp
{
  int r;
  uInt b;

  if (z == Z_NULL || z->state == Z_NULL || z->next_in == Z_NULL)
    return Z_STREAM_ERROR;
 633:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
      return Z_STREAM_ERROR;
  }
#ifdef NEED_DUMMY_RETURN
  return Z_STREAM_ERROR;  /* Some dumb compilers complain without this */
#endif
}
 638:	5b                   	pop    %ebx
 639:	5e                   	pop    %esi
 63a:	5f                   	pop    %edi
 63b:	5d                   	pop    %ebp
 63c:	c3                   	ret    
 63d:	8d 76 00             	lea    0x0(%esi),%esi
        z->msg = (char*)"incorrect header check";
        z->state->sub.marker = 5;       /* can't try inflateSync */
        break;
      }
      Tracev((stderr, "inflate: zlib header ok\n"));
      if (!(b & PRESET_DICT))
 640:	f6 44 24 1f 20       	testb  $0x20,0x1f(%esp)
 645:	75 71                	jne    6b8 <_inflate+0x468>
      {
        z->state->mode = BLOCKS;
 647:	c7 01 07 00 00 00    	movl   $0x7,(%ecx)
        z->state->sub.marker = 5;       /* can't try inflateSync */
        break;
      }
      z->state->mode = FLAG;
    case FLAG:
      NEEDBYTE
 64d:	89 f0                	mov    %esi,%eax
      }
      Tracev((stderr, "inflate: zlib header ok\n"));
      if (!(b & PRESET_DICT))
      {
        z->state->mode = BLOCKS;
        break;
 64f:	ba 07 00 00 00       	mov    $0x7,%edx
 654:	e9 44 fc ff ff       	jmp    29d <_inflate+0x4d>
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return Z_STREAM_ERROR;
    case BLOCKS:
      r = inflate_blocks(z->state->blocks, z, r);
      if (r == Z_DATA_ERROR)
      {
        z->state->mode = BAD;
 660:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
        z->state->sub.marker = 0;       /* can try inflateSync */
        break;
 663:	ba 0d 00 00 00       	mov    $0xd,%edx
      return Z_STREAM_ERROR;
    case BLOCKS:
      r = inflate_blocks(z->state->blocks, z, r);
      if (r == Z_DATA_ERROR)
      {
        z->state->mode = BAD;
 668:	c7 01 0d 00 00 00    	movl   $0xd,(%ecx)
        z->state->sub.marker = 0;       /* can try inflateSync */
 66e:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
        break;
 675:	e9 23 fc ff ff       	jmp    29d <_inflate+0x4d>
 67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        z->state->mode = BAD;
        z->msg = (char*)"unknown compression method";
        z->state->sub.marker = 5;       /* can't try inflateSync */
        break;
      }
      if ((z->state->sub.method >> 4) + 8 > z->state->wbits)
 680:	c1 ed 04             	shr    $0x4,%ebp
 683:	83 c5 08             	add    $0x8,%ebp
 686:	3b 69 10             	cmp    0x10(%ecx),%ebp
 689:	76 20                	jbe    6ab <_inflate+0x45b>
      {
        z->state->mode = BAD;
 68b:	c7 01 0d 00 00 00    	movl   $0xd,(%ecx)
  f = f == Z_FINISH ? Z_BUF_ERROR : Z_OK;
  r = Z_BUF_ERROR;
  while (1) switch (z->state->mode)
  {
    case METHOD:
      NEEDBYTE
 691:	89 f0                	mov    %esi,%eax
        break;
      }
      if ((z->state->sub.method >> 4) + 8 > z->state->wbits)
      {
        z->state->mode = BAD;
        z->msg = (char*)"invalid window size";
 693:	c7 43 18 1b 00 00 00 	movl   $0x1b,0x18(%ebx)
        z->state->sub.marker = 5;       /* can't try inflateSync */
        break;
 69a:	ba 0d 00 00 00       	mov    $0xd,%edx
      }
      if ((z->state->sub.method >> 4) + 8 > z->state->wbits)
      {
        z->state->mode = BAD;
        z->msg = (char*)"invalid window size";
        z->state->sub.marker = 5;       /* can't try inflateSync */
 69f:	c7 41 04 05 00 00 00 	movl   $0x5,0x4(%ecx)
        break;
 6a6:	e9 f2 fb ff ff       	jmp    29d <_inflate+0x4d>
      }
      z->state->mode = FLAG;
 6ab:	c7 01 01 00 00 00    	movl   $0x1,(%ecx)
  f = f == Z_FINISH ? Z_BUF_ERROR : Z_OK;
  r = Z_BUF_ERROR;
  while (1) switch (z->state->mode)
  {
    case METHOD:
      NEEDBYTE
 6b1:	89 f0                	mov    %esi,%eax
 6b3:	e9 8b fe ff ff       	jmp    543 <_inflate+0x2f3>
      if (!(b & PRESET_DICT))
      {
        z->state->mode = BLOCKS;
        break;
      }
      z->state->mode = DICT4;
 6b8:	c7 01 02 00 00 00    	movl   $0x2,(%ecx)
        z->state->sub.marker = 5;       /* can't try inflateSync */
        break;
      }
      z->state->mode = FLAG;
    case FLAG:
      NEEDBYTE
 6be:	89 f0                	mov    %esi,%eax
 6c0:	e9 e6 fe ff ff       	jmp    5ab <_inflate+0x35b>
 6c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006d0 <_inflateSetDictionary>:

int ZEXPORT inflateSetDictionary(z, dictionary, dictLength)
z_streamp z;
const Bytef *dictionary;
uInt  dictLength;
{
 6d0:	57                   	push   %edi
 6d1:	56                   	push   %esi
 6d2:	53                   	push   %ebx
 6d3:	83 ec 10             	sub    $0x10,%esp
 6d6:	8b 5c 24 20          	mov    0x20(%esp),%ebx
 6da:	8b 7c 24 24          	mov    0x24(%esp),%edi
 6de:	8b 74 24 28          	mov    0x28(%esp),%esi
  uInt length = dictLength;

  if (z == Z_NULL || z->state == Z_NULL || z->state->mode != DICT0)
 6e2:	85 db                	test   %ebx,%ebx
 6e4:	74 6b                	je     751 <_inflateSetDictionary+0x81>
 6e6:	8b 43 1c             	mov    0x1c(%ebx),%eax
 6e9:	85 c0                	test   %eax,%eax
 6eb:	74 64                	je     751 <_inflateSetDictionary+0x81>
 6ed:	83 38 06             	cmpl   $0x6,(%eax)
 6f0:	75 5f                	jne    751 <_inflateSetDictionary+0x81>
    return Z_STREAM_ERROR;

  if (adler32(1L, dictionary, dictLength) != z->adler) return Z_DATA_ERROR;
 6f2:	89 74 24 08          	mov    %esi,0x8(%esp)
 6f6:	89 7c 24 04          	mov    %edi,0x4(%esp)
 6fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 701:	e8 00 00 00 00       	call   706 <_inflateSetDictionary+0x36>
 706:	3b 43 30             	cmp    0x30(%ebx),%eax
 709:	75 55                	jne    760 <_inflateSetDictionary+0x90>
  z->adler = 1L;

  if (length >= ((uInt)1<<z->state->wbits))
 70b:	8b 53 1c             	mov    0x1c(%ebx),%edx
 70e:	b8 01 00 00 00       	mov    $0x1,%eax

  if (z == Z_NULL || z->state == Z_NULL || z->state->mode != DICT0)
    return Z_STREAM_ERROR;

  if (adler32(1L, dictionary, dictLength) != z->adler) return Z_DATA_ERROR;
  z->adler = 1L;
 713:	c7 43 30 01 00 00 00 	movl   $0x1,0x30(%ebx)

  if (length >= ((uInt)1<<z->state->wbits))
 71a:	8b 4a 10             	mov    0x10(%edx),%ecx
 71d:	d3 e0                	shl    %cl,%eax
 71f:	39 c6                	cmp    %eax,%esi
 721:	73 25                	jae    748 <_inflateSetDictionary+0x78>
  {
    length = (1<<z->state->wbits)-1;
    dictionary += dictLength - length;
  }
  inflate_set_dictionary(z->state->blocks, dictionary, length);
 723:	89 74 24 08          	mov    %esi,0x8(%esp)
 727:	89 7c 24 04          	mov    %edi,0x4(%esp)
 72b:	8b 42 14             	mov    0x14(%edx),%eax
 72e:	89 04 24             	mov    %eax,(%esp)
 731:	e8 00 00 00 00       	call   736 <_inflateSetDictionary+0x66>
  z->state->mode = BLOCKS;
 736:	8b 43 1c             	mov    0x1c(%ebx),%eax
 739:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
  return Z_OK;
 73f:	31 c0                	xor    %eax,%eax
}
 741:	83 c4 10             	add    $0x10,%esp
 744:	5b                   	pop    %ebx
 745:	5e                   	pop    %esi
 746:	5f                   	pop    %edi
 747:	c3                   	ret    
  if (adler32(1L, dictionary, dictLength) != z->adler) return Z_DATA_ERROR;
  z->adler = 1L;

  if (length >= ((uInt)1<<z->state->wbits))
  {
    length = (1<<z->state->wbits)-1;
 748:	48                   	dec    %eax
    dictionary += dictLength - length;
 749:	29 c6                	sub    %eax,%esi
 74b:	01 f7                	add    %esi,%edi
  if (adler32(1L, dictionary, dictLength) != z->adler) return Z_DATA_ERROR;
  z->adler = 1L;

  if (length >= ((uInt)1<<z->state->wbits))
  {
    length = (1<<z->state->wbits)-1;
 74d:	89 c6                	mov    %eax,%esi
 74f:	eb d2                	jmp    723 <_inflateSetDictionary+0x53>
    dictionary += dictLength - length;
  }
  inflate_set_dictionary(z->state->blocks, dictionary, length);
  z->state->mode = BLOCKS;
  return Z_OK;
}
 751:	83 c4 10             	add    $0x10,%esp
uInt  dictLength;
{
  uInt length = dictLength;

  if (z == Z_NULL || z->state == Z_NULL || z->state->mode != DICT0)
    return Z_STREAM_ERROR;
 754:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    dictionary += dictLength - length;
  }
  inflate_set_dictionary(z->state->blocks, dictionary, length);
  z->state->mode = BLOCKS;
  return Z_OK;
}
 759:	5b                   	pop    %ebx
 75a:	5e                   	pop    %esi
 75b:	5f                   	pop    %edi
 75c:	c3                   	ret    
 75d:	8d 76 00             	lea    0x0(%esi),%esi
  uInt length = dictLength;

  if (z == Z_NULL || z->state == Z_NULL || z->state->mode != DICT0)
    return Z_STREAM_ERROR;

  if (adler32(1L, dictionary, dictLength) != z->adler) return Z_DATA_ERROR;
 760:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 765:	eb da                	jmp    741 <_inflateSetDictionary+0x71>
 767:	89 f6                	mov    %esi,%esi
 769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000770 <_inflateSync>:
}


int ZEXPORT inflateSync(z)
z_streamp z;
{
 770:	55                   	push   %ebp
 771:	57                   	push   %edi
 772:	56                   	push   %esi
 773:	53                   	push   %ebx
 774:	83 ec 2c             	sub    $0x2c,%esp
 777:	8b 74 24 40          	mov    0x40(%esp),%esi
  Bytef *p;     /* pointer to bytes */
  uInt m;       /* number of marker bytes found in a row */
  uLong r, w;   /* temporaries to save total_in and total_out */

  /* set up */
  if (z == Z_NULL || z->state == Z_NULL)
 77b:	85 f6                	test   %esi,%esi
 77d:	0f 84 f9 00 00 00    	je     87c <_inflateSync+0x10c>
 783:	8b 7e 1c             	mov    0x1c(%esi),%edi
 786:	85 ff                	test   %edi,%edi
 788:	0f 84 ee 00 00 00    	je     87c <_inflateSync+0x10c>
    return Z_STREAM_ERROR;
  if (z->state->mode != BAD)
 78e:	83 3f 0d             	cmpl   $0xd,(%edi)
 791:	74 22                	je     7b5 <_inflateSync+0x45>
  {
    z->state->mode = BAD;
    z->state->sub.marker = 0;
 793:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
  /* set up */
  if (z == Z_NULL || z->state == Z_NULL)
    return Z_STREAM_ERROR;
  if (z->state->mode != BAD)
  {
    z->state->mode = BAD;
 79a:	c7 07 0d 00 00 00    	movl   $0xd,(%edi)
    z->state->sub.marker = 0;
  }
  if ((n = z->avail_in) == 0)
 7a0:	8b 56 04             	mov    0x4(%esi),%edx
 7a3:	85 d2                	test   %edx,%edx
 7a5:	0f 84 ca 00 00 00    	je     875 <_inflateSync+0x105>
    return Z_BUF_ERROR;
  p = z->next_in;
 7ab:	8b 06                	mov    (%esi),%eax
 7ad:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  m = z->state->sub.marker;
 7b1:	31 c0                	xor    %eax,%eax
 7b3:	eb 1d                	jmp    7d2 <_inflateSync+0x62>
  if (z->state->mode != BAD)
  {
    z->state->mode = BAD;
    z->state->sub.marker = 0;
  }
  if ((n = z->avail_in) == 0)
 7b5:	8b 56 04             	mov    0x4(%esi),%edx
 7b8:	85 d2                	test   %edx,%edx
 7ba:	0f 84 b5 00 00 00    	je     875 <_inflateSync+0x105>
    return Z_BUF_ERROR;
  p = z->next_in;
 7c0:	8b 06                	mov    (%esi),%eax
 7c2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  m = z->state->sub.marker;
 7c6:	8b 47 04             	mov    0x4(%edi),%eax

  /* search */
  while (n && m < 4)
 7c9:	83 f8 03             	cmp    $0x3,%eax
 7cc:	0f 87 9b 00 00 00    	ja     86d <_inflateSync+0xfd>
}


int ZEXPORT inflateSync(z)
z_streamp z;
{
 7d2:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    if (*p == mark[m])
      m++;
    else if (*p)
      m = 0;
    else
      m = 4 - m;
 7d6:	bd 04 00 00 00       	mov    $0x4,%ebp
 7db:	eb 19                	jmp    7f6 <_inflateSync+0x86>
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
 7e0:	89 eb                	mov    %ebp,%ebx
 7e2:	29 c3                	sub    %eax,%ebx
 7e4:	89 d8                	mov    %ebx,%eax
 7e6:	83 fb 03             	cmp    $0x3,%ebx
 7e9:	0f 96 c3             	setbe  %bl
    p++, n--;
 7ec:	41                   	inc    %ecx
 7ed:	4a                   	dec    %edx
    return Z_BUF_ERROR;
  p = z->next_in;
  m = z->state->sub.marker;

  /* search */
  while (n && m < 4)
 7ee:	84 db                	test   %bl,%bl
 7f0:	74 1e                	je     810 <_inflateSync+0xa0>
 7f2:	85 d2                	test   %edx,%edx
 7f4:	74 1a                	je     810 <_inflateSync+0xa0>
  {
    static const Byte mark[4] = {0, 0, 0xff, 0xff};
    if (*p == mark[m])
 7f6:	8a 19                	mov    (%ecx),%bl
 7f8:	3a 98 a4 00 00 00    	cmp    0xa4(%eax),%bl
 7fe:	74 51                	je     851 <_inflateSync+0xe1>
      m++;
    else if (*p)
 800:	84 db                	test   %bl,%bl
 802:	74 dc                	je     7e0 <_inflateSync+0x70>
 804:	b3 01                	mov    $0x1,%bl
      m = 0;
 806:	31 c0                	xor    %eax,%eax
    else
      m = 4 - m;
    p++, n--;
 808:	41                   	inc    %ecx
 809:	4a                   	dec    %edx
    return Z_BUF_ERROR;
  p = z->next_in;
  m = z->state->sub.marker;

  /* search */
  while (n && m < 4)
 80a:	84 db                	test   %bl,%bl
 80c:	75 e4                	jne    7f2 <_inflateSync+0x82>
 80e:	66 90                	xchg   %ax,%ax
 810:	89 cb                	mov    %ecx,%ebx
 812:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
 816:	29 eb                	sub    %ebp,%ebx
      m = 4 - m;
    p++, n--;
  }

  /* restore */
  z->total_in += p - z->next_in;
 818:	8b 6e 08             	mov    0x8(%esi),%ebp
  z->next_in = p;
 81b:	89 0e                	mov    %ecx,(%esi)
      m = 4 - m;
    p++, n--;
  }

  /* restore */
  z->total_in += p - z->next_in;
 81d:	01 eb                	add    %ebp,%ebx
  z->next_in = p;
  z->avail_in = n;
 81f:	89 56 04             	mov    %edx,0x4(%esi)
      m = 4 - m;
    p++, n--;
  }

  /* restore */
  z->total_in += p - z->next_in;
 822:	89 5e 08             	mov    %ebx,0x8(%esi)
  z->next_in = p;
  z->avail_in = n;
  z->state->sub.marker = m;

  /* return no joy or set up to restart on a new block */
  if (m != 4)
 825:	83 f8 04             	cmp    $0x4,%eax

  /* restore */
  z->total_in += p - z->next_in;
  z->next_in = p;
  z->avail_in = n;
  z->state->sub.marker = m;
 828:	89 47 04             	mov    %eax,0x4(%edi)

  /* return no joy or set up to restart on a new block */
  if (m != 4)
 82b:	75 33                	jne    860 <_inflateSync+0xf0>
    return Z_DATA_ERROR;
  r = z->total_in;  w = z->total_out;
 82d:	8b 7e 14             	mov    0x14(%esi),%edi
  inflateReset(z);
 830:	89 34 24             	mov    %esi,(%esp)
 833:	e8 c8 f7 ff ff       	call   0 <_inflateReset>
  z->total_in = r;  z->total_out = w;
  z->state->mode = BLOCKS;
 838:	8b 46 1c             	mov    0x1c(%esi),%eax
  /* return no joy or set up to restart on a new block */
  if (m != 4)
    return Z_DATA_ERROR;
  r = z->total_in;  w = z->total_out;
  inflateReset(z);
  z->total_in = r;  z->total_out = w;
 83b:	89 5e 08             	mov    %ebx,0x8(%esi)
 83e:	89 7e 14             	mov    %edi,0x14(%esi)
  z->state->mode = BLOCKS;
 841:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
  return Z_OK;
 847:	31 c0                	xor    %eax,%eax
}
 849:	83 c4 2c             	add    $0x2c,%esp
 84c:	5b                   	pop    %ebx
 84d:	5e                   	pop    %esi
 84e:	5f                   	pop    %edi
 84f:	5d                   	pop    %ebp
 850:	c3                   	ret    
  /* search */
  while (n && m < 4)
  {
    static const Byte mark[4] = {0, 0, 0xff, 0xff};
    if (*p == mark[m])
      m++;
 851:	40                   	inc    %eax
 852:	83 f8 03             	cmp    $0x3,%eax
 855:	0f 96 c3             	setbe  %bl
 858:	eb 92                	jmp    7ec <_inflateSync+0x7c>
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  r = z->total_in;  w = z->total_out;
  inflateReset(z);
  z->total_in = r;  z->total_out = w;
  z->state->mode = BLOCKS;
  return Z_OK;
}
 860:	83 c4 2c             	add    $0x2c,%esp
  z->avail_in = n;
  z->state->sub.marker = m;

  /* return no joy or set up to restart on a new block */
  if (m != 4)
    return Z_DATA_ERROR;
 863:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  r = z->total_in;  w = z->total_out;
  inflateReset(z);
  z->total_in = r;  z->total_out = w;
  z->state->mode = BLOCKS;
  return Z_OK;
}
 868:	5b                   	pop    %ebx
 869:	5e                   	pop    %esi
 86a:	5f                   	pop    %edi
 86b:	5d                   	pop    %ebp
 86c:	c3                   	ret    
    z->state->mode = BAD;
    z->state->sub.marker = 0;
  }
  if ((n = z->avail_in) == 0)
    return Z_BUF_ERROR;
  p = z->next_in;
 86d:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  m = z->state->sub.marker;

  /* search */
  while (n && m < 4)
 871:	31 db                	xor    %ebx,%ebx
 873:	eb a3                	jmp    818 <_inflateSync+0xa8>
  {
    z->state->mode = BAD;
    z->state->sub.marker = 0;
  }
  if ((n = z->avail_in) == 0)
    return Z_BUF_ERROR;
 875:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
 87a:	eb cd                	jmp    849 <_inflateSync+0xd9>
  uInt m;       /* number of marker bytes found in a row */
  uLong r, w;   /* temporaries to save total_in and total_out */

  /* set up */
  if (z == Z_NULL || z->state == Z_NULL)
    return Z_STREAM_ERROR;
 87c:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
 881:	eb c6                	jmp    849 <_inflateSync+0xd9>
 883:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000890 <_inflateSyncPoint>:
 * decompressing, PPP checks that at the end of input packet, inflate is
 * waiting for these length bytes.
 */
int ZEXPORT inflateSyncPoint(z)
z_streamp z;
{
 890:	8b 44 24 04          	mov    0x4(%esp),%eax
  if (z == Z_NULL || z->state == Z_NULL || z->state->blocks == Z_NULL)
 894:	85 c0                	test   %eax,%eax
 896:	74 18                	je     8b0 <_inflateSyncPoint+0x20>
 898:	8b 40 1c             	mov    0x1c(%eax),%eax
 89b:	85 c0                	test   %eax,%eax
 89d:	74 11                	je     8b0 <_inflateSyncPoint+0x20>
 89f:	8b 40 14             	mov    0x14(%eax),%eax
 8a2:	85 c0                	test   %eax,%eax
 8a4:	74 0a                	je     8b0 <_inflateSyncPoint+0x20>
    return Z_STREAM_ERROR;
  return inflate_blocks_sync_point(z->state->blocks);
 8a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8aa:	e9 00 00 00 00       	jmp    8af <_inflateSyncPoint+0x1f>
 8af:	90                   	nop
}
 8b0:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
 8b5:	c3                   	ret    
 8b6:	90                   	nop
 8b7:	90                   	nop
 8b8:	90                   	nop
 8b9:	90                   	nop
 8ba:	90                   	nop
 8bb:	90                   	nop
 8bc:	90                   	nop
 8bd:	90                   	nop
 8be:	90                   	nop
 8bf:	90                   	nop

inftrees.o:     file format pe-i386


Disassembly of section .text:

00000000 <_huft_build>:
/* Given a list of code lengths and a maximum table size, make a set of
   tables to decode that set of codes.  Return Z_OK on success, Z_BUF_ERROR
   if the given code set is incomplete (the tables are still built in this
   case), Z_DATA_ERROR if the input is invalid (an over-subscribed set of
   lengths), or Z_MEM_ERROR if not enough memory. */
{
   0:	55                   	push   %ebp
   1:	57                   	push   %edi
   2:	56                   	push   %esi
   3:	53                   	push   %ebx
   4:	81 ec 10 01 00 00    	sub    $0x110,%esp
   a:	89 d7                	mov    %edx,%edi
   c:	89 c6                	mov    %eax,%esi
  p = c;
#define C0 *p++ = 0;
#define C2 C0 C0 C0 C0
#define C4 C2 C2 C2 C2
  C4                            /* clear c[]--assume BMAX+1 is 16 */
  p = b;  i = n;
   e:	89 c2                	mov    %eax,%edx
/* Given a list of code lengths and a maximum table size, make a set of
   tables to decode that set of codes.  Return Z_OK on success, Z_BUF_ERROR
   if the given code set is incomplete (the tables are still built in this
   case), Z_DATA_ERROR if the input is invalid (an over-subscribed set of
   lengths), or Z_MEM_ERROR if not enough memory. */
{
  10:	89 4c 24 3c          	mov    %ecx,0x3c(%esp)
  14:	8b ac 24 30 01 00 00 	mov    0x130(%esp),%ebp
  /* Generate counts for each bit length */
  p = c;
#define C0 *p++ = 0;
#define C2 C0 C0 C0 C0
#define C4 C2 C2 C2 C2
  C4                            /* clear c[]--assume BMAX+1 is 16 */
  1b:	c7 84 24 90 00 00 00 	movl   $0x0,0x90(%esp)
  22:	00 00 00 00 
  26:	c7 84 24 94 00 00 00 	movl   $0x0,0x94(%esp)
  2d:	00 00 00 00 
  31:	c7 84 24 98 00 00 00 	movl   $0x0,0x98(%esp)
  38:	00 00 00 00 
  3c:	c7 84 24 9c 00 00 00 	movl   $0x0,0x9c(%esp)
  43:	00 00 00 00 
  47:	c7 84 24 a0 00 00 00 	movl   $0x0,0xa0(%esp)
  4e:	00 00 00 00 
  52:	c7 84 24 a4 00 00 00 	movl   $0x0,0xa4(%esp)
  59:	00 00 00 00 
  5d:	c7 84 24 a8 00 00 00 	movl   $0x0,0xa8(%esp)
  64:	00 00 00 00 
  68:	c7 84 24 ac 00 00 00 	movl   $0x0,0xac(%esp)
  6f:	00 00 00 00 
  73:	c7 84 24 b0 00 00 00 	movl   $0x0,0xb0(%esp)
  7a:	00 00 00 00 
  7e:	c7 84 24 b4 00 00 00 	movl   $0x0,0xb4(%esp)
  85:	00 00 00 00 
  89:	c7 84 24 b8 00 00 00 	movl   $0x0,0xb8(%esp)
  90:	00 00 00 00 
  94:	c7 84 24 bc 00 00 00 	movl   $0x0,0xbc(%esp)
  9b:	00 00 00 00 
  9f:	c7 84 24 c0 00 00 00 	movl   $0x0,0xc0(%esp)
  a6:	00 00 00 00 
  aa:	c7 84 24 c4 00 00 00 	movl   $0x0,0xc4(%esp)
  b1:	00 00 00 00 
  b5:	c7 84 24 c8 00 00 00 	movl   $0x0,0xc8(%esp)
  bc:	00 00 00 00 
  c0:	c7 84 24 cc 00 00 00 	movl   $0x0,0xcc(%esp)
  c7:	00 00 00 00 
  cb:	89 f8                	mov    %edi,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  p = b;  i = n;
  do {
    c[*p++]++;                  /* assume all entries <= BMAX */
  d0:	83 c2 04             	add    $0x4,%edx
  d3:	8b 4a fc             	mov    -0x4(%edx),%ecx
  d6:	8b 9c 8c 90 00 00 00 	mov    0x90(%esp,%ecx,4),%ebx
  dd:	43                   	inc    %ebx
  } while (--i);
  de:	48                   	dec    %eax
#define C2 C0 C0 C0 C0
#define C4 C2 C2 C2 C2
  C4                            /* clear c[]--assume BMAX+1 is 16 */
  p = b;  i = n;
  do {
    c[*p++]++;                  /* assume all entries <= BMAX */
  df:	89 9c 8c 90 00 00 00 	mov    %ebx,0x90(%esp,%ecx,4)
  } while (--i);
  e6:	75 e8                	jne    d0 <_huft_build+0xd0>
  if (c[0] == n)                /* null input--all zero length codes */
  e8:	8b 9c 24 90 00 00 00 	mov    0x90(%esp),%ebx
  ef:	39 fb                	cmp    %edi,%ebx
  f1:	0f 84 c9 04 00 00    	je     5c0 <_huft_build+0x5c0>
    return Z_OK;
  }


  /* Find minimum and maximum length, bound *m by those */
  l = *m;
  f7:	8b 55 00             	mov    0x0(%ebp),%edx
  for (j = 1; j <= BMAX; j++)
  fa:	b9 01 00 00 00       	mov    $0x1,%ecx
  ff:	90                   	nop
    if (c[j])
 100:	8b 84 8c 90 00 00 00 	mov    0x90(%esp,%ecx,4),%eax
 107:	85 c0                	test   %eax,%eax
 109:	0f 85 a1 04 00 00    	jne    5b0 <_huft_build+0x5b0>
  }


  /* Find minimum and maximum length, bound *m by those */
  l = *m;
  for (j = 1; j <= BMAX; j++)
 10f:	41                   	inc    %ecx
 110:	83 f9 10             	cmp    $0x10,%ecx
 113:	75 eb                	jne    100 <_huft_build+0x100>
 115:	b8 00 00 01 00       	mov    $0x10000,%eax
 11a:	c7 44 24 10 10 00 00 	movl   $0x10,0x10(%esp)
 121:	00 
    return Z_OK;
  }


  /* Find minimum and maximum length, bound *m by those */
  l = *m;
 122:	39 ca                	cmp    %ecx,%edx
    if (c[j])
      break;
  k = j;                        /* minimum code length */
  if ((uInt)l < j)
    l = j;
  for (i = BMAX; i; i--)
 124:	89 0c 24             	mov    %ecx,(%esp)
    return Z_OK;
  }


  /* Find minimum and maximum length, bound *m by those */
  l = *m;
 127:	0f 42 54 24 10       	cmovb  0x10(%esp),%edx
 12c:	89 54 24 08          	mov    %edx,0x8(%esp)
    if (c[j])
      break;
  k = j;                        /* minimum code length */
  if ((uInt)l < j)
    l = j;
  for (i = BMAX; i; i--)
 130:	ba 0f 00 00 00       	mov    $0xf,%edx
    if (c[i])
 135:	8b 8c 94 90 00 00 00 	mov    0x90(%esp,%edx,4),%ecx
 13c:	85 c9                	test   %ecx,%ecx
 13e:	0f 85 e3 03 00 00    	jne    527 <_huft_build+0x527>
    if (c[j])
      break;
  k = j;                        /* minimum code length */
  if ((uInt)l < j)
    l = j;
  for (i = BMAX; i; i--)
 144:	4a                   	dec    %edx
 145:	75 ee                	jne    135 <_huft_build+0x135>

  /* Adjust last length count to fill out codes, if needed */
  for (y = 1 << j; j < i; j++, y <<= 1)
    if ((y -= c[j]) < 0)
      return Z_DATA_ERROR;
  if ((y -= c[i]) < 0)
 147:	89 c2                	mov    %eax,%edx
 149:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
 14d:	29 da                	sub    %ebx,%edx
    if (c[i])
      break;
  g = i;                        /* maximum code length */
  if ((uInt)l > i)
    l = i;
  *m = l;
 14f:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%ebp)

  /* Adjust last length count to fill out codes, if needed */
  for (y = 1 << j; j < i; j++, y <<= 1)
    if ((y -= c[j]) < 0)
      return Z_DATA_ERROR;
  if ((y -= c[i]) < 0)
 156:	89 54 24 4c          	mov    %edx,0x4c(%esp)
 15a:	0f 88 93 03 00 00    	js     4f3 <_huft_build+0x4f3>
    return Z_DATA_ERROR;
  c[i] += y;
 160:	89 84 24 90 00 00 00 	mov    %eax,0x90(%esp)


  /* Generate starting offsets into the value table for each length */
  x[1] = j = 0;
 167:	c7 84 24 d4 00 00 00 	movl   $0x0,0xd4(%esp)
 16e:	00 00 00 00 
  p = c + 1;  xp = x + 2;
  while (--i) {                 /* note that i == g from above */
 172:	83 ca ff             	or     $0xffffffff,%edx
  if ((uInt)l < j)
    l = j;
  for (i = BMAX; i; i--)
    if (c[i])
      break;
  g = i;                        /* maximum code length */
 175:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
 17c:	00 
 17d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 184:	00 
 185:	31 c0                	xor    %eax,%eax
 187:	31 c9                	xor    %ecx,%ecx
 189:	8d 9c 24 d0 00 00 00 	lea    0xd0(%esp),%ebx

  /* Generate starting offsets into the value table for each length */
  x[1] = j = 0;
  p = c + 1;  xp = x + 2;
  while (--i) {                 /* note that i == g from above */
    *xp++ = (j += *p++);
 190:	8b ac 84 94 00 00 00 	mov    0x94(%esp,%eax,4),%ebp
 197:	01 e9                	add    %ebp,%ecx
 199:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
 19d:	40                   	inc    %eax


  /* Generate starting offsets into the value table for each length */
  x[1] = j = 0;
  p = c + 1;  xp = x + 2;
  while (--i) {                 /* note that i == g from above */
 19e:	39 d0                	cmp    %edx,%eax
 1a0:	75 ee                	jne    190 <_huft_build+0x190>
  if ((uInt)l < j)
    l = j;
  for (i = BMAX; i; i--)
    if (c[i])
      break;
  g = i;                        /* maximum code length */
 1a2:	31 c0                	xor    %eax,%eax
 1a4:	8b ac 24 3c 01 00 00 	mov    0x13c(%esp),%ebp
 1ab:	90                   	nop
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi


  /* Make a table of values in order of bit lengths */
  p = b;  i = 0;
  do {
    if ((j = *p++) != 0)
 1b0:	8b 14 86             	mov    (%esi,%eax,4),%edx
 1b3:	85 d2                	test   %edx,%edx
 1b5:	74 15                	je     1cc <_huft_build+0x1cc>
      v[x[j]++] = i;
 1b7:	8b 8c 94 d0 00 00 00 	mov    0xd0(%esp,%edx,4),%ecx
 1be:	8d 59 01             	lea    0x1(%ecx),%ebx
 1c1:	89 44 8d 00          	mov    %eax,0x0(%ebp,%ecx,4)
 1c5:	89 9c 94 d0 00 00 00 	mov    %ebx,0xd0(%esp,%edx,4)
  } while (++i < n);
 1cc:	40                   	inc    %eax
 1cd:	39 c7                	cmp    %eax,%edi
 1cf:	77 df                	ja     1b0 <_huft_build+0x1b0>
  n = x[g];                     /* set n to length of v */
 1d1:	8b 74 24 40          	mov    0x40(%esp),%esi

  /* Generate the Huffman codes and for each, make the table entries */
  x[0] = i = 0;                 /* first Huffman code is zero */
  p = v;                        /* grab values in bit order */
  h = -1;                       /* no tables yet--level -1 */
  w = -l;                       /* bits decoded == (l * h) */
 1d5:	8b 7c 24 08          	mov    0x8(%esp),%edi
 1d9:	f7 df                	neg    %edi
  p = b;  i = 0;
  do {
    if ((j = *p++) != 0)
      v[x[j]++] = i;
  } while (++i < n);
  n = x[g];                     /* set n to length of v */
 1db:	8b 84 b4 d0 00 00 00 	mov    0xd0(%esp,%esi,4),%eax

  /* Generate the Huffman codes and for each, make the table entries */
  x[0] = i = 0;                 /* first Huffman code is zero */
  p = v;                        /* grab values in bit order */
  h = -1;                       /* no tables yet--level -1 */
  w = -l;                       /* bits decoded == (l * h) */
 1e2:	89 7c 24 20          	mov    %edi,0x20(%esp)
  } while (++i < n);
  n = x[g];                     /* set n to length of v */


  /* Generate the Huffman codes and for each, make the table entries */
  x[0] = i = 0;                 /* first Huffman code is zero */
 1e6:	c7 84 24 d0 00 00 00 	movl   $0x0,0xd0(%esp)
 1ed:	00 00 00 00 
  p = v;                        /* grab values in bit order */
  h = -1;                       /* no tables yet--level -1 */
  w = -l;                       /* bits decoded == (l * h) */
  u[0] = (inflate_huft *)Z_NULL;        /* just to keep compilers happy */
 1f1:	c7 44 24 54 00 00 00 	movl   $0x0,0x54(%esp)
 1f8:	00 
  q = (inflate_huft *)Z_NULL;   /* ditto */
  z = 0;                        /* ditto */

  /* go through the bit lengths (k already is bits in shortest code) */
  for (; k <= g; k++)
 1f9:	3b 74 24 10          	cmp    0x10(%esp),%esi
 1fd:	0f 8c 57 04 00 00    	jl     65a <_huft_build+0x65a>
          *t = q;               /* first table is returned result */
      }

      /* set up table entry in r */
      r.bits = (Byte)(k - w);
      if (p >= v + n)
 203:	8b b4 24 3c 01 00 00 	mov    0x13c(%esp),%esi
 20a:	31 db                	xor    %ebx,%ebx
 20c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 213:	00 
 214:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
 21b:	00 
 21c:	8d 04 86             	lea    (%esi,%eax,4),%eax
 21f:	89 44 24 48          	mov    %eax,0x48(%esp)
 223:	8b 44 24 10          	mov    0x10(%esp),%eax
 227:	8d b4 84 90 00 00 00 	lea    0x90(%esp,%eax,4),%esi
 22e:	89 74 24 34          	mov    %esi,0x34(%esp)
 232:	8b 74 24 40          	mov    0x40(%esp),%esi
 236:	29 c6                	sub    %eax,%esi
 238:	8b 44 24 08          	mov    0x8(%esp),%eax
 23c:	c1 e0 02             	shl    $0x2,%eax
 23f:	89 74 24 30          	mov    %esi,0x30(%esp)
 243:	89 44 24 24          	mov    %eax,0x24(%esp)
 247:	8b 44 24 20          	mov    0x20(%esp),%eax
 24b:	89 44 24 0c          	mov    %eax,0xc(%esp)
 24f:	83 ce ff             	or     $0xffffffff,%esi
  z = 0;                        /* ditto */

  /* go through the bit lengths (k already is bits in shortest code) */
  for (; k <= g; k++)
  {
    a = c[k];
 252:	8b 44 24 34          	mov    0x34(%esp),%eax
 256:	89 f7                	mov    %esi,%edi
 258:	8b 00                	mov    (%eax),%eax
 25a:	89 44 24 18          	mov    %eax,0x18(%esp)
 25e:	8b 44 24 10          	mov    0x10(%esp),%eax
 262:	8d 48 ff             	lea    -0x1(%eax),%ecx
      f = 1 << (k - w);
      for (j = i >> w; j < z; j += f)
        q[j] = r;

      /* backwards increment the k-bit code i */
      for (j = 1 << (k - 1); i & j; j >>= 1)
 265:	b8 01 00 00 00       	mov    $0x1,%eax
 26a:	d3 e0                	shl    %cl,%eax
 26c:	89 44 24 44          	mov    %eax,0x44(%esp)

  /* go through the bit lengths (k already is bits in shortest code) */
  for (; k <= g; k++)
  {
    a = c[k];
    while (a--)
 270:	8b 44 24 18          	mov    0x18(%esp),%eax
 274:	85 c0                	test   %eax,%eax
 276:	8d 70 ff             	lea    -0x1(%eax),%esi
 279:	89 74 24 38          	mov    %esi,0x38(%esp)
 27d:	0f 84 aa 03 00 00    	je     62d <_huft_build+0x62d>
 283:	8b 74 24 08          	mov    0x8(%esp),%esi
 287:	8b 44 24 0c          	mov    0xc(%esp),%eax
 28b:	01 f0                	add    %esi,%eax
 28d:	8b 74 24 10          	mov    0x10(%esp),%esi
 291:	29 c6                	sub    %eax,%esi
 293:	89 04 24             	mov    %eax,(%esp)
 296:	89 f0                	mov    %esi,%eax
 298:	8b 54 24 34          	mov    0x34(%esp),%edx
 29c:	f7 d8                	neg    %eax
    {
      /* here i is the Huffman code of length k bits for value *p */
      /* make tables up to required level */
      while (k > w + l)
 29e:	8b 4c 24 10          	mov    0x10(%esp),%ecx
 2a2:	8d 04 82             	lea    (%edx,%eax,4),%eax
 2a5:	39 0c 24             	cmp    %ecx,(%esp)
 2a8:	89 44 24 14          	mov    %eax,0x14(%esp)
 2ac:	0f 8d 18 01 00 00    	jge    3ca <_huft_build+0x3ca>
        w += l;                 /* previous table always l bits */

        /* compute minimum size table less than or equal to l bits */
        z = g - w;
        z = z > (uInt)l ? l : z;        /* table size upper limit */
        if ((f = 1 << (j = k - w)) > a + 1)     /* try a k-w bit table */
 2b2:	ba 01 00 00 00       	mov    $0x1,%edx
 2b7:	89 f1                	mov    %esi,%ecx
 2b9:	d3 e2                	shl    %cl,%edx
    {
      /* here i is the Huffman code of length k bits for value *p */
      /* make tables up to required level */
      while (k > w + l)
      {
        h++;
 2bb:	8d 6f 01             	lea    0x1(%edi),%ebp
 2be:	89 f0                	mov    %esi,%eax
        w += l;                 /* previous table always l bits */

        /* compute minimum size table less than or equal to l bits */
        z = g - w;
        z = z > (uInt)l ? l : z;        /* table size upper limit */
        if ((f = 1 << (j = k - w)) > a + 1)     /* try a k-w bit table */
 2c0:	39 54 24 18          	cmp    %edx,0x18(%esp)
 2c4:	73 50                	jae    316 <_huft_build+0x316>
 2c6:	8b 44 24 30          	mov    0x30(%esp),%eax
 2ca:	8d 1c 30             	lea    (%eax,%esi,1),%ebx
        h++;
        w += l;                 /* previous table always l bits */

        /* compute minimum size table less than or equal to l bits */
        z = g - w;
        z = z > (uInt)l ? l : z;        /* table size upper limit */
 2cd:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 2d1:	39 c3                	cmp    %eax,%ebx
 2d3:	0f 47 d8             	cmova  %eax,%ebx
        if ((f = 1 << (j = k - w)) > a + 1)     /* try a k-w bit table */
        {                       /* too few codes for k-w bit table */
          f -= a + 1;           /* deduct codes from patterns left */
          xp = c + k;
          if (j < z)
 2d6:	39 f3                	cmp    %esi,%ebx
 2d8:	89 f0                	mov    %esi,%eax
 2da:	76 3a                	jbe    316 <_huft_build+0x316>
            while (++j < z)     /* try smaller tables up to z bits */
 2dc:	8d 46 01             	lea    0x1(%esi),%eax
 2df:	39 c3                	cmp    %eax,%ebx
 2e1:	76 33                	jbe    316 <_huft_build+0x316>
        /* compute minimum size table less than or equal to l bits */
        z = g - w;
        z = z > (uInt)l ? l : z;        /* table size upper limit */
        if ((f = 1 << (j = k - w)) > a + 1)     /* try a k-w bit table */
        {                       /* too few codes for k-w bit table */
          f -= a + 1;           /* deduct codes from patterns left */
 2e3:	8b 4c 24 38          	mov    0x38(%esp),%ecx
 2e7:	29 ca                	sub    %ecx,%edx
          xp = c + k;
          if (j < z)
            while (++j < z)     /* try smaller tables up to z bits */
            {
              if ((f <<= 1) <= *++xp)
 2e9:	8b 4c 24 34          	mov    0x34(%esp),%ecx
 2ed:	8d 54 12 fe          	lea    -0x2(%edx,%edx,1),%edx
 2f1:	8b 49 04             	mov    0x4(%ecx),%ecx
 2f4:	39 d1                	cmp    %edx,%ecx
 2f6:	73 1e                	jae    316 <_huft_build+0x316>
 2f8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2fc:	8b 7c 24 14          	mov    0x14(%esp),%edi
 300:	eb 09                	jmp    30b <_huft_build+0x30b>
 302:	01 d2                	add    %edx,%edx
 304:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
 307:	39 ca                	cmp    %ecx,%edx
 309:	76 07                	jbe    312 <_huft_build+0x312>
        if ((f = 1 << (j = k - w)) > a + 1)     /* try a k-w bit table */
        {                       /* too few codes for k-w bit table */
          f -= a + 1;           /* deduct codes from patterns left */
          xp = c + k;
          if (j < z)
            while (++j < z)     /* try smaller tables up to z bits */
 30b:	40                   	inc    %eax
            {
              if ((f <<= 1) <= *++xp)
                break;          /* enough codes to use up j bits */
              f -= *xp;         /* else deduct codes from patterns */
 30c:	29 ca                	sub    %ecx,%edx
        if ((f = 1 << (j = k - w)) > a + 1)     /* try a k-w bit table */
        {                       /* too few codes for k-w bit table */
          f -= a + 1;           /* deduct codes from patterns left */
          xp = c + k;
          if (j < z)
            while (++j < z)     /* try smaller tables up to z bits */
 30e:	39 c3                	cmp    %eax,%ebx
 310:	77 f0                	ja     302 <_huft_build+0x302>
 312:	8b 7c 24 04          	mov    0x4(%esp),%edi
              if ((f <<= 1) <= *++xp)
                break;          /* enough codes to use up j bits */
              f -= *xp;         /* else deduct codes from patterns */
            }
        }
        z = 1 << j;             /* table entries for j-bit table */
 316:	88 c1                	mov    %al,%cl
 318:	bb 01 00 00 00       	mov    $0x1,%ebx
 31d:	d3 e3                	shl    %cl,%ebx

        /* allocate new table */
        if (*hn + z > MANY)     /* (note: doesn't matter for fixed) */
 31f:	8b 8c 24 38 01 00 00 	mov    0x138(%esp),%ecx
 326:	8b 11                	mov    (%ecx),%edx
 328:	8d 0c 13             	lea    (%ebx,%edx,1),%ecx
 32b:	81 f9 a0 05 00 00    	cmp    $0x5a0,%ecx
 331:	0f 87 e0 01 00 00    	ja     517 <_huft_build+0x517>
          return Z_MEM_ERROR;   /* not enough memory */
        u[h] = q = hp + *hn;
 337:	8b 8c 24 34 01 00 00 	mov    0x134(%esp),%ecx
 33e:	8d 14 d1             	lea    (%ecx,%edx,8),%edx
        *hn += z;
 341:	8b 8c 24 38 01 00 00 	mov    0x138(%esp),%ecx
        z = 1 << j;             /* table entries for j-bit table */

        /* allocate new table */
        if (*hn + z > MANY)     /* (note: doesn't matter for fixed) */
          return Z_MEM_ERROR;   /* not enough memory */
        u[h] = q = hp + *hn;
 348:	89 54 24 04          	mov    %edx,0x4(%esp)
 34c:	89 54 ac 54          	mov    %edx,0x54(%esp,%ebp,4)
        *hn += z;
 350:	8b 11                	mov    (%ecx),%edx
 352:	01 da                	add    %ebx,%edx

        /* connect to last table, if there is one */
        if (h)
 354:	85 ed                	test   %ebp,%ebp

        /* allocate new table */
        if (*hn + z > MANY)     /* (note: doesn't matter for fixed) */
          return Z_MEM_ERROR;   /* not enough memory */
        u[h] = q = hp + *hn;
        *hn += z;
 356:	89 11                	mov    %edx,(%ecx)

        /* connect to last table, if there is one */
        if (h)
 358:	0f 84 a5 01 00 00    	je     503 <_huft_build+0x503>
        {
          x[h] = i;             /* save pattern for backing up */
 35e:	8b 4c 24 28          	mov    0x28(%esp),%ecx
          r.bits = (Byte)l;     /* bits to dump before this table */
          r.exop = (Byte)j;     /* bits in this table */
          j = i >> (w - l);
          r.base = (uInt)(q - u[h-1] - j);   /* offset to this table */
 362:	8b 7c bc 54          	mov    0x54(%esp,%edi,4),%edi
        if (h)
        {
          x[h] = i;             /* save pattern for backing up */
          r.bits = (Byte)l;     /* bits to dump before this table */
          r.exop = (Byte)j;     /* bits in this table */
          j = i >> (w - l);
 366:	89 ca                	mov    %ecx,%edx
        *hn += z;

        /* connect to last table, if there is one */
        if (h)
        {
          x[h] = i;             /* save pattern for backing up */
 368:	89 8c ac d0 00 00 00 	mov    %ecx,0xd0(%esp,%ebp,4)
          r.bits = (Byte)l;     /* bits to dump before this table */
          r.exop = (Byte)j;     /* bits in this table */
          j = i >> (w - l);
 36f:	8a 4c 24 0c          	mov    0xc(%esp),%cl
 373:	d3 ea                	shr    %cl,%edx
          r.base = (uInt)(q - u[h-1] - j);   /* offset to this table */
 375:	8b 4c 24 04          	mov    0x4(%esp),%ecx
 379:	29 f9                	sub    %edi,%ecx
 37b:	c1 f9 03             	sar    $0x3,%ecx
 37e:	29 d1                	sub    %edx,%ecx
 380:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
          u[h-1][j] = r;        /* connect to last table */
 384:	8d 0c d7             	lea    (%edi,%edx,8),%ecx
 387:	89 ef                	mov    %ebp,%edi
        /* connect to last table, if there is one */
        if (h)
        {
          x[h] = i;             /* save pattern for backing up */
          r.bits = (Byte)l;     /* bits to dump before this table */
          r.exop = (Byte)j;     /* bits in this table */
 389:	88 01                	mov    %al,(%ecx)

        /* connect to last table, if there is one */
        if (h)
        {
          x[h] = i;             /* save pattern for backing up */
          r.bits = (Byte)l;     /* bits to dump before this table */
 38b:	8a 44 24 08          	mov    0x8(%esp),%al
 38f:	88 41 01             	mov    %al,0x1(%ecx)
          r.exop = (Byte)j;     /* bits in this table */
          j = i >> (w - l);
          r.base = (uInt)(q - u[h-1] - j);   /* offset to this table */
          u[h-1][j] = r;        /* connect to last table */
 392:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 396:	89 41 04             	mov    %eax,0x4(%ecx)
 399:	8b 54 24 24          	mov    0x24(%esp),%edx
 39d:	8b 4c 24 14          	mov    0x14(%esp),%ecx
 3a1:	01 d1                	add    %edx,%ecx
 3a3:	8b 04 24             	mov    (%esp),%eax
 3a6:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 3aa:	8b 4c 24 08          	mov    0x8(%esp),%ecx
 3ae:	89 44 24 0c          	mov    %eax,0xc(%esp)
 3b2:	01 c8                	add    %ecx,%eax
 3b4:	8b 54 24 20          	mov    0x20(%esp),%edx
 3b8:	89 04 24             	mov    %eax,(%esp)
    a = c[k];
    while (a--)
    {
      /* here i is the Huffman code of length k bits for value *p */
      /* make tables up to required level */
      while (k > w + l)
 3bb:	8b 4c 24 10          	mov    0x10(%esp),%ecx
 3bf:	01 d6                	add    %edx,%esi
 3c1:	39 0c 24             	cmp    %ecx,(%esp)
 3c4:	0f 8c e8 fe ff ff    	jl     2b2 <_huft_build+0x2b2>
        else
          *t = q;               /* first table is returned result */
      }

      /* set up table entry in r */
      r.bits = (Byte)(k - w);
 3ca:	8a 44 24 10          	mov    0x10(%esp),%al
 3ce:	8b 54 24 0c          	mov    0xc(%esp),%edx
 3d2:	29 d0                	sub    %edx,%eax
      if (p >= v + n)
        r.exop = 128 + 64;      /* out of values--invalid code */
 3d4:	c6 04 24 c0          	movb   $0xc0,(%esp)
        else
          *t = q;               /* first table is returned result */
      }

      /* set up table entry in r */
      r.bits = (Byte)(k - w);
 3d8:	88 44 24 14          	mov    %al,0x14(%esp)
      if (p >= v + n)
 3dc:	8b 44 24 48          	mov    0x48(%esp),%eax
 3e0:	39 84 24 3c 01 00 00 	cmp    %eax,0x13c(%esp)
 3e7:	73 38                	jae    421 <_huft_build+0x421>
        r.exop = 128 + 64;      /* out of values--invalid code */
      else if (*p < s)
 3e9:	8b 84 24 3c 01 00 00 	mov    0x13c(%esp),%eax
 3f0:	8b 00                	mov    (%eax),%eax
 3f2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 3f6:	3b 44 24 3c          	cmp    0x3c(%esp),%eax
 3fa:	0f 83 e1 01 00 00    	jae    5e1 <_huft_build+0x5e1>
      {
        r.exop = (Byte)(*p < 256 ? 0 : 32 + 64);     /* 256 is end-of-block */
 400:	3d 00 01 00 00       	cmp    $0x100,%eax
 405:	19 c0                	sbb    %eax,%eax
 407:	83 f0 ff             	xor    $0xffffffff,%eax
 40a:	83 e0 60             	and    $0x60,%eax
 40d:	88 04 24             	mov    %al,(%esp)
        r.base = *p++;          /* simple code is just the value */
 410:	8b 84 24 3c 01 00 00 	mov    0x13c(%esp),%eax
 417:	83 c0 04             	add    $0x4,%eax
 41a:	89 84 24 3c 01 00 00 	mov    %eax,0x13c(%esp)
        r.exop = (Byte)(e[*p - s] + 16 + 64);/* non-simple--look up in lists */
        r.base = d[*p++ - s];
      }

      /* fill code-like entries with r */
      f = 1 << (k - w);
 421:	8b 44 24 0c          	mov    0xc(%esp),%eax
 425:	8b 4c 24 10          	mov    0x10(%esp),%ecx
 429:	29 c1                	sub    %eax,%ecx
 42b:	bd 01 00 00 00       	mov    $0x1,%ebp
 430:	d3 e5                	shl    %cl,%ebp
      for (j = i >> w; j < z; j += f)
 432:	8b 54 24 28          	mov    0x28(%esp),%edx
 436:	88 c1                	mov    %al,%cl
 438:	d3 ea                	shr    %cl,%edx
 43a:	39 da                	cmp    %ebx,%edx
 43c:	73 41                	jae    47f <_huft_build+0x47f>
 43e:	8b 44 24 04          	mov    0x4(%esp),%eax
 442:	8d 34 ed 00 00 00 00 	lea    0x0(,%ebp,8),%esi
 449:	89 7c 24 18          	mov    %edi,0x18(%esp)
 44d:	89 df                	mov    %ebx,%edi
 44f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
 452:	8a 5c 24 14          	mov    0x14(%esp),%bl
 456:	01 ea                	add    %ebp,%edx
 458:	89 74 24 14          	mov    %esi,0x14(%esp)
 45c:	8b 74 24 1c          	mov    0x1c(%esp),%esi
        q[j] = r;
 460:	8a 0c 24             	mov    (%esp),%cl
 463:	88 58 01             	mov    %bl,0x1(%eax)
 466:	88 08                	mov    %cl,(%eax)
 468:	8b 4c 24 14          	mov    0x14(%esp),%ecx
 46c:	89 70 04             	mov    %esi,0x4(%eax)
 46f:	01 c8                	add    %ecx,%eax
 471:	89 d1                	mov    %edx,%ecx
 473:	01 ea                	add    %ebp,%edx
        r.base = d[*p++ - s];
      }

      /* fill code-like entries with r */
      f = 1 << (k - w);
      for (j = i >> w; j < z; j += f)
 475:	39 f9                	cmp    %edi,%ecx
 477:	72 e7                	jb     460 <_huft_build+0x460>
 479:	89 fb                	mov    %edi,%ebx
 47b:	8b 7c 24 18          	mov    0x18(%esp),%edi
        q[j] = r;

      /* backwards increment the k-bit code i */
      for (j = 1 << (k - 1); i & j; j >>= 1)
 47f:	8b 74 24 44          	mov    0x44(%esp),%esi
 483:	8b 54 24 28          	mov    0x28(%esp),%edx
 487:	89 f0                	mov    %esi,%eax
 489:	85 74 24 28          	test   %esi,0x28(%esp)
 48d:	74 0d                	je     49c <_huft_build+0x49c>
 48f:	90                   	nop
        i ^= j;
 490:	31 c2                	xor    %eax,%edx
      f = 1 << (k - w);
      for (j = i >> w; j < z; j += f)
        q[j] = r;

      /* backwards increment the k-bit code i */
      for (j = 1 << (k - 1); i & j; j >>= 1)
 492:	d1 e8                	shr    %eax
 494:	85 d0                	test   %edx,%eax
 496:	75 f8                	jne    490 <_huft_build+0x490>
 498:	89 54 24 28          	mov    %edx,0x28(%esp)
        i ^= j;
      i ^= j;
 49c:	8b 6c 24 28          	mov    0x28(%esp),%ebp

      /* backup over finished tables */
      mask = (1 << w) - 1;      /* needed on HP, cc -O bug */
 4a0:	8b 54 24 0c          	mov    0xc(%esp),%edx
        q[j] = r;

      /* backwards increment the k-bit code i */
      for (j = 1 << (k - 1); i & j; j >>= 1)
        i ^= j;
      i ^= j;
 4a4:	31 c5                	xor    %eax,%ebp

      /* backup over finished tables */
      mask = (1 << w) - 1;      /* needed on HP, cc -O bug */
 4a6:	88 d1                	mov    %dl,%cl
 4a8:	b8 01 00 00 00       	mov    $0x1,%eax
        q[j] = r;

      /* backwards increment the k-bit code i */
      for (j = 1 << (k - 1); i & j; j >>= 1)
        i ^= j;
      i ^= j;
 4ad:	89 6c 24 28          	mov    %ebp,0x28(%esp)

      /* backup over finished tables */
      mask = (1 << w) - 1;      /* needed on HP, cc -O bug */
 4b1:	d3 e0                	shl    %cl,%eax
 4b3:	48                   	dec    %eax
        q[j] = r;

      /* backwards increment the k-bit code i */
      for (j = 1 << (k - 1); i & j; j >>= 1)
        i ^= j;
      i ^= j;
 4b4:	8b 74 24 28          	mov    0x28(%esp),%esi

      /* backup over finished tables */
      mask = (1 << w) - 1;      /* needed on HP, cc -O bug */
      while ((i & mask) != x[h])
 4b8:	21 f0                	and    %esi,%eax
 4ba:	3b 84 bc d0 00 00 00 	cmp    0xd0(%esp,%edi,4),%eax
 4c1:	74 23                	je     4e6 <_huft_build+0x4e6>
 4c3:	8d 84 24 d0 00 00 00 	lea    0xd0(%esp),%eax
 4ca:	8b 6c 24 08          	mov    0x8(%esp),%ebp
 4ce:	89 d1                	mov    %edx,%ecx
      {
        h--;                    /* don't need to update q */
        w -= l;
 4d0:	29 e9                	sub    %ebp,%ecx
        mask = (1 << w) - 1;
 4d2:	ba 01 00 00 00       	mov    $0x1,%edx
 4d7:	d3 e2                	shl    %cl,%edx
 4d9:	4a                   	dec    %edx

      /* backup over finished tables */
      mask = (1 << w) - 1;      /* needed on HP, cc -O bug */
      while ((i & mask) != x[h])
      {
        h--;                    /* don't need to update q */
 4da:	4f                   	dec    %edi
        i ^= j;
      i ^= j;

      /* backup over finished tables */
      mask = (1 << w) - 1;      /* needed on HP, cc -O bug */
      while ((i & mask) != x[h])
 4db:	21 f2                	and    %esi,%edx
 4dd:	3b 14 b8             	cmp    (%eax,%edi,4),%edx
 4e0:	75 ee                	jne    4d0 <_huft_build+0x4d0>
 4e2:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 4e6:	8b 44 24 38          	mov    0x38(%esp),%eax
 4ea:	89 44 24 18          	mov    %eax,0x18(%esp)
 4ee:	e9 7d fd ff ff       	jmp    270 <_huft_build+0x270>


  /* Adjust last length count to fill out codes, if needed */
  for (y = 1 << j; j < i; j++, y <<= 1)
    if ((y -= c[j]) < 0)
      return Z_DATA_ERROR;
 4f3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  }


  /* Return Z_BUF_ERROR if we were given an incomplete table */
  return y != 0 && g != 1 ? Z_BUF_ERROR : Z_OK;
}
 4f8:	81 c4 10 01 00 00    	add    $0x110,%esp
 4fe:	5b                   	pop    %ebx
 4ff:	5e                   	pop    %esi
 500:	5f                   	pop    %edi
 501:	5d                   	pop    %ebp
 502:	c3                   	ret    
          j = i >> (w - l);
          r.base = (uInt)(q - u[h-1] - j);   /* offset to this table */
          u[h-1][j] = r;        /* connect to last table */
        }
        else
          *t = q;               /* first table is returned result */
 503:	8b 84 24 2c 01 00 00 	mov    0x12c(%esp),%eax
 50a:	8b 7c 24 04          	mov    0x4(%esp),%edi
 50e:	89 38                	mov    %edi,(%eax)
 510:	31 ff                	xor    %edi,%edi
 512:	e9 82 fe ff ff       	jmp    399 <_huft_build+0x399>
  }


  /* Return Z_BUF_ERROR if we were given an incomplete table */
  return y != 0 && g != 1 ? Z_BUF_ERROR : Z_OK;
}
 517:	81 c4 10 01 00 00    	add    $0x110,%esp
        }
        z = 1 << j;             /* table entries for j-bit table */

        /* allocate new table */
        if (*hn + z > MANY)     /* (note: doesn't matter for fixed) */
          return Z_MEM_ERROR;   /* not enough memory */
 51d:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  }


  /* Return Z_BUF_ERROR if we were given an incomplete table */
  return y != 0 && g != 1 ? Z_BUF_ERROR : Z_OK;
}
 522:	5b                   	pop    %ebx
 523:	5e                   	pop    %esi
 524:	5f                   	pop    %edi
 525:	5d                   	pop    %ebp
 526:	c3                   	ret    
    l = j;
  for (i = BMAX; i; i--)
    if (c[i])
      break;
  g = i;                        /* maximum code length */
  if ((uInt)l > i)
 527:	8b 5c 24 08          	mov    0x8(%esp),%ebx
 52b:	8b 0c 24             	mov    (%esp),%ecx
  if ((uInt)l < j)
    l = j;
  for (i = BMAX; i; i--)
    if (c[i])
      break;
  g = i;                        /* maximum code length */
 52e:	89 54 24 40          	mov    %edx,0x40(%esp)
  if ((uInt)l > i)
 532:	89 5c 24 2c          	mov    %ebx,0x2c(%esp)
 536:	39 d3                	cmp    %edx,%ebx
 538:	77 6a                	ja     5a4 <_huft_build+0x5a4>
    l = i;
  *m = l;
 53a:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx


  /* Adjust last length count to fill out codes, if needed */
  for (y = 1 << j; j < i; j++, y <<= 1)
 53e:	39 ca                	cmp    %ecx,%edx
    if (c[i])
      break;
  g = i;                        /* maximum code length */
  if ((uInt)l > i)
    l = i;
  *m = l;
 540:	89 5d 00             	mov    %ebx,0x0(%ebp)


  /* Adjust last length count to fill out codes, if needed */
  for (y = 1 << j; j < i; j++, y <<= 1)
 543:	76 2c                	jbe    571 <_huft_build+0x571>
    if ((y -= c[j]) < 0)
 545:	2b 84 8c 90 00 00 00 	sub    0x90(%esp,%ecx,4),%eax
 54c:	78 a5                	js     4f3 <_huft_build+0x4f3>
 54e:	8d 8c 8c 94 00 00 00 	lea    0x94(%esp,%ecx,4),%ecx
 555:	8d 9c 94 90 00 00 00 	lea    0x90(%esp,%edx,4),%ebx
 55c:	eb 0d                	jmp    56b <_huft_build+0x56b>
 55e:	66 90                	xchg   %ax,%ax
 560:	8b 29                	mov    (%ecx),%ebp
 562:	83 c1 04             	add    $0x4,%ecx
 565:	29 e8                	sub    %ebp,%eax
 567:	85 c0                	test   %eax,%eax
 569:	78 88                	js     4f3 <_huft_build+0x4f3>
    l = i;
  *m = l;


  /* Adjust last length count to fill out codes, if needed */
  for (y = 1 << j; j < i; j++, y <<= 1)
 56b:	01 c0                	add    %eax,%eax
 56d:	39 d9                	cmp    %ebx,%ecx
 56f:	75 ef                	jne    560 <_huft_build+0x560>
 571:	8b 8c 94 90 00 00 00 	mov    0x90(%esp,%edx,4),%ecx
    if ((y -= c[j]) < 0)
      return Z_DATA_ERROR;
  if ((y -= c[i]) < 0)
 578:	89 c3                	mov    %eax,%ebx
 57a:	29 cb                	sub    %ecx,%ebx
 57c:	89 5c 24 4c          	mov    %ebx,0x4c(%esp)
 580:	0f 88 6d ff ff ff    	js     4f3 <_huft_build+0x4f3>
    return Z_DATA_ERROR;
  c[i] += y;
 586:	89 84 94 90 00 00 00 	mov    %eax,0x90(%esp,%edx,4)


  /* Generate starting offsets into the value table for each length */
  x[1] = j = 0;
  p = c + 1;  xp = x + 2;
  while (--i) {                 /* note that i == g from above */
 58d:	4a                   	dec    %edx
    return Z_DATA_ERROR;
  c[i] += y;


  /* Generate starting offsets into the value table for each length */
  x[1] = j = 0;
 58e:	c7 84 24 d4 00 00 00 	movl   $0x0,0xd4(%esp)
 595:	00 00 00 00 
  p = c + 1;  xp = x + 2;
  while (--i) {                 /* note that i == g from above */
 599:	0f 85 e6 fb ff ff    	jne    185 <_huft_build+0x185>
 59f:	e9 fe fb ff ff       	jmp    1a2 <_huft_build+0x1a2>
    l = j;
  for (i = BMAX; i; i--)
    if (c[i])
      break;
  g = i;                        /* maximum code length */
  if ((uInt)l > i)
 5a4:	89 54 24 2c          	mov    %edx,0x2c(%esp)
  if ((uInt)l < j)
    l = j;
  for (i = BMAX; i; i--)
    if (c[i])
      break;
  g = i;                        /* maximum code length */
 5a8:	89 54 24 08          	mov    %edx,0x8(%esp)
 5ac:	eb 8c                	jmp    53a <_huft_build+0x53a>
 5ae:	66 90                	xchg   %ax,%ax
 5b0:	b8 01 00 00 00       	mov    $0x1,%eax


  /* Find minimum and maximum length, bound *m by those */
  l = *m;
  for (j = 1; j <= BMAX; j++)
    if (c[j])
 5b5:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 5b9:	d3 e0                	shl    %cl,%eax
 5bb:	e9 62 fb ff ff       	jmp    122 <_huft_build+0x122>
  do {
    c[*p++]++;                  /* assume all entries <= BMAX */
  } while (--i);
  if (c[0] == n)                /* null input--all zero length codes */
  {
    *t = (inflate_huft *)Z_NULL;
 5c0:	8b 84 24 2c 01 00 00 	mov    0x12c(%esp),%eax
 5c7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    *m = 0;
 5cd:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%ebp)
  }


  /* Return Z_BUF_ERROR if we were given an incomplete table */
  return y != 0 && g != 1 ? Z_BUF_ERROR : Z_OK;
}
 5d4:	81 c4 10 01 00 00    	add    $0x110,%esp
  } while (--i);
  if (c[0] == n)                /* null input--all zero length codes */
  {
    *t = (inflate_huft *)Z_NULL;
    *m = 0;
    return Z_OK;
 5da:	31 c0                	xor    %eax,%eax
  }


  /* Return Z_BUF_ERROR if we were given an incomplete table */
  return y != 0 && g != 1 ? Z_BUF_ERROR : Z_OK;
}
 5dc:	5b                   	pop    %ebx
 5dd:	5e                   	pop    %esi
 5de:	5f                   	pop    %edi
 5df:	5d                   	pop    %ebp
 5e0:	c3                   	ret    
        r.exop = (Byte)(*p < 256 ? 0 : 32 + 64);     /* 256 is end-of-block */
        r.base = *p++;          /* simple code is just the value */
      }
      else
      {
        r.exop = (Byte)(e[*p - s] + 16 + 64);/* non-simple--look up in lists */
 5e1:	8b 54 24 1c          	mov    0x1c(%esp),%edx
 5e5:	8b 74 24 3c          	mov    0x3c(%esp),%esi
 5e9:	29 f2                	sub    %esi,%edx
 5eb:	8b b4 24 28 01 00 00 	mov    0x128(%esp),%esi
        r.base = d[*p++ - s];
 5f2:	8b ac 24 3c 01 00 00 	mov    0x13c(%esp),%ebp
        r.exop = (Byte)(*p < 256 ? 0 : 32 + 64);     /* 256 is end-of-block */
        r.base = *p++;          /* simple code is just the value */
      }
      else
      {
        r.exop = (Byte)(e[*p - s] + 16 + 64);/* non-simple--look up in lists */
 5f9:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
        r.base = d[*p++ - s];
 600:	83 c5 04             	add    $0x4,%ebp
 603:	89 ac 24 3c 01 00 00 	mov    %ebp,0x13c(%esp)
        r.exop = (Byte)(*p < 256 ? 0 : 32 + 64);     /* 256 is end-of-block */
        r.base = *p++;          /* simple code is just the value */
      }
      else
      {
        r.exop = (Byte)(e[*p - s] + 16 + 64);/* non-simple--look up in lists */
 60a:	8b 34 06             	mov    (%esi,%eax,1),%esi
 60d:	89 34 24             	mov    %esi,(%esp)
 610:	0f b6 34 24          	movzbl (%esp),%esi
 614:	8d 4e 50             	lea    0x50(%esi),%ecx
        r.base = d[*p++ - s];
 617:	8b b4 24 24 01 00 00 	mov    0x124(%esp),%esi
        r.exop = (Byte)(*p < 256 ? 0 : 32 + 64);     /* 256 is end-of-block */
        r.base = *p++;          /* simple code is just the value */
      }
      else
      {
        r.exop = (Byte)(e[*p - s] + 16 + 64);/* non-simple--look up in lists */
 61e:	88 0c 24             	mov    %cl,(%esp)
        r.base = d[*p++ - s];
 621:	8b 04 06             	mov    (%esi,%eax,1),%eax
 624:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 628:	e9 f4 fd ff ff       	jmp    421 <_huft_build+0x421>
  u[0] = (inflate_huft *)Z_NULL;        /* just to keep compilers happy */
  q = (inflate_huft *)Z_NULL;   /* ditto */
  z = 0;                        /* ditto */

  /* go through the bit lengths (k already is bits in shortest code) */
  for (; k <= g; k++)
 62d:	8b 44 24 10          	mov    0x10(%esp),%eax
 631:	8b 54 24 34          	mov    0x34(%esp),%edx
 635:	40                   	inc    %eax
 636:	8b 4c 24 30          	mov    0x30(%esp),%ecx
 63a:	89 44 24 10          	mov    %eax,0x10(%esp)
 63e:	83 c2 04             	add    $0x4,%edx
 641:	49                   	dec    %ecx
 642:	8b 44 24 10          	mov    0x10(%esp),%eax
 646:	89 fe                	mov    %edi,%esi
 648:	89 54 24 34          	mov    %edx,0x34(%esp)
 64c:	89 4c 24 30          	mov    %ecx,0x30(%esp)
 650:	3b 44 24 40          	cmp    0x40(%esp),%eax
 654:	0f 8e f8 fb ff ff    	jle    252 <_huft_build+0x252>
    }
  }


  /* Return Z_BUF_ERROR if we were given an incomplete table */
  return y != 0 && g != 1 ? Z_BUF_ERROR : Z_OK;
 65a:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
 65e:	85 db                	test   %ebx,%ebx
 660:	74 10                	je     672 <_huft_build+0x672>
 662:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
 667:	83 7c 24 40 01       	cmpl   $0x1,0x40(%esp)
 66c:	0f 85 86 fe ff ff    	jne    4f8 <_huft_build+0x4f8>
 672:	31 c0                	xor    %eax,%eax
 674:	e9 7f fe ff ff       	jmp    4f8 <_huft_build+0x4f8>
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000680 <_inflate_trees_bits>:
uIntf *c;               /* 19 code lengths */
uIntf *bb;              /* bits tree desired/actual depth */
inflate_huft * FAR *tb; /* bits tree result */
inflate_huft *hp;       /* space for trees */
z_streamp z;            /* for messages */
{
 680:	55                   	push   %ebp
 681:	57                   	push   %edi
 682:	56                   	push   %esi
 683:	53                   	push   %ebx
 684:	83 ec 3c             	sub    $0x3c,%esp
 687:	8b 74 24 60          	mov    0x60(%esp),%esi
  int r;
  uInt hn = 0;          /* hufts used in space */
  uIntf *v;             /* work area for huft_build */

  if ((v = (uIntf*)ZALLOC(z, 19, sizeof(uInt))) == Z_NULL)
 68b:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
 692:	00 
 693:	c7 44 24 04 13 00 00 	movl   $0x13,0x4(%esp)
 69a:	00 
inflate_huft * FAR *tb; /* bits tree result */
inflate_huft *hp;       /* space for trees */
z_streamp z;            /* for messages */
{
  int r;
  uInt hn = 0;          /* hufts used in space */
 69b:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 6a2:	00 
  uIntf *v;             /* work area for huft_build */

  if ((v = (uIntf*)ZALLOC(z, 19, sizeof(uInt))) == Z_NULL)
 6a3:	8b 46 28             	mov    0x28(%esi),%eax
uIntf *c;               /* 19 code lengths */
uIntf *bb;              /* bits tree desired/actual depth */
inflate_huft * FAR *tb; /* bits tree result */
inflate_huft *hp;       /* space for trees */
z_streamp z;            /* for messages */
{
 6a6:	8b 6c 24 54          	mov    0x54(%esp),%ebp
  int r;
  uInt hn = 0;          /* hufts used in space */
  uIntf *v;             /* work area for huft_build */

  if ((v = (uIntf*)ZALLOC(z, 19, sizeof(uInt))) == Z_NULL)
 6aa:	89 04 24             	mov    %eax,(%esp)
 6ad:	ff 56 20             	call   *0x20(%esi)
 6b0:	89 c7                	mov    %eax,%edi
 6b2:	85 c0                	test   %eax,%eax
 6b4:	0f 84 86 00 00 00    	je     740 <_inflate_trees_bits+0xc0>
    return Z_MEM_ERROR;
  r = huft_build(c, 19, 19, (uIntf*)Z_NULL, (uIntf*)Z_NULL,
 6ba:	89 44 24 18          	mov    %eax,0x18(%esp)
 6be:	8d 44 24 2c          	lea    0x2c(%esp),%eax
 6c2:	89 44 24 14          	mov    %eax,0x14(%esp)
 6c6:	8b 44 24 5c          	mov    0x5c(%esp),%eax
 6ca:	89 44 24 10          	mov    %eax,0x10(%esp)
 6ce:	8b 44 24 58          	mov    0x58(%esp),%eax
 6d2:	89 44 24 08          	mov    %eax,0x8(%esp)
 6d6:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
 6da:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 6e1:	00 
 6e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 6e9:	b9 13 00 00 00       	mov    $0x13,%ecx
 6ee:	ba 13 00 00 00       	mov    $0x13,%edx
 6f3:	8b 44 24 50          	mov    0x50(%esp),%eax
 6f7:	e8 04 f9 ff ff       	call   0 <_huft_build>
 6fc:	89 c3                	mov    %eax,%ebx
                 tb, bb, hp, &hn, v);
  if (r == Z_DATA_ERROR)
 6fe:	83 f8 fd             	cmp    $0xfffffffd,%eax
 701:	74 31                	je     734 <_inflate_trees_bits+0xb4>
    z->msg = (char*)"oversubscribed dynamic bit lengths tree";
  else if (r == Z_BUF_ERROR || *bb == 0)
 703:	83 f8 fb             	cmp    $0xfffffffb,%eax
 706:	74 1e                	je     726 <_inflate_trees_bits+0xa6>
 708:	8b 45 00             	mov    0x0(%ebp),%eax
 70b:	85 c0                	test   %eax,%eax
 70d:	74 17                	je     726 <_inflate_trees_bits+0xa6>
  {
    z->msg = (char*)"incomplete dynamic bit lengths tree";
    r = Z_DATA_ERROR;
  }
  ZFREE(z, v);
 70f:	89 7c 24 04          	mov    %edi,0x4(%esp)
 713:	8b 46 28             	mov    0x28(%esi),%eax
 716:	89 04 24             	mov    %eax,(%esp)
 719:	ff 56 24             	call   *0x24(%esi)
  return r;
 71c:	89 d8                	mov    %ebx,%eax
}
 71e:	83 c4 3c             	add    $0x3c,%esp
 721:	5b                   	pop    %ebx
 722:	5e                   	pop    %esi
 723:	5f                   	pop    %edi
 724:	5d                   	pop    %ebp
 725:	c3                   	ret    
                 tb, bb, hp, &hn, v);
  if (r == Z_DATA_ERROR)
    z->msg = (char*)"oversubscribed dynamic bit lengths tree";
  else if (r == Z_BUF_ERROR || *bb == 0)
  {
    z->msg = (char*)"incomplete dynamic bit lengths tree";
 726:	c7 46 18 28 00 00 00 	movl   $0x28,0x18(%esi)
    r = Z_DATA_ERROR;
 72d:	bb fd ff ff ff       	mov    $0xfffffffd,%ebx
 732:	eb db                	jmp    70f <_inflate_trees_bits+0x8f>
  if ((v = (uIntf*)ZALLOC(z, 19, sizeof(uInt))) == Z_NULL)
    return Z_MEM_ERROR;
  r = huft_build(c, 19, 19, (uIntf*)Z_NULL, (uIntf*)Z_NULL,
                 tb, bb, hp, &hn, v);
  if (r == Z_DATA_ERROR)
    z->msg = (char*)"oversubscribed dynamic bit lengths tree";
 734:	c7 46 18 00 00 00 00 	movl   $0x0,0x18(%esi)
 73b:	eb d2                	jmp    70f <_inflate_trees_bits+0x8f>
 73d:	8d 76 00             	lea    0x0(%esi),%esi
  int r;
  uInt hn = 0;          /* hufts used in space */
  uIntf *v;             /* work area for huft_build */

  if ((v = (uIntf*)ZALLOC(z, 19, sizeof(uInt))) == Z_NULL)
    return Z_MEM_ERROR;
 740:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
 745:	eb d7                	jmp    71e <_inflate_trees_bits+0x9e>
 747:	89 f6                	mov    %esi,%esi
 749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000750 <_inflate_trees_dynamic>:
uIntf *bd;              /* distance desired/actual bit depth */
inflate_huft * FAR *tl; /* literal/length tree result */
inflate_huft * FAR *td; /* distance tree result */
inflate_huft *hp;       /* space for trees */
z_streamp z;            /* for messages */
{
 750:	55                   	push   %ebp
 751:	57                   	push   %edi
 752:	56                   	push   %esi
 753:	53                   	push   %ebx
 754:	83 ec 4c             	sub    $0x4c,%esp
 757:	8b 9c 24 80 00 00 00 	mov    0x80(%esp),%ebx
  int r;
  uInt hn = 0;          /* hufts used in space */
  uIntf *v;             /* work area for huft_build */

  /* allocate work area */
  if ((v = (uIntf*)ZALLOC(z, 288, sizeof(uInt))) == Z_NULL)
 75e:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
 765:	00 
 766:	c7 44 24 04 20 01 00 	movl   $0x120,0x4(%esp)
 76d:	00 
inflate_huft * FAR *td; /* distance tree result */
inflate_huft *hp;       /* space for trees */
z_streamp z;            /* for messages */
{
  int r;
  uInt hn = 0;          /* hufts used in space */
 76e:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
 775:	00 
  uIntf *v;             /* work area for huft_build */

  /* allocate work area */
  if ((v = (uIntf*)ZALLOC(z, 288, sizeof(uInt))) == Z_NULL)
 776:	8b 43 28             	mov    0x28(%ebx),%eax
uIntf *bd;              /* distance desired/actual bit depth */
inflate_huft * FAR *tl; /* literal/length tree result */
inflate_huft * FAR *td; /* distance tree result */
inflate_huft *hp;       /* space for trees */
z_streamp z;            /* for messages */
{
 779:	8b 7c 24 6c          	mov    0x6c(%esp),%edi
  int r;
  uInt hn = 0;          /* hufts used in space */
  uIntf *v;             /* work area for huft_build */

  /* allocate work area */
  if ((v = (uIntf*)ZALLOC(z, 288, sizeof(uInt))) == Z_NULL)
 77d:	89 04 24             	mov    %eax,(%esp)
 780:	ff 53 20             	call   *0x20(%ebx)
 783:	89 c6                	mov    %eax,%esi
 785:	85 c0                	test   %eax,%eax
 787:	0f 84 45 01 00 00    	je     8d2 <_inflate_trees_dynamic+0x182>
    return Z_MEM_ERROR;

  /* build literal/length tree */
  r = huft_build(c, nl, 257, cplens, cplext, tl, bl, hp, &hn, v);
 78d:	89 44 24 18          	mov    %eax,0x18(%esp)
 791:	8b 44 24 7c          	mov    0x7c(%esp),%eax
 795:	89 44 24 10          	mov    %eax,0x10(%esp)
 799:	8d 6c 24 3c          	lea    0x3c(%esp),%ebp
 79d:	8b 44 24 74          	mov    0x74(%esp),%eax
 7a1:	89 6c 24 14          	mov    %ebp,0x14(%esp)
 7a5:	89 44 24 08          	mov    %eax,0x8(%esp)
 7a9:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 7ad:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
 7b4:	00 
 7b5:	c7 04 24 80 02 00 00 	movl   $0x280,(%esp)
 7bc:	b9 01 01 00 00       	mov    $0x101,%ecx
 7c1:	8b 54 24 60          	mov    0x60(%esp),%edx
 7c5:	8b 44 24 68          	mov    0x68(%esp),%eax
 7c9:	e8 32 f8 ff ff       	call   0 <_huft_build>
  if (r != Z_OK || *bl == 0)
 7ce:	85 c0                	test   %eax,%eax
 7d0:	74 2e                	je     800 <_inflate_trees_dynamic+0xb0>
  {
    if (r == Z_DATA_ERROR)
 7d2:	83 f8 fd             	cmp    $0xfffffffd,%eax
 7d5:	75 3d                	jne    814 <_inflate_trees_dynamic+0xc4>
      z->msg = (char*)"oversubscribed literal/length tree";
 7d7:	c7 43 18 4c 00 00 00 	movl   $0x4c,0x18(%ebx)
    else if (r != Z_MEM_ERROR)
    {
      z->msg = (char*)"empty distance tree with lengths";
      r = Z_DATA_ERROR;
    }
    ZFREE(z, v);
 7de:	89 74 24 04          	mov    %esi,0x4(%esp)
 7e2:	89 44 24 2c          	mov    %eax,0x2c(%esp)
 7e6:	8b 53 28             	mov    0x28(%ebx),%edx
 7e9:	89 14 24             	mov    %edx,(%esp)
 7ec:	ff 53 24             	call   *0x24(%ebx)
    return r;
 7ef:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  }

  /* done */
  ZFREE(z, v);
  return Z_OK;
}
 7f3:	83 c4 4c             	add    $0x4c,%esp
 7f6:	5b                   	pop    %ebx
 7f7:	5e                   	pop    %esi
 7f8:	5f                   	pop    %edi
 7f9:	5d                   	pop    %ebp
 7fa:	c3                   	ret    
 7fb:	90                   	nop
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if ((v = (uIntf*)ZALLOC(z, 288, sizeof(uInt))) == Z_NULL)
    return Z_MEM_ERROR;

  /* build literal/length tree */
  r = huft_build(c, nl, 257, cplens, cplext, tl, bl, hp, &hn, v);
  if (r != Z_OK || *bl == 0)
 800:	8b 17                	mov    (%edi),%edx
 802:	85 d2                	test   %edx,%edx
 804:	75 1a                	jne    820 <_inflate_trees_dynamic+0xd0>
  {
    if (r == Z_DATA_ERROR)
      z->msg = (char*)"oversubscribed literal/length tree";
    else if (r != Z_MEM_ERROR)
    {
      z->msg = (char*)"incomplete literal/length tree";
 806:	c7 43 18 70 00 00 00 	movl   $0x70,0x18(%ebx)
      r = Z_DATA_ERROR;
 80d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 812:	eb ca                	jmp    7de <_inflate_trees_dynamic+0x8e>
  r = huft_build(c, nl, 257, cplens, cplext, tl, bl, hp, &hn, v);
  if (r != Z_OK || *bl == 0)
  {
    if (r == Z_DATA_ERROR)
      z->msg = (char*)"oversubscribed literal/length tree";
    else if (r != Z_MEM_ERROR)
 814:	83 f8 fc             	cmp    $0xfffffffc,%eax
 817:	75 ed                	jne    806 <_inflate_trees_dynamic+0xb6>
 819:	eb c3                	jmp    7de <_inflate_trees_dynamic+0x8e>
 81b:	90                   	nop
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ZFREE(z, v);
    return r;
  }

  /* build distance tree */
  r = huft_build(c + nl, nd, 0, cpdist, cpdext, td, bd, hp, &hn, v);
 820:	8b 4c 24 60          	mov    0x60(%esp),%ecx
 824:	8b 44 24 68          	mov    0x68(%esp),%eax
 828:	8b 54 24 78          	mov    0x78(%esp),%edx
 82c:	89 74 24 18          	mov    %esi,0x18(%esp)
 830:	8d 04 88             	lea    (%eax,%ecx,4),%eax
 833:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
 837:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 83b:	8b 4c 24 70          	mov    0x70(%esp),%ecx
 83f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 843:	89 54 24 08          	mov    %edx,0x8(%esp)
 847:	31 c9                	xor    %ecx,%ecx
 849:	89 6c 24 14          	mov    %ebp,0x14(%esp)
 84d:	c7 44 24 04 00 01 00 	movl   $0x100,0x4(%esp)
 854:	00 
 855:	c7 04 24 80 01 00 00 	movl   $0x180,(%esp)
 85c:	8b 54 24 64          	mov    0x64(%esp),%edx
 860:	e8 9b f7 ff ff       	call   0 <_huft_build>
  if (r != Z_OK || (*bd == 0 && nl > 257))
 865:	85 c0                	test   %eax,%eax
 867:	75 27                	jne    890 <_inflate_trees_dynamic+0x140>
 869:	81 7c 24 60 01 01 00 	cmpl   $0x101,0x60(%esp)
 870:	00 
 871:	76 3d                	jbe    8b0 <_inflate_trees_dynamic+0x160>
 873:	8b 44 24 70          	mov    0x70(%esp),%eax
 877:	8b 00                	mov    (%eax),%eax
 879:	85 c0                	test   %eax,%eax
 87b:	75 33                	jne    8b0 <_inflate_trees_dynamic+0x160>
      z->msg = (char*)"incomplete distance tree";
      r = Z_DATA_ERROR;
    }
    else if (r != Z_MEM_ERROR)
    {
      z->msg = (char*)"empty distance tree with lengths";
 87d:	c7 43 18 c8 00 00 00 	movl   $0xc8,0x18(%ebx)
      r = Z_DATA_ERROR;
 884:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 889:	e9 50 ff ff ff       	jmp    7de <_inflate_trees_dynamic+0x8e>
 88e:	66 90                	xchg   %ax,%ax

  /* build distance tree */
  r = huft_build(c + nl, nd, 0, cpdist, cpdext, td, bd, hp, &hn, v);
  if (r != Z_OK || (*bd == 0 && nl > 257))
  {
    if (r == Z_DATA_ERROR)
 890:	83 f8 fd             	cmp    $0xfffffffd,%eax
 893:	74 0f                	je     8a4 <_inflate_trees_dynamic+0x154>
      z->msg = (char*)"oversubscribed distance tree";
    else if (r == Z_BUF_ERROR) {
 895:	83 f8 fb             	cmp    $0xfffffffb,%eax
 898:	74 2a                	je     8c4 <_inflate_trees_dynamic+0x174>
    }
#else
      z->msg = (char*)"incomplete distance tree";
      r = Z_DATA_ERROR;
    }
    else if (r != Z_MEM_ERROR)
 89a:	83 f8 fc             	cmp    $0xfffffffc,%eax
 89d:	75 de                	jne    87d <_inflate_trees_dynamic+0x12d>
 89f:	e9 3a ff ff ff       	jmp    7de <_inflate_trees_dynamic+0x8e>
  /* build distance tree */
  r = huft_build(c + nl, nd, 0, cpdist, cpdext, td, bd, hp, &hn, v);
  if (r != Z_OK || (*bd == 0 && nl > 257))
  {
    if (r == Z_DATA_ERROR)
      z->msg = (char*)"oversubscribed distance tree";
 8a4:	c7 43 18 8f 00 00 00 	movl   $0x8f,0x18(%ebx)
 8ab:	e9 2e ff ff ff       	jmp    7de <_inflate_trees_dynamic+0x8e>
    return r;
#endif
  }

  /* done */
  ZFREE(z, v);
 8b0:	89 74 24 04          	mov    %esi,0x4(%esp)
 8b4:	8b 43 28             	mov    0x28(%ebx),%eax
 8b7:	89 04 24             	mov    %eax,(%esp)
 8ba:	ff 53 24             	call   *0x24(%ebx)
  return Z_OK;
 8bd:	31 c0                	xor    %eax,%eax
 8bf:	e9 2f ff ff ff       	jmp    7f3 <_inflate_trees_dynamic+0xa3>
    else if (r == Z_BUF_ERROR) {
#ifdef PKZIP_BUG_WORKAROUND
      r = Z_OK;
    }
#else
      z->msg = (char*)"incomplete distance tree";
 8c4:	c7 43 18 ac 00 00 00 	movl   $0xac,0x18(%ebx)
      r = Z_DATA_ERROR;
 8cb:	b0 fd                	mov    $0xfd,%al
 8cd:	e9 0c ff ff ff       	jmp    7de <_inflate_trees_dynamic+0x8e>
  uInt hn = 0;          /* hufts used in space */
  uIntf *v;             /* work area for huft_build */

  /* allocate work area */
  if ((v = (uIntf*)ZALLOC(z, 288, sizeof(uInt))) == Z_NULL)
    return Z_MEM_ERROR;
 8d2:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
 8d7:	e9 17 ff ff ff       	jmp    7f3 <_inflate_trees_dynamic+0xa3>
 8dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008e0 <_inflate_trees_fixed>:
    ZFREE(z, v);
    ZFREE(z, c);
    fixed_built = 1;
  }
#endif
  *bl = fixed_bl;
 8e0:	8b 44 24 04          	mov    0x4(%esp),%eax
 8e4:	c7 00 09 00 00 00    	movl   $0x9,(%eax)
  *bd = fixed_bd;
 8ea:	8b 44 24 08          	mov    0x8(%esp),%eax
 8ee:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  *tl = fixed_tl;
 8f4:	8b 44 24 0c          	mov    0xc(%esp),%eax
 8f8:	c7 00 00 01 00 00    	movl   $0x100,(%eax)
  *td = fixed_td;
 8fe:	8b 44 24 10          	mov    0x10(%esp),%eax
 902:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return Z_OK;
}
 908:	31 c0                	xor    %eax,%eax
 90a:	c3                   	ret    
 90b:	90                   	nop
 90c:	90                   	nop
 90d:	90                   	nop
 90e:	90                   	nop
 90f:	90                   	nop

infutil.o:     file format pe-i386


Disassembly of section .text:

00000000 <_inflate_flush>:
/* copy as much as possible from the sliding window to the output area */
int inflate_flush(s, z, r)
inflate_blocks_statef *s;
z_streamp z;
int r;
{
   0:	55                   	push   %ebp
   1:	57                   	push   %edi
   2:	56                   	push   %esi
   3:	53                   	push   %ebx
   4:	83 ec 2c             	sub    $0x2c,%esp
   7:	8b 74 24 40          	mov    0x40(%esp),%esi
   b:	8b 7c 24 44          	mov    0x44(%esp),%edi
  Bytef *p;
  Bytef *q;

  /* local copies of source and destination pointers */
  p = z->next_out;
  q = s->read;
   f:	8b 56 30             	mov    0x30(%esi),%edx

  /* compute number of bytes to copy as far as end of window */
  n = (uInt)((q <= s->write ? s->write : s->end) - q);
  12:	8b 5e 34             	mov    0x34(%esi),%ebx
  uInt n;
  Bytef *p;
  Bytef *q;

  /* local copies of source and destination pointers */
  p = z->next_out;
  15:	8b 6f 0c             	mov    0xc(%edi),%ebp
  q = s->read;

  /* compute number of bytes to copy as far as end of window */
  n = (uInt)((q <= s->write ? s->write : s->end) - q);
  18:	39 da                	cmp    %ebx,%edx
  1a:	76 03                	jbe    1f <_inflate_flush+0x1f>
  1c:	8b 5e 2c             	mov    0x2c(%esi),%ebx
  1f:	29 d3                	sub    %edx,%ebx
  if (n > z->avail_out) n = z->avail_out;
  21:	8b 47 10             	mov    0x10(%edi),%eax
  24:	39 c3                	cmp    %eax,%ebx
  26:	0f 47 d8             	cmova  %eax,%ebx
  if (n && r == Z_BUF_ERROR) r = Z_OK;
  29:	85 db                	test   %ebx,%ebx
  2b:	74 13                	je     40 <_inflate_flush+0x40>
  2d:	b9 00 00 00 00       	mov    $0x0,%ecx
  32:	83 7c 24 48 fb       	cmpl   $0xfffffffb,0x48(%esp)
  37:	0f 45 4c 24 48       	cmovne 0x48(%esp),%ecx
  3c:	89 4c 24 48          	mov    %ecx,0x48(%esp)

  /* update counters */
  z->avail_out -= n;
  40:	29 d8                	sub    %ebx,%eax
  z->total_out += n;
  42:	8b 4f 14             	mov    0x14(%edi),%ecx
  45:	01 d9                	add    %ebx,%ecx
  n = (uInt)((q <= s->write ? s->write : s->end) - q);
  if (n > z->avail_out) n = z->avail_out;
  if (n && r == Z_BUF_ERROR) r = Z_OK;

  /* update counters */
  z->avail_out -= n;
  47:	89 47 10             	mov    %eax,0x10(%edi)
  z->total_out += n;

  /* update check information */
  if (s->checkfn != Z_NULL)
  4a:	8b 46 38             	mov    0x38(%esi),%eax
  if (n > z->avail_out) n = z->avail_out;
  if (n && r == Z_BUF_ERROR) r = Z_OK;

  /* update counters */
  z->avail_out -= n;
  z->total_out += n;
  4d:	89 4f 14             	mov    %ecx,0x14(%edi)

  /* update check information */
  if (s->checkfn != Z_NULL)
  50:	85 c0                	test   %eax,%eax
  52:	74 1e                	je     72 <_inflate_flush+0x72>
    z->adler = s->check = (*s->checkfn)(s->check, q, n);
  54:	89 54 24 04          	mov    %edx,0x4(%esp)
  58:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  5c:	8b 4e 3c             	mov    0x3c(%esi),%ecx
  5f:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  63:	89 0c 24             	mov    %ecx,(%esp)
  66:	ff d0                	call   *%eax
  68:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  6c:	89 46 3c             	mov    %eax,0x3c(%esi)
  6f:	89 47 30             	mov    %eax,0x30(%edi)

  /* copy as far as end of window */
  zmemcpy(p, q, n);
  72:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  76:	89 54 24 04          	mov    %edx,0x4(%esp)
  7a:	89 2c 24             	mov    %ebp,(%esp)
  7d:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  81:	e8 00 00 00 00       	call   86 <_inflate_flush+0x86>
  p += n;
  q += n;
  86:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  if (s->checkfn != Z_NULL)
    z->adler = s->check = (*s->checkfn)(s->check, q, n);

  /* copy as far as end of window */
  zmemcpy(p, q, n);
  p += n;
  8a:	01 dd                	add    %ebx,%ebp
  q += n;

  /* see if more to copy at beginning of window */
  if (q == s->end)
  8c:	8b 46 2c             	mov    0x2c(%esi),%eax
    z->adler = s->check = (*s->checkfn)(s->check, q, n);

  /* copy as far as end of window */
  zmemcpy(p, q, n);
  p += n;
  q += n;
  8f:	01 d3                	add    %edx,%ebx

  /* see if more to copy at beginning of window */
  if (q == s->end)
  91:	39 d8                	cmp    %ebx,%eax
  93:	74 12                	je     a7 <_inflate_flush+0xa7>
    p += n;
    q += n;
  }

  /* update pointers */
  z->next_out = p;
  95:	89 6f 0c             	mov    %ebp,0xc(%edi)
  s->read = q;

  /* done */
  return r;
}
  98:	8b 44 24 48          	mov    0x48(%esp),%eax
    q += n;
  }

  /* update pointers */
  z->next_out = p;
  s->read = q;
  9c:	89 5e 30             	mov    %ebx,0x30(%esi)

  /* done */
  return r;
}
  9f:	83 c4 2c             	add    $0x2c,%esp
  a2:	5b                   	pop    %ebx
  a3:	5e                   	pop    %esi
  a4:	5f                   	pop    %edi
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    
  /* see if more to copy at beginning of window */
  if (q == s->end)
  {
    /* wrap pointers */
    q = s->window;
    if (s->write == s->end)
  a7:	8b 5e 34             	mov    0x34(%esi),%ebx

  /* see if more to copy at beginning of window */
  if (q == s->end)
  {
    /* wrap pointers */
    q = s->window;
  aa:	8b 4e 28             	mov    0x28(%esi),%ecx
    if (s->write == s->end)
  ad:	39 d8                	cmp    %ebx,%eax
  af:	74 74                	je     125 <_inflate_flush+0x125>
      s->write = s->window;

    /* compute bytes to copy */
    n = (uInt)(s->write - q);
    if (n > z->avail_out) n = z->avail_out;
  b1:	8b 47 10             	mov    0x10(%edi),%eax
  b4:	29 cb                	sub    %ecx,%ebx
  b6:	39 d8                	cmp    %ebx,%eax
  b8:	0f 46 d8             	cmovbe %eax,%ebx
    if (n && r == Z_BUF_ERROR) r = Z_OK;
  bb:	85 db                	test   %ebx,%ebx
  bd:	74 13                	je     d2 <_inflate_flush+0xd2>
  bf:	ba 00 00 00 00       	mov    $0x0,%edx
  c4:	83 7c 24 48 fb       	cmpl   $0xfffffffb,0x48(%esp)
  c9:	0f 45 54 24 48       	cmovne 0x48(%esp),%edx
  ce:	89 54 24 48          	mov    %edx,0x48(%esp)

    /* update counters */
    z->avail_out -= n;
  d2:	29 d8                	sub    %ebx,%eax
  d4:	89 47 10             	mov    %eax,0x10(%edi)
    z->total_out += n;
  d7:	8b 47 14             	mov    0x14(%edi),%eax
  da:	01 d8                	add    %ebx,%eax
  dc:	89 47 14             	mov    %eax,0x14(%edi)

    /* update check information */
    if (s->checkfn != Z_NULL)
  df:	8b 46 38             	mov    0x38(%esi),%eax
  e2:	85 c0                	test   %eax,%eax
  e4:	74 1e                	je     104 <_inflate_flush+0x104>
      z->adler = s->check = (*s->checkfn)(s->check, q, n);
  e6:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  ea:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  ee:	8b 56 3c             	mov    0x3c(%esi),%edx
  f1:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
  f5:	89 14 24             	mov    %edx,(%esp)
  f8:	ff d0                	call   *%eax
  fa:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  fe:	89 46 3c             	mov    %eax,0x3c(%esi)
 101:	89 47 30             	mov    %eax,0x30(%edi)

    /* copy */
    zmemcpy(p, q, n);
 104:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 108:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 10c:	89 2c 24             	mov    %ebp,(%esp)
 10f:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
 113:	e8 00 00 00 00       	call   118 <_inflate_flush+0x118>
    p += n;
    q += n;
 118:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    if (s->checkfn != Z_NULL)
      z->adler = s->check = (*s->checkfn)(s->check, q, n);

    /* copy */
    zmemcpy(p, q, n);
    p += n;
 11c:	01 dd                	add    %ebx,%ebp
    q += n;
 11e:	01 cb                	add    %ecx,%ebx
 120:	e9 70 ff ff ff       	jmp    95 <_inflate_flush+0x95>
  if (q == s->end)
  {
    /* wrap pointers */
    q = s->window;
    if (s->write == s->end)
      s->write = s->window;
 125:	89 4e 34             	mov    %ecx,0x34(%esi)

    /* compute bytes to copy */
    n = (uInt)(s->write - q);
    if (n > z->avail_out) n = z->avail_out;
 128:	8b 47 10             	mov    0x10(%edi),%eax
 12b:	31 db                	xor    %ebx,%ebx
 12d:	eb a3                	jmp    d2 <_inflate_flush+0xd2>
 12f:	90                   	nop

trees.o:     file format pe-i386


Disassembly of section .text:

00000000 <_pqdownheap>:
 */
local void pqdownheap(s, tree, k)
    deflate_state *s;
    ct_data *tree;  /* the tree to restore */
    int k;               /* node to move down */
{
       0:	55                   	push   %ebp
    int v = s->heap[k];
       1:	8d a9 d4 02 00 00    	lea    0x2d4(%ecx),%ebp
 */
local void pqdownheap(s, tree, k)
    deflate_state *s;
    ct_data *tree;  /* the tree to restore */
    int k;               /* node to move down */
{
       7:	57                   	push   %edi
       8:	56                   	push   %esi
       9:	53                   	push   %ebx
    int v = s->heap[k];
    int j = k << 1;  /* left son of k */
       a:	01 c9                	add    %ecx,%ecx
 */
local void pqdownheap(s, tree, k)
    deflate_state *s;
    ct_data *tree;  /* the tree to restore */
    int k;               /* node to move down */
{
       c:	83 ec 18             	sub    $0x18,%esp
    int v = s->heap[k];
       f:	8b 74 a8 04          	mov    0x4(%eax,%ebp,4),%esi
      13:	89 f7                	mov    %esi,%edi
      15:	89 74 24 14          	mov    %esi,0x14(%esp)
    int j = k << 1;  /* left son of k */
    while (j <= s->heap_len) {
      19:	8b b0 48 14 00 00    	mov    0x1448(%eax),%esi
 */
local void pqdownheap(s, tree, k)
    deflate_state *s;
    ct_data *tree;  /* the tree to restore */
    int k;               /* node to move down */
{
      1f:	89 54 24 08          	mov    %edx,0x8(%esp)
    int v = s->heap[k];
    int j = k << 1;  /* left son of k */
    while (j <= s->heap_len) {
      23:	89 74 24 04          	mov    %esi,0x4(%esp)
      27:	39 f1                	cmp    %esi,%ecx
      29:	0f 8f 87 00 00 00    	jg     b6 <_pqdownheap+0xb6>
      2f:	8d 14 ba             	lea    (%edx,%edi,4),%edx
      32:	89 54 24 0c          	mov    %edx,0xc(%esp)
      36:	eb 3a                	jmp    72 <_pqdownheap+0x72>
      38:	8b 94 88 54 0b 00 00 	mov    0xb54(%eax,%ecx,4),%edx
      3f:	8b 74 24 08          	mov    0x8(%esp),%esi
        /* Set j to the smallest of the two sons: */
        if (j < s->heap_len &&
      43:	89 0c 24             	mov    %ecx,(%esp)
      46:	66 8b 34 96          	mov    (%esi,%edx,4),%si
            smaller(tree, s->heap[j+1], s->heap[j], s->depth)) {
            j++;
        }
        /* Exit if v is smaller than both sons */
        if (smaller(tree, v, s->heap[j], s->depth)) break;
      4a:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
      4e:	66 39 33             	cmp    %si,(%ebx)
      51:	72 63                	jb     b6 <_pqdownheap+0xb6>
      53:	74 71                	je     c6 <_pqdownheap+0xc6>

        /* Exchange v with the smallest son */
        s->heap[k] = s->heap[j];  k = j;

        /* And continue down the tree, setting j to the left son of k */
        j <<= 1;
      55:	8b 1c 24             	mov    (%esp),%ebx
        }
        /* Exit if v is smaller than both sons */
        if (smaller(tree, v, s->heap[j], s->depth)) break;

        /* Exchange v with the smallest son */
        s->heap[k] = s->heap[j];  k = j;
      58:	89 54 a8 04          	mov    %edx,0x4(%eax,%ebp,4)

        /* And continue down the tree, setting j to the left son of k */
        j <<= 1;
      5c:	8d 0c 1b             	lea    (%ebx,%ebx,1),%ecx
    ct_data *tree;  /* the tree to restore */
    int k;               /* node to move down */
{
    int v = s->heap[k];
    int j = k << 1;  /* left son of k */
    while (j <= s->heap_len) {
      5f:	3b 4c 24 04          	cmp    0x4(%esp),%ecx
      63:	0f 8f 85 00 00 00    	jg     ee <_pqdownheap+0xee>
      69:	8b 14 24             	mov    (%esp),%edx
      6c:	8d aa d4 02 00 00    	lea    0x2d4(%edx),%ebp
        /* Set j to the smallest of the two sons: */
        if (j < s->heap_len &&
      72:	3b 4c 24 04          	cmp    0x4(%esp),%ecx
      76:	7d c0                	jge    38 <_pqdownheap+0x38>
      78:	8d 3c 88             	lea    (%eax,%ecx,4),%edi
            smaller(tree, s->heap[j+1], s->heap[j], s->depth)) {
      7b:	8b 5c 24 08          	mov    0x8(%esp),%ebx
      7f:	8d 71 01             	lea    0x1(%ecx),%esi
      82:	8b 97 58 0b 00 00    	mov    0xb58(%edi),%edx
      88:	8b bf 54 0b 00 00    	mov    0xb54(%edi),%edi
      8e:	89 34 24             	mov    %esi,(%esp)
      91:	89 7c 24 10          	mov    %edi,0x10(%esp)
      95:	66 8b 34 93          	mov    (%ebx,%edx,4),%si
      99:	66 8b 3c bb          	mov    (%ebx,%edi,4),%di
{
    int v = s->heap[k];
    int j = k << 1;  /* left son of k */
    while (j <= s->heap_len) {
        /* Set j to the smallest of the two sons: */
        if (j < s->heap_len &&
      9d:	66 39 fe             	cmp    %di,%si
      a0:	72 a8                	jb     4a <_pqdownheap+0x4a>
            smaller(tree, s->heap[j+1], s->heap[j], s->depth)) {
      a2:	74 60                	je     104 <_pqdownheap+0x104>
            j++;
        }
        /* Exit if v is smaller than both sons */
        if (smaller(tree, v, s->heap[j], s->depth)) break;
      a4:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
      a8:	89 fe                	mov    %edi,%esi
      aa:	8b 54 24 10          	mov    0x10(%esp),%edx
      ae:	89 0c 24             	mov    %ecx,(%esp)
      b1:	66 39 33             	cmp    %si,(%ebx)
      b4:	73 9d                	jae    53 <_pqdownheap+0x53>
        s->heap[k] = s->heap[j];  k = j;

        /* And continue down the tree, setting j to the left son of k */
        j <<= 1;
    }
    s->heap[k] = v;
      b6:	8b 54 24 14          	mov    0x14(%esp),%edx
      ba:	89 54 a8 04          	mov    %edx,0x4(%eax,%ebp,4)
}
      be:	83 c4 18             	add    $0x18,%esp
      c1:	5b                   	pop    %ebx
      c2:	5e                   	pop    %esi
      c3:	5f                   	pop    %edi
      c4:	5d                   	pop    %ebp
      c5:	c3                   	ret    
        if (j < s->heap_len &&
            smaller(tree, s->heap[j+1], s->heap[j], s->depth)) {
            j++;
        }
        /* Exit if v is smaller than both sons */
        if (smaller(tree, v, s->heap[j], s->depth)) break;
      c6:	8b 74 24 14          	mov    0x14(%esp),%esi
      ca:	8a 8c 10 50 14 00 00 	mov    0x1450(%eax,%edx,1),%cl
      d1:	38 8c 30 50 14 00 00 	cmp    %cl,0x1450(%eax,%esi,1)
      d8:	76 dc                	jbe    b6 <_pqdownheap+0xb6>

        /* Exchange v with the smallest son */
        s->heap[k] = s->heap[j];  k = j;

        /* And continue down the tree, setting j to the left son of k */
        j <<= 1;
      da:	8b 1c 24             	mov    (%esp),%ebx
        }
        /* Exit if v is smaller than both sons */
        if (smaller(tree, v, s->heap[j], s->depth)) break;

        /* Exchange v with the smallest son */
        s->heap[k] = s->heap[j];  k = j;
      dd:	89 54 a8 04          	mov    %edx,0x4(%eax,%ebp,4)

        /* And continue down the tree, setting j to the left son of k */
        j <<= 1;
      e1:	8d 0c 1b             	lea    (%ebx,%ebx,1),%ecx
    ct_data *tree;  /* the tree to restore */
    int k;               /* node to move down */
{
    int v = s->heap[k];
    int j = k << 1;  /* left son of k */
    while (j <= s->heap_len) {
      e4:	3b 4c 24 04          	cmp    0x4(%esp),%ecx
      e8:	0f 8e 7b ff ff ff    	jle    69 <_pqdownheap+0x69>
      ee:	8d ab d4 02 00 00    	lea    0x2d4(%ebx),%ebp
        s->heap[k] = s->heap[j];  k = j;

        /* And continue down the tree, setting j to the left son of k */
        j <<= 1;
    }
    s->heap[k] = v;
      f4:	8b 54 24 14          	mov    0x14(%esp),%edx
      f8:	89 54 a8 04          	mov    %edx,0x4(%eax,%ebp,4)
}
      fc:	83 c4 18             	add    $0x18,%esp
      ff:	5b                   	pop    %ebx
     100:	5e                   	pop    %esi
     101:	5f                   	pop    %edi
     102:	5d                   	pop    %ebp
     103:	c3                   	ret    
    int v = s->heap[k];
    int j = k << 1;  /* left son of k */
    while (j <= s->heap_len) {
        /* Set j to the smallest of the two sons: */
        if (j < s->heap_len &&
            smaller(tree, s->heap[j+1], s->heap[j], s->depth)) {
     104:	8b 7c 24 10          	mov    0x10(%esp),%edi
     108:	8a 9c 10 50 14 00 00 	mov    0x1450(%eax,%edx,1),%bl
     10f:	3a 9c 38 50 14 00 00 	cmp    0x1450(%eax,%edi,1),%bl
     116:	0f 46 0c 24          	cmovbe (%esp),%ecx
     11a:	0f 47 d7             	cmova  %edi,%edx
     11d:	89 0c 24             	mov    %ecx,(%esp)
     120:	e9 25 ff ff ff       	jmp    4a <_pqdownheap+0x4a>
     125:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <_build_tree>:
 *     also updated if stree is not null. The field max_code is set.
 */
local void build_tree(s, desc)
    deflate_state *s;
    tree_desc *desc; /* the tree descriptor */
{
     130:	55                   	push   %ebp
     131:	57                   	push   %edi
     132:	56                   	push   %esi
     133:	53                   	push   %ebx
     134:	83 ec 50             	sub    $0x50,%esp
     137:	89 c3                	mov    %eax,%ebx
    ct_data *tree         = desc->dyn_tree;
    const ct_data *stree  = desc->stat_desc->static_tree;
     139:	8b 42 08             	mov    0x8(%edx),%eax
 */
local void build_tree(s, desc)
    deflate_state *s;
    tree_desc *desc; /* the tree descriptor */
{
    ct_data *tree         = desc->dyn_tree;
     13c:	8b 0a                	mov    (%edx),%ecx
 *     also updated if stree is not null. The field max_code is set.
 */
local void build_tree(s, desc)
    deflate_state *s;
    tree_desc *desc; /* the tree descriptor */
{
     13e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    ct_data *tree         = desc->dyn_tree;
     142:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    const ct_data *stree  = desc->stat_desc->static_tree;
    int elems             = desc->stat_desc->elems;
     146:	8b 68 0c             	mov    0xc(%eax),%ebp
local void build_tree(s, desc)
    deflate_state *s;
    tree_desc *desc; /* the tree descriptor */
{
    ct_data *tree         = desc->dyn_tree;
    const ct_data *stree  = desc->stat_desc->static_tree;
     149:	8b 38                	mov    (%eax),%edi
     * heap[SMALLEST]. The sons of heap[n] are heap[2*n] and heap[2*n+1].
     * heap[0] is not used.
     */
    s->heap_len = 0, s->heap_max = HEAP_SIZE;

    for (n = 0; n < elems; n++) {
     14b:	85 ed                	test   %ebp,%ebp

    /* Construct the initial heap, with least frequent element in
     * heap[SMALLEST]. The sons of heap[n] are heap[2*n] and heap[2*n+1].
     * heap[0] is not used.
     */
    s->heap_len = 0, s->heap_max = HEAP_SIZE;
     14d:	c7 83 48 14 00 00 00 	movl   $0x0,0x1448(%ebx)
     154:	00 00 00 
     157:	c7 83 4c 14 00 00 3d 	movl   $0x23d,0x144c(%ebx)
     15e:	02 00 00 

    for (n = 0; n < elems; n++) {
     161:	0f 8e 5c 04 00 00    	jle    5c3 <_build_tree+0x493>
     167:	89 ca                	mov    %ecx,%edx
     169:	31 c0                	xor    %eax,%eax
     16b:	83 c9 ff             	or     $0xffffffff,%ecx
     16e:	eb 28                	jmp    198 <_build_tree+0x68>
        if (tree[n].Freq != 0) {
            s->heap[++(s->heap_len)] = max_code = n;
     170:	8b 8b 48 14 00 00    	mov    0x1448(%ebx),%ecx
     176:	83 c2 04             	add    $0x4,%edx
     179:	8d 71 01             	lea    0x1(%ecx),%esi
     17c:	89 b3 48 14 00 00    	mov    %esi,0x1448(%ebx)
     182:	89 84 8b 58 0b 00 00 	mov    %eax,0xb58(%ebx,%ecx,4)
            s->depth[n] = 0;
     189:	c6 84 03 50 14 00 00 	movb   $0x0,0x1450(%ebx,%eax,1)
     190:	00 
     191:	89 c1                	mov    %eax,%ecx
     * heap[SMALLEST]. The sons of heap[n] are heap[2*n] and heap[2*n+1].
     * heap[0] is not used.
     */
    s->heap_len = 0, s->heap_max = HEAP_SIZE;

    for (n = 0; n < elems; n++) {
     193:	40                   	inc    %eax
     194:	39 e8                	cmp    %ebp,%eax
     196:	74 14                	je     1ac <_build_tree+0x7c>
        if (tree[n].Freq != 0) {
     198:	66 83 3a 00          	cmpw   $0x0,(%edx)
     19c:	75 d2                	jne    170 <_build_tree+0x40>
     * heap[SMALLEST]. The sons of heap[n] are heap[2*n] and heap[2*n+1].
     * heap[0] is not used.
     */
    s->heap_len = 0, s->heap_max = HEAP_SIZE;

    for (n = 0; n < elems; n++) {
     19e:	40                   	inc    %eax
        if (tree[n].Freq != 0) {
            s->heap[++(s->heap_len)] = max_code = n;
            s->depth[n] = 0;
        } else {
            tree[n].Len = 0;
     19f:	66 c7 42 02 00 00    	movw   $0x0,0x2(%edx)
     1a5:	83 c2 04             	add    $0x4,%edx
     * heap[SMALLEST]. The sons of heap[n] are heap[2*n] and heap[2*n+1].
     * heap[0] is not used.
     */
    s->heap_len = 0, s->heap_max = HEAP_SIZE;

    for (n = 0; n < elems; n++) {
     1a8:	39 e8                	cmp    %ebp,%eax
     1aa:	75 ec                	jne    198 <_build_tree+0x68>
     1ac:	89 2c 24             	mov    %ebp,(%esp)
     1af:	8b 83 48 14 00 00    	mov    0x1448(%ebx),%eax
     1b5:	89 ce                	mov    %ecx,%esi
     1b7:	8b 6c 24 08          	mov    0x8(%esp),%ebp
     1bb:	eb 46                	jmp    203 <_build_tree+0xd3>
     1bd:	31 c9                	xor    %ecx,%ecx
     * and that at least one bit should be sent even if there is only one
     * possible code. So to avoid special checks later on we force at least
     * two codes of non zero frequency.
     */
    while (s->heap_len < 2) {
        node = s->heap[++(s->heap_len)] = (max_code < 2 ? ++max_code : 0);
     1bf:	31 d2                	xor    %edx,%edx
     1c1:	89 94 83 54 0b 00 00 	mov    %edx,0xb54(%ebx,%eax,4)
        tree[node].Freq = 1;
     1c8:	66 c7 44 0d 00 01 00 	movw   $0x1,0x0(%ebp,%ecx,1)
        s->depth[node] = 0;
        s->opt_len--; if (stree) s->static_len -= stree[node].Len;
     1cf:	8b 83 a0 16 00 00    	mov    0x16a0(%ebx),%eax
     * two codes of non zero frequency.
     */
    while (s->heap_len < 2) {
        node = s->heap[++(s->heap_len)] = (max_code < 2 ? ++max_code : 0);
        tree[node].Freq = 1;
        s->depth[node] = 0;
     1d5:	c6 84 13 50 14 00 00 	movb   $0x0,0x1450(%ebx,%edx,1)
     1dc:	00 
        s->opt_len--; if (stree) s->static_len -= stree[node].Len;
     1dd:	48                   	dec    %eax
     1de:	85 ff                	test   %edi,%edi
     1e0:	89 83 a0 16 00 00    	mov    %eax,0x16a0(%ebx)
     1e6:	74 15                	je     1fd <_build_tree+0xcd>
     1e8:	31 c0                	xor    %eax,%eax
     1ea:	8b 93 a4 16 00 00    	mov    0x16a4(%ebx),%edx
     1f0:	66 8b 44 0f 02       	mov    0x2(%edi,%ecx,1),%ax
     1f5:	29 c2                	sub    %eax,%edx
     1f7:	89 93 a4 16 00 00    	mov    %edx,0x16a4(%ebx)
     1fd:	8b 83 48 14 00 00    	mov    0x1448(%ebx),%eax
    /* The pkzip format requires that at least one distance code exists,
     * and that at least one bit should be sent even if there is only one
     * possible code. So to avoid special checks later on we force at least
     * two codes of non zero frequency.
     */
    while (s->heap_len < 2) {
     203:	83 f8 01             	cmp    $0x1,%eax
     206:	7f 18                	jg     220 <_build_tree+0xf0>
        node = s->heap[++(s->heap_len)] = (max_code < 2 ? ++max_code : 0);
     208:	40                   	inc    %eax
     209:	83 fe 01             	cmp    $0x1,%esi
     20c:	89 83 48 14 00 00    	mov    %eax,0x1448(%ebx)
     212:	7f a9                	jg     1bd <_build_tree+0x8d>
     214:	46                   	inc    %esi
     215:	89 f2                	mov    %esi,%edx
     217:	8d 0c b5 00 00 00 00 	lea    0x0(,%esi,4),%ecx
     21e:	eb a1                	jmp    1c1 <_build_tree+0x91>
        tree[node].Freq = 1;
        s->depth[node] = 0;
        s->opt_len--; if (stree) s->static_len -= stree[node].Len;
        /* node is 0 or 1 so it does not have extra bits */
    }
    desc->max_code = max_code;
     220:	8b 7c 24 0c          	mov    0xc(%esp),%edi
     224:	89 74 24 28          	mov    %esi,0x28(%esp)

    /* The elements heap[heap_len/2+1 .. heap_len] are leaves of the tree,
     * establish sub-heaps of increasing lengths:
     */
    for (n = s->heap_len/2; n >= 1; n--) pqdownheap(s, tree, n);
     228:	d1 f8                	sar    %eax
     22a:	8b 2c 24             	mov    (%esp),%ebp
        tree[node].Freq = 1;
        s->depth[node] = 0;
        s->opt_len--; if (stree) s->static_len -= stree[node].Len;
        /* node is 0 or 1 so it does not have extra bits */
    }
    desc->max_code = max_code;
     22d:	89 77 04             	mov    %esi,0x4(%edi)

    /* The elements heap[heap_len/2+1 .. heap_len] are leaves of the tree,
     * establish sub-heaps of increasing lengths:
     */
    for (n = s->heap_len/2; n >= 1; n--) pqdownheap(s, tree, n);
     230:	89 c6                	mov    %eax,%esi
     232:	8b 7c 24 08          	mov    0x8(%esp),%edi
     236:	89 f1                	mov    %esi,%ecx
     238:	89 fa                	mov    %edi,%edx
     23a:	89 d8                	mov    %ebx,%eax
     23c:	e8 bf fd ff ff       	call   0 <_pqdownheap>
     241:	4e                   	dec    %esi
     242:	75 f2                	jne    236 <_build_tree+0x106>
     244:	8b 83 48 14 00 00    	mov    0x1448(%ebx),%eax
     24a:	eb 06                	jmp    252 <_build_tree+0x122>
     24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            fprintf(stderr,"\nnode %d(%d), sons %d(%d) %d(%d)",
                    node, tree[node].Freq, n, tree[n].Freq, m, tree[m].Freq);
        }
#endif
        /* and insert the new node in the heap */
        s->heap[SMALLEST] = node++;
     250:	89 f5                	mov    %esi,%ebp
    /* Construct the Huffman tree by repeatedly combining the least two
     * frequent nodes.
     */
    node = elems;              /* next internal node of the tree */
    do {
        pqremove(s, tree, n);  /* n = node of least frequency */
     252:	8b 7c 24 08          	mov    0x8(%esp),%edi
     256:	8d 50 ff             	lea    -0x1(%eax),%edx
     259:	8b 84 83 54 0b 00 00 	mov    0xb54(%ebx,%eax,4),%eax
     260:	8b b3 58 0b 00 00    	mov    0xb58(%ebx),%esi
     266:	89 93 48 14 00 00    	mov    %edx,0x1448(%ebx)
     26c:	89 83 58 0b 00 00    	mov    %eax,0xb58(%ebx)
     272:	89 fa                	mov    %edi,%edx
     274:	b9 01 00 00 00       	mov    $0x1,%ecx
     279:	89 d8                	mov    %ebx,%eax
     27b:	e8 80 fd ff ff       	call   0 <_pqdownheap>
        m = s->heap[SMALLEST]; /* m = node of next least frequency */

        s->heap[--(s->heap_max)] = n; /* keep the nodes sorted by frequency */
     280:	8b 93 4c 14 00 00    	mov    0x144c(%ebx),%edx
     286:	8d 0c 93             	lea    (%ebx,%edx,4),%ecx
     * frequent nodes.
     */
    node = elems;              /* next internal node of the tree */
    do {
        pqremove(s, tree, n);  /* n = node of least frequency */
        m = s->heap[SMALLEST]; /* m = node of next least frequency */
     289:	8b 83 58 0b 00 00    	mov    0xb58(%ebx),%eax

        s->heap[--(s->heap_max)] = n; /* keep the nodes sorted by frequency */
        s->heap[--(s->heap_max)] = m;
     28f:	83 ea 02             	sub    $0x2,%edx

        /* Create a new node father of n and m */
        tree[node].Freq = tree[n].Freq + tree[m].Freq;
     292:	89 7c 24 08          	mov    %edi,0x8(%esp)
    node = elems;              /* next internal node of the tree */
    do {
        pqremove(s, tree, n);  /* n = node of least frequency */
        m = s->heap[SMALLEST]; /* m = node of next least frequency */

        s->heap[--(s->heap_max)] = n; /* keep the nodes sorted by frequency */
     296:	89 b1 50 0b 00 00    	mov    %esi,0xb50(%ecx)
        s->heap[--(s->heap_max)] = m;
     29c:	89 93 4c 14 00 00    	mov    %edx,0x144c(%ebx)
     2a2:	89 81 4c 0b 00 00    	mov    %eax,0xb4c(%ecx)

        /* Create a new node father of n and m */
        tree[node].Freq = tree[n].Freq + tree[m].Freq;
     2a8:	8d 0c b7             	lea    (%edi,%esi,4),%ecx
     2ab:	89 0c 24             	mov    %ecx,(%esp)
     2ae:	8d 0c 87             	lea    (%edi,%eax,4),%ecx
     2b1:	89 ca                	mov    %ecx,%edx
     2b3:	8b 0c 24             	mov    (%esp),%ecx
     2b6:	66 8b 09             	mov    (%ecx),%cx
     2b9:	66 03 0a             	add    (%edx),%cx
     2bc:	66 89 0c af          	mov    %cx,(%edi,%ebp,4)
        s->depth[node] = (uch) (MAX(s->depth[n], s->depth[m]) + 1);
     2c0:	8a 8c 03 50 14 00 00 	mov    0x1450(%ebx,%eax,1),%cl
     2c7:	0f b6 b4 33 50 14 00 	movzbl 0x1450(%ebx,%esi,1),%esi
     2ce:	00 
     2cf:	8d 41 01             	lea    0x1(%ecx),%eax
     2d2:	88 44 24 04          	mov    %al,0x4(%esp)
     2d6:	89 f0                	mov    %esi,%eax
     2d8:	38 c8                	cmp    %cl,%al
     2da:	8d 7e 01             	lea    0x1(%esi),%edi
     2dd:	8a 44 24 04          	mov    0x4(%esp),%al
                    node, tree[node].Freq, n, tree[n].Freq, m, tree[m].Freq);
        }
#endif
        /* and insert the new node in the heap */
        s->heap[SMALLEST] = node++;
        pqdownheap(s, tree, SMALLEST);
     2e1:	b9 01 00 00 00       	mov    $0x1,%ecx
        s->heap[--(s->heap_max)] = n; /* keep the nodes sorted by frequency */
        s->heap[--(s->heap_max)] = m;

        /* Create a new node father of n and m */
        tree[node].Freq = tree[n].Freq + tree[m].Freq;
        s->depth[node] = (uch) (MAX(s->depth[n], s->depth[m]) + 1);
     2e6:	0f 43 c7             	cmovae %edi,%eax
     2e9:	88 84 2b 50 14 00 00 	mov    %al,0x1450(%ebx,%ebp,1)
        tree[n].Dad = tree[m].Dad = (ush)node;
     2f0:	8b 04 24             	mov    (%esp),%eax
     2f3:	66 89 6a 02          	mov    %bp,0x2(%edx)
                    node, tree[node].Freq, n, tree[n].Freq, m, tree[m].Freq);
        }
#endif
        /* and insert the new node in the heap */
        s->heap[SMALLEST] = node++;
        pqdownheap(s, tree, SMALLEST);
     2f7:	8b 54 24 08          	mov    0x8(%esp),%edx
        s->heap[--(s->heap_max)] = m;

        /* Create a new node father of n and m */
        tree[node].Freq = tree[n].Freq + tree[m].Freq;
        s->depth[node] = (uch) (MAX(s->depth[n], s->depth[m]) + 1);
        tree[n].Dad = tree[m].Dad = (ush)node;
     2fb:	66 89 68 02          	mov    %bp,0x2(%eax)
                    node, tree[node].Freq, n, tree[n].Freq, m, tree[m].Freq);
        }
#endif
        /* and insert the new node in the heap */
        s->heap[SMALLEST] = node++;
        pqdownheap(s, tree, SMALLEST);
     2ff:	89 d8                	mov    %ebx,%eax
            fprintf(stderr,"\nnode %d(%d), sons %d(%d) %d(%d)",
                    node, tree[node].Freq, n, tree[n].Freq, m, tree[m].Freq);
        }
#endif
        /* and insert the new node in the heap */
        s->heap[SMALLEST] = node++;
     301:	89 ab 58 0b 00 00    	mov    %ebp,0xb58(%ebx)
     307:	8d 75 01             	lea    0x1(%ebp),%esi
        pqdownheap(s, tree, SMALLEST);
     30a:	e8 f1 fc ff ff       	call   0 <_pqdownheap>

    } while (s->heap_len >= 2);
     30f:	8b 83 48 14 00 00    	mov    0x1448(%ebx),%eax
     315:	83 f8 01             	cmp    $0x1,%eax
     318:	0f 8f 32 ff ff ff    	jg     250 <_build_tree+0x120>

    s->heap[--(s->heap_max)] = s->heap[SMALLEST];
     31e:	8b 83 4c 14 00 00    	mov    0x144c(%ebx),%eax
     324:	8b 8b 58 0b 00 00    	mov    0xb58(%ebx),%ecx
     32a:	8d 50 ff             	lea    -0x1(%eax),%edx
     32d:	89 93 4c 14 00 00    	mov    %edx,0x144c(%ebx)
     333:	89 8c 83 50 0b 00 00 	mov    %ecx,0xb50(%ebx,%eax,4)
 */
local void gen_bitlen(s, desc)
    deflate_state *s;
    tree_desc *desc;    /* the tree descriptor */
{
    ct_data *tree        = desc->dyn_tree;
     33a:	8b 44 24 0c          	mov    0xc(%esp),%eax
     33e:	8d 93 54 0b 00 00    	lea    0xb54(%ebx),%edx
     344:	8b 38                	mov    (%eax),%edi
     346:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    int max_code         = desc->max_code;
     34a:	8b 78 04             	mov    0x4(%eax),%edi
    const ct_data *stree = desc->stat_desc->static_tree;
     34d:	8b 40 08             	mov    0x8(%eax),%eax
local void gen_bitlen(s, desc)
    deflate_state *s;
    tree_desc *desc;    /* the tree descriptor */
{
    ct_data *tree        = desc->dyn_tree;
    int max_code         = desc->max_code;
     350:	89 3c 24             	mov    %edi,(%esp)
    const ct_data *stree = desc->stat_desc->static_tree;
     353:	8b 38                	mov    (%eax),%edi
    const intf *extra    = desc->stat_desc->extra_bits;
    int base             = desc->stat_desc->extra_base;
    int max_length       = desc->stat_desc->max_length;
     355:	8b 68 10             	mov    0x10(%eax),%ebp
    deflate_state *s;
    tree_desc *desc;    /* the tree descriptor */
{
    ct_data *tree        = desc->dyn_tree;
    int max_code         = desc->max_code;
    const ct_data *stree = desc->stat_desc->static_tree;
     358:	89 7c 24 20          	mov    %edi,0x20(%esp)
    const intf *extra    = desc->stat_desc->extra_bits;
     35c:	8b 78 04             	mov    0x4(%eax),%edi
     35f:	89 7c 24 24          	mov    %edi,0x24(%esp)
    int base             = desc->stat_desc->extra_base;
     363:	8b 78 08             	mov    0x8(%eax),%edi
     366:	8d 83 34 0b 00 00    	lea    0xb34(%ebx),%eax
     36c:	89 7c 24 18          	mov    %edi,0x18(%esp)
     370:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    int bits;           /* bit length */
    int xbits;          /* extra bits */
    ush f;              /* frequency */
    int overflow = 0;   /* number of elements with bit length too large */

    for (bits = 0; bits <= MAX_BITS; bits++) s->bl_count[bits] = 0;
     374:	66 c7 00 00 00       	movw   $0x0,(%eax)
     379:	83 c0 02             	add    $0x2,%eax
     37c:	39 d0                	cmp    %edx,%eax
     37e:	75 f4                	jne    374 <_build_tree+0x244>

    /* In a first pass, compute the optimal bit lengths (which may
     * overflow in the case of the bit length tree).
     */
    tree[s->heap[s->heap_max]].Len = 0; /* root of the heap */
     380:	8b 44 24 0c          	mov    0xc(%esp),%eax
     384:	66 c7 44 88 02 00 00 	movw   $0x0,0x2(%eax,%ecx,4)

    for (h = s->heap_max+1; h < HEAP_SIZE; h++) {
     38b:	8b 83 4c 14 00 00    	mov    0x144c(%ebx),%eax
     391:	3d 3b 02 00 00       	cmp    $0x23b,%eax
     396:	0f 8f ad 01 00 00    	jg     549 <_build_tree+0x419>
     39c:	8d bc 83 58 0b 00 00 	lea    0xb58(%ebx,%eax,4),%edi
     3a3:	8d 83 48 14 00 00    	lea    0x1448(%ebx),%eax
     3a9:	89 44 24 10          	mov    %eax,0x10(%esp)
     3ad:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     3b4:	00 
     3b5:	89 6c 24 04          	mov    %ebp,0x4(%esp)
     3b9:	89 5c 24 14          	mov    %ebx,0x14(%esp)
     3bd:	8d 76 00             	lea    0x0(%esi),%esi
        n = s->heap[h];
     3c0:	8b 17                	mov    (%edi),%edx
        bits = tree[tree[n].Dad].Len + 1;
     3c2:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
     3c6:	31 c0                	xor    %eax,%eax
     3c8:	8d 34 95 00 00 00 00 	lea    0x0(,%edx,4),%esi
     3cf:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
     3d2:	66 8b 41 02          	mov    0x2(%ecx),%ax
     3d6:	66 8b 6c 83 02       	mov    0x2(%ebx,%eax,4),%bp
     3db:	81 e5 ff ff 00 00    	and    $0xffff,%ebp
     3e1:	89 e8                	mov    %ebp,%eax
     3e3:	40                   	inc    %eax
        if (bits > max_length) bits = max_length, overflow++;
     3e4:	39 44 24 04          	cmp    %eax,0x4(%esp)
     3e8:	7d 0d                	jge    3f7 <_build_tree+0x2c7>
     3ea:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
     3ee:	8b 44 24 04          	mov    0x4(%esp),%eax
     3f2:	45                   	inc    %ebp
     3f3:	89 6c 24 1c          	mov    %ebp,0x1c(%esp)
        tree[n].Len = (ush)bits;
     3f7:	66 89 41 02          	mov    %ax,0x2(%ecx)
        /* We overwrite tree[n].Dad which is no longer needed */

        if (n > max_code) continue; /* not a leaf node */
     3fb:	39 14 24             	cmp    %edx,(%esp)
     3fe:	7c 59                	jl     459 <_build_tree+0x329>

        s->bl_count[bits]++;
     400:	8b 5c 24 14          	mov    0x14(%esp),%ebx
        xbits = 0;
     404:	31 ed                	xor    %ebp,%ebp
        tree[n].Len = (ush)bits;
        /* We overwrite tree[n].Dad which is no longer needed */

        if (n > max_code) continue; /* not a leaf node */

        s->bl_count[bits]++;
     406:	66 ff 84 43 34 0b 00 	incw   0xb34(%ebx,%eax,2)
     40d:	00 
        xbits = 0;
        if (n >= base) xbits = extra[n-base];
     40e:	39 54 24 18          	cmp    %edx,0x18(%esp)
     412:	7f 0d                	jg     421 <_build_tree+0x2f1>
     414:	8b 5c 24 18          	mov    0x18(%esp),%ebx
     418:	29 da                	sub    %ebx,%edx
     41a:	8b 5c 24 24          	mov    0x24(%esp),%ebx
     41e:	8b 2c 93             	mov    (%ebx,%edx,4),%ebp
        f = tree[n].Freq;
        s->opt_len += (ulg)f * (bits + xbits);
     421:	31 d2                	xor    %edx,%edx
     423:	01 e8                	add    %ebp,%eax
     425:	66 8b 11             	mov    (%ecx),%dx
     428:	8b 5c 24 14          	mov    0x14(%esp),%ebx
     42c:	0f af c2             	imul   %edx,%eax
     42f:	01 83 a0 16 00 00    	add    %eax,0x16a0(%ebx)
        if (stree) s->static_len += (ulg)f * (stree[n].Len + xbits);
     435:	8b 44 24 20          	mov    0x20(%esp),%eax
     439:	85 c0                	test   %eax,%eax
     43b:	74 1c                	je     459 <_build_tree+0x329>
     43d:	89 c1                	mov    %eax,%ecx
     43f:	31 c0                	xor    %eax,%eax
     441:	66 8b 44 31 02       	mov    0x2(%ecx,%esi,1),%ax
     446:	01 c5                	add    %eax,%ebp
     448:	0f af ea             	imul   %edx,%ebp
     44b:	8b 93 a4 16 00 00    	mov    0x16a4(%ebx),%edx
     451:	01 ea                	add    %ebp,%edx
     453:	89 93 a4 16 00 00    	mov    %edx,0x16a4(%ebx)
     459:	83 c7 04             	add    $0x4,%edi
    /* In a first pass, compute the optimal bit lengths (which may
     * overflow in the case of the bit length tree).
     */
    tree[s->heap[s->heap_max]].Len = 0; /* root of the heap */

    for (h = s->heap_max+1; h < HEAP_SIZE; h++) {
     45c:	3b 7c 24 10          	cmp    0x10(%esp),%edi
     460:	0f 85 5a ff ff ff    	jne    3c0 <_build_tree+0x290>
        if (n >= base) xbits = extra[n-base];
        f = tree[n].Freq;
        s->opt_len += (ulg)f * (bits + xbits);
        if (stree) s->static_len += (ulg)f * (stree[n].Len + xbits);
    }
    if (overflow == 0) return;
     466:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     46a:	8b 6c 24 04          	mov    0x4(%esp),%ebp
     46e:	8b 5c 24 14          	mov    0x14(%esp),%ebx
     472:	85 c0                	test   %eax,%eax
     474:	0f 84 cf 00 00 00    	je     549 <_build_tree+0x419>
     47a:	8d 4d ff             	lea    -0x1(%ebp),%ecx
     47d:	89 c6                	mov    %eax,%esi
     47f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
     483:	8d 0c 6b             	lea    (%ebx,%ebp,2),%ecx
    /* This happens for example on obj2 and pic of the Calgary corpus */

    /* Find the first bit length which could increase: */
    do {
        bits = max_length-1;
        while (s->bl_count[bits] == 0) bits--;
     486:	66 8b 91 32 0b 00 00 	mov    0xb32(%ecx),%dx
     48d:	8b 44 24 10          	mov    0x10(%esp),%eax
     491:	66 85 d2             	test   %dx,%dx
     494:	75 0e                	jne    4a4 <_build_tree+0x374>
     496:	48                   	dec    %eax
     497:	66 8b 94 43 34 0b 00 	mov    0xb34(%ebx,%eax,2),%dx
     49e:	00 
     49f:	66 85 d2             	test   %dx,%dx
     4a2:	74 f2                	je     496 <_build_tree+0x366>
     4a4:	8d 04 43             	lea    (%ebx,%eax,2),%eax
        s->bl_count[bits]--;      /* move one leaf down the tree */
     4a7:	4a                   	dec    %edx
        s->bl_count[bits+1] += 2; /* move one overflow item as its brother */
        s->bl_count[max_length]--;
        /* The brother of the overflow item also moves one step up,
         * but this does not affect bl_count[max_length]
         */
        overflow -= 2;
     4a8:	83 ee 02             	sub    $0x2,%esi
    /* Find the first bit length which could increase: */
    do {
        bits = max_length-1;
        while (s->bl_count[bits] == 0) bits--;
        s->bl_count[bits]--;      /* move one leaf down the tree */
        s->bl_count[bits+1] += 2; /* move one overflow item as its brother */
     4ab:	66 83 80 36 0b 00 00 	addw   $0x2,0xb36(%eax)
     4b2:	02 

    /* Find the first bit length which could increase: */
    do {
        bits = max_length-1;
        while (s->bl_count[bits] == 0) bits--;
        s->bl_count[bits]--;      /* move one leaf down the tree */
     4b3:	66 89 90 34 0b 00 00 	mov    %dx,0xb34(%eax)
        s->bl_count[max_length]--;
        /* The brother of the overflow item also moves one step up,
         * but this does not affect bl_count[max_length]
         */
        overflow -= 2;
    } while (overflow > 0);
     4ba:	85 f6                	test   %esi,%esi
    do {
        bits = max_length-1;
        while (s->bl_count[bits] == 0) bits--;
        s->bl_count[bits]--;      /* move one leaf down the tree */
        s->bl_count[bits+1] += 2; /* move one overflow item as its brother */
        s->bl_count[max_length]--;
     4bc:	66 8b 81 34 0b 00 00 	mov    0xb34(%ecx),%ax
     4c3:	8d 78 ff             	lea    -0x1(%eax),%edi
     4c6:	66 89 b9 34 0b 00 00 	mov    %di,0xb34(%ecx)
        /* The brother of the overflow item also moves one step up,
         * but this does not affect bl_count[max_length]
         */
        overflow -= 2;
    } while (overflow > 0);
     4cd:	7f b7                	jg     486 <_build_tree+0x356>
    /* Now recompute all bit lengths, scanning in increasing frequency.
     * h is still equal to HEAP_SIZE. (It is simpler to reconstruct all
     * lengths instead of fixing only the wrong ones. This idea is taken
     * from 'ar' written by Haruhiko Okumura.)
     */
    for (bits = max_length; bits != 0; bits--) {
     4cf:	85 ed                	test   %ebp,%ebp
     4d1:	74 76                	je     549 <_build_tree+0x419>
     4d3:	b8 3d 02 00 00       	mov    $0x23d,%eax
     4d8:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
     4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n = s->bl_count[bits];
     4e0:	31 f6                	xor    %esi,%esi
     4e2:	66 89 fe             	mov    %di,%si
        while (n != 0) {
     4e5:	85 f6                	test   %esi,%esi
     4e7:	74 45                	je     52e <_build_tree+0x3fe>
     4e9:	89 74 24 04          	mov    %esi,0x4(%esp)
     4ed:	8d 76 00             	lea    0x0(%esi),%esi
            m = s->heap[--h];
     4f0:	48                   	dec    %eax
     4f1:	8b 94 83 54 0b 00 00 	mov    0xb54(%ebx,%eax,4),%edx
            if (m > max_code) continue;
     4f8:	39 14 24             	cmp    %edx,(%esp)
     4fb:	7c f3                	jl     4f0 <_build_tree+0x3c0>
            if (tree[m].Len != (unsigned) bits) {
     4fd:	8d 14 91             	lea    (%ecx,%edx,4),%edx
     500:	31 f6                	xor    %esi,%esi
     502:	66 8b 72 02          	mov    0x2(%edx),%si
     506:	39 ee                	cmp    %ebp,%esi
     508:	74 1e                	je     528 <_build_tree+0x3f8>
                Trace((stderr,"code %d bits %d->%d\n", m, tree[m].Len, bits));
                s->opt_len += ((long)bits - (long)tree[m].Len)
     50a:	89 ef                	mov    %ebp,%edi
     50c:	29 f7                	sub    %esi,%edi
                              *(long)tree[m].Freq;
     50e:	31 f6                	xor    %esi,%esi
     510:	66 8b 32             	mov    (%edx),%si
     513:	0f af f7             	imul   %edi,%esi
        while (n != 0) {
            m = s->heap[--h];
            if (m > max_code) continue;
            if (tree[m].Len != (unsigned) bits) {
                Trace((stderr,"code %d bits %d->%d\n", m, tree[m].Len, bits));
                s->opt_len += ((long)bits - (long)tree[m].Len)
     516:	8b bb a0 16 00 00    	mov    0x16a0(%ebx),%edi
     51c:	01 f7                	add    %esi,%edi
     51e:	89 bb a0 16 00 00    	mov    %edi,0x16a0(%ebx)
                              *(long)tree[m].Freq;
                tree[m].Len = (ush)bits;
     524:	66 89 6a 02          	mov    %bp,0x2(%edx)
     * lengths instead of fixing only the wrong ones. This idea is taken
     * from 'ar' written by Haruhiko Okumura.)
     */
    for (bits = max_length; bits != 0; bits--) {
        n = s->bl_count[bits];
        while (n != 0) {
     528:	ff 4c 24 04          	decl   0x4(%esp)
     52c:	75 c2                	jne    4f0 <_build_tree+0x3c0>
    /* Now recompute all bit lengths, scanning in increasing frequency.
     * h is still equal to HEAP_SIZE. (It is simpler to reconstruct all
     * lengths instead of fixing only the wrong ones. This idea is taken
     * from 'ar' written by Haruhiko Okumura.)
     */
    for (bits = max_length; bits != 0; bits--) {
     52e:	8b 7c 24 10          	mov    0x10(%esp),%edi
     532:	89 fd                	mov    %edi,%ebp
     534:	89 fe                	mov    %edi,%esi
     536:	85 ff                	test   %edi,%edi
     538:	74 0f                	je     549 <_build_tree+0x419>
     53a:	4e                   	dec    %esi
     53b:	66 8b bc 7b 34 0b 00 	mov    0xb34(%ebx,%edi,2),%di
     542:	00 
     543:	89 74 24 10          	mov    %esi,0x10(%esp)
     547:	eb 97                	jmp    4e0 <_build_tree+0x3b0>
    ct_data *tree;             /* the tree to decorate */
    int max_code;              /* largest code with non zero frequency */
    ushf *bl_count;            /* number of codes at each bit length */
{
    ush next_code[MAX_BITS+1]; /* next code value for each bit length */
    ush code = 0;              /* running code value */
     549:	31 d2                	xor    %edx,%edx
    int n;                     /* code index */

    /* The distribution counts are first used to generate the code values
     * without bit reversal.
     */
    for (bits = 1; bits <= MAX_BITS; bits++) {
     54b:	b8 01 00 00 00       	mov    $0x1,%eax
     550:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
        next_code[bits] = code = (code + bl_count[bits-1]) << 1;
     554:	66 03 54 41 fe       	add    -0x2(%ecx,%eax,2),%dx
     559:	01 d2                	add    %edx,%edx
     55b:	66 89 54 44 30       	mov    %dx,0x30(%esp,%eax,2)
    int n;                     /* code index */

    /* The distribution counts are first used to generate the code values
     * without bit reversal.
     */
    for (bits = 1; bits <= MAX_BITS; bits++) {
     560:	40                   	inc    %eax
     561:	83 f8 10             	cmp    $0x10,%eax
     564:	75 ee                	jne    554 <_build_tree+0x424>
     566:	8b 44 24 08          	mov    0x8(%esp),%eax
     56a:	8b 7c 24 28          	mov    0x28(%esp),%edi
     */
    Assert (code + bl_count[MAX_BITS]-1 == (1<<MAX_BITS)-1,
            "inconsistent bit counts");
    Tracev((stderr,"\ngen_codes: max_code %d ", max_code));

    for (n = 0;  n <= max_code; n++) {
     56e:	85 ff                	test   %edi,%edi
     570:	8d 48 02             	lea    0x2(%eax),%ecx
     573:	8d 5c b8 06          	lea    0x6(%eax,%edi,4),%ebx
     577:	78 42                	js     5bb <_build_tree+0x48b>
     579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        int len = tree[n].Len;
     580:	31 d2                	xor    %edx,%edx
     582:	66 8b 11             	mov    (%ecx),%dx
        if (len == 0) continue;
     585:	85 d2                	test   %edx,%edx
     587:	74 2b                	je     5b4 <_build_tree+0x484>
        /* Now reverse the bits */
        tree[n].Code = bi_reverse(next_code[len]++, len);
     589:	66 8b 74 54 30       	mov    0x30(%esp,%edx,2),%si
     58e:	31 ed                	xor    %ebp,%ebp
     590:	66 89 f5             	mov    %si,%bp
     593:	8d 46 01             	lea    0x1(%esi),%eax
     596:	66 89 44 54 30       	mov    %ax,0x30(%esp,%edx,2)
 */
local unsigned bi_reverse(code, len)
    unsigned code; /* the value to invert */
    int len;       /* its bit length */
{
    register unsigned res = 0;
     59b:	31 c0                	xor    %eax,%eax
     59d:	8d 76 00             	lea    0x0(%esi),%esi
    do {
        res |= code & 1;
     5a0:	89 ef                	mov    %ebp,%edi
        code >>= 1, res <<= 1;
     5a2:	d1 ed                	shr    %ebp
    unsigned code; /* the value to invert */
    int len;       /* its bit length */
{
    register unsigned res = 0;
    do {
        res |= code & 1;
     5a4:	83 e7 01             	and    $0x1,%edi
     5a7:	09 f8                	or     %edi,%eax
        code >>= 1, res <<= 1;
     5a9:	01 c0                	add    %eax,%eax
    } while (--len > 0);
     5ab:	4a                   	dec    %edx
     5ac:	75 f2                	jne    5a0 <_build_tree+0x470>
    return res >> 1;
     5ae:	d1 e8                	shr    %eax

    for (n = 0;  n <= max_code; n++) {
        int len = tree[n].Len;
        if (len == 0) continue;
        /* Now reverse the bits */
        tree[n].Code = bi_reverse(next_code[len]++, len);
     5b0:	66 89 41 fe          	mov    %ax,-0x2(%ecx)
     5b4:	83 c1 04             	add    $0x4,%ecx
     */
    Assert (code + bl_count[MAX_BITS]-1 == (1<<MAX_BITS)-1,
            "inconsistent bit counts");
    Tracev((stderr,"\ngen_codes: max_code %d ", max_code));

    for (n = 0;  n <= max_code; n++) {
     5b7:	39 d9                	cmp    %ebx,%ecx
     5b9:	75 c5                	jne    580 <_build_tree+0x450>
     */
    gen_bitlen(s, (tree_desc *)desc);

    /* The field len is now set, we can generate the bit codes */
    gen_codes ((ct_data *)tree, max_code, s->bl_count);
}
     5bb:	83 c4 50             	add    $0x50,%esp
     5be:	5b                   	pop    %ebx
     5bf:	5e                   	pop    %esi
     5c0:	5f                   	pop    %edi
     5c1:	5d                   	pop    %ebp
     5c2:	c3                   	ret    
     5c3:	89 2c 24             	mov    %ebp,(%esp)
     * heap[SMALLEST]. The sons of heap[n] are heap[2*n] and heap[2*n+1].
     * heap[0] is not used.
     */
    s->heap_len = 0, s->heap_max = HEAP_SIZE;

    for (n = 0; n < elems; n++) {
     5c6:	31 c0                	xor    %eax,%eax
{
    ct_data *tree         = desc->dyn_tree;
    const ct_data *stree  = desc->stat_desc->static_tree;
    int elems             = desc->stat_desc->elems;
    int n, m;          /* iterate over heap elements */
    int max_code = -1; /* largest code with non zero frequency */
     5c8:	83 ce ff             	or     $0xffffffff,%esi
     5cb:	8b 6c 24 08          	mov    0x8(%esp),%ebp
     5cf:	e9 2f fc ff ff       	jmp    203 <_build_tree+0xd3>
     5d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     5da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000005e0 <_scan_tree>:
 */
local void scan_tree (s, tree, max_code)
    deflate_state *s;
    ct_data *tree;   /* the tree to be scanned */
    int max_code;    /* and its largest code of non zero frequency */
{
     5e0:	55                   	push   %ebp
     5e1:	57                   	push   %edi
     5e2:	56                   	push   %esi
     5e3:	53                   	push   %ebx
     5e4:	83 ec 0c             	sub    $0xc,%esp
    int n;                     /* iterates over all tree elements */
    int prevlen = -1;          /* last emitted length */
    int curlen;                /* length of current code */
    int nextlen = tree[0].Len; /* length of next code */
     5e7:	31 db                	xor    %ebx,%ebx
     5e9:	66 8b 5a 02          	mov    0x2(%edx),%bx
 */
local void scan_tree (s, tree, max_code)
    deflate_state *s;
    ct_data *tree;   /* the tree to be scanned */
    int max_code;    /* and its largest code of non zero frequency */
{
     5ed:	89 c5                	mov    %eax,%ebp
    int nextlen = tree[0].Len; /* length of next code */
    int count = 0;             /* repeat count of the current code */
    int max_count = 7;         /* max repeat count */
    int min_count = 4;         /* min repeat count */

    if (nextlen == 0) max_count = 138, min_count = 3;
     5ef:	83 fb 01             	cmp    $0x1,%ebx
     5f2:	19 ff                	sbb    %edi,%edi
     5f4:	83 c7 04             	add    $0x4,%edi
     5f7:	83 fb 01             	cmp    $0x1,%ebx
     5fa:	19 c0                	sbb    %eax,%eax
     5fc:	25 83 00 00 00       	and    $0x83,%eax
     601:	83 c0 07             	add    $0x7,%eax
    tree[max_code+1].Len = (ush)0xffff; /* guard */

    for (n = 0; n <= max_code; n++) {
     604:	85 c9                	test   %ecx,%ecx
    int nextlen = tree[0].Len; /* length of next code */
    int count = 0;             /* repeat count of the current code */
    int max_count = 7;         /* max repeat count */
    int min_count = 4;         /* min repeat count */

    if (nextlen == 0) max_count = 138, min_count = 3;
     606:	89 c6                	mov    %eax,%esi
    tree[max_code+1].Len = (ush)0xffff; /* guard */
     608:	8d 04 8d 04 00 00 00 	lea    0x4(,%ecx,4),%eax
     60f:	66 c7 44 02 02 ff ff 	movw   $0xffff,0x2(%edx,%eax,1)

    for (n = 0; n <= max_code; n++) {
     616:	0f 88 9c 00 00 00    	js     6b8 <_scan_tree+0xd8>
     61c:	8d 44 02 06          	lea    0x6(%edx,%eax,1),%eax
     620:	8d 4a 06             	lea    0x6(%edx),%ecx
     623:	83 ca ff             	or     $0xffffffff,%edx
     626:	89 44 24 08          	mov    %eax,0x8(%esp)
     62a:	89 54 24 04          	mov    %edx,0x4(%esp)
     62e:	31 c0                	xor    %eax,%eax
     630:	eb 37                	jmp    669 <_scan_tree+0x89>
        curlen = nextlen; nextlen = tree[n+1].Len;
        if (++count < max_count && curlen == nextlen) {
            continue;
        } else if (count < min_count) {
            s->bl_tree[curlen].Freq += count;
     632:	66 01 84 9d 74 0a 00 	add    %ax,0xa74(%ebp,%ebx,4)
     639:	00 
     63a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
            s->bl_tree[REPZ_3_10].Freq++;
        } else {
            s->bl_tree[REPZ_11_138].Freq++;
        }
        count = 0; prevlen = curlen;
        if (nextlen == 0) {
     63e:	85 d2                	test   %edx,%edx
     640:	74 5f                	je     6a1 <_scan_tree+0xc1>
            max_count = 138, min_count = 3;
        } else if (curlen == nextlen) {
     642:	8a 44 24 03          	mov    0x3(%esp),%al
     646:	89 c7                	mov    %eax,%edi
     648:	89 c6                	mov    %eax,%esi
     64a:	c1 e7 1f             	shl    $0x1f,%edi
     64d:	31 c0                	xor    %eax,%eax
     64f:	c1 e6 1f             	shl    $0x1f,%esi
     652:	c1 ff 1f             	sar    $0x1f,%edi
     655:	c1 fe 1f             	sar    $0x1f,%esi
     658:	83 c7 04             	add    $0x4,%edi
     65b:	83 c6 07             	add    $0x7,%esi
     65e:	83 c1 04             	add    $0x4,%ecx

    if (nextlen == 0) max_count = 138, min_count = 3;
    tree[max_code+1].Len = (ush)0xffff; /* guard */

    for (n = 0; n <= max_code; n++) {
        curlen = nextlen; nextlen = tree[n+1].Len;
     661:	89 d3                	mov    %edx,%ebx
    int min_count = 4;         /* min repeat count */

    if (nextlen == 0) max_count = 138, min_count = 3;
    tree[max_code+1].Len = (ush)0xffff; /* guard */

    for (n = 0; n <= max_code; n++) {
     663:	3b 4c 24 08          	cmp    0x8(%esp),%ecx
     667:	74 4f                	je     6b8 <_scan_tree+0xd8>
        curlen = nextlen; nextlen = tree[n+1].Len;
     669:	31 d2                	xor    %edx,%edx
        if (++count < max_count && curlen == nextlen) {
     66b:	40                   	inc    %eax

    if (nextlen == 0) max_count = 138, min_count = 3;
    tree[max_code+1].Len = (ush)0xffff; /* guard */

    for (n = 0; n <= max_code; n++) {
        curlen = nextlen; nextlen = tree[n+1].Len;
     66c:	66 8b 11             	mov    (%ecx),%dx
        if (++count < max_count && curlen == nextlen) {
     66f:	39 d3                	cmp    %edx,%ebx
     671:	0f 94 44 24 03       	sete   0x3(%esp)
     676:	75 04                	jne    67c <_scan_tree+0x9c>
     678:	39 c6                	cmp    %eax,%esi
     67a:	7f e2                	jg     65e <_scan_tree+0x7e>
            continue;
        } else if (count < min_count) {
     67c:	39 f8                	cmp    %edi,%eax
     67e:	7c b2                	jl     632 <_scan_tree+0x52>
            s->bl_tree[curlen].Freq += count;
        } else if (curlen != 0) {
     680:	85 db                	test   %ebx,%ebx
     682:	74 3c                	je     6c0 <_scan_tree+0xe0>
            if (curlen != prevlen) s->bl_tree[curlen].Freq++;
     684:	39 5c 24 04          	cmp    %ebx,0x4(%esp)
     688:	74 08                	je     692 <_scan_tree+0xb2>
     68a:	66 ff 84 9d 74 0a 00 	incw   0xa74(%ebp,%ebx,4)
     691:	00 
            s->bl_tree[REP_3_6].Freq++;
     692:	66 ff 85 b4 0a 00 00 	incw   0xab4(%ebp)
     699:	89 5c 24 04          	mov    %ebx,0x4(%esp)
            s->bl_tree[REPZ_3_10].Freq++;
        } else {
            s->bl_tree[REPZ_11_138].Freq++;
        }
        count = 0; prevlen = curlen;
        if (nextlen == 0) {
     69d:	85 d2                	test   %edx,%edx
     69f:	75 a1                	jne    642 <_scan_tree+0x62>
     6a1:	83 c1 04             	add    $0x4,%ecx
        } else if (count <= 10) {
            s->bl_tree[REPZ_3_10].Freq++;
        } else {
            s->bl_tree[REPZ_11_138].Freq++;
        }
        count = 0; prevlen = curlen;
     6a4:	31 c0                	xor    %eax,%eax
        if (nextlen == 0) {
            max_count = 138, min_count = 3;
     6a6:	bf 03 00 00 00       	mov    $0x3,%edi
     6ab:	be 8a 00 00 00       	mov    $0x8a,%esi

    if (nextlen == 0) max_count = 138, min_count = 3;
    tree[max_code+1].Len = (ush)0xffff; /* guard */

    for (n = 0; n <= max_code; n++) {
        curlen = nextlen; nextlen = tree[n+1].Len;
     6b0:	89 d3                	mov    %edx,%ebx
    int min_count = 4;         /* min repeat count */

    if (nextlen == 0) max_count = 138, min_count = 3;
    tree[max_code+1].Len = (ush)0xffff; /* guard */

    for (n = 0; n <= max_code; n++) {
     6b2:	3b 4c 24 08          	cmp    0x8(%esp),%ecx
     6b6:	75 b1                	jne    669 <_scan_tree+0x89>
            max_count = 6, min_count = 3;
        } else {
            max_count = 7, min_count = 4;
        }
    }
}
     6b8:	83 c4 0c             	add    $0xc,%esp
     6bb:	5b                   	pop    %ebx
     6bc:	5e                   	pop    %esi
     6bd:	5f                   	pop    %edi
     6be:	5d                   	pop    %ebp
     6bf:	c3                   	ret    
        } else if (count < min_count) {
            s->bl_tree[curlen].Freq += count;
        } else if (curlen != 0) {
            if (curlen != prevlen) s->bl_tree[curlen].Freq++;
            s->bl_tree[REP_3_6].Freq++;
        } else if (count <= 10) {
     6c0:	83 f8 0a             	cmp    $0xa,%eax
     6c3:	7f 0c                	jg     6d1 <_scan_tree+0xf1>
            s->bl_tree[REPZ_3_10].Freq++;
     6c5:	66 ff 85 b8 0a 00 00 	incw   0xab8(%ebp)
     6cc:	e9 69 ff ff ff       	jmp    63a <_scan_tree+0x5a>
        } else {
            s->bl_tree[REPZ_11_138].Freq++;
     6d1:	66 ff 85 bc 0a 00 00 	incw   0xabc(%ebp)
     6d8:	e9 5d ff ff ff       	jmp    63a <_scan_tree+0x5a>
     6dd:	8d 76 00             	lea    0x0(%esi),%esi

000006e0 <_send_tree>:
 */
local void send_tree (s, tree, max_code)
    deflate_state *s;
    ct_data *tree; /* the tree to be scanned */
    int max_code;       /* and its largest code of non zero frequency */
{
     6e0:	55                   	push   %ebp
     6e1:	57                   	push   %edi
     6e2:	56                   	push   %esi
     6e3:	53                   	push   %ebx
     6e4:	83 ec 18             	sub    $0x18,%esp
     6e7:	89 c7                	mov    %eax,%edi
    int n;                     /* iterates over all tree elements */
    int prevlen = -1;          /* last emitted length */
    int curlen;                /* length of current code */
    int nextlen = tree[0].Len; /* length of next code */
     6e9:	31 c0                	xor    %eax,%eax
     6eb:	66 8b 42 02          	mov    0x2(%edx),%ax
    int count = 0;             /* repeat count of the current code */
    int max_count = 7;         /* max repeat count */
    int min_count = 4;         /* min repeat count */

    /* tree[max_code+1].Len = -1; */  /* guard already set */
    if (nextlen == 0) max_count = 138, min_count = 3;
     6ef:	83 f8 01             	cmp    $0x1,%eax
    int max_code;       /* and its largest code of non zero frequency */
{
    int n;                     /* iterates over all tree elements */
    int prevlen = -1;          /* last emitted length */
    int curlen;                /* length of current code */
    int nextlen = tree[0].Len; /* length of next code */
     6f2:	89 c3                	mov    %eax,%ebx
    int count = 0;             /* repeat count of the current code */
    int max_count = 7;         /* max repeat count */
    int min_count = 4;         /* min repeat count */

    /* tree[max_code+1].Len = -1; */  /* guard already set */
    if (nextlen == 0) max_count = 138, min_count = 3;
     6f4:	19 c0                	sbb    %eax,%eax
    int max_code;       /* and its largest code of non zero frequency */
{
    int n;                     /* iterates over all tree elements */
    int prevlen = -1;          /* last emitted length */
    int curlen;                /* length of current code */
    int nextlen = tree[0].Len; /* length of next code */
     6f6:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    int count = 0;             /* repeat count of the current code */
    int max_count = 7;         /* max repeat count */
    int min_count = 4;         /* min repeat count */

    /* tree[max_code+1].Len = -1; */  /* guard already set */
    if (nextlen == 0) max_count = 138, min_count = 3;
     6fa:	83 c0 04             	add    $0x4,%eax
     6fd:	83 fb 01             	cmp    $0x1,%ebx
     700:	19 db                	sbb    %ebx,%ebx
     702:	81 e3 83 00 00 00    	and    $0x83,%ebx
     708:	83 c3 07             	add    $0x7,%ebx

    for (n = 0; n <= max_code; n++) {
     70b:	85 c9                	test   %ecx,%ecx
     70d:	0f 88 3a 01 00 00    	js     84d <_send_tree+0x16d>
     713:	8d 72 06             	lea    0x6(%edx),%esi
     716:	31 ed                	xor    %ebp,%ebp
     718:	89 74 24 08          	mov    %esi,0x8(%esp)
     71c:	8d 74 8a 0a          	lea    0xa(%edx,%ecx,4),%esi
     720:	89 74 24 14          	mov    %esi,0x14(%esp)
     724:	83 c9 ff             	or     $0xffffffff,%ecx
        curlen = nextlen; nextlen = tree[n+1].Len;
     727:	8b 54 24 08          	mov    0x8(%esp),%edx
     72b:	31 f6                	xor    %esi,%esi
     72d:	66 8b 32             	mov    (%edx),%si
        if (++count < max_count && curlen == nextlen) {
     730:	8d 55 01             	lea    0x1(%ebp),%edx
     733:	39 74 24 04          	cmp    %esi,0x4(%esp)

    /* tree[max_code+1].Len = -1; */  /* guard already set */
    if (nextlen == 0) max_count = 138, min_count = 3;

    for (n = 0; n <= max_code; n++) {
        curlen = nextlen; nextlen = tree[n+1].Len;
     737:	89 74 24 0c          	mov    %esi,0xc(%esp)
        if (++count < max_count && curlen == nextlen) {
     73b:	0f 94 44 24 13       	sete   0x13(%esp)
     740:	89 14 24             	mov    %edx,(%esp)
     743:	75 08                	jne    74d <_send_tree+0x6d>
     745:	39 d3                	cmp    %edx,%ebx
     747:	0f 8f a3 02 00 00    	jg     9f0 <_send_tree+0x310>
            continue;
        } else if (count < min_count) {
     74d:	39 04 24             	cmp    %eax,(%esp)
     750:	0f 8d 0d 01 00 00    	jge    863 <_send_tree+0x183>
     756:	8b 44 24 04          	mov    0x4(%esp),%eax
     75a:	8d 1c 87             	lea    (%edi,%eax,4),%ebx
     75d:	eb 6a                	jmp    7c9 <_send_tree+0xe9>
     75f:	90                   	nop
            do { send_code(s, curlen, s->bl_tree); } while (--count != 0);
     760:	31 f6                	xor    %esi,%esi
     762:	8b af b0 16 00 00    	mov    0x16b0(%edi),%ebp
     768:	66 8b b3 74 0a 00 00 	mov    0xa74(%ebx),%si
     76f:	89 f2                	mov    %esi,%edx
     771:	d3 e2                	shl    %cl,%edx
     773:	8b 4f 14             	mov    0x14(%edi),%ecx
     776:	09 ea                	or     %ebp,%edx
     778:	66 89 97 b0 16 00 00 	mov    %dx,0x16b0(%edi)
     77f:	8d 69 01             	lea    0x1(%ecx),%ebp
     782:	89 6f 14             	mov    %ebp,0x14(%edi)
     785:	8b 6f 08             	mov    0x8(%edi),%ebp
     788:	88 54 0d 00          	mov    %dl,0x0(%ebp,%ecx,1)
     78c:	8b 57 14             	mov    0x14(%edi),%edx
     78f:	8b 6f 08             	mov    0x8(%edi),%ebp
     792:	8d 4a 01             	lea    0x1(%edx),%ecx
     795:	89 4f 14             	mov    %ecx,0x14(%edi)
     798:	31 c9                	xor    %ecx,%ecx
     79a:	8a 8f b1 16 00 00    	mov    0x16b1(%edi),%cl
     7a0:	88 4c 15 00          	mov    %cl,0x0(%ebp,%edx,1)
     7a4:	b9 10 00 00 00       	mov    $0x10,%ecx
     7a9:	8b 97 b4 16 00 00    	mov    0x16b4(%edi),%edx
     7af:	29 d1                	sub    %edx,%ecx
     7b1:	d3 fe                	sar    %cl,%esi
     7b3:	ff 0c 24             	decl   (%esp)
     7b6:	8d 44 10 f0          	lea    -0x10(%eax,%edx,1),%eax
     7ba:	66 89 b7 b0 16 00 00 	mov    %si,0x16b0(%edi)
     7c1:	89 87 b4 16 00 00    	mov    %eax,0x16b4(%edi)
     7c7:	74 3d                	je     806 <_send_tree+0x126>
     7c9:	31 c0                	xor    %eax,%eax
     7cb:	ba 10 00 00 00       	mov    $0x10,%edx
     7d0:	66 8b 83 76 0a 00 00 	mov    0xa76(%ebx),%ax
     7d7:	8b 8f b4 16 00 00    	mov    0x16b4(%edi),%ecx
     7dd:	29 c2                	sub    %eax,%edx
     7df:	39 d1                	cmp    %edx,%ecx
     7e1:	0f 8f 79 ff ff ff    	jg     760 <_send_tree+0x80>
     7e7:	31 d2                	xor    %edx,%edx
     7e9:	66 8b 93 74 0a 00 00 	mov    0xa74(%ebx),%dx
     7f0:	d3 e2                	shl    %cl,%edx
     7f2:	66 09 97 b0 16 00 00 	or     %dx,0x16b0(%edi)
     7f9:	01 c1                	add    %eax,%ecx
     7fb:	ff 0c 24             	decl   (%esp)
     7fe:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     804:	75 c3                	jne    7c9 <_send_tree+0xe9>

        } else {
            send_code(s, REPZ_11_138, s->bl_tree); send_bits(s, count-11, 7);
        }
        count = 0; prevlen = curlen;
        if (nextlen == 0) {
     806:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
     80a:	8b 4c 24 04          	mov    0x4(%esp),%ecx
     80e:	85 db                	test   %ebx,%ebx
     810:	74 43                	je     855 <_send_tree+0x175>
            max_count = 138, min_count = 3;
        } else if (curlen == nextlen) {
     812:	8a 5c 24 13          	mov    0x13(%esp),%bl
     816:	31 ed                	xor    %ebp,%ebp
     818:	89 d8                	mov    %ebx,%eax
     81a:	c1 e0 1f             	shl    $0x1f,%eax
     81d:	c1 e3 1f             	shl    $0x1f,%ebx
     820:	c1 f8 1f             	sar    $0x1f,%eax
     823:	c1 fb 1f             	sar    $0x1f,%ebx
     826:	83 c0 04             	add    $0x4,%eax
     829:	83 c3 07             	add    $0x7,%ebx
     82c:	8b 54 24 08          	mov    0x8(%esp),%edx
     830:	83 c2 04             	add    $0x4,%edx
     833:	89 54 24 08          	mov    %edx,0x8(%esp)

    /* tree[max_code+1].Len = -1; */  /* guard already set */
    if (nextlen == 0) max_count = 138, min_count = 3;

    for (n = 0; n <= max_code; n++) {
        curlen = nextlen; nextlen = tree[n+1].Len;
     837:	8b 54 24 0c          	mov    0xc(%esp),%edx
     83b:	8b 74 24 08          	mov    0x8(%esp),%esi
     83f:	89 54 24 04          	mov    %edx,0x4(%esp)
    int min_count = 4;         /* min repeat count */

    /* tree[max_code+1].Len = -1; */  /* guard already set */
    if (nextlen == 0) max_count = 138, min_count = 3;

    for (n = 0; n <= max_code; n++) {
     843:	3b 74 24 14          	cmp    0x14(%esp),%esi
     847:	0f 85 da fe ff ff    	jne    727 <_send_tree+0x47>
            max_count = 6, min_count = 3;
        } else {
            max_count = 7, min_count = 4;
        }
    }
}
     84d:	83 c4 18             	add    $0x18,%esp
     850:	5b                   	pop    %ebx
     851:	5e                   	pop    %esi
     852:	5f                   	pop    %edi
     853:	5d                   	pop    %ebp
     854:	c3                   	ret    
        } else {
            send_code(s, REPZ_11_138, s->bl_tree); send_bits(s, count-11, 7);
        }
        count = 0; prevlen = curlen;
        if (nextlen == 0) {
            max_count = 138, min_count = 3;
     855:	b8 03 00 00 00       	mov    $0x3,%eax
     85a:	bb 8a 00 00 00       	mov    $0x8a,%ebx
            send_code(s, REPZ_3_10, s->bl_tree); send_bits(s, count-3, 3);

        } else {
            send_code(s, REPZ_11_138, s->bl_tree); send_bits(s, count-11, 7);
        }
        count = 0; prevlen = curlen;
     85f:	31 ed                	xor    %ebp,%ebp
     861:	eb c9                	jmp    82c <_send_tree+0x14c>
        if (++count < max_count && curlen == nextlen) {
            continue;
        } else if (count < min_count) {
            do { send_code(s, curlen, s->bl_tree); } while (--count != 0);

        } else if (curlen != 0) {
     863:	8b 5c 24 04          	mov    0x4(%esp),%ebx
     867:	85 db                	test   %ebx,%ebx
     869:	0f 84 89 01 00 00    	je     9f8 <_send_tree+0x318>
            if (curlen != prevlen) {
     86f:	3b 4c 24 04          	cmp    0x4(%esp),%ecx
     873:	0f 84 d7 03 00 00    	je     c50 <_send_tree+0x570>
     879:	8b 44 24 04          	mov    0x4(%esp),%eax
                send_code(s, curlen, s->bl_tree); count--;
     87d:	31 f6                	xor    %esi,%esi
     87f:	ba 10 00 00 00       	mov    $0x10,%edx
     884:	8b 8f b4 16 00 00    	mov    0x16b4(%edi),%ecx
     88a:	8d 04 87             	lea    (%edi,%eax,4),%eax
     88d:	66 8b b0 76 0a 00 00 	mov    0xa76(%eax),%si
     894:	29 f2                	sub    %esi,%edx
     896:	39 d1                	cmp    %edx,%ecx
     898:	0f 8e 82 03 00 00    	jle    c20 <_send_tree+0x540>
     89e:	31 db                	xor    %ebx,%ebx
     8a0:	8b 97 b0 16 00 00    	mov    0x16b0(%edi),%edx
     8a6:	66 8b 98 74 0a 00 00 	mov    0xa74(%eax),%bx
     8ad:	89 d8                	mov    %ebx,%eax
     8af:	89 1c 24             	mov    %ebx,(%esp)
     8b2:	d3 e0                	shl    %cl,%eax
     8b4:	09 d0                	or     %edx,%eax
     8b6:	8b 57 14             	mov    0x14(%edi),%edx
     8b9:	8b 4f 08             	mov    0x8(%edi),%ecx
     8bc:	66 89 87 b0 16 00 00 	mov    %ax,0x16b0(%edi)
     8c3:	8d 5a 01             	lea    0x1(%edx),%ebx
     8c6:	89 5f 14             	mov    %ebx,0x14(%edi)
     8c9:	88 04 11             	mov    %al,(%ecx,%edx,1)
     8cc:	8b 47 14             	mov    0x14(%edi),%eax
     8cf:	8b 4f 08             	mov    0x8(%edi),%ecx
     8d2:	8d 50 01             	lea    0x1(%eax),%edx
     8d5:	89 57 14             	mov    %edx,0x14(%edi)
     8d8:	31 d2                	xor    %edx,%edx
     8da:	8a 97 b1 16 00 00    	mov    0x16b1(%edi),%dl
     8e0:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     8e3:	b9 10 00 00 00       	mov    $0x10,%ecx
     8e8:	8b 87 b4 16 00 00    	mov    0x16b4(%edi),%eax
     8ee:	8b 14 24             	mov    (%esp),%edx
     8f1:	29 c1                	sub    %eax,%ecx
     8f3:	d3 fa                	sar    %cl,%edx
     8f5:	8d 4c 06 f0          	lea    -0x10(%esi,%eax,1),%ecx
     8f9:	89 d3                	mov    %edx,%ebx
     8fb:	66 89 97 b0 16 00 00 	mov    %dx,0x16b0(%edi)
     902:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
            }
            Assert(count >= 3 && count <= 6, " 3_6?");
            send_code(s, REP_3_6, s->bl_tree); send_bits(s, count-3, 2);
     908:	31 d2                	xor    %edx,%edx
     90a:	b8 10 00 00 00       	mov    $0x10,%eax
     90f:	66 8b 97 b6 0a 00 00 	mov    0xab6(%edi),%dx
     916:	29 d0                	sub    %edx,%eax
     918:	39 c8                	cmp    %ecx,%eax
     91a:	0f 8d f0 01 00 00    	jge    b10 <_send_tree+0x430>
     920:	31 c0                	xor    %eax,%eax
     922:	66 8b 87 b4 0a 00 00 	mov    0xab4(%edi),%ax
     929:	89 04 24             	mov    %eax,(%esp)
     92c:	d3 e0                	shl    %cl,%eax
     92e:	8b 4f 14             	mov    0x14(%edi),%ecx
     931:	09 d8                	or     %ebx,%eax
     933:	8b 5f 08             	mov    0x8(%edi),%ebx
     936:	66 89 87 b0 16 00 00 	mov    %ax,0x16b0(%edi)
     93d:	8d 71 01             	lea    0x1(%ecx),%esi
     940:	89 77 14             	mov    %esi,0x14(%edi)
     943:	88 04 0b             	mov    %al,(%ebx,%ecx,1)
     946:	8b 47 14             	mov    0x14(%edi),%eax
     949:	8b 5f 08             	mov    0x8(%edi),%ebx
     94c:	8d 48 01             	lea    0x1(%eax),%ecx
     94f:	89 4f 14             	mov    %ecx,0x14(%edi)
     952:	31 c9                	xor    %ecx,%ecx
     954:	8a 8f b1 16 00 00    	mov    0x16b1(%edi),%cl
     95a:	88 0c 03             	mov    %cl,(%ebx,%eax,1)
     95d:	b9 10 00 00 00       	mov    $0x10,%ecx
     962:	8b b7 b4 16 00 00    	mov    0x16b4(%edi),%esi
     968:	8b 04 24             	mov    (%esp),%eax
     96b:	29 f1                	sub    %esi,%ecx
     96d:	d3 f8                	sar    %cl,%eax
     96f:	89 c1                	mov    %eax,%ecx
     971:	66 89 8f b0 16 00 00 	mov    %cx,0x16b0(%edi)
     978:	8d 4c 32 f0          	lea    -0x10(%edx,%esi,1),%ecx
     97c:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     982:	83 f9 0e             	cmp    $0xe,%ecx
     985:	0f 8e 65 01 00 00    	jle    af0 <_send_tree+0x410>
     98b:	8d 75 fd             	lea    -0x3(%ebp),%esi
     98e:	8b 57 14             	mov    0x14(%edi),%edx
     991:	89 f3                	mov    %esi,%ebx
     993:	31 ed                	xor    %ebp,%ebp
     995:	d3 e3                	shl    %cl,%ebx
     997:	8b 4f 08             	mov    0x8(%edi),%ecx
     99a:	09 d8                	or     %ebx,%eax
     99c:	8d 5a 01             	lea    0x1(%edx),%ebx
     99f:	66 89 87 b0 16 00 00 	mov    %ax,0x16b0(%edi)
     9a6:	89 5f 14             	mov    %ebx,0x14(%edi)
     9a9:	88 04 11             	mov    %al,(%ecx,%edx,1)
     9ac:	8b 47 14             	mov    0x14(%edi),%eax
     9af:	8b 4f 08             	mov    0x8(%edi),%ecx
     9b2:	66 89 f5             	mov    %si,%bp
     9b5:	8d 50 01             	lea    0x1(%eax),%edx
     9b8:	89 57 14             	mov    %edx,0x14(%edi)
     9bb:	31 d2                	xor    %edx,%edx
     9bd:	8a 97 b1 16 00 00    	mov    0x16b1(%edi),%dl
     9c3:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     9c6:	b9 10 00 00 00       	mov    $0x10,%ecx
     9cb:	8b 87 b4 16 00 00    	mov    0x16b4(%edi),%eax
     9d1:	29 c1                	sub    %eax,%ecx
     9d3:	83 e8 0e             	sub    $0xe,%eax
     9d6:	d3 fd                	sar    %cl,%ebp
     9d8:	66 89 af b0 16 00 00 	mov    %bp,0x16b0(%edi)
     9df:	89 87 b4 16 00 00    	mov    %eax,0x16b4(%edi)
     9e5:	e9 1c fe ff ff       	jmp    806 <_send_tree+0x126>
     9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     9f0:	8b 2c 24             	mov    (%esp),%ebp
     9f3:	e9 34 fe ff ff       	jmp    82c <_send_tree+0x14c>

        } else if (count <= 10) {
            send_code(s, REPZ_3_10, s->bl_tree); send_bits(s, count-3, 3);
     9f8:	31 f6                	xor    %esi,%esi
                send_code(s, curlen, s->bl_tree); count--;
            }
            Assert(count >= 3 && count <= 6, " 3_6?");
            send_code(s, REP_3_6, s->bl_tree); send_bits(s, count-3, 2);

        } else if (count <= 10) {
     9fa:	83 3c 24 0a          	cmpl   $0xa,(%esp)
     9fe:	0f 8f 2d 01 00 00    	jg     b31 <_send_tree+0x451>
            send_code(s, REPZ_3_10, s->bl_tree); send_bits(s, count-3, 3);
     a04:	66 8b b7 ba 0a 00 00 	mov    0xaba(%edi),%si
     a0b:	b8 10 00 00 00       	mov    $0x10,%eax
     a10:	8b 8f b4 16 00 00    	mov    0x16b4(%edi),%ecx
     a16:	29 f0                	sub    %esi,%eax
     a18:	39 c1                	cmp    %eax,%ecx
     a1a:	0f 8e 44 02 00 00    	jle    c64 <_send_tree+0x584>
     a20:	31 c0                	xor    %eax,%eax
     a22:	8b 97 b0 16 00 00    	mov    0x16b0(%edi),%edx
     a28:	66 8b 87 b8 0a 00 00 	mov    0xab8(%edi),%ax
     a2f:	89 04 24             	mov    %eax,(%esp)
     a32:	d3 e0                	shl    %cl,%eax
     a34:	09 d0                	or     %edx,%eax
     a36:	8b 57 14             	mov    0x14(%edi),%edx
     a39:	8b 4f 08             	mov    0x8(%edi),%ecx
     a3c:	66 89 87 b0 16 00 00 	mov    %ax,0x16b0(%edi)
     a43:	8d 5a 01             	lea    0x1(%edx),%ebx
     a46:	89 5f 14             	mov    %ebx,0x14(%edi)
     a49:	88 04 11             	mov    %al,(%ecx,%edx,1)
     a4c:	8b 47 14             	mov    0x14(%edi),%eax
     a4f:	8b 4f 08             	mov    0x8(%edi),%ecx
     a52:	8b 1c 24             	mov    (%esp),%ebx
     a55:	8d 50 01             	lea    0x1(%eax),%edx
     a58:	89 57 14             	mov    %edx,0x14(%edi)
     a5b:	31 d2                	xor    %edx,%edx
     a5d:	8a 97 b1 16 00 00    	mov    0x16b1(%edi),%dl
     a63:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     a66:	b9 10 00 00 00       	mov    $0x10,%ecx
     a6b:	8b 87 b4 16 00 00    	mov    0x16b4(%edi),%eax
     a71:	29 c1                	sub    %eax,%ecx
     a73:	d3 fb                	sar    %cl,%ebx
     a75:	8d 4c 06 f0          	lea    -0x10(%esi,%eax,1),%ecx
     a79:	89 da                	mov    %ebx,%edx
     a7b:	66 89 9f b0 16 00 00 	mov    %bx,0x16b0(%edi)
     a82:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     a88:	83 f9 0d             	cmp    $0xd,%ecx
     a8b:	0f 8e 00 02 00 00    	jle    c91 <_send_tree+0x5b1>
     a91:	8d 75 fe             	lea    -0x2(%ebp),%esi
     a94:	31 ed                	xor    %ebp,%ebp
     a96:	89 f0                	mov    %esi,%eax
     a98:	66 89 f5             	mov    %si,%bp
     a9b:	d3 e0                	shl    %cl,%eax
     a9d:	09 d0                	or     %edx,%eax
     a9f:	8b 57 14             	mov    0x14(%edi),%edx
     aa2:	8b 4f 08             	mov    0x8(%edi),%ecx
     aa5:	66 89 87 b0 16 00 00 	mov    %ax,0x16b0(%edi)
     aac:	8d 5a 01             	lea    0x1(%edx),%ebx
     aaf:	89 5f 14             	mov    %ebx,0x14(%edi)
     ab2:	88 04 11             	mov    %al,(%ecx,%edx,1)
     ab5:	8b 47 14             	mov    0x14(%edi),%eax
     ab8:	8b 4f 08             	mov    0x8(%edi),%ecx
     abb:	8d 50 01             	lea    0x1(%eax),%edx
     abe:	89 57 14             	mov    %edx,0x14(%edi)
     ac1:	31 d2                	xor    %edx,%edx
     ac3:	8a 97 b1 16 00 00    	mov    0x16b1(%edi),%dl
     ac9:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     acc:	b9 10 00 00 00       	mov    $0x10,%ecx
     ad1:	8b 87 b4 16 00 00    	mov    0x16b4(%edi),%eax
     ad7:	29 c1                	sub    %eax,%ecx
     ad9:	83 e8 0d             	sub    $0xd,%eax
     adc:	d3 fd                	sar    %cl,%ebp
     ade:	66 89 af b0 16 00 00 	mov    %bp,0x16b0(%edi)
     ae5:	89 87 b4 16 00 00    	mov    %eax,0x16b4(%edi)
     aeb:	e9 16 fd ff ff       	jmp    806 <_send_tree+0x126>
        } else if (curlen != 0) {
            if (curlen != prevlen) {
                send_code(s, curlen, s->bl_tree); count--;
            }
            Assert(count >= 3 && count <= 6, " 3_6?");
            send_code(s, REP_3_6, s->bl_tree); send_bits(s, count-3, 2);
     af0:	83 ed 03             	sub    $0x3,%ebp
     af3:	d3 e5                	shl    %cl,%ebp
     af5:	09 c5                	or     %eax,%ebp
     af7:	83 c1 02             	add    $0x2,%ecx
     afa:	66 89 af b0 16 00 00 	mov    %bp,0x16b0(%edi)
     b01:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     b07:	e9 fa fc ff ff       	jmp    806 <_send_tree+0x126>
     b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b10:	31 c0                	xor    %eax,%eax
     b12:	66 8b 87 b4 0a 00 00 	mov    0xab4(%edi),%ax
     b19:	d3 e0                	shl    %cl,%eax
     b1b:	09 d8                	or     %ebx,%eax
     b1d:	01 d1                	add    %edx,%ecx
     b1f:	66 89 87 b0 16 00 00 	mov    %ax,0x16b0(%edi)
     b26:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     b2c:	e9 51 fe ff ff       	jmp    982 <_send_tree+0x2a2>

        } else if (count <= 10) {
            send_code(s, REPZ_3_10, s->bl_tree); send_bits(s, count-3, 3);

        } else {
            send_code(s, REPZ_11_138, s->bl_tree); send_bits(s, count-11, 7);
     b31:	66 8b b7 be 0a 00 00 	mov    0xabe(%edi),%si
     b38:	b8 10 00 00 00       	mov    $0x10,%eax
     b3d:	8b 8f b4 16 00 00    	mov    0x16b4(%edi),%ecx
     b43:	29 f0                	sub    %esi,%eax
     b45:	39 c1                	cmp    %eax,%ecx
     b47:	0f 8e 83 01 00 00    	jle    cd0 <_send_tree+0x5f0>
     b4d:	31 c0                	xor    %eax,%eax
     b4f:	8b 97 b0 16 00 00    	mov    0x16b0(%edi),%edx
     b55:	66 8b 87 bc 0a 00 00 	mov    0xabc(%edi),%ax
     b5c:	89 04 24             	mov    %eax,(%esp)
     b5f:	d3 e0                	shl    %cl,%eax
     b61:	09 d0                	or     %edx,%eax
     b63:	8b 57 14             	mov    0x14(%edi),%edx
     b66:	8b 4f 08             	mov    0x8(%edi),%ecx
     b69:	66 89 87 b0 16 00 00 	mov    %ax,0x16b0(%edi)
     b70:	8d 5a 01             	lea    0x1(%edx),%ebx
     b73:	89 5f 14             	mov    %ebx,0x14(%edi)
     b76:	88 04 11             	mov    %al,(%ecx,%edx,1)
     b79:	8b 47 14             	mov    0x14(%edi),%eax
     b7c:	8b 4f 08             	mov    0x8(%edi),%ecx
     b7f:	8b 1c 24             	mov    (%esp),%ebx
     b82:	8d 50 01             	lea    0x1(%eax),%edx
     b85:	89 57 14             	mov    %edx,0x14(%edi)
     b88:	31 d2                	xor    %edx,%edx
     b8a:	8a 97 b1 16 00 00    	mov    0x16b1(%edi),%dl
     b90:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     b93:	b9 10 00 00 00       	mov    $0x10,%ecx
     b98:	8b 87 b4 16 00 00    	mov    0x16b4(%edi),%eax
     b9e:	29 c1                	sub    %eax,%ecx
     ba0:	d3 fb                	sar    %cl,%ebx
     ba2:	8d 4c 06 f0          	lea    -0x10(%esi,%eax,1),%ecx
     ba6:	89 da                	mov    %ebx,%edx
     ba8:	66 89 9f b0 16 00 00 	mov    %bx,0x16b0(%edi)
     baf:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     bb5:	83 f9 09             	cmp    $0x9,%ecx
     bb8:	0f 8e f2 00 00 00    	jle    cb0 <_send_tree+0x5d0>
     bbe:	8d 75 f6             	lea    -0xa(%ebp),%esi
     bc1:	31 ed                	xor    %ebp,%ebp
     bc3:	89 f0                	mov    %esi,%eax
     bc5:	66 89 f5             	mov    %si,%bp
     bc8:	d3 e0                	shl    %cl,%eax
     bca:	09 d0                	or     %edx,%eax
     bcc:	8b 57 14             	mov    0x14(%edi),%edx
     bcf:	8b 4f 08             	mov    0x8(%edi),%ecx
     bd2:	66 89 87 b0 16 00 00 	mov    %ax,0x16b0(%edi)
     bd9:	8d 5a 01             	lea    0x1(%edx),%ebx
     bdc:	89 5f 14             	mov    %ebx,0x14(%edi)
     bdf:	88 04 11             	mov    %al,(%ecx,%edx,1)
     be2:	8b 47 14             	mov    0x14(%edi),%eax
     be5:	8b 4f 08             	mov    0x8(%edi),%ecx
     be8:	8d 50 01             	lea    0x1(%eax),%edx
     beb:	89 57 14             	mov    %edx,0x14(%edi)
     bee:	31 d2                	xor    %edx,%edx
     bf0:	8a 97 b1 16 00 00    	mov    0x16b1(%edi),%dl
     bf6:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     bf9:	b9 10 00 00 00       	mov    $0x10,%ecx
     bfe:	8b 87 b4 16 00 00    	mov    0x16b4(%edi),%eax
     c04:	29 c1                	sub    %eax,%ecx
     c06:	83 e8 09             	sub    $0x9,%eax
     c09:	d3 fd                	sar    %cl,%ebp
     c0b:	66 89 af b0 16 00 00 	mov    %bp,0x16b0(%edi)
     c12:	89 87 b4 16 00 00    	mov    %eax,0x16b4(%edi)
     c18:	e9 e9 fb ff ff       	jmp    806 <_send_tree+0x126>
     c1d:	8d 76 00             	lea    0x0(%esi),%esi
        } else if (count < min_count) {
            do { send_code(s, curlen, s->bl_tree); } while (--count != 0);

        } else if (curlen != 0) {
            if (curlen != prevlen) {
                send_code(s, curlen, s->bl_tree); count--;
     c20:	66 8b 98 74 0a 00 00 	mov    0xa74(%eax),%bx
     c27:	81 e3 ff ff 00 00    	and    $0xffff,%ebx
     c2d:	89 d8                	mov    %ebx,%eax
     c2f:	d3 e0                	shl    %cl,%eax
     c31:	89 c3                	mov    %eax,%ebx
     c33:	8b 87 b0 16 00 00    	mov    0x16b0(%edi),%eax
     c39:	09 c3                	or     %eax,%ebx
     c3b:	01 f1                	add    %esi,%ecx
     c3d:	66 89 9f b0 16 00 00 	mov    %bx,0x16b0(%edi)
     c44:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     c4a:	e9 b9 fc ff ff       	jmp    908 <_send_tree+0x228>
     c4f:	90                   	nop
     c50:	8b 8f b4 16 00 00    	mov    0x16b4(%edi),%ecx
     c56:	8b 9f b0 16 00 00    	mov    0x16b0(%edi),%ebx
            continue;
        } else if (count < min_count) {
            do { send_code(s, curlen, s->bl_tree); } while (--count != 0);

        } else if (curlen != 0) {
            if (curlen != prevlen) {
     c5c:	8b 2c 24             	mov    (%esp),%ebp
     c5f:	e9 a4 fc ff ff       	jmp    908 <_send_tree+0x228>
            }
            Assert(count >= 3 && count <= 6, " 3_6?");
            send_code(s, REP_3_6, s->bl_tree); send_bits(s, count-3, 2);

        } else if (count <= 10) {
            send_code(s, REPZ_3_10, s->bl_tree); send_bits(s, count-3, 3);
     c64:	31 c0                	xor    %eax,%eax
     c66:	8b 9f b0 16 00 00    	mov    0x16b0(%edi),%ebx
     c6c:	66 8b 87 b8 0a 00 00 	mov    0xab8(%edi),%ax
     c73:	d3 e0                	shl    %cl,%eax
     c75:	89 c2                	mov    %eax,%edx
     c77:	01 f1                	add    %esi,%ecx
     c79:	09 da                	or     %ebx,%edx
     c7b:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     c81:	66 89 97 b0 16 00 00 	mov    %dx,0x16b0(%edi)
     c88:	83 f9 0d             	cmp    $0xd,%ecx
     c8b:	0f 8f 00 fe ff ff    	jg     a91 <_send_tree+0x3b1>
     c91:	83 ed 02             	sub    $0x2,%ebp
     c94:	d3 e5                	shl    %cl,%ebp
     c96:	09 d5                	or     %edx,%ebp
     c98:	83 c1 03             	add    $0x3,%ecx
     c9b:	66 89 af b0 16 00 00 	mov    %bp,0x16b0(%edi)
     ca2:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     ca8:	e9 59 fb ff ff       	jmp    806 <_send_tree+0x126>
     cad:	8d 76 00             	lea    0x0(%esi),%esi

        } else {
            send_code(s, REPZ_11_138, s->bl_tree); send_bits(s, count-11, 7);
     cb0:	83 ed 0a             	sub    $0xa,%ebp
     cb3:	d3 e5                	shl    %cl,%ebp
     cb5:	09 d5                	or     %edx,%ebp
     cb7:	83 c1 07             	add    $0x7,%ecx
     cba:	66 89 af b0 16 00 00 	mov    %bp,0x16b0(%edi)
     cc1:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     cc7:	e9 3a fb ff ff       	jmp    806 <_send_tree+0x126>
     ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cd0:	31 c0                	xor    %eax,%eax
     cd2:	66 8b 87 bc 0a 00 00 	mov    0xabc(%edi),%ax
     cd9:	d3 e0                	shl    %cl,%eax
     cdb:	89 c2                	mov    %eax,%edx
     cdd:	8b 87 b0 16 00 00    	mov    0x16b0(%edi),%eax
     ce3:	09 c2                	or     %eax,%edx
     ce5:	01 f1                	add    %esi,%ecx
     ce7:	66 89 97 b0 16 00 00 	mov    %dx,0x16b0(%edi)
     cee:	89 8f b4 16 00 00    	mov    %ecx,0x16b4(%edi)
     cf4:	e9 bc fe ff ff       	jmp    bb5 <_send_tree+0x4d5>
     cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d00 <_compress_block>:
 */
local void compress_block(s, ltree, dtree)
    deflate_state *s;
    ct_data *ltree; /* literal tree */
    ct_data *dtree; /* distance tree */
{
     d00:	55                   	push   %ebp
     d01:	57                   	push   %edi
     d02:	56                   	push   %esi
     d03:	53                   	push   %ebx
     d04:	83 ec 14             	sub    $0x14,%esp
     d07:	89 c3                	mov    %eax,%ebx
    int lc;             /* match length or unmatched char (if dist == 0) */
    unsigned lx = 0;    /* running index in l_buf */
    unsigned code;      /* the code to send */
    int extra;          /* number of extra bits to send */

    if (s->last_lit != 0) do {
     d09:	8b 80 98 16 00 00    	mov    0x1698(%eax),%eax
 */
local void compress_block(s, ltree, dtree)
    deflate_state *s;
    ct_data *ltree; /* literal tree */
    ct_data *dtree; /* distance tree */
{
     d0f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
     d13:	89 54 24 08          	mov    %edx,0x8(%esp)
    int lc;             /* match length or unmatched char (if dist == 0) */
    unsigned lx = 0;    /* running index in l_buf */
    unsigned code;      /* the code to send */
    int extra;          /* number of extra bits to send */

    if (s->last_lit != 0) do {
     d17:	85 c0                	test   %eax,%eax
     d19:	8b 8b b4 16 00 00    	mov    0x16b4(%ebx),%ecx
     d1f:	8b ab b0 16 00 00    	mov    0x16b0(%ebx),%ebp
     d25:	0f 84 2b 03 00 00    	je     1056 <_compress_block+0x356>
     d2b:	31 d2                	xor    %edx,%edx
     d2d:	e9 99 00 00 00       	jmp    dcb <_compress_block+0xcb>
        dist = s->d_buf[lx];
        lc = s->l_buf[lx++];
        if (dist == 0) {
            send_code(s, lc, ltree); /* send a literal byte */
     d32:	8b 7c 24 08          	mov    0x8(%esp),%edi
     d36:	66 be 10 00          	mov    $0x10,%si
     d3a:	8d 14 87             	lea    (%edi,%eax,4),%edx
     d3d:	31 c0                	xor    %eax,%eax
     d3f:	66 8b 42 02          	mov    0x2(%edx),%ax
     d43:	66 8b 3a             	mov    (%edx),%di
     d46:	81 e7 ff ff 00 00    	and    $0xffff,%edi
     d4c:	29 c6                	sub    %eax,%esi
     d4e:	89 fa                	mov    %edi,%edx
     d50:	39 ce                	cmp    %ecx,%esi
     d52:	0f 8d dc 02 00 00    	jge    1034 <_compress_block+0x334>
     d58:	89 7c 24 04          	mov    %edi,0x4(%esp)
     d5c:	8b 73 08             	mov    0x8(%ebx),%esi
     d5f:	d3 e7                	shl    %cl,%edi
     d61:	8b 4b 14             	mov    0x14(%ebx),%ecx
     d64:	09 fd                	or     %edi,%ebp
     d66:	89 ea                	mov    %ebp,%edx
     d68:	66 89 ab b0 16 00 00 	mov    %bp,0x16b0(%ebx)
     d6f:	8d 79 01             	lea    0x1(%ecx),%edi
     d72:	89 7b 14             	mov    %edi,0x14(%ebx)
     d75:	88 14 0e             	mov    %dl,(%esi,%ecx,1)
     d78:	8b 4b 14             	mov    0x14(%ebx),%ecx
     d7b:	8b 7b 08             	mov    0x8(%ebx),%edi
     d7e:	8d 71 01             	lea    0x1(%ecx),%esi
     d81:	89 73 14             	mov    %esi,0x14(%ebx)
     d84:	0f b6 b3 b1 16 00 00 	movzbl 0x16b1(%ebx),%esi
     d8b:	81 e6 ff 00 00 00    	and    $0xff,%esi
     d91:	89 f2                	mov    %esi,%edx
     d93:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
     d96:	b9 10 00 00 00       	mov    $0x10,%ecx
     d9b:	8b b3 b4 16 00 00    	mov    0x16b4(%ebx),%esi
     da1:	8b 54 24 04          	mov    0x4(%esp),%edx
     da5:	29 f1                	sub    %esi,%ecx

            send_code(s, code, dtree);       /* send the distance code */
            extra = extra_dbits[code];
            if (extra != 0) {
                dist -= base_dist[code];
                send_bits(s, dist, extra);   /* send the extra distance bits */
     da7:	d3 fa                	sar    %cl,%edx
     da9:	8d 4c 30 f0          	lea    -0x10(%eax,%esi,1),%ecx
     dad:	89 d5                	mov    %edx,%ebp
     daf:	66 89 93 b0 16 00 00 	mov    %dx,0x16b0(%ebx)
     db6:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
     dbc:	8b 14 24             	mov    (%esp),%edx
        } /* literal or match pair ? */

        /* Check that the overlay between pending_buf and d_buf+l_buf is ok: */
        Assert(s->pending < s->lit_bufsize + 2*lx, "pendingBuf overflow");

    } while (lx < s->last_lit);
     dbf:	3b 93 98 16 00 00    	cmp    0x1698(%ebx),%edx
     dc5:	0f 83 8b 02 00 00    	jae    1056 <_compress_block+0x356>
    unsigned lx = 0;    /* running index in l_buf */
    unsigned code;      /* the code to send */
    int extra;          /* number of extra bits to send */

    if (s->last_lit != 0) do {
        dist = s->d_buf[lx];
     dcb:	8b 83 9c 16 00 00    	mov    0x169c(%ebx),%eax
     dd1:	31 f6                	xor    %esi,%esi
     dd3:	66 8b 34 50          	mov    (%eax,%edx,2),%si
        lc = s->l_buf[lx++];
     dd7:	8d 42 01             	lea    0x1(%edx),%eax
     dda:	89 04 24             	mov    %eax,(%esp)
     ddd:	8b 83 90 16 00 00    	mov    0x1690(%ebx),%eax
     de3:	0f b6 3c 10          	movzbl (%eax,%edx,1),%edi
        if (dist == 0) {
            send_code(s, lc, ltree); /* send a literal byte */
     de7:	89 f8                	mov    %edi,%eax
     de9:	25 ff 00 00 00       	and    $0xff,%eax
    int extra;          /* number of extra bits to send */

    if (s->last_lit != 0) do {
        dist = s->d_buf[lx];
        lc = s->l_buf[lx++];
        if (dist == 0) {
     dee:	85 f6                	test   %esi,%esi
     df0:	0f 84 3c ff ff ff    	je     d32 <_compress_block+0x32>
            send_code(s, lc, ltree); /* send a literal byte */
            Tracecv(isgraph(lc), (stderr," '%c' ", lc));
        } else {
            /* Here, lc is the match length - MIN_MATCH */
            code = _length_code[lc];
     df6:	31 d2                	xor    %edx,%edx
    unsigned code;      /* the code to send */
    int extra;          /* number of extra bits to send */

    if (s->last_lit != 0) do {
        dist = s->d_buf[lx];
        lc = s->l_buf[lx++];
     df8:	89 44 24 0c          	mov    %eax,0xc(%esp)
        if (dist == 0) {
            send_code(s, lc, ltree); /* send a literal byte */
            Tracecv(isgraph(lc), (stderr," '%c' ", lc));
        } else {
            /* Here, lc is the match length - MIN_MATCH */
            code = _length_code[lc];
     dfc:	8a 90 00 01 00 00    	mov    0x100(%eax),%dl
            send_code(s, code+LITERALS+1, ltree); /* send the length code */
     e02:	8b 44 24 08          	mov    0x8(%esp),%eax
     e06:	31 ff                	xor    %edi,%edi
        if (dist == 0) {
            send_code(s, lc, ltree); /* send a literal byte */
            Tracecv(isgraph(lc), (stderr," '%c' ", lc));
        } else {
            /* Here, lc is the match length - MIN_MATCH */
            code = _length_code[lc];
     e08:	89 54 24 04          	mov    %edx,0x4(%esp)
            send_code(s, code+LITERALS+1, ltree); /* send the length code */
     e0c:	8d 84 90 04 04 00 00 	lea    0x404(%eax,%edx,4),%eax
     e13:	ba 10 00 00 00       	mov    $0x10,%edx
     e18:	66 8b 78 02          	mov    0x2(%eax),%di
     e1c:	29 fa                	sub    %edi,%edx
     e1e:	39 ca                	cmp    %ecx,%edx
     e20:	0f 8d 8a 02 00 00    	jge    10b0 <_compress_block+0x3b0>
     e26:	31 d2                	xor    %edx,%edx
     e28:	66 8b 10             	mov    (%eax),%dx
     e2b:	89 d0                	mov    %edx,%eax
     e2d:	d3 e0                	shl    %cl,%eax
     e2f:	89 e9                	mov    %ebp,%ecx
     e31:	09 c1                	or     %eax,%ecx
     e33:	8b 43 14             	mov    0x14(%ebx),%eax
     e36:	66 89 8b b0 16 00 00 	mov    %cx,0x16b0(%ebx)
     e3d:	8d 68 01             	lea    0x1(%eax),%ebp
     e40:	89 6b 14             	mov    %ebp,0x14(%ebx)
     e43:	8b 6b 08             	mov    0x8(%ebx),%ebp
     e46:	88 4c 05 00          	mov    %cl,0x0(%ebp,%eax,1)
     e4a:	8b 43 14             	mov    0x14(%ebx),%eax
     e4d:	8b 6b 08             	mov    0x8(%ebx),%ebp
     e50:	8d 48 01             	lea    0x1(%eax),%ecx
     e53:	89 4b 14             	mov    %ecx,0x14(%ebx)
     e56:	31 c9                	xor    %ecx,%ecx
     e58:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
     e5e:	88 4c 05 00          	mov    %cl,0x0(%ebp,%eax,1)
     e62:	b9 10 00 00 00       	mov    $0x10,%ecx
     e67:	8b 83 b4 16 00 00    	mov    0x16b4(%ebx),%eax
     e6d:	29 c1                	sub    %eax,%ecx
     e6f:	d3 fa                	sar    %cl,%edx
     e71:	8d 4c 07 f0          	lea    -0x10(%edi,%eax,1),%ecx
     e75:	89 d5                	mov    %edx,%ebp
     e77:	66 89 93 b0 16 00 00 	mov    %dx,0x16b0(%ebx)
     e7e:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
            extra = extra_lbits[code];
     e84:	8b 44 24 04          	mov    0x4(%esp),%eax
     e88:	8b 3c 85 00 0a 00 00 	mov    0xa00(,%eax,4),%edi
            if (extra != 0) {
     e8f:	85 ff                	test   %edi,%edi
     e91:	74 7d                	je     f10 <_compress_block+0x210>
                lc -= base_length[code];
     e93:	8b 54 24 0c          	mov    0xc(%esp),%edx
     e97:	2b 14 85 80 00 00 00 	sub    0x80(,%eax,4),%edx
                send_bits(s, lc, extra);       /* send the extra length bits */
     e9e:	b8 10 00 00 00       	mov    $0x10,%eax
     ea3:	29 f8                	sub    %edi,%eax
            /* Here, lc is the match length - MIN_MATCH */
            code = _length_code[lc];
            send_code(s, code+LITERALS+1, ltree); /* send the length code */
            extra = extra_lbits[code];
            if (extra != 0) {
                lc -= base_length[code];
     ea5:	89 54 24 04          	mov    %edx,0x4(%esp)
                send_bits(s, lc, extra);       /* send the extra length bits */
     ea9:	39 c8                	cmp    %ecx,%eax
     eab:	0f 8d 5f 02 00 00    	jge    1110 <_compress_block+0x410>
     eb1:	89 d0                	mov    %edx,%eax
     eb3:	8b 53 08             	mov    0x8(%ebx),%edx
     eb6:	d3 e0                	shl    %cl,%eax
     eb8:	89 e9                	mov    %ebp,%ecx
     eba:	09 c1                	or     %eax,%ecx
     ebc:	8b 43 14             	mov    0x14(%ebx),%eax
     ebf:	66 89 8b b0 16 00 00 	mov    %cx,0x16b0(%ebx)
     ec6:	8d 68 01             	lea    0x1(%eax),%ebp
     ec9:	89 6b 14             	mov    %ebp,0x14(%ebx)
     ecc:	88 0c 02             	mov    %cl,(%edx,%eax,1)
     ecf:	8b 43 14             	mov    0x14(%ebx),%eax
     ed2:	8b 6b 08             	mov    0x8(%ebx),%ebp
     ed5:	31 d2                	xor    %edx,%edx
     ed7:	8d 48 01             	lea    0x1(%eax),%ecx
     eda:	66 8b 54 24 04       	mov    0x4(%esp),%dx
     edf:	89 4b 14             	mov    %ecx,0x14(%ebx)
     ee2:	31 c9                	xor    %ecx,%ecx
     ee4:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
     eea:	88 4c 05 00          	mov    %cl,0x0(%ebp,%eax,1)
     eee:	b9 10 00 00 00       	mov    $0x10,%ecx
     ef3:	8b 83 b4 16 00 00    	mov    0x16b4(%ebx),%eax
     ef9:	29 c1                	sub    %eax,%ecx
     efb:	d3 fa                	sar    %cl,%edx
     efd:	8d 4c 07 f0          	lea    -0x10(%edi,%eax,1),%ecx
     f01:	89 d5                	mov    %edx,%ebp
     f03:	66 89 93 b0 16 00 00 	mov    %dx,0x16b0(%ebx)
     f0a:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
            }
            dist--; /* dist is now the match distance - 1 */
     f10:	4e                   	dec    %esi
            code = d_code(dist);
     f11:	81 fe ff 00 00 00    	cmp    $0xff,%esi
     f17:	0f 87 d9 01 00 00    	ja     10f6 <_compress_block+0x3f6>
     f1d:	31 c0                	xor    %eax,%eax
     f1f:	8a 86 00 02 00 00    	mov    0x200(%esi),%al
     f25:	89 44 24 04          	mov    %eax,0x4(%esp)
            Assert (code < D_CODES, "bad d_code");

            send_code(s, code, dtree);       /* send the distance code */
     f29:	8b 7c 24 04          	mov    0x4(%esp),%edi
     f2d:	8b 44 24 10          	mov    0x10(%esp),%eax
     f31:	ba 10 00 00 00       	mov    $0x10,%edx
     f36:	8d 04 b8             	lea    (%eax,%edi,4),%eax
     f39:	31 ff                	xor    %edi,%edi
     f3b:	66 8b 78 02          	mov    0x2(%eax),%di
     f3f:	29 fa                	sub    %edi,%edx
     f41:	39 ca                	cmp    %ecx,%edx
     f43:	0f 8d 8a 01 00 00    	jge    10d3 <_compress_block+0x3d3>
     f49:	31 d2                	xor    %edx,%edx
     f4b:	66 8b 10             	mov    (%eax),%dx
     f4e:	89 d0                	mov    %edx,%eax
     f50:	d3 e0                	shl    %cl,%eax
     f52:	89 e9                	mov    %ebp,%ecx
     f54:	09 c1                	or     %eax,%ecx
     f56:	8b 43 14             	mov    0x14(%ebx),%eax
     f59:	66 89 8b b0 16 00 00 	mov    %cx,0x16b0(%ebx)
     f60:	8d 68 01             	lea    0x1(%eax),%ebp
     f63:	89 6b 14             	mov    %ebp,0x14(%ebx)
     f66:	8b 6b 08             	mov    0x8(%ebx),%ebp
     f69:	88 4c 05 00          	mov    %cl,0x0(%ebp,%eax,1)
     f6d:	8b 43 14             	mov    0x14(%ebx),%eax
     f70:	8b 6b 08             	mov    0x8(%ebx),%ebp
     f73:	8d 48 01             	lea    0x1(%eax),%ecx
     f76:	89 4b 14             	mov    %ecx,0x14(%ebx)
     f79:	31 c9                	xor    %ecx,%ecx
     f7b:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
     f81:	88 4c 05 00          	mov    %cl,0x0(%ebp,%eax,1)
     f85:	b9 10 00 00 00       	mov    $0x10,%ecx
     f8a:	8b 83 b4 16 00 00    	mov    0x16b4(%ebx),%eax
     f90:	29 c1                	sub    %eax,%ecx
     f92:	d3 fa                	sar    %cl,%edx
     f94:	8d 4c 07 f0          	lea    -0x10(%edi,%eax,1),%ecx
     f98:	89 d5                	mov    %edx,%ebp
     f9a:	66 89 93 b0 16 00 00 	mov    %dx,0x16b0(%ebx)
     fa1:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
            extra = extra_dbits[code];
     fa7:	8b 44 24 04          	mov    0x4(%esp),%eax
     fab:	8b 04 85 80 09 00 00 	mov    0x980(,%eax,4),%eax
            if (extra != 0) {
     fb2:	85 c0                	test   %eax,%eax
     fb4:	0f 84 02 fe ff ff    	je     dbc <_compress_block+0xbc>
                dist -= base_dist[code];
     fba:	8b 7c 24 04          	mov    0x4(%esp),%edi
     fbe:	8b 14 bd 00 00 00 00 	mov    0x0(,%edi,4),%edx
     fc5:	29 d6                	sub    %edx,%esi
     fc7:	89 74 24 04          	mov    %esi,0x4(%esp)
                send_bits(s, dist, extra);   /* send the extra distance bits */
     fcb:	be 10 00 00 00       	mov    $0x10,%esi
     fd0:	29 c6                	sub    %eax,%esi
     fd2:	39 ce                	cmp    %ecx,%esi
     fd4:	7d 5a                	jge    1030 <_compress_block+0x330>
     fd6:	8b 7c 24 04          	mov    0x4(%esp),%edi
     fda:	8b 73 08             	mov    0x8(%ebx),%esi
     fdd:	d3 e7                	shl    %cl,%edi
     fdf:	8b 4b 14             	mov    0x14(%ebx),%ecx
     fe2:	09 fd                	or     %edi,%ebp
     fe4:	89 ea                	mov    %ebp,%edx
     fe6:	66 89 ab b0 16 00 00 	mov    %bp,0x16b0(%ebx)
     fed:	8d 79 01             	lea    0x1(%ecx),%edi
     ff0:	89 7b 14             	mov    %edi,0x14(%ebx)
     ff3:	88 14 0e             	mov    %dl,(%esi,%ecx,1)
     ff6:	8b 4b 14             	mov    0x14(%ebx),%ecx
     ff9:	8b 7b 08             	mov    0x8(%ebx),%edi
     ffc:	8d 71 01             	lea    0x1(%ecx),%esi
     fff:	89 73 14             	mov    %esi,0x14(%ebx)
    1002:	0f b6 b3 b1 16 00 00 	movzbl 0x16b1(%ebx),%esi
    1009:	81 e6 ff 00 00 00    	and    $0xff,%esi
    100f:	89 f2                	mov    %esi,%edx
    1011:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
    1014:	31 d2                	xor    %edx,%edx
    1016:	8b b3 b4 16 00 00    	mov    0x16b4(%ebx),%esi
    101c:	b9 10 00 00 00       	mov    $0x10,%ecx
    1021:	66 8b 54 24 04       	mov    0x4(%esp),%dx
    1026:	29 f1                	sub    %esi,%ecx
    1028:	e9 7a fd ff ff       	jmp    da7 <_compress_block+0xa7>
    102d:	8d 76 00             	lea    0x0(%esi),%esi
    1030:	8b 54 24 04          	mov    0x4(%esp),%edx
    1034:	d3 e2                	shl    %cl,%edx
    1036:	09 d5                	or     %edx,%ebp
    1038:	01 c1                	add    %eax,%ecx
    103a:	8b 14 24             	mov    (%esp),%edx
    103d:	66 89 ab b0 16 00 00 	mov    %bp,0x16b0(%ebx)
    1044:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
        } /* literal or match pair ? */

        /* Check that the overlay between pending_buf and d_buf+l_buf is ok: */
        Assert(s->pending < s->lit_bufsize + 2*lx, "pendingBuf overflow");

    } while (lx < s->last_lit);
    104a:	3b 93 98 16 00 00    	cmp    0x1698(%ebx),%edx
    1050:	0f 82 75 fd ff ff    	jb     dcb <_compress_block+0xcb>

    send_code(s, END_BLOCK, ltree);
    1056:	8b 44 24 08          	mov    0x8(%esp),%eax
    105a:	31 f6                	xor    %esi,%esi
    105c:	66 8b b0 02 04 00 00 	mov    0x402(%eax),%si
    1063:	b8 10 00 00 00       	mov    $0x10,%eax
    1068:	89 c2                	mov    %eax,%edx
    106a:	29 f2                	sub    %esi,%edx
    106c:	39 ca                	cmp    %ecx,%edx
    106e:	0f 8c bc 00 00 00    	jl     1130 <_compress_block+0x430>
    1074:	8b 7c 24 08          	mov    0x8(%esp),%edi
    1078:	31 c0                	xor    %eax,%eax
    107a:	01 ce                	add    %ecx,%esi
    107c:	66 8b 87 00 04 00 00 	mov    0x400(%edi),%ax
    1083:	89 b3 b4 16 00 00    	mov    %esi,0x16b4(%ebx)
    1089:	d3 e0                	shl    %cl,%eax
    108b:	09 e8                	or     %ebp,%eax
    108d:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    s->last_eob_len = ltree[END_BLOCK].Len;
    1094:	8b 7c 24 08          	mov    0x8(%esp),%edi
    1098:	31 c0                	xor    %eax,%eax
    109a:	66 8b 87 02 04 00 00 	mov    0x402(%edi),%ax
    10a1:	89 83 ac 16 00 00    	mov    %eax,0x16ac(%ebx)
}
    10a7:	83 c4 14             	add    $0x14,%esp
    10aa:	5b                   	pop    %ebx
    10ab:	5e                   	pop    %esi
    10ac:	5f                   	pop    %edi
    10ad:	5d                   	pop    %ebp
    10ae:	c3                   	ret    
    10af:	90                   	nop
            send_code(s, lc, ltree); /* send a literal byte */
            Tracecv(isgraph(lc), (stderr," '%c' ", lc));
        } else {
            /* Here, lc is the match length - MIN_MATCH */
            code = _length_code[lc];
            send_code(s, code+LITERALS+1, ltree); /* send the length code */
    10b0:	66 8b 10             	mov    (%eax),%dx
    10b3:	81 e2 ff ff 00 00    	and    $0xffff,%edx
    10b9:	89 d0                	mov    %edx,%eax
    10bb:	d3 e0                	shl    %cl,%eax
    10bd:	09 c5                	or     %eax,%ebp
    10bf:	01 f9                	add    %edi,%ecx
    10c1:	66 89 ab b0 16 00 00 	mov    %bp,0x16b0(%ebx)
    10c8:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    10ce:	e9 b1 fd ff ff       	jmp    e84 <_compress_block+0x184>
            }
            dist--; /* dist is now the match distance - 1 */
            code = d_code(dist);
            Assert (code < D_CODES, "bad d_code");

            send_code(s, code, dtree);       /* send the distance code */
    10d3:	66 8b 10             	mov    (%eax),%dx
    10d6:	81 e2 ff ff 00 00    	and    $0xffff,%edx
    10dc:	89 d0                	mov    %edx,%eax
    10de:	d3 e0                	shl    %cl,%eax
    10e0:	09 c5                	or     %eax,%ebp
    10e2:	01 f9                	add    %edi,%ecx
    10e4:	66 89 ab b0 16 00 00 	mov    %bp,0x16b0(%ebx)
    10eb:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    10f1:	e9 b1 fe ff ff       	jmp    fa7 <_compress_block+0x2a7>
            if (extra != 0) {
                lc -= base_length[code];
                send_bits(s, lc, extra);       /* send the extra length bits */
            }
            dist--; /* dist is now the match distance - 1 */
            code = d_code(dist);
    10f6:	89 f0                	mov    %esi,%eax
    10f8:	31 d2                	xor    %edx,%edx
    10fa:	c1 e8 07             	shr    $0x7,%eax
    10fd:	8a 90 00 03 00 00    	mov    0x300(%eax),%dl
    1103:	89 54 24 04          	mov    %edx,0x4(%esp)
    1107:	e9 1d fe ff ff       	jmp    f29 <_compress_block+0x229>
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            code = _length_code[lc];
            send_code(s, code+LITERALS+1, ltree); /* send the length code */
            extra = extra_lbits[code];
            if (extra != 0) {
                lc -= base_length[code];
                send_bits(s, lc, extra);       /* send the extra length bits */
    1110:	8b 54 24 04          	mov    0x4(%esp),%edx
    1114:	d3 e2                	shl    %cl,%edx
    1116:	09 d5                	or     %edx,%ebp
    1118:	01 f9                	add    %edi,%ecx
    111a:	66 89 ab b0 16 00 00 	mov    %bp,0x16b0(%ebx)
    1121:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    1127:	e9 e4 fd ff ff       	jmp    f10 <_compress_block+0x210>
    112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        /* Check that the overlay between pending_buf and d_buf+l_buf is ok: */
        Assert(s->pending < s->lit_bufsize + 2*lx, "pendingBuf overflow");

    } while (lx < s->last_lit);

    send_code(s, END_BLOCK, ltree);
    1130:	8b 54 24 08          	mov    0x8(%esp),%edx
    1134:	31 ff                	xor    %edi,%edi
    1136:	66 8b ba 00 04 00 00 	mov    0x400(%edx),%di
    113d:	89 fa                	mov    %edi,%edx
    113f:	89 3c 24             	mov    %edi,(%esp)
    1142:	d3 e2                	shl    %cl,%edx
    1144:	89 d1                	mov    %edx,%ecx
    1146:	8b 53 14             	mov    0x14(%ebx),%edx
    1149:	09 e9                	or     %ebp,%ecx
    114b:	8b 6b 08             	mov    0x8(%ebx),%ebp
    114e:	8d 7a 01             	lea    0x1(%edx),%edi
    1151:	66 89 8b b0 16 00 00 	mov    %cx,0x16b0(%ebx)
    1158:	89 7b 14             	mov    %edi,0x14(%ebx)
    115b:	88 4c 15 00          	mov    %cl,0x0(%ebp,%edx,1)
    115f:	8b 53 14             	mov    0x14(%ebx),%edx
    1162:	8b 7b 08             	mov    0x8(%ebx),%edi
    1165:	8b 2c 24             	mov    (%esp),%ebp
    1168:	8d 4a 01             	lea    0x1(%edx),%ecx
    116b:	89 4b 14             	mov    %ecx,0x14(%ebx)
    116e:	31 c9                	xor    %ecx,%ecx
    1170:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
    1176:	88 0c 17             	mov    %cl,(%edi,%edx,1)
    1179:	8b 93 b4 16 00 00    	mov    0x16b4(%ebx),%edx
    117f:	29 d0                	sub    %edx,%eax
    1181:	89 c1                	mov    %eax,%ecx
    1183:	8d 44 16 f0          	lea    -0x10(%esi,%edx,1),%eax
    1187:	d3 fd                	sar    %cl,%ebp
    1189:	66 89 ab b0 16 00 00 	mov    %bp,0x16b0(%ebx)
    1190:	89 83 b4 16 00 00    	mov    %eax,0x16b4(%ebx)
    1196:	e9 f9 fe ff ff       	jmp    1094 <_compress_block+0x394>
    119b:	90                   	nop
    119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011a0 <_bi_windup>:
 * Flush the bit buffer and align the output on a byte boundary
 */
local void bi_windup(s)
    deflate_state *s;
{
    if (s->bi_valid > 8) {
    11a0:	8b 90 b4 16 00 00    	mov    0x16b4(%eax),%edx
/* ===========================================================================
 * Flush the bit buffer and align the output on a byte boundary
 */
local void bi_windup(s)
    deflate_state *s;
{
    11a6:	53                   	push   %ebx
    if (s->bi_valid > 8) {
    11a7:	83 fa 08             	cmp    $0x8,%edx
    11aa:	7f 34                	jg     11e0 <_bi_windup+0x40>
        put_short(s, s->bi_buf);
    } else if (s->bi_valid > 0) {
    11ac:	85 d2                	test   %edx,%edx
    11ae:	7e 15                	jle    11c5 <_bi_windup+0x25>
        put_byte(s, (Byte)s->bi_buf);
    11b0:	8b 50 14             	mov    0x14(%eax),%edx
    11b3:	8b 48 08             	mov    0x8(%eax),%ecx
    11b6:	8d 5a 01             	lea    0x1(%edx),%ebx
    11b9:	89 58 14             	mov    %ebx,0x14(%eax)
    11bc:	8a 98 b0 16 00 00    	mov    0x16b0(%eax),%bl
    11c2:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
    }
    s->bi_buf = 0;
    11c5:	66 c7 80 b0 16 00 00 	movw   $0x0,0x16b0(%eax)
    11cc:	00 00 
    s->bi_valid = 0;
    11ce:	c7 80 b4 16 00 00 00 	movl   $0x0,0x16b4(%eax)
    11d5:	00 00 00 
#ifdef DEBUG
    s->bits_sent = (s->bits_sent+7) & ~7;
#endif
}
    11d8:	5b                   	pop    %ebx
    11d9:	c3                   	ret    
    11da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 */
local void bi_windup(s)
    deflate_state *s;
{
    if (s->bi_valid > 8) {
        put_short(s, s->bi_buf);
    11e0:	8b 50 14             	mov    0x14(%eax),%edx
    11e3:	8b 48 08             	mov    0x8(%eax),%ecx
    11e6:	8d 5a 01             	lea    0x1(%edx),%ebx
    11e9:	89 58 14             	mov    %ebx,0x14(%eax)
    11ec:	8a 98 b0 16 00 00    	mov    0x16b0(%eax),%bl
    11f2:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
    11f5:	8b 50 14             	mov    0x14(%eax),%edx
    11f8:	8b 48 08             	mov    0x8(%eax),%ecx
    11fb:	8d 5a 01             	lea    0x1(%edx),%ebx
    11fe:	89 58 14             	mov    %ebx,0x14(%eax)
    1201:	31 db                	xor    %ebx,%ebx
    1203:	8a 98 b1 16 00 00    	mov    0x16b1(%eax),%bl
    1209:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
    120c:	eb b7                	jmp    11c5 <_bi_windup+0x25>
    120e:	66 90                	xchg   %ax,%ax

00001210 <_bi_flush>:
 * Flush the bit buffer, keeping at most 7 bits in it.
 */
local void bi_flush(s)
    deflate_state *s;
{
    if (s->bi_valid == 16) {
    1210:	8b 90 b4 16 00 00    	mov    0x16b4(%eax),%edx
/* ===========================================================================
 * Flush the bit buffer, keeping at most 7 bits in it.
 */
local void bi_flush(s)
    deflate_state *s;
{
    1216:	53                   	push   %ebx
    if (s->bi_valid == 16) {
    1217:	83 fa 10             	cmp    $0x10,%edx
    121a:	74 34                	je     1250 <_bi_flush+0x40>
        put_short(s, s->bi_buf);
        s->bi_buf = 0;
        s->bi_valid = 0;
    } else if (s->bi_valid >= 8) {
    121c:	83 fa 07             	cmp    $0x7,%edx
    121f:	7e 2c                	jle    124d <_bi_flush+0x3d>
        put_byte(s, (Byte)s->bi_buf);
    1221:	8b 50 14             	mov    0x14(%eax),%edx
    1224:	8b 48 08             	mov    0x8(%eax),%ecx
    1227:	8d 5a 01             	lea    0x1(%edx),%ebx
    122a:	89 58 14             	mov    %ebx,0x14(%eax)
    122d:	8a 98 b0 16 00 00    	mov    0x16b0(%eax),%bl
    1233:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
        s->bi_buf >>= 8;
        s->bi_valid -= 8;
    1236:	8b 90 b4 16 00 00    	mov    0x16b4(%eax),%edx
        put_short(s, s->bi_buf);
        s->bi_buf = 0;
        s->bi_valid = 0;
    } else if (s->bi_valid >= 8) {
        put_byte(s, (Byte)s->bi_buf);
        s->bi_buf >>= 8;
    123c:	66 c1 a8 b0 16 00 00 	shrw   $0x8,0x16b0(%eax)
    1243:	08 
        s->bi_valid -= 8;
    1244:	83 ea 08             	sub    $0x8,%edx
    1247:	89 90 b4 16 00 00    	mov    %edx,0x16b4(%eax)
    }
}
    124d:	5b                   	pop    %ebx
    124e:	c3                   	ret    
    124f:	90                   	nop
 */
local void bi_flush(s)
    deflate_state *s;
{
    if (s->bi_valid == 16) {
        put_short(s, s->bi_buf);
    1250:	8b 50 14             	mov    0x14(%eax),%edx
    1253:	8b 48 08             	mov    0x8(%eax),%ecx
    1256:	8d 5a 01             	lea    0x1(%edx),%ebx
    1259:	89 58 14             	mov    %ebx,0x14(%eax)
    125c:	8a 98 b0 16 00 00    	mov    0x16b0(%eax),%bl
    1262:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
    1265:	8b 50 14             	mov    0x14(%eax),%edx
    1268:	8b 48 08             	mov    0x8(%eax),%ecx
    126b:	8d 5a 01             	lea    0x1(%edx),%ebx
    126e:	89 58 14             	mov    %ebx,0x14(%eax)
    1271:	31 db                	xor    %ebx,%ebx
    1273:	8a 98 b1 16 00 00    	mov    0x16b1(%eax),%bl
    1279:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
        s->bi_buf = 0;
    127c:	66 c7 80 b0 16 00 00 	movw   $0x0,0x16b0(%eax)
    1283:	00 00 
        s->bi_valid = 0;
    1285:	c7 80 b4 16 00 00 00 	movl   $0x0,0x16b4(%eax)
    128c:	00 00 00 
    } else if (s->bi_valid >= 8) {
        put_byte(s, (Byte)s->bi_buf);
        s->bi_buf >>= 8;
        s->bi_valid -= 8;
    }
}
    128f:	5b                   	pop    %ebx
    1290:	c3                   	ret    
    1291:	eb 0d                	jmp    12a0 <__tr_init>
    1293:	90                   	nop
    1294:	90                   	nop
    1295:	90                   	nop
    1296:	90                   	nop
    1297:	90                   	nop
    1298:	90                   	nop
    1299:	90                   	nop
    129a:	90                   	nop
    129b:	90                   	nop
    129c:	90                   	nop
    129d:	90                   	nop
    129e:	90                   	nop
    129f:	90                   	nop

000012a0 <__tr_init>:
/* ===========================================================================
 * Initialize the tree data structures for a new zlib stream.
 */
void _tr_init(s)
    deflate_state *s;
{
    12a0:	56                   	push   %esi
    12a1:	53                   	push   %ebx
    12a2:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    tr_static_init();

    s->l_desc.dyn_tree = s->dyn_ltree;
    12a6:	8d 83 8c 00 00 00    	lea    0x8c(%ebx),%eax
    s->l_desc.stat_desc = &static_l_desc;

    s->d_desc.dyn_tree = s->dyn_dtree;
    12ac:	8d 93 80 09 00 00    	lea    0x980(%ebx),%edx
    s->d_desc.stat_desc = &static_d_desc;

    s->bl_desc.dyn_tree = s->bl_tree;
    12b2:	8d b3 74 0a 00 00    	lea    0xa74(%ebx),%esi
void _tr_init(s)
    deflate_state *s;
{
    tr_static_init();

    s->l_desc.dyn_tree = s->dyn_ltree;
    12b8:	89 83 10 0b 00 00    	mov    %eax,0xb10(%ebx)
    s->l_desc.stat_desc = &static_l_desc;
    12be:	c7 83 18 0b 00 00 28 	movl   $0x28,0xb18(%ebx)
    12c5:	00 00 00 

    s->d_desc.dyn_tree = s->dyn_dtree;
    12c8:	89 93 1c 0b 00 00    	mov    %edx,0xb1c(%ebx)
    s->d_desc.stat_desc = &static_d_desc;
    12ce:	c7 83 24 0b 00 00 14 	movl   $0x14,0xb24(%ebx)
    12d5:	00 00 00 

    s->bl_desc.dyn_tree = s->bl_tree;
    12d8:	89 b3 28 0b 00 00    	mov    %esi,0xb28(%ebx)
    s->bl_desc.stat_desc = &static_bl_desc;
    12de:	c7 83 30 0b 00 00 00 	movl   $0x0,0xb30(%ebx)
    12e5:	00 00 00 

    s->bi_buf = 0;
    12e8:	66 c7 83 b0 16 00 00 	movw   $0x0,0x16b0(%ebx)
    12ef:	00 00 
    s->bi_valid = 0;
    12f1:	c7 83 b4 16 00 00 00 	movl   $0x0,0x16b4(%ebx)
    12f8:	00 00 00 
    s->last_eob_len = 8; /* enough lookahead for inflate */
    12fb:	c7 83 ac 16 00 00 08 	movl   $0x8,0x16ac(%ebx)
    1302:	00 00 00 
    1305:	8d 8b 04 05 00 00    	lea    0x504(%ebx),%ecx
    130b:	90                   	nop
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    deflate_state *s;
{
    int n; /* iterates over tree elements */

    /* Initialize the trees. */
    for (n = 0; n < L_CODES;  n++) s->dyn_ltree[n].Freq = 0;
    1310:	66 c7 00 00 00       	movw   $0x0,(%eax)
    1315:	83 c0 04             	add    $0x4,%eax
    1318:	39 c8                	cmp    %ecx,%eax
    131a:	75 f4                	jne    1310 <__tr_init+0x70>
    131c:	89 d0                	mov    %edx,%eax
    131e:	8d 93 f8 09 00 00    	lea    0x9f8(%ebx),%edx
    for (n = 0; n < D_CODES;  n++) s->dyn_dtree[n].Freq = 0;
    1324:	66 c7 00 00 00       	movw   $0x0,(%eax)
    1329:	83 c0 04             	add    $0x4,%eax
    132c:	39 d0                	cmp    %edx,%eax
    132e:	75 f4                	jne    1324 <__tr_init+0x84>
    1330:	89 f0                	mov    %esi,%eax
    1332:	8d 93 c0 0a 00 00    	lea    0xac0(%ebx),%edx
    for (n = 0; n < BL_CODES; n++) s->bl_tree[n].Freq = 0;
    1338:	66 c7 00 00 00       	movw   $0x0,(%eax)
    133d:	83 c0 04             	add    $0x4,%eax
    1340:	39 d0                	cmp    %edx,%eax
    1342:	75 f4                	jne    1338 <__tr_init+0x98>

    s->dyn_ltree[END_BLOCK].Freq = 1;
    1344:	66 c7 83 8c 04 00 00 	movw   $0x1,0x48c(%ebx)
    134b:	01 00 
    s->opt_len = s->static_len = 0L;
    134d:	c7 83 a4 16 00 00 00 	movl   $0x0,0x16a4(%ebx)
    1354:	00 00 00 
    1357:	c7 83 a0 16 00 00 00 	movl   $0x0,0x16a0(%ebx)
    135e:	00 00 00 
    s->last_lit = s->matches = 0;
    1361:	c7 83 a8 16 00 00 00 	movl   $0x0,0x16a8(%ebx)
    1368:	00 00 00 
    136b:	c7 83 98 16 00 00 00 	movl   $0x0,0x1698(%ebx)
    1372:	00 00 00 
    s->bits_sent = 0L;
#endif

    /* Initialize the first block of the first file: */
    init_block(s);
}
    1375:	5b                   	pop    %ebx
    1376:	5e                   	pop    %esi
    1377:	c3                   	ret    
    1378:	90                   	nop
    1379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001380 <__tr_stored_block>:
void _tr_stored_block(s, buf, stored_len, eof)
    deflate_state *s;
    charf *buf;       /* input block */
    ulg stored_len;   /* length of input block */
    int eof;          /* true if this is the last block for a file */
{
    1380:	55                   	push   %ebp
    1381:	57                   	push   %edi
    1382:	56                   	push   %esi
    1383:	53                   	push   %ebx
    1384:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    send_bits(s, (STORED_BLOCK<<1)+eof, 3);  /* send block type */
    1388:	8b 44 24 20          	mov    0x20(%esp),%eax
void _tr_stored_block(s, buf, stored_len, eof)
    deflate_state *s;
    charf *buf;       /* input block */
    ulg stored_len;   /* length of input block */
    int eof;          /* true if this is the last block for a file */
{
    138c:	8b 74 24 18          	mov    0x18(%esp),%esi
    1390:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    send_bits(s, (STORED_BLOCK<<1)+eof, 3);  /* send block type */
    1394:	8b 8b b4 16 00 00    	mov    0x16b4(%ebx),%ecx
    139a:	d3 e0                	shl    %cl,%eax
    139c:	83 f9 0d             	cmp    $0xd,%ecx
    139f:	0f 8f 9b 00 00 00    	jg     1440 <__tr_stored_block+0xc0>
    13a5:	66 09 83 b0 16 00 00 	or     %ax,0x16b0(%ebx)
    13ac:	83 c1 03             	add    $0x3,%ecx
    13af:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    deflate_state *s;
    charf    *buf;    /* the input data */
    unsigned len;     /* its length */
    int      header;  /* true if block header must be written */
{
    bi_windup(s);        /* align on byte boundary */
    13b5:	89 d8                	mov    %ebx,%eax
    13b7:	8d 2c 3e             	lea    (%esi,%edi,1),%ebp
    13ba:	e8 e1 fd ff ff       	call   11a0 <_bi_windup>
    s->last_eob_len = 8; /* enough lookahead for inflate */

    if (header) {
        put_short(s, (ush)len);   
    13bf:	8b 43 14             	mov    0x14(%ebx),%eax
    13c2:	8b 53 08             	mov    0x8(%ebx),%edx
    13c5:	8d 48 01             	lea    0x1(%eax),%ecx
    13c8:	89 4b 14             	mov    %ecx,0x14(%ebx)
    13cb:	89 f9                	mov    %edi,%ecx
    charf    *buf;    /* the input data */
    unsigned len;     /* its length */
    int      header;  /* true if block header must be written */
{
    bi_windup(s);        /* align on byte boundary */
    s->last_eob_len = 8; /* enough lookahead for inflate */
    13cd:	c7 83 ac 16 00 00 08 	movl   $0x8,0x16ac(%ebx)
    13d4:	00 00 00 

    if (header) {
        put_short(s, (ush)len);   
    13d7:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    13da:	8b 43 14             	mov    0x14(%ebx),%eax
    13dd:	8b 53 08             	mov    0x8(%ebx),%edx
    13e0:	8d 48 01             	lea    0x1(%eax),%ecx
    13e3:	89 4b 14             	mov    %ecx,0x14(%ebx)
    13e6:	89 f9                	mov    %edi,%ecx
    13e8:	66 c1 e9 08          	shr    $0x8,%cx
    13ec:	88 0c 02             	mov    %cl,(%edx,%eax,1)
        put_short(s, (ush)~len);
    13ef:	8b 43 14             	mov    0x14(%ebx),%eax
    13f2:	8b 53 08             	mov    0x8(%ebx),%edx
    13f5:	8d 48 01             	lea    0x1(%eax),%ecx
    13f8:	89 4b 14             	mov    %ecx,0x14(%ebx)
    13fb:	89 f9                	mov    %edi,%ecx
    13fd:	83 f1 ff             	xor    $0xffffffff,%ecx
    1400:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    1403:	8b 53 14             	mov    0x14(%ebx),%edx
    1406:	8b 4b 08             	mov    0x8(%ebx),%ecx
    1409:	8d 42 01             	lea    0x1(%edx),%eax
    140c:	89 43 14             	mov    %eax,0x14(%ebx)
    140f:	89 f8                	mov    %edi,%eax
    1411:	83 f0 ff             	xor    $0xffffffff,%eax
    1414:	66 c1 e8 08          	shr    $0x8,%ax
#endif
    }
#ifdef DEBUG
    s->bits_sent += (ulg)len<<3;
#endif
    while (len--) {
    1418:	85 ff                	test   %edi,%edi
    bi_windup(s);        /* align on byte boundary */
    s->last_eob_len = 8; /* enough lookahead for inflate */

    if (header) {
        put_short(s, (ush)len);   
        put_short(s, (ush)~len);
    141a:	88 04 11             	mov    %al,(%ecx,%edx,1)
#endif
    }
#ifdef DEBUG
    s->bits_sent += (ulg)len<<3;
#endif
    while (len--) {
    141d:	74 18                	je     1437 <__tr_stored_block+0xb7>
    141f:	90                   	nop
        put_byte(s, *buf++);
    1420:	8b 43 14             	mov    0x14(%ebx),%eax
    1423:	46                   	inc    %esi
    1424:	8b 53 08             	mov    0x8(%ebx),%edx
#endif
    }
#ifdef DEBUG
    s->bits_sent += (ulg)len<<3;
#endif
    while (len--) {
    1427:	39 ee                	cmp    %ebp,%esi
        put_byte(s, *buf++);
    1429:	8d 48 01             	lea    0x1(%eax),%ecx
    142c:	89 4b 14             	mov    %ecx,0x14(%ebx)
    142f:	8a 4e ff             	mov    -0x1(%esi),%cl
    1432:	88 0c 02             	mov    %cl,(%edx,%eax,1)
#endif
    }
#ifdef DEBUG
    s->bits_sent += (ulg)len<<3;
#endif
    while (len--) {
    1435:	75 e9                	jne    1420 <__tr_stored_block+0xa0>
#ifdef DEBUG
    s->compressed_len = (s->compressed_len + 3 + 7) & (ulg)~7L;
    s->compressed_len += (stored_len + 4) << 3;
#endif
    copy_block(s, buf, (unsigned)stored_len, 1); /* with header */
}
    1437:	5b                   	pop    %ebx
    1438:	5e                   	pop    %esi
    1439:	5f                   	pop    %edi
    143a:	5d                   	pop    %ebp
    143b:	c3                   	ret    
    143c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    deflate_state *s;
    charf *buf;       /* input block */
    ulg stored_len;   /* length of input block */
    int eof;          /* true if this is the last block for a file */
{
    send_bits(s, (STORED_BLOCK<<1)+eof, 3);  /* send block type */
    1440:	8b 93 b0 16 00 00    	mov    0x16b0(%ebx),%edx
    1446:	8b 4b 08             	mov    0x8(%ebx),%ecx
    1449:	09 d0                	or     %edx,%eax
    144b:	8b 53 14             	mov    0x14(%ebx),%edx
    144e:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    1455:	8d 6a 01             	lea    0x1(%edx),%ebp
    1458:	89 6b 14             	mov    %ebp,0x14(%ebx)
    145b:	88 04 11             	mov    %al,(%ecx,%edx,1)
    145e:	8b 43 14             	mov    0x14(%ebx),%eax
    1461:	8b 53 08             	mov    0x8(%ebx),%edx
    1464:	8d 48 01             	lea    0x1(%eax),%ecx
    1467:	89 4b 14             	mov    %ecx,0x14(%ebx)
    146a:	31 c9                	xor    %ecx,%ecx
    146c:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
    1472:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    1475:	31 d2                	xor    %edx,%edx
    1477:	8b 83 b4 16 00 00    	mov    0x16b4(%ebx),%eax
    147d:	b9 10 00 00 00       	mov    $0x10,%ecx
    1482:	29 c1                	sub    %eax,%ecx
    1484:	66 8b 54 24 20       	mov    0x20(%esp),%dx
    1489:	d3 fa                	sar    %cl,%edx
    148b:	83 e8 0d             	sub    $0xd,%eax
    148e:	66 89 93 b0 16 00 00 	mov    %dx,0x16b0(%ebx)
    1495:	89 83 b4 16 00 00    	mov    %eax,0x16b4(%ebx)
    149b:	e9 15 ff ff ff       	jmp    13b5 <__tr_stored_block+0x35>

000014a0 <__tr_align>:
 * To simplify the code, we assume the worst case of last real code encoded
 * on one bit only.
 */
void _tr_align(s)
    deflate_state *s;
{
    14a0:	57                   	push   %edi
    14a1:	56                   	push   %esi
    14a2:	53                   	push   %ebx
    14a3:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    send_bits(s, STATIC_TREES<<1, 3);
    14a7:	8b 8b b4 16 00 00    	mov    0x16b4(%ebx),%ecx
    14ad:	83 f9 0d             	cmp    $0xd,%ecx
    14b0:	0f 8e 5a 01 00 00    	jle    1610 <__tr_align+0x170>
    14b6:	ba 02 00 00 00       	mov    $0x2,%edx
    14bb:	8b bb b0 16 00 00    	mov    0x16b0(%ebx),%edi
    14c1:	89 d0                	mov    %edx,%eax
    14c3:	8b 73 08             	mov    0x8(%ebx),%esi
    14c6:	d3 e0                	shl    %cl,%eax
    14c8:	8b 4b 14             	mov    0x14(%ebx),%ecx
    14cb:	09 f8                	or     %edi,%eax
    14cd:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    14d4:	8d 79 01             	lea    0x1(%ecx),%edi
    14d7:	89 7b 14             	mov    %edi,0x14(%ebx)
    14da:	88 04 0e             	mov    %al,(%esi,%ecx,1)
    14dd:	8b 43 14             	mov    0x14(%ebx),%eax
    14e0:	8b 7b 08             	mov    0x8(%ebx),%edi
    14e3:	31 c9                	xor    %ecx,%ecx
    14e5:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
    14eb:	8d 70 01             	lea    0x1(%eax),%esi
    14ee:	89 73 14             	mov    %esi,0x14(%ebx)
    14f1:	88 0c 07             	mov    %cl,(%edi,%eax,1)
    14f4:	8b 83 b4 16 00 00    	mov    0x16b4(%ebx),%eax
    14fa:	b9 10 00 00 00       	mov    $0x10,%ecx
    14ff:	29 c1                	sub    %eax,%ecx
    1501:	d3 fa                	sar    %cl,%edx
    1503:	8d 48 f3             	lea    -0xd(%eax),%ecx
    1506:	66 89 93 b0 16 00 00 	mov    %dx,0x16b0(%ebx)
    150d:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    send_code(s, END_BLOCK, static_ltree);
    1513:	83 f9 09             	cmp    $0x9,%ecx
    1516:	0f 8e e4 00 00 00    	jle    1600 <__tr_align+0x160>
    151c:	8b 43 14             	mov    0x14(%ebx),%eax
    151f:	8b 53 08             	mov    0x8(%ebx),%edx
    1522:	8d 48 01             	lea    0x1(%eax),%ecx
    1525:	89 4b 14             	mov    %ecx,0x14(%ebx)
    1528:	8a 8b b0 16 00 00    	mov    0x16b0(%ebx),%cl
    152e:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    1531:	8b 43 14             	mov    0x14(%ebx),%eax
    1534:	8b 53 08             	mov    0x8(%ebx),%edx
    1537:	8d 48 01             	lea    0x1(%eax),%ecx
    153a:	89 4b 14             	mov    %ecx,0x14(%ebx)
    153d:	31 c9                	xor    %ecx,%ecx
    153f:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
    1545:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    1548:	66 c7 83 b0 16 00 00 	movw   $0x0,0x16b0(%ebx)
    154f:	00 00 
    1551:	8b b3 b4 16 00 00    	mov    0x16b4(%ebx),%esi
    1557:	83 ee 09             	sub    $0x9,%esi
    155a:	89 b3 b4 16 00 00    	mov    %esi,0x16b4(%ebx)
#ifdef DEBUG
    s->compressed_len += 10L; /* 3 for block type, 7 for EOB */
#endif
    bi_flush(s);
    1560:	89 d8                	mov    %ebx,%eax
    1562:	e8 a9 fc ff ff       	call   1210 <_bi_flush>
    /* Of the 10 bits for the empty block, we have already sent
     * (10 - bi_valid) bits. The lookahead for the last real code (before
     * the EOB of the previous block) was thus at least one plus the length
     * of the EOB plus what we have just sent of the empty static block.
     */
    if (1 + s->last_eob_len + 10 - s->bi_valid < 9) {
    1567:	8b 83 ac 16 00 00    	mov    0x16ac(%ebx),%eax
    156d:	83 c0 0b             	add    $0xb,%eax
    1570:	8b 8b b4 16 00 00    	mov    0x16b4(%ebx),%ecx
    1576:	29 c8                	sub    %ecx,%eax
    1578:	83 f8 08             	cmp    $0x8,%eax
    157b:	7f 74                	jg     15f1 <__tr_align+0x151>
        send_bits(s, STATIC_TREES<<1, 3);
    157d:	83 f9 0d             	cmp    $0xd,%ecx
    1580:	0f 8f aa 00 00 00    	jg     1630 <__tr_align+0x190>
    1586:	b8 02 00 00 00       	mov    $0x2,%eax
    158b:	d3 e0                	shl    %cl,%eax
    158d:	66 09 83 b0 16 00 00 	or     %ax,0x16b0(%ebx)
    1594:	83 c1 03             	add    $0x3,%ecx
    1597:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
        send_code(s, END_BLOCK, static_ltree);
    159d:	83 f9 09             	cmp    $0x9,%ecx
    15a0:	0f 8e f0 00 00 00    	jle    1696 <__tr_align+0x1f6>
    15a6:	8b 43 14             	mov    0x14(%ebx),%eax
    15a9:	8b 53 08             	mov    0x8(%ebx),%edx
    15ac:	8d 48 01             	lea    0x1(%eax),%ecx
    15af:	89 4b 14             	mov    %ecx,0x14(%ebx)
    15b2:	8a 8b b0 16 00 00    	mov    0x16b0(%ebx),%cl
    15b8:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    15bb:	8b 43 14             	mov    0x14(%ebx),%eax
    15be:	8b 53 08             	mov    0x8(%ebx),%edx
    15c1:	8d 48 01             	lea    0x1(%eax),%ecx
    15c4:	89 4b 14             	mov    %ecx,0x14(%ebx)
    15c7:	31 c9                	xor    %ecx,%ecx
    15c9:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
    15cf:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    15d2:	66 c7 83 b0 16 00 00 	movw   $0x0,0x16b0(%ebx)
    15d9:	00 00 
    15db:	8b 83 b4 16 00 00    	mov    0x16b4(%ebx),%eax
    15e1:	83 e8 09             	sub    $0x9,%eax
    15e4:	89 83 b4 16 00 00    	mov    %eax,0x16b4(%ebx)
#ifdef DEBUG
        s->compressed_len += 10L;
#endif
        bi_flush(s);
    15ea:	89 d8                	mov    %ebx,%eax
    15ec:	e8 1f fc ff ff       	call   1210 <_bi_flush>
    }
    s->last_eob_len = 7;
    15f1:	c7 83 ac 16 00 00 07 	movl   $0x7,0x16ac(%ebx)
    15f8:	00 00 00 
}
    15fb:	5b                   	pop    %ebx
    15fc:	5e                   	pop    %esi
    15fd:	5f                   	pop    %edi
    15fe:	c3                   	ret    
    15ff:	90                   	nop
 */
void _tr_align(s)
    deflate_state *s;
{
    send_bits(s, STATIC_TREES<<1, 3);
    send_code(s, END_BLOCK, static_ltree);
    1600:	83 c1 07             	add    $0x7,%ecx
    1603:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    1609:	e9 52 ff ff ff       	jmp    1560 <__tr_align+0xc0>
    160e:	66 90                	xchg   %ax,%ax
 * on one bit only.
 */
void _tr_align(s)
    deflate_state *s;
{
    send_bits(s, STATIC_TREES<<1, 3);
    1610:	b8 02 00 00 00       	mov    $0x2,%eax
    1615:	d3 e0                	shl    %cl,%eax
    1617:	66 09 83 b0 16 00 00 	or     %ax,0x16b0(%ebx)
    161e:	83 c1 03             	add    $0x3,%ecx
    1621:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    1627:	e9 e7 fe ff ff       	jmp    1513 <__tr_align+0x73>
    162c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     * (10 - bi_valid) bits. The lookahead for the last real code (before
     * the EOB of the previous block) was thus at least one plus the length
     * of the EOB plus what we have just sent of the empty static block.
     */
    if (1 + s->last_eob_len + 10 - s->bi_valid < 9) {
        send_bits(s, STATIC_TREES<<1, 3);
    1630:	ba 02 00 00 00       	mov    $0x2,%edx
    1635:	8b 73 08             	mov    0x8(%ebx),%esi
    1638:	89 d0                	mov    %edx,%eax
    163a:	d3 e0                	shl    %cl,%eax
    163c:	8b 8b b0 16 00 00    	mov    0x16b0(%ebx),%ecx
    1642:	09 c8                	or     %ecx,%eax
    1644:	8b 4b 14             	mov    0x14(%ebx),%ecx
    1647:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    164e:	8d 79 01             	lea    0x1(%ecx),%edi
    1651:	89 7b 14             	mov    %edi,0x14(%ebx)
    1654:	88 04 0e             	mov    %al,(%esi,%ecx,1)
    1657:	8b 43 14             	mov    0x14(%ebx),%eax
    165a:	31 c9                	xor    %ecx,%ecx
    165c:	8b 7b 08             	mov    0x8(%ebx),%edi
    165f:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
    1665:	8d 70 01             	lea    0x1(%eax),%esi
    1668:	89 73 14             	mov    %esi,0x14(%ebx)
    166b:	88 0c 07             	mov    %cl,(%edi,%eax,1)
    166e:	8b 83 b4 16 00 00    	mov    0x16b4(%ebx),%eax
    1674:	b9 10 00 00 00       	mov    $0x10,%ecx
    1679:	29 c1                	sub    %eax,%ecx
    167b:	d3 fa                	sar    %cl,%edx
    167d:	8d 48 f3             	lea    -0xd(%eax),%ecx
    1680:	66 89 93 b0 16 00 00 	mov    %dx,0x16b0(%ebx)
    1687:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
        send_code(s, END_BLOCK, static_ltree);
    168d:	83 f9 09             	cmp    $0x9,%ecx
    1690:	0f 8f 10 ff ff ff    	jg     15a6 <__tr_align+0x106>
    1696:	83 c1 07             	add    $0x7,%ecx
    1699:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    169f:	e9 46 ff ff ff       	jmp    15ea <__tr_align+0x14a>
    16a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    16aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000016b0 <__tr_flush_block>:
void _tr_flush_block(s, buf, stored_len, eof)
    deflate_state *s;
    charf *buf;       /* input block, or NULL if too old */
    ulg stored_len;   /* length of input block */
    int eof;          /* true if this is the last block for a file */
{
    16b0:	55                   	push   %ebp
    16b1:	57                   	push   %edi
    16b2:	56                   	push   %esi
    16b3:	53                   	push   %ebx
    16b4:	83 ec 2c             	sub    $0x2c,%esp
    16b7:	8b 5c 24 40          	mov    0x40(%esp),%ebx
    16bb:	8b 44 24 44          	mov    0x44(%esp),%eax
    16bf:	89 44 24 14          	mov    %eax,0x14(%esp)
    16c3:	8b 44 24 48          	mov    0x48(%esp),%eax
    ulg opt_lenb, static_lenb; /* opt_len and static_len in bytes */
    int max_blindex = 0;  /* index of last bit length code of non zero freq */

    /* Build the Huffman trees unless a stored block is forced */
    if (s->level > 0) {
    16c7:	8b 7b 7c             	mov    0x7c(%ebx),%edi
void _tr_flush_block(s, buf, stored_len, eof)
    deflate_state *s;
    charf *buf;       /* input block, or NULL if too old */
    ulg stored_len;   /* length of input block */
    int eof;          /* true if this is the last block for a file */
{
    16ca:	89 44 24 10          	mov    %eax,0x10(%esp)
    16ce:	8b 6c 24 4c          	mov    0x4c(%esp),%ebp
    ulg opt_lenb, static_lenb; /* opt_len and static_len in bytes */
    int max_blindex = 0;  /* index of last bit length code of non zero freq */

    /* Build the Huffman trees unless a stored block is forced */
    if (s->level > 0) {
    16d2:	85 ff                	test   %edi,%edi
    16d4:	0f 8e 4b 04 00 00    	jle    1b25 <__tr_flush_block+0x475>
    16da:	8d 83 8c 00 00 00    	lea    0x8c(%ebx),%eax
    16e0:	89 44 24 18          	mov    %eax,0x18(%esp)

	 /* Check if the file is ascii or binary */
	if (s->data_type == Z_UNKNOWN) set_data_type(s);
    16e4:	80 7b 1c 02          	cmpb   $0x2,0x1c(%ebx)
    16e8:	0f 84 88 05 00 00    	je     1c76 <__tr_flush_block+0x5c6>

	/* Construct the literal and distance trees */
	build_tree(s, (tree_desc *)(&(s->l_desc)));
    16ee:	8d 93 10 0b 00 00    	lea    0xb10(%ebx),%edx
    16f4:	89 d8                	mov    %ebx,%eax
    16f6:	e8 35 ea ff ff       	call   130 <_build_tree>
	Tracev((stderr, "\nlit data: dyn %ld, stat %ld", s->opt_len,
		s->static_len));

	build_tree(s, (tree_desc *)(&(s->d_desc)));
    16fb:	8d 93 1c 0b 00 00    	lea    0xb1c(%ebx),%edx
    1701:	89 d8                	mov    %ebx,%eax
    1703:	e8 28 ea ff ff       	call   130 <_build_tree>
    deflate_state *s;
{
    int max_blindex;  /* index of last bit length code of non zero freq */

    /* Determine the bit length frequencies for literal and distance trees */
    scan_tree(s, (ct_data *)s->dyn_ltree, s->l_desc.max_code);
    1708:	8b 8b 14 0b 00 00    	mov    0xb14(%ebx),%ecx
    170e:	8b 54 24 18          	mov    0x18(%esp),%edx
    1712:	89 d8                	mov    %ebx,%eax
    1714:	e8 c7 ee ff ff       	call   5e0 <_scan_tree>
    scan_tree(s, (ct_data *)s->dyn_dtree, s->d_desc.max_code);
    1719:	8d 83 80 09 00 00    	lea    0x980(%ebx),%eax
    171f:	89 c2                	mov    %eax,%edx
    1721:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1725:	8b 8b 20 0b 00 00    	mov    0xb20(%ebx),%ecx
    172b:	89 d8                	mov    %ebx,%eax
    172d:	e8 ae ee ff ff       	call   5e0 <_scan_tree>

    /* Build the bit length tree: */
    build_tree(s, (tree_desc *)(&(s->bl_desc)));
    1732:	8d 93 28 0b 00 00    	lea    0xb28(%ebx),%edx
    1738:	89 d8                	mov    %ebx,%eax
    173a:	e8 f1 e9 ff ff       	call   130 <_build_tree>

    /* Determine the number of bit length codes to send. The pkzip format
     * requires that at least 4 bit length codes be sent. (appnote.txt says
     * 3 but the actual value used is 4.)
     */
    for (max_blindex = BL_CODES-1; max_blindex >= 3; max_blindex--) {
    173f:	ba 12 00 00 00       	mov    $0x12,%edx
        if (s->bl_tree[bl_order[max_blindex]].Len != 0) break;
    1744:	31 c0                	xor    %eax,%eax
    1746:	8a 82 00 09 00 00    	mov    0x900(%edx),%al
    174c:	66 83 bc 83 76 0a 00 	cmpw   $0x0,0xa76(%ebx,%eax,4)
    1753:	00 00 
    1755:	0f 85 c1 03 00 00    	jne    1b1c <__tr_flush_block+0x46c>

    /* Determine the number of bit length codes to send. The pkzip format
     * requires that at least 4 bit length codes be sent. (appnote.txt says
     * 3 but the actual value used is 4.)
     */
    for (max_blindex = BL_CODES-1; max_blindex >= 3; max_blindex--) {
    175b:	4a                   	dec    %edx
    175c:	83 fa 02             	cmp    $0x2,%edx
    175f:	75 e3                	jne    1744 <__tr_flush_block+0x94>
    1761:	b9 09 00 00 00       	mov    $0x9,%ecx
    1766:	8b 83 a0 16 00 00    	mov    0x16a0(%ebx),%eax
	 */
	max_blindex = build_bl_tree(s);

	/* Determine the best encoding. Compute first the block length in bytes*/
	opt_lenb = (s->opt_len+3+7)>>3;
	static_lenb = (s->static_len+3+7)>>3;
    176c:	8b bb a4 16 00 00    	mov    0x16a4(%ebx),%edi
     */
    for (max_blindex = BL_CODES-1; max_blindex >= 3; max_blindex--) {
        if (s->bl_tree[bl_order[max_blindex]].Len != 0) break;
    }
    /* Update opt_len to include the bit length tree and counts */
    s->opt_len += 3*(max_blindex+1) + 5+5+4;
    1772:	8d 44 01 0e          	lea    0xe(%ecx,%eax,1),%eax
	 */
	max_blindex = build_bl_tree(s);

	/* Determine the best encoding. Compute first the block length in bytes*/
	opt_lenb = (s->opt_len+3+7)>>3;
	static_lenb = (s->static_len+3+7)>>3;
    1776:	8d 4f 0a             	lea    0xa(%edi),%ecx
     */
    for (max_blindex = BL_CODES-1; max_blindex >= 3; max_blindex--) {
        if (s->bl_tree[bl_order[max_blindex]].Len != 0) break;
    }
    /* Update opt_len to include the bit length tree and counts */
    s->opt_len += 3*(max_blindex+1) + 5+5+4;
    1779:	89 83 a0 16 00 00    	mov    %eax,0x16a0(%ebx)
    }

#ifdef FORCE_STORED
    if (buf != (char*)0) { /* force stored block */
#else
    if (stored_len+4 <= opt_lenb && buf != (char*)0) {
    177f:	8b 7c 24 10          	mov    0x10(%esp),%edi
	 */
	max_blindex = build_bl_tree(s);

	/* Determine the best encoding. Compute first the block length in bytes*/
	opt_lenb = (s->opt_len+3+7)>>3;
	static_lenb = (s->static_len+3+7)>>3;
    1783:	c1 e9 03             	shr    $0x3,%ecx
	 * in bl_order of the last bit length code to send.
	 */
	max_blindex = build_bl_tree(s);

	/* Determine the best encoding. Compute first the block length in bytes*/
	opt_lenb = (s->opt_len+3+7)>>3;
    1786:	83 c0 0a             	add    $0xa,%eax
    1789:	c1 e8 03             	shr    $0x3,%eax
    }

#ifdef FORCE_STORED
    if (buf != (char*)0) { /* force stored block */
#else
    if (stored_len+4 <= opt_lenb && buf != (char*)0) {
    178c:	8d 77 04             	lea    0x4(%edi),%esi
    178f:	39 c8                	cmp    %ecx,%eax
    1791:	0f 47 c1             	cmova  %ecx,%eax
    1794:	39 c6                	cmp    %eax,%esi
    1796:	0f 87 b1 00 00 00    	ja     184d <__tr_flush_block+0x19d>
    179c:	8b 74 24 14          	mov    0x14(%esp),%esi
    17a0:	85 f6                	test   %esi,%esi
    17a2:	0f 84 a5 00 00 00    	je     184d <__tr_flush_block+0x19d>
         * Otherwise we can't have processed more than WSIZE input bytes since
         * the last block flush, because compression would have been
         * successful. If LIT_BUFSIZE <= WSIZE, it is never too late to
         * transform a block into a stored block.
         */
        _tr_stored_block(s, buf, stored_len, eof);
    17a8:	8b 44 24 10          	mov    0x10(%esp),%eax
    17ac:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    17b0:	89 44 24 08          	mov    %eax,0x8(%esp)
    17b4:	8b 44 24 14          	mov    0x14(%esp),%eax
    17b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    17bc:	89 1c 24             	mov    %ebx,(%esp)
    17bf:	e8 bc fb ff ff       	call   1380 <__tr_stored_block>
    17c4:	8b 44 24 18          	mov    0x18(%esp),%eax
    17c8:	8d 93 04 05 00 00    	lea    0x504(%ebx),%edx
    17ce:	66 90                	xchg   %ax,%ax
    deflate_state *s;
{
    int n; /* iterates over tree elements */

    /* Initialize the trees. */
    for (n = 0; n < L_CODES;  n++) s->dyn_ltree[n].Freq = 0;
    17d0:	66 c7 00 00 00       	movw   $0x0,(%eax)
    17d5:	83 c0 04             	add    $0x4,%eax
    17d8:	39 d0                	cmp    %edx,%eax
    17da:	75 f4                	jne    17d0 <__tr_flush_block+0x120>
    17dc:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    17e0:	8d 93 f8 09 00 00    	lea    0x9f8(%ebx),%edx
    for (n = 0; n < D_CODES;  n++) s->dyn_dtree[n].Freq = 0;
    17e6:	66 c7 00 00 00       	movw   $0x0,(%eax)
    17eb:	83 c0 04             	add    $0x4,%eax
    17ee:	39 d0                	cmp    %edx,%eax
    17f0:	75 f4                	jne    17e6 <__tr_flush_block+0x136>
    17f2:	8d 83 74 0a 00 00    	lea    0xa74(%ebx),%eax
    17f8:	8d 93 c0 0a 00 00    	lea    0xac0(%ebx),%edx
    17fe:	66 90                	xchg   %ax,%ax
    for (n = 0; n < BL_CODES; n++) s->bl_tree[n].Freq = 0;
    1800:	66 c7 00 00 00       	movw   $0x0,(%eax)
    1805:	83 c0 04             	add    $0x4,%eax
    1808:	39 d0                	cmp    %edx,%eax
    180a:	75 f4                	jne    1800 <__tr_flush_block+0x150>

    s->dyn_ltree[END_BLOCK].Freq = 1;
    180c:	66 c7 83 8c 04 00 00 	movw   $0x1,0x48c(%ebx)
    1813:	01 00 
    s->opt_len = s->static_len = 0L;
    1815:	c7 83 a4 16 00 00 00 	movl   $0x0,0x16a4(%ebx)
    181c:	00 00 00 
    181f:	c7 83 a0 16 00 00 00 	movl   $0x0,0x16a0(%ebx)
    1826:	00 00 00 
    s->last_lit = s->matches = 0;
    1829:	c7 83 a8 16 00 00 00 	movl   $0x0,0x16a8(%ebx)
    1830:	00 00 00 
    1833:	c7 83 98 16 00 00 00 	movl   $0x0,0x1698(%ebx)
    183a:	00 00 00 
    /* The above check is made mod 2^32, for files larger than 512 MB
     * and uLong implemented on 32 bits.
     */
    init_block(s);

    if (eof) {
    183d:	85 ed                	test   %ebp,%ebp
    183f:	0f 85 c9 02 00 00    	jne    1b0e <__tr_flush_block+0x45e>
        s->compressed_len += 7;  /* align on byte boundary */
#endif
    }
    Tracev((stderr,"\ncomprlen %lu(%lu) ", s->compressed_len>>3,
           s->compressed_len-7*eof));
}
    1845:	83 c4 2c             	add    $0x2c,%esp
    1848:	5b                   	pop    %ebx
    1849:	5e                   	pop    %esi
    184a:	5f                   	pop    %edi
    184b:	5d                   	pop    %ebp
    184c:	c3                   	ret    
        _tr_stored_block(s, buf, stored_len, eof);

#ifdef FORCE_STATIC
    } else if (static_lenb >= 0) { /* force static trees */
#else
    } else if (static_lenb == opt_lenb) {
    184d:	39 c1                	cmp    %eax,%ecx
    184f:	0f 84 02 03 00 00    	je     1b57 <__tr_flush_block+0x4a7>
        compress_block(s, (ct_data *)static_ltree, (ct_data *)static_dtree);
#ifdef DEBUG
        s->compressed_len += 3 + s->static_len;
#endif
    } else {
        send_bits(s, (DYN_TREES<<1)+eof, 3);
    1855:	8b 8b b4 16 00 00    	mov    0x16b4(%ebx),%ecx
    185b:	83 f9 0d             	cmp    $0xd,%ecx
    185e:	0f 8e 85 03 00 00    	jle    1be9 <__tr_flush_block+0x539>
    1864:	8d 75 04             	lea    0x4(%ebp),%esi
    1867:	89 f0                	mov    %esi,%eax
    1869:	d3 e0                	shl    %cl,%eax
    186b:	8b 8b b0 16 00 00    	mov    0x16b0(%ebx),%ecx
    1871:	09 c8                	or     %ecx,%eax
    1873:	8b 4b 14             	mov    0x14(%ebx),%ecx
    1876:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    187d:	8d 79 01             	lea    0x1(%ecx),%edi
    1880:	89 7b 14             	mov    %edi,0x14(%ebx)
    1883:	8b 7b 08             	mov    0x8(%ebx),%edi
    1886:	88 04 0f             	mov    %al,(%edi,%ecx,1)
    1889:	8b 43 14             	mov    0x14(%ebx),%eax
    188c:	8b 7b 08             	mov    0x8(%ebx),%edi
    188f:	8d 48 01             	lea    0x1(%eax),%ecx
    1892:	89 4b 14             	mov    %ecx,0x14(%ebx)
    1895:	31 c9                	xor    %ecx,%ecx
    1897:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
    189d:	88 0c 07             	mov    %cl,(%edi,%eax,1)
    18a0:	31 c0                	xor    %eax,%eax
    18a2:	66 89 f0             	mov    %si,%ax
    18a5:	b9 10 00 00 00       	mov    $0x10,%ecx
    18aa:	8b b3 b4 16 00 00    	mov    0x16b4(%ebx),%esi
    18b0:	29 f1                	sub    %esi,%ecx
    18b2:	d3 f8                	sar    %cl,%eax
    18b4:	89 c7                	mov    %eax,%edi
    18b6:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    18bd:	8b 83 b4 16 00 00    	mov    0x16b4(%ebx),%eax
    18c3:	8d 48 f3             	lea    -0xd(%eax),%ecx
    18c6:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
        send_all_trees(s, s->l_desc.max_code+1, s->d_desc.max_code+1,
    18cc:	8b 83 20 0b 00 00    	mov    0xb20(%ebx),%eax

    Assert (lcodes >= 257 && dcodes >= 1 && blcodes >= 4, "not enough codes");
    Assert (lcodes <= L_CODES && dcodes <= D_CODES && blcodes <= BL_CODES,
            "too many codes");
    Tracev((stderr, "\nbl counts: "));
    send_bits(s, lcodes-257, 5); /* not +255 as stated in appnote.txt */
    18d2:	83 f9 0b             	cmp    $0xb,%ecx
#ifdef DEBUG
        s->compressed_len += 3 + s->static_len;
#endif
    } else {
        send_bits(s, (DYN_TREES<<1)+eof, 3);
        send_all_trees(s, s->l_desc.max_code+1, s->d_desc.max_code+1,
    18d5:	89 44 24 20          	mov    %eax,0x20(%esp)
    18d9:	8b 83 14 0b 00 00    	mov    0xb14(%ebx),%eax
    18df:	89 44 24 24          	mov    %eax,0x24(%esp)

    Assert (lcodes >= 257 && dcodes >= 1 && blcodes >= 4, "not enough codes");
    Assert (lcodes <= L_CODES && dcodes <= D_CODES && blcodes <= BL_CODES,
            "too many codes");
    Tracev((stderr, "\nbl counts: "));
    send_bits(s, lcodes-257, 5); /* not +255 as stated in appnote.txt */
    18e3:	0f 8e db 02 00 00    	jle    1bc4 <__tr_flush_block+0x514>
    18e9:	8d b0 00 ff ff ff    	lea    -0x100(%eax),%esi
    18ef:	89 f0                	mov    %esi,%eax
    18f1:	d3 e0                	shl    %cl,%eax
    18f3:	8b 4b 14             	mov    0x14(%ebx),%ecx
    18f6:	09 f8                	or     %edi,%eax
    18f8:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    18ff:	8d 79 01             	lea    0x1(%ecx),%edi
    1902:	89 7b 14             	mov    %edi,0x14(%ebx)
    1905:	8b 7b 08             	mov    0x8(%ebx),%edi
    1908:	88 04 0f             	mov    %al,(%edi,%ecx,1)
    190b:	8b 43 14             	mov    0x14(%ebx),%eax
    190e:	8b 7b 08             	mov    0x8(%ebx),%edi
    1911:	8d 48 01             	lea    0x1(%eax),%ecx
    1914:	89 4b 14             	mov    %ecx,0x14(%ebx)
    1917:	31 c9                	xor    %ecx,%ecx
    1919:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
    191f:	88 0c 07             	mov    %cl,(%edi,%eax,1)
    1922:	31 c0                	xor    %eax,%eax
    1924:	8b bb b4 16 00 00    	mov    0x16b4(%ebx),%edi
    192a:	b9 10 00 00 00       	mov    $0x10,%ecx
    192f:	29 f9                	sub    %edi,%ecx
    1931:	66 89 f0             	mov    %si,%ax
    1934:	d3 f8                	sar    %cl,%eax
    1936:	89 c1                	mov    %eax,%ecx
    1938:	66 89 8b b0 16 00 00 	mov    %cx,0x16b0(%ebx)
    193f:	8d 4f f5             	lea    -0xb(%edi),%ecx
    1942:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    send_bits(s, dcodes-1,   5);
    1948:	8b 7c 24 20          	mov    0x20(%esp),%edi
    194c:	d3 e7                	shl    %cl,%edi
    194e:	83 f9 0b             	cmp    $0xb,%ecx
    1951:	0f 8e 56 02 00 00    	jle    1bad <__tr_flush_block+0x4fd>
    1957:	8b 4b 14             	mov    0x14(%ebx),%ecx
    195a:	8b 73 08             	mov    0x8(%ebx),%esi
    195d:	09 f8                	or     %edi,%eax
    195f:	8d 79 01             	lea    0x1(%ecx),%edi
    1962:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    1969:	89 7b 14             	mov    %edi,0x14(%ebx)
    196c:	88 04 0e             	mov    %al,(%esi,%ecx,1)
    196f:	8b 43 14             	mov    0x14(%ebx),%eax
    1972:	8b 73 08             	mov    0x8(%ebx),%esi
    1975:	8d 48 01             	lea    0x1(%eax),%ecx
    1978:	89 4b 14             	mov    %ecx,0x14(%ebx)
    197b:	31 c9                	xor    %ecx,%ecx
    197d:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
    1983:	88 0c 06             	mov    %cl,(%esi,%eax,1)
    1986:	31 c0                	xor    %eax,%eax
    1988:	8b b3 b4 16 00 00    	mov    0x16b4(%ebx),%esi
    198e:	b9 10 00 00 00       	mov    $0x10,%ecx
    1993:	29 f1                	sub    %esi,%ecx
    1995:	66 8b 44 24 20       	mov    0x20(%esp),%ax
    199a:	d3 f8                	sar    %cl,%eax
    199c:	89 c1                	mov    %eax,%ecx
    199e:	66 89 8b b0 16 00 00 	mov    %cx,0x16b0(%ebx)
    19a5:	8d 4e f5             	lea    -0xb(%esi),%ecx
    19a8:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    send_bits(s, blcodes-4,  4); /* not -3 as stated in appnote.txt */
    19ae:	83 f9 0c             	cmp    $0xc,%ecx
    19b1:	0f 8e da 01 00 00    	jle    1b91 <__tr_flush_block+0x4e1>
    19b7:	8d 72 fd             	lea    -0x3(%edx),%esi
    19ba:	89 f7                	mov    %esi,%edi
    19bc:	d3 e7                	shl    %cl,%edi
    19be:	8b 4b 14             	mov    0x14(%ebx),%ecx
    19c1:	09 f8                	or     %edi,%eax
    19c3:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    19ca:	8d 79 01             	lea    0x1(%ecx),%edi
    19cd:	89 7b 14             	mov    %edi,0x14(%ebx)
    19d0:	8b 7b 08             	mov    0x8(%ebx),%edi
    19d3:	88 04 0f             	mov    %al,(%edi,%ecx,1)
    19d6:	8b 43 14             	mov    0x14(%ebx),%eax
    19d9:	8b 7b 08             	mov    0x8(%ebx),%edi
    19dc:	8d 48 01             	lea    0x1(%eax),%ecx
    19df:	89 4b 14             	mov    %ecx,0x14(%ebx)
    19e2:	31 c9                	xor    %ecx,%ecx
    19e4:	8a 8b b1 16 00 00    	mov    0x16b1(%ebx),%cl
    19ea:	88 0c 07             	mov    %cl,(%edi,%eax,1)
    19ed:	31 c0                	xor    %eax,%eax
    19ef:	66 89 f0             	mov    %si,%ax
    19f2:	b9 10 00 00 00       	mov    $0x10,%ecx
    19f7:	8b b3 b4 16 00 00    	mov    0x16b4(%ebx),%esi
    19fd:	29 f1                	sub    %esi,%ecx
    19ff:	d3 f8                	sar    %cl,%eax
    1a01:	89 c7                	mov    %eax,%edi
    1a03:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    1a0a:	8b 83 b4 16 00 00    	mov    0x16b4(%ebx),%eax
    1a10:	8d 48 f4             	lea    -0xc(%eax),%ecx
    1a13:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    1a19:	8d 42 01             	lea    0x1(%edx),%eax
    1a1c:	89 6c 24 28          	mov    %ebp,0x28(%esp)
    1a20:	89 44 24 10          	mov    %eax,0x10(%esp)

    /* Determine the number of bit length codes to send. The pkzip format
     * requires that at least 4 bit length codes be sent. (appnote.txt says
     * 3 but the actual value used is 4.)
     */
    for (max_blindex = BL_CODES-1; max_blindex >= 3; max_blindex--) {
    1a24:	31 d2                	xor    %edx,%edx
    1a26:	eb 74                	jmp    1a9c <__tr_flush_block+0x3ec>
    send_bits(s, lcodes-257, 5); /* not +255 as stated in appnote.txt */
    send_bits(s, dcodes-1,   5);
    send_bits(s, blcodes-4,  4); /* not -3 as stated in appnote.txt */
    for (rank = 0; rank < blcodes; rank++) {
        Tracev((stderr, "\nbl code %2d ", bl_order[rank]));
        send_bits(s, s->bl_tree[bl_order[rank]].Len, 3);
    1a28:	d3 e0                	shl    %cl,%eax
    1a2a:	89 74 24 14          	mov    %esi,0x14(%esp)
    1a2e:	89 c1                	mov    %eax,%ecx
    1a30:	8b 73 14             	mov    0x14(%ebx),%esi
    1a33:	09 f9                	or     %edi,%ecx
    1a35:	8b 7b 08             	mov    0x8(%ebx),%edi
    1a38:	66 89 8b b0 16 00 00 	mov    %cx,0x16b0(%ebx)
    1a3f:	8d 6e 01             	lea    0x1(%esi),%ebp
            "too many codes");
    Tracev((stderr, "\nbl counts: "));
    send_bits(s, lcodes-257, 5); /* not +255 as stated in appnote.txt */
    send_bits(s, dcodes-1,   5);
    send_bits(s, blcodes-4,  4); /* not -3 as stated in appnote.txt */
    for (rank = 0; rank < blcodes; rank++) {
    1a42:	42                   	inc    %edx
        Tracev((stderr, "\nbl code %2d ", bl_order[rank]));
        send_bits(s, s->bl_tree[bl_order[rank]].Len, 3);
    1a43:	89 6b 14             	mov    %ebp,0x14(%ebx)
    1a46:	88 0c 37             	mov    %cl,(%edi,%esi,1)
    1a49:	8b 4b 14             	mov    0x14(%ebx),%ecx
    1a4c:	8b 7b 08             	mov    0x8(%ebx),%edi
    1a4f:	8d 71 01             	lea    0x1(%ecx),%esi
    1a52:	89 73 14             	mov    %esi,0x14(%ebx)
    1a55:	0f b6 b3 b1 16 00 00 	movzbl 0x16b1(%ebx),%esi
    1a5c:	81 e6 ff 00 00 00    	and    $0xff,%esi
    1a62:	89 f0                	mov    %esi,%eax
    1a64:	88 04 0f             	mov    %al,(%edi,%ecx,1)
    1a67:	b9 10 00 00 00       	mov    $0x10,%ecx
    1a6c:	8b b3 b4 16 00 00    	mov    0x16b4(%ebx),%esi
    1a72:	8b 44 24 14          	mov    0x14(%esp),%eax
    1a76:	29 f1                	sub    %esi,%ecx
    1a78:	83 ee 0d             	sub    $0xd,%esi
    1a7b:	d3 f8                	sar    %cl,%eax
    1a7d:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    1a84:	89 b3 b4 16 00 00    	mov    %esi,0x16b4(%ebx)
            "too many codes");
    Tracev((stderr, "\nbl counts: "));
    send_bits(s, lcodes-257, 5); /* not +255 as stated in appnote.txt */
    send_bits(s, dcodes-1,   5);
    send_bits(s, blcodes-4,  4); /* not -3 as stated in appnote.txt */
    for (rank = 0; rank < blcodes; rank++) {
    1a8a:	3b 54 24 10          	cmp    0x10(%esp),%edx
    1a8e:	74 48                	je     1ad8 <__tr_flush_block+0x428>
    1a90:	8b 8b b4 16 00 00    	mov    0x16b4(%ebx),%ecx
    1a96:	8b bb b0 16 00 00    	mov    0x16b0(%ebx),%edi
        Tracev((stderr, "\nbl code %2d ", bl_order[rank]));
        send_bits(s, s->bl_tree[bl_order[rank]].Len, 3);
    1a9c:	31 c0                	xor    %eax,%eax
    1a9e:	8a 82 00 09 00 00    	mov    0x900(%edx),%al
    1aa4:	66 8b b4 83 76 0a 00 	mov    0xa76(%ebx,%eax,4),%si
    1aab:	00 
    1aac:	81 e6 ff ff 00 00    	and    $0xffff,%esi
    1ab2:	83 f9 0d             	cmp    $0xd,%ecx
    1ab5:	89 f0                	mov    %esi,%eax
    1ab7:	0f 8f 6b ff ff ff    	jg     1a28 <__tr_flush_block+0x378>
    1abd:	d3 e0                	shl    %cl,%eax
    1abf:	09 c7                	or     %eax,%edi
    1ac1:	83 c1 03             	add    $0x3,%ecx
            "too many codes");
    Tracev((stderr, "\nbl counts: "));
    send_bits(s, lcodes-257, 5); /* not +255 as stated in appnote.txt */
    send_bits(s, dcodes-1,   5);
    send_bits(s, blcodes-4,  4); /* not -3 as stated in appnote.txt */
    for (rank = 0; rank < blcodes; rank++) {
    1ac4:	42                   	inc    %edx
        Tracev((stderr, "\nbl code %2d ", bl_order[rank]));
        send_bits(s, s->bl_tree[bl_order[rank]].Len, 3);
    1ac5:	66 89 bb b0 16 00 00 	mov    %di,0x16b0(%ebx)
    1acc:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
            "too many codes");
    Tracev((stderr, "\nbl counts: "));
    send_bits(s, lcodes-257, 5); /* not +255 as stated in appnote.txt */
    send_bits(s, dcodes-1,   5);
    send_bits(s, blcodes-4,  4); /* not -3 as stated in appnote.txt */
    for (rank = 0; rank < blcodes; rank++) {
    1ad2:	3b 54 24 10          	cmp    0x10(%esp),%edx
    1ad6:	75 b8                	jne    1a90 <__tr_flush_block+0x3e0>
        Tracev((stderr, "\nbl code %2d ", bl_order[rank]));
        send_bits(s, s->bl_tree[bl_order[rank]].Len, 3);
    }
    Tracev((stderr, "\nbl tree: sent %ld", s->bits_sent));

    send_tree(s, (ct_data *)s->dyn_ltree, lcodes-1); /* literal tree */
    1ad8:	8b 74 24 18          	mov    0x18(%esp),%esi
    1adc:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    1ae0:	89 f2                	mov    %esi,%edx
    1ae2:	89 d8                	mov    %ebx,%eax
    1ae4:	8b 6c 24 28          	mov    0x28(%esp),%ebp
    1ae8:	e8 f3 eb ff ff       	call   6e0 <_send_tree>
    Tracev((stderr, "\nlit tree: sent %ld", s->bits_sent));

    send_tree(s, (ct_data *)s->dyn_dtree, dcodes-1); /* distance tree */
    1aed:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    1af1:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    1af5:	89 fa                	mov    %edi,%edx
    1af7:	89 d8                	mov    %ebx,%eax
    1af9:	e8 e2 eb ff ff       	call   6e0 <_send_tree>
#endif
    } else {
        send_bits(s, (DYN_TREES<<1)+eof, 3);
        send_all_trees(s, s->l_desc.max_code+1, s->d_desc.max_code+1,
                       max_blindex+1);
        compress_block(s, (ct_data *)s->dyn_ltree, (ct_data *)s->dyn_dtree);
    1afe:	89 f9                	mov    %edi,%ecx
    1b00:	89 f2                	mov    %esi,%edx
    1b02:	89 d8                	mov    %ebx,%eax
    1b04:	e8 f7 f1 ff ff       	call   d00 <_compress_block>
    1b09:	e9 b6 fc ff ff       	jmp    17c4 <__tr_flush_block+0x114>
        s->compressed_len += 7;  /* align on byte boundary */
#endif
    }
    Tracev((stderr,"\ncomprlen %lu(%lu) ", s->compressed_len>>3,
           s->compressed_len-7*eof));
}
    1b0e:	83 c4 2c             	add    $0x2c,%esp
     * and uLong implemented on 32 bits.
     */
    init_block(s);

    if (eof) {
        bi_windup(s);
    1b11:	89 d8                	mov    %ebx,%eax
        s->compressed_len += 7;  /* align on byte boundary */
#endif
    }
    Tracev((stderr,"\ncomprlen %lu(%lu) ", s->compressed_len>>3,
           s->compressed_len-7*eof));
}
    1b13:	5b                   	pop    %ebx
    1b14:	5e                   	pop    %esi
    1b15:	5f                   	pop    %edi
    1b16:	5d                   	pop    %ebp
     * and uLong implemented on 32 bits.
     */
    init_block(s);

    if (eof) {
        bi_windup(s);
    1b17:	e9 84 f6 ff ff       	jmp    11a0 <_bi_windup>
    1b1c:	8d 4c 52 03          	lea    0x3(%edx,%edx,2),%ecx
    1b20:	e9 41 fc ff ff       	jmp    1766 <__tr_flush_block+0xb6>

	if (static_lenb <= opt_lenb) opt_lenb = static_lenb;

    } else {
        Assert(buf != (char*)0, "lost buf");
	opt_lenb = static_lenb = stored_len + 5; /* force a stored block */
    1b25:	8b 44 24 10          	mov    0x10(%esp),%eax
    1b29:	8d 50 05             	lea    0x5(%eax),%edx
    }

#ifdef FORCE_STORED
    if (buf != (char*)0) { /* force stored block */
#else
    if (stored_len+4 <= opt_lenb && buf != (char*)0) {
    1b2c:	83 c0 04             	add    $0x4,%eax
    1b2f:	39 c2                	cmp    %eax,%edx
    1b31:	8d 83 8c 00 00 00    	lea    0x8c(%ebx),%eax
    1b37:	0f 82 90 01 00 00    	jb     1ccd <__tr_flush_block+0x61d>
    1b3d:	8b 54 24 14          	mov    0x14(%esp),%edx
    1b41:	89 44 24 18          	mov    %eax,0x18(%esp)
    1b45:	8d 83 80 09 00 00    	lea    0x980(%ebx),%eax
    1b4b:	85 d2                	test   %edx,%edx
    1b4d:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1b51:	0f 85 51 fc ff ff    	jne    17a8 <__tr_flush_block+0xf8>
#ifdef FORCE_STATIC
    } else if (static_lenb >= 0) { /* force static trees */
#else
    } else if (static_lenb == opt_lenb) {
#endif
        send_bits(s, (STATIC_TREES<<1)+eof, 3);
    1b57:	8b 8b b4 16 00 00    	mov    0x16b4(%ebx),%ecx
    1b5d:	83 f9 0d             	cmp    $0xd,%ecx
    1b60:	0f 8f a7 00 00 00    	jg     1c0d <__tr_flush_block+0x55d>
    1b66:	8d 45 02             	lea    0x2(%ebp),%eax
    1b69:	d3 e0                	shl    %cl,%eax
    1b6b:	66 09 83 b0 16 00 00 	or     %ax,0x16b0(%ebx)
    1b72:	83 c1 03             	add    $0x3,%ecx
    1b75:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
        compress_block(s, (ct_data *)static_ltree, (ct_data *)static_dtree);
    1b7b:	b9 00 04 00 00       	mov    $0x400,%ecx
    1b80:	ba 80 04 00 00       	mov    $0x480,%edx
    1b85:	89 d8                	mov    %ebx,%eax
    1b87:	e8 74 f1 ff ff       	call   d00 <_compress_block>
    1b8c:	e9 33 fc ff ff       	jmp    17c4 <__tr_flush_block+0x114>
    Assert (lcodes <= L_CODES && dcodes <= D_CODES && blcodes <= BL_CODES,
            "too many codes");
    Tracev((stderr, "\nbl counts: "));
    send_bits(s, lcodes-257, 5); /* not +255 as stated in appnote.txt */
    send_bits(s, dcodes-1,   5);
    send_bits(s, blcodes-4,  4); /* not -3 as stated in appnote.txt */
    1b91:	8d 7a fd             	lea    -0x3(%edx),%edi
    1b94:	d3 e7                	shl    %cl,%edi
    1b96:	09 c7                	or     %eax,%edi
    1b98:	83 c1 04             	add    $0x4,%ecx
    1b9b:	66 89 bb b0 16 00 00 	mov    %di,0x16b0(%ebx)
    1ba2:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    1ba8:	e9 6c fe ff ff       	jmp    1a19 <__tr_flush_block+0x369>
    Assert (lcodes >= 257 && dcodes >= 1 && blcodes >= 4, "not enough codes");
    Assert (lcodes <= L_CODES && dcodes <= D_CODES && blcodes <= BL_CODES,
            "too many codes");
    Tracev((stderr, "\nbl counts: "));
    send_bits(s, lcodes-257, 5); /* not +255 as stated in appnote.txt */
    send_bits(s, dcodes-1,   5);
    1bad:	09 f8                	or     %edi,%eax
    1baf:	83 c1 05             	add    $0x5,%ecx
    1bb2:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    1bb9:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    1bbf:	e9 ea fd ff ff       	jmp    19ae <__tr_flush_block+0x2fe>

    Assert (lcodes >= 257 && dcodes >= 1 && blcodes >= 4, "not enough codes");
    Assert (lcodes <= L_CODES && dcodes <= D_CODES && blcodes <= BL_CODES,
            "too many codes");
    Tracev((stderr, "\nbl counts: "));
    send_bits(s, lcodes-257, 5); /* not +255 as stated in appnote.txt */
    1bc4:	8b 44 24 24          	mov    0x24(%esp),%eax
    1bc8:	8d b0 00 ff ff ff    	lea    -0x100(%eax),%esi
    1bce:	89 f0                	mov    %esi,%eax
    1bd0:	d3 e0                	shl    %cl,%eax
    1bd2:	09 f8                	or     %edi,%eax
    1bd4:	83 c1 05             	add    $0x5,%ecx
    1bd7:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    1bde:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    1be4:	e9 5f fd ff ff       	jmp    1948 <__tr_flush_block+0x298>
        compress_block(s, (ct_data *)static_ltree, (ct_data *)static_dtree);
#ifdef DEBUG
        s->compressed_len += 3 + s->static_len;
#endif
    } else {
        send_bits(s, (DYN_TREES<<1)+eof, 3);
    1be9:	8d 45 04             	lea    0x4(%ebp),%eax
    1bec:	d3 e0                	shl    %cl,%eax
    1bee:	89 c7                	mov    %eax,%edi
    1bf0:	8b 83 b0 16 00 00    	mov    0x16b0(%ebx),%eax
    1bf6:	09 c7                	or     %eax,%edi
    1bf8:	83 c1 03             	add    $0x3,%ecx
    1bfb:	66 89 bb b0 16 00 00 	mov    %di,0x16b0(%ebx)
    1c02:	89 8b b4 16 00 00    	mov    %ecx,0x16b4(%ebx)
    1c08:	e9 bf fc ff ff       	jmp    18cc <__tr_flush_block+0x21c>
#ifdef FORCE_STATIC
    } else if (static_lenb >= 0) { /* force static trees */
#else
    } else if (static_lenb == opt_lenb) {
#endif
        send_bits(s, (STATIC_TREES<<1)+eof, 3);
    1c0d:	8b 53 14             	mov    0x14(%ebx),%edx
    1c10:	8d 45 02             	lea    0x2(%ebp),%eax
    1c13:	8b bb b0 16 00 00    	mov    0x16b0(%ebx),%edi
    1c19:	89 44 24 10          	mov    %eax,0x10(%esp)
    1c1d:	d3 e0                	shl    %cl,%eax
    1c1f:	8b 4b 08             	mov    0x8(%ebx),%ecx
    1c22:	09 f8                	or     %edi,%eax
    1c24:	8d 72 01             	lea    0x1(%edx),%esi
    1c27:	66 89 83 b0 16 00 00 	mov    %ax,0x16b0(%ebx)
    1c2e:	89 73 14             	mov    %esi,0x14(%ebx)
    1c31:	88 04 11             	mov    %al,(%ecx,%edx,1)
    1c34:	8b 43 14             	mov    0x14(%ebx),%eax
    1c37:	8b 4b 08             	mov    0x8(%ebx),%ecx
    1c3a:	31 ff                	xor    %edi,%edi
    1c3c:	8d 50 01             	lea    0x1(%eax),%edx
    1c3f:	66 8b 7c 24 10       	mov    0x10(%esp),%di
    1c44:	89 53 14             	mov    %edx,0x14(%ebx)
    1c47:	31 d2                	xor    %edx,%edx
    1c49:	8a 93 b1 16 00 00    	mov    0x16b1(%ebx),%dl
    1c4f:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1c52:	b9 10 00 00 00       	mov    $0x10,%ecx
    1c57:	8b 83 b4 16 00 00    	mov    0x16b4(%ebx),%eax
    1c5d:	29 c1                	sub    %eax,%ecx
    1c5f:	83 e8 0d             	sub    $0xd,%eax
    1c62:	d3 ff                	sar    %cl,%edi
    1c64:	66 89 bb b0 16 00 00 	mov    %di,0x16b0(%ebx)
    1c6b:	89 83 b4 16 00 00    	mov    %eax,0x16b4(%ebx)
    1c71:	e9 05 ff ff ff       	jmp    1b7b <__tr_flush_block+0x4cb>
    1c76:	8d 93 a8 00 00 00    	lea    0xa8(%ebx),%edx

    /* Build the Huffman trees unless a stored block is forced */
    if (s->level > 0) {

	 /* Check if the file is ascii or binary */
	if (s->data_type == Z_UNKNOWN) set_data_type(s);
    1c7c:	31 c9                	xor    %ecx,%ecx
    deflate_state *s;
{
    int n = 0;
    unsigned ascii_freq = 0;
    unsigned bin_freq = 0;
    while (n < 7)        bin_freq += s->dyn_ltree[n++].Freq;
    1c7e:	31 f6                	xor    %esi,%esi
    1c80:	83 c0 04             	add    $0x4,%eax
    1c83:	66 8b 70 fc          	mov    -0x4(%eax),%si
    1c87:	01 f1                	add    %esi,%ecx
    1c89:	39 d0                	cmp    %edx,%eax
    1c8b:	75 f1                	jne    1c7e <__tr_flush_block+0x5ce>
    1c8d:	8d 83 8c 02 00 00    	lea    0x28c(%ebx),%eax
    1c93:	31 f6                	xor    %esi,%esi
    while (n < 128)    ascii_freq += s->dyn_ltree[n++].Freq;
    1c95:	31 ff                	xor    %edi,%edi
    1c97:	83 c2 04             	add    $0x4,%edx
    1c9a:	66 8b 7a fc          	mov    -0x4(%edx),%di
    1c9e:	01 fe                	add    %edi,%esi
    1ca0:	39 c2                	cmp    %eax,%edx
    1ca2:	75 f1                	jne    1c95 <__tr_flush_block+0x5e5>
    1ca4:	8d bb 8c 04 00 00    	lea    0x48c(%ebx),%edi
    1caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while (n < LITERALS) bin_freq += s->dyn_ltree[n++].Freq;
    1cb0:	31 d2                	xor    %edx,%edx
    1cb2:	83 c0 04             	add    $0x4,%eax
    1cb5:	66 8b 50 fc          	mov    -0x4(%eax),%dx
    1cb9:	01 d1                	add    %edx,%ecx
    1cbb:	39 f8                	cmp    %edi,%eax
    1cbd:	75 f1                	jne    1cb0 <__tr_flush_block+0x600>
    s->data_type = (Byte)(bin_freq > (ascii_freq >> 2) ? Z_BINARY : Z_ASCII);
    1cbf:	c1 ee 02             	shr    $0x2,%esi
    1cc2:	39 ce                	cmp    %ecx,%esi
    1cc4:	0f 93 43 1c          	setae  0x1c(%ebx)
    1cc8:	e9 21 fa ff ff       	jmp    16ee <__tr_flush_block+0x3e>
    1ccd:	89 44 24 18          	mov    %eax,0x18(%esp)
    1cd1:	8d 83 80 09 00 00    	lea    0x980(%ebx),%eax
    1cd7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1cdb:	e9 77 fe ff ff       	jmp    1b57 <__tr_flush_block+0x4a7>

00001ce0 <__tr_tally>:
 */
int _tr_tally (s, dist, lc)
    deflate_state *s;
    unsigned dist;  /* distance of matched string */
    unsigned lc;    /* match length-MIN_MATCH or unmatched char (if dist==0) */
{
    1ce0:	56                   	push   %esi
    1ce1:	53                   	push   %ebx
    1ce2:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1ce6:	8b 54 24 10          	mov    0x10(%esp),%edx
    1cea:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    s->d_buf[s->last_lit] = (ush)dist;
    s->l_buf[s->last_lit++] = (uch)lc;
    if (dist == 0) {
    1cee:	85 d2                	test   %edx,%edx
int _tr_tally (s, dist, lc)
    deflate_state *s;
    unsigned dist;  /* distance of matched string */
    unsigned lc;    /* match length-MIN_MATCH or unmatched char (if dist==0) */
{
    s->d_buf[s->last_lit] = (ush)dist;
    1cf0:	8b 88 98 16 00 00    	mov    0x1698(%eax),%ecx
    1cf6:	8b b0 9c 16 00 00    	mov    0x169c(%eax),%esi
    1cfc:	66 89 14 4e          	mov    %dx,(%esi,%ecx,2)
    s->l_buf[s->last_lit++] = (uch)lc;
    1d00:	8d 71 01             	lea    0x1(%ecx),%esi
    1d03:	89 b0 98 16 00 00    	mov    %esi,0x1698(%eax)
    1d09:	8b b0 90 16 00 00    	mov    0x1690(%eax),%esi
    1d0f:	88 1c 0e             	mov    %bl,(%esi,%ecx,1)
    if (dist == 0) {
    1d12:	74 6c                	je     1d80 <__tr_tally+0xa0>
        /* lc is the unmatched char */
        s->dyn_ltree[lc].Freq++;
    } else {
        s->matches++;
    1d14:	8b 88 a8 16 00 00    	mov    0x16a8(%eax),%ecx
        /* Here, lc is the match length - MIN_MATCH */
        dist--;             /* dist = match distance - 1 */
    1d1a:	4a                   	dec    %edx
    s->l_buf[s->last_lit++] = (uch)lc;
    if (dist == 0) {
        /* lc is the unmatched char */
        s->dyn_ltree[lc].Freq++;
    } else {
        s->matches++;
    1d1b:	41                   	inc    %ecx
    1d1c:	89 88 a8 16 00 00    	mov    %ecx,0x16a8(%eax)
    1d22:	31 c9                	xor    %ecx,%ecx
    1d24:	8a 8b 00 01 00 00    	mov    0x100(%ebx),%cl
        dist--;             /* dist = match distance - 1 */
        Assert((ush)dist < (ush)MAX_DIST(s) &&
               (ush)lc <= (ush)(MAX_MATCH-MIN_MATCH) &&
               (ush)d_code(dist) < (ush)D_CODES,  "_tr_tally: bad match");

        s->dyn_ltree[_length_code[lc]+LITERALS+1].Freq++;
    1d2a:	66 ff 84 88 90 04 00 	incw   0x490(%eax,%ecx,4)
    1d31:	00 
        s->dyn_dtree[d_code(dist)].Freq++;
    1d32:	81 fa ff 00 00 00    	cmp    $0xff,%edx
    1d38:	76 36                	jbe    1d70 <__tr_tally+0x90>
    1d3a:	c1 ea 07             	shr    $0x7,%edx
    1d3d:	8a 8a 00 03 00 00    	mov    0x300(%edx),%cl
    1d43:	81 e1 ff 00 00 00    	and    $0xff,%ecx
    1d49:	89 ca                	mov    %ecx,%edx
    1d4b:	66 ff 84 90 80 09 00 	incw   0x980(%eax,%edx,4)
    1d52:	00 
               s->last_lit, in_length, out_length,
               100L - out_length*100L/in_length));
        if (s->matches < s->last_lit/2 && out_length < in_length/2) return 1;
    }
#endif
    return (s->last_lit == s->lit_bufsize-1);
    1d53:	8b 98 94 16 00 00    	mov    0x1694(%eax),%ebx
    1d59:	8d 53 ff             	lea    -0x1(%ebx),%edx
    /* We avoid equality with lit_bufsize because of wraparound at 64K
     * on 16 bit machines and because stored blocks are restricted to
     * 64K-1 bytes.
     */
}
    1d5c:	5b                   	pop    %ebx
               s->last_lit, in_length, out_length,
               100L - out_length*100L/in_length));
        if (s->matches < s->last_lit/2 && out_length < in_length/2) return 1;
    }
#endif
    return (s->last_lit == s->lit_bufsize-1);
    1d5d:	39 90 98 16 00 00    	cmp    %edx,0x1698(%eax)
    /* We avoid equality with lit_bufsize because of wraparound at 64K
     * on 16 bit machines and because stored blocks are restricted to
     * 64K-1 bytes.
     */
}
    1d63:	5e                   	pop    %esi
               s->last_lit, in_length, out_length,
               100L - out_length*100L/in_length));
        if (s->matches < s->last_lit/2 && out_length < in_length/2) return 1;
    }
#endif
    return (s->last_lit == s->lit_bufsize-1);
    1d64:	0f 94 c0             	sete   %al
    1d67:	25 ff 00 00 00       	and    $0xff,%eax
    /* We avoid equality with lit_bufsize because of wraparound at 64K
     * on 16 bit machines and because stored blocks are restricted to
     * 64K-1 bytes.
     */
}
    1d6c:	c3                   	ret    
    1d6d:	8d 76 00             	lea    0x0(%esi),%esi
        Assert((ush)dist < (ush)MAX_DIST(s) &&
               (ush)lc <= (ush)(MAX_MATCH-MIN_MATCH) &&
               (ush)d_code(dist) < (ush)D_CODES,  "_tr_tally: bad match");

        s->dyn_ltree[_length_code[lc]+LITERALS+1].Freq++;
        s->dyn_dtree[d_code(dist)].Freq++;
    1d70:	8a 9a 00 02 00 00    	mov    0x200(%edx),%bl
    1d76:	81 e3 ff 00 00 00    	and    $0xff,%ebx
    1d7c:	89 da                	mov    %ebx,%edx
    1d7e:	eb cb                	jmp    1d4b <__tr_tally+0x6b>
{
    s->d_buf[s->last_lit] = (ush)dist;
    s->l_buf[s->last_lit++] = (uch)lc;
    if (dist == 0) {
        /* lc is the unmatched char */
        s->dyn_ltree[lc].Freq++;
    1d80:	66 ff 84 98 8c 00 00 	incw   0x8c(%eax,%ebx,4)
    1d87:	00 
    1d88:	eb c9                	jmp    1d53 <__tr_tally+0x73>
    1d8a:	90                   	nop
    1d8b:	90                   	nop
    1d8c:	90                   	nop
    1d8d:	90                   	nop
    1d8e:	90                   	nop
    1d8f:	90                   	nop

uncompr.o:     file format pe-i386


Disassembly of section .text:

00000000 <_uncompress>:
int ZEXPORT uncompress (dest, destLen, source, sourceLen)
    Bytef *dest;
    uLongf *destLen;
    const Bytef *source;
    uLong sourceLen;
{
   0:	57                   	push   %edi
   1:	56                   	push   %esi
   2:	53                   	push   %ebx
   3:	83 ec 50             	sub    $0x50,%esp
    z_stream stream;
    int err;

    stream.next_in = (Bytef*)source;
   6:	8b 44 24 68          	mov    0x68(%esp),%eax
int ZEXPORT uncompress (dest, destLen, source, sourceLen)
    Bytef *dest;
    uLongf *destLen;
    const Bytef *source;
    uLong sourceLen;
{
   a:	8b 7c 24 64          	mov    0x64(%esp),%edi
    z_stream stream;
    int err;

    stream.next_in = (Bytef*)source;
   e:	89 44 24 18          	mov    %eax,0x18(%esp)
    stream.avail_in = (uInt)sourceLen;
  12:	8b 44 24 6c          	mov    0x6c(%esp),%eax
  16:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if ((uLong)stream.avail_out != *destLen) return Z_BUF_ERROR;

    stream.zalloc = (alloc_func)0;
    stream.zfree = (free_func)0;

    err = inflateInit(&stream);
  1a:	8d 74 24 18          	lea    0x18(%esp),%esi
    stream.next_in = (Bytef*)source;
    stream.avail_in = (uInt)sourceLen;
    /* Check for source > 64K on 16-bit machine: */
    if ((uLong)stream.avail_in != sourceLen) return Z_BUF_ERROR;

    stream.next_out = dest;
  1e:	8b 44 24 60          	mov    0x60(%esp),%eax
    stream.avail_out = (uInt)*destLen;
    if ((uLong)stream.avail_out != *destLen) return Z_BUF_ERROR;

    stream.zalloc = (alloc_func)0;
  22:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  29:	00 
    stream.next_in = (Bytef*)source;
    stream.avail_in = (uInt)sourceLen;
    /* Check for source > 64K on 16-bit machine: */
    if ((uLong)stream.avail_in != sourceLen) return Z_BUF_ERROR;

    stream.next_out = dest;
  2a:	89 44 24 24          	mov    %eax,0x24(%esp)
    stream.avail_out = (uInt)*destLen;
  2e:	8b 07                	mov    (%edi),%eax
    if ((uLong)stream.avail_out != *destLen) return Z_BUF_ERROR;

    stream.zalloc = (alloc_func)0;
    stream.zfree = (free_func)0;

    err = inflateInit(&stream);
  30:	c7 44 24 08 38 00 00 	movl   $0x38,0x8(%esp)
  37:	00 
  38:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  3f:	00 
  40:	89 34 24             	mov    %esi,(%esp)
    stream.avail_in = (uInt)sourceLen;
    /* Check for source > 64K on 16-bit machine: */
    if ((uLong)stream.avail_in != sourceLen) return Z_BUF_ERROR;

    stream.next_out = dest;
    stream.avail_out = (uInt)*destLen;
  43:	89 44 24 28          	mov    %eax,0x28(%esp)
    if ((uLong)stream.avail_out != *destLen) return Z_BUF_ERROR;

    stream.zalloc = (alloc_func)0;
    stream.zfree = (free_func)0;
  47:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
  4e:	00 

    err = inflateInit(&stream);
  4f:	e8 00 00 00 00       	call   54 <_uncompress+0x54>
    if (err != Z_OK) return err;
  54:	85 c0                	test   %eax,%eax
  56:	74 08                	je     60 <_uncompress+0x60>
    }
    *destLen = stream.total_out;

    err = inflateEnd(&stream);
    return err;
}
  58:	83 c4 50             	add    $0x50,%esp
  5b:	5b                   	pop    %ebx
  5c:	5e                   	pop    %esi
  5d:	5f                   	pop    %edi
  5e:	c3                   	ret    
  5f:	90                   	nop
    stream.zfree = (free_func)0;

    err = inflateInit(&stream);
    if (err != Z_OK) return err;

    err = inflate(&stream, Z_FINISH);
  60:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
  67:	00 
  68:	89 34 24             	mov    %esi,(%esp)
  6b:	e8 00 00 00 00       	call   70 <_uncompress+0x70>
  70:	89 c3                	mov    %eax,%ebx
    if (err != Z_STREAM_END) {
  72:	83 f8 01             	cmp    $0x1,%eax
  75:	74 19                	je     90 <_uncompress+0x90>
        inflateEnd(&stream);
  77:	89 34 24             	mov    %esi,(%esp)
  7a:	e8 00 00 00 00       	call   7f <_uncompress+0x7f>
        return err == Z_OK ? Z_BUF_ERROR : err;
  7f:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
  84:	85 db                	test   %ebx,%ebx
  86:	0f 45 c3             	cmovne %ebx,%eax
    }
    *destLen = stream.total_out;

    err = inflateEnd(&stream);
    return err;
}
  89:	83 c4 50             	add    $0x50,%esp
  8c:	5b                   	pop    %ebx
  8d:	5e                   	pop    %esi
  8e:	5f                   	pop    %edi
  8f:	c3                   	ret    
    err = inflate(&stream, Z_FINISH);
    if (err != Z_STREAM_END) {
        inflateEnd(&stream);
        return err == Z_OK ? Z_BUF_ERROR : err;
    }
    *destLen = stream.total_out;
  90:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  94:	89 07                	mov    %eax,(%edi)

    err = inflateEnd(&stream);
  96:	89 34 24             	mov    %esi,(%esp)
  99:	e8 00 00 00 00       	call   9e <_uncompress+0x9e>
    return err;
}
  9e:	83 c4 50             	add    $0x50,%esp
  a1:	5b                   	pop    %ebx
  a2:	5e                   	pop    %esi
  a3:	5f                   	pop    %edi
  a4:	c3                   	ret    
  a5:	90                   	nop
  a6:	90                   	nop
  a7:	90                   	nop
  a8:	90                   	nop
  a9:	90                   	nop
  aa:	90                   	nop
  ab:	90                   	nop
  ac:	90                   	nop
  ad:	90                   	nop
  ae:	90                   	nop
  af:	90                   	nop

zutil.o:     file format pe-i386


Disassembly of section .text:

00000000 <_zlibVersion>:


const char * ZEXPORT zlibVersion()
{
    return ZLIB_VERSION;
}
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	c3                   	ret    
   6:	8d 76 00             	lea    0x0(%esi),%esi
   9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000010 <_zError>:
 * uncompress()
 */
const char * ZEXPORT zError(err)
    int err;
{
    return ERR_MSG(err);
  10:	8b 54 24 04          	mov    0x4(%esp),%edx
  14:	b8 02 00 00 00       	mov    $0x2,%eax
  19:	29 d0                	sub    %edx,%eax
  1b:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
}
  22:	c3                   	ret    
  23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000030 <_zcalloc>:

voidpf zcalloc (opaque, items, size)
    voidpf opaque;
    unsigned items;
    unsigned size;
{
  30:	8b 44 24 08          	mov    0x8(%esp),%eax
    if (opaque) items += size - size; /* make compiler happy */
    return (voidpf)calloc(items, size);
  34:	8b 54 24 0c          	mov    0xc(%esp),%edx
  38:	89 54 24 08          	mov    %edx,0x8(%esp)
  3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  40:	e9 00 00 00 00       	jmp    45 <_zcalloc+0x15>
  45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000050 <_zcfree>:

void  zcfree (opaque, ptr)
    voidpf opaque;
    voidpf ptr;
{
    free(ptr);
  50:	8b 44 24 08          	mov    0x8(%esp),%eax
  54:	89 44 24 04          	mov    %eax,0x4(%esp)
  58:	e9 00 00 00 00       	jmp    5d <_zcfree+0xd>
  5d:	90                   	nop
  5e:	90                   	nop
  5f:	90                   	nop
