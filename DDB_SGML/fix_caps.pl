#!/usr/bin/perl
# fix beta-code capital letters:  accents and breathings before the letter, not after

while(<>)
{
    s|\*([a-z])([()/\\=\|]+)|*$2$1|gi;
#    s|\*([aehowu])([()/\\=\|]+)([^aehiowu])|\*$2$1$3|gi;
    print;
}
