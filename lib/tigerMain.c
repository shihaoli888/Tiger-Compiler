#include <stdio.h>

struct String
{
    int len;
    unsigned char content[1];
};
typedef struct String *string;

void tigerMain(){
    char *str = "test\n";
    putc('x',stdout);
    // test
    string s = chr('a');
    putchar(ord(s));
    string ss = concat(s, chr('b'));
    print(ss);
    print(substring(ss, 1, 1));

}