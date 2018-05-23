#ifndef TEMP_H
#define TEMP_H
#include "symbol.h"
typedef struct Temp_temp_ *Temp_temp;
Temp_temp Temp_newtemp(void);

typedef struct Temp_tempList_ *Temp_tempList;
struct Temp_tempList_ { Temp_temp head; Temp_tempList tail; };
Temp_tempList Temp_TempList(Temp_temp h, Temp_tempList t);

typedef S_symbol Temp_label;
Temp_label Temp_newlabel(void);
Temp_label Temp_namedlabel(string name);
string Temp_labelstring(Temp_label s);

typedef struct Temp_labelList_ *Temp_labelList;
struct Temp_labelList_ { Temp_label head; Temp_labelList tail; };
Temp_labelList Temp_LabelList(Temp_label h, Temp_labelList t);

#ifdef _DEBUG
//defined to test instruction selection. 
typedef struct Temp_map_ *Temp_map;
struct Temp_map_ {TAB_table tab; Temp_map under;};

int getTmpnum(Temp_temp);
#endif // _DEBUG


#endif // !TEMP_H
