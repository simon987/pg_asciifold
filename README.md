# PostgreSQL ASCII folding

Reasonably fast (tested on Musicbrainz dataset, is 40% faster than a simple `UPPER()`) 
ASCII folding functions based on [Lucene's ASCIIFoldingFilter](https://lucene.apache.org/core/4_0_0/analyzers-common/org/apache/lucene/analysis/miscellaneous/ASCIIFoldingFilter.html) for PostgreSQL

*Example:*
```
postgres=# SELECT asciifold('Hello, ⒩ᴐⱤú⒴⁈～!');
      asciifold       
----------------------
 Hello, (n)ORu(y)?!~!
(1 row)

postgres=# SELECT asciifold_lower('Hello, ⒩ᴐⱤú⒴⁈～!');
      asciifold       
----------------------
 hello, (n)oru(y)?!~!
(1 row)
```

UTF8 input string is not sanitized (invalid UTF8 might lead to undefined behavior)

### Compiling from source (CMake)

```bash
apt install postgresql-server-11-dev
cmake .
make
```

See [asciifolding.c](asciifolding.c) & [build.sh](build.sh) for more information


