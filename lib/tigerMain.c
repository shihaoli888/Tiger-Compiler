// #include <stdio.h>

struct String
{
    int len;
    unsigned char content[1];
};
typedef struct String *string;

void tigerMain(){
    // test
    char *str = "test\n";

    string ch = tigerGetchar();
    
    string s = chr('a');
    string ss = concat(concat(s, chr('b')), ch);
    printStr(ss);
    flush();
    printStr(substring(ss, 1, 1));
    printInt(size(ss));
    printInt(not(size(ss)));
    printInt(ord(s));
    tigerExit(-1);
}