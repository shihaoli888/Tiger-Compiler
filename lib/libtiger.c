#include <stdio.h>
#include <stdlib.h>
#include <memory.h>

void tigerMain();

struct String
{
    int len;
    unsigned char content[1];
};
typedef struct String *string;

string constchar[256];
string emptychar;

unsigned char *initArray(int size, int initVal)
{
    int *res = (int *)malloc(sizeof(int) * size);
    int i;
    for (i = 0; i < size; i++)
    {
        res[i] = initVal;
    }
    return (unsigned char *)res;
}

unsigned char *allocRecord(int size)
{
    return (unsigned char *)malloc(sizeof(int) * size);
}

void printStr(string str)
{
    int len = str->len;
    int i;
    for (i = 0; i < len; i++)
    {
        putchar(str->content[i]);
    }
}

void printInt(int i)
{
    printf("%d", i);
}

void flush()
{
    fflush(stdout);
}

string tigerGetchar()
{
    int ch;
    if ((ch = getc(stdin)) == EOF)
    {
        return emptychar;
    }
    return constchar[ch];
}

int ord(string str)
{
    return (str->len == 0) ? -1 : str->content[0];
}

string chr(int ch)
{
    if (ch < 0 || ch > 255)
    {
        printf("Error: function chr: ASCII value out of range\n");
        exit(1);
    }
    return constchar[ch];
}

int size(string str)
{
    return str->len;
}

string substring(string str, int first, int len)
{
    if (len + first > str->len)
    {
        printf("Error: function substring: out of range\n");
        exit(1);
    }
    string res = (string)malloc(sizeof(int) * (len + 1));
    res->len = len;
    memcpy(res->content, str->content + first, sizeof(int) * len);
    return res;
}

int stringcmp(string s1, string s2)
{
    int l1 = s1->len, l2 = s2->len;
    int i, j;
    for (i = 0, j = 0; i < l1 & j < l2; i++, j++)
    {
        if (s1->content[i] != s2->content[j])
            return s1->content[i] > s2->content[j];
    }
    if (i == l1 && j == l2)
    {
        return 0;
    }
    if (i != l1)
        return 1;
    return -1;
}

string concat(string str1, string str2)
{
    if (str1->len == 0)
        return str2;
    if (str2->len == 0)
        return str1;
    int resLen = str1->len + str2->len;
    string res = (string)malloc(sizeof(int) * (resLen + 1));
    res->len = resLen;
    memcpy(res->content, str1->content, sizeof(int) * str1->len);
    memcpy(res->content + str1->len, str2->content, sizeof(int) * str2->len);
    return res;
}

int not(int i)
{
    return i == 0;
}

void tigerExit(int i)
{
    exit(i);
}

int main()
{
    // initialize const string
    int i;
    for (i = 0; i < 256; i++)
    {
        constchar[i] = (string)malloc(sizeof(struct String));
        constchar[i]->len = 1;
        constchar[i]->content[0] = i;
    }
    // empty string
    emptychar = (string)malloc(sizeof(struct String));
    emptychar->len = emptychar->content[0] = 0;

    tigerMain();
    return 0;
}