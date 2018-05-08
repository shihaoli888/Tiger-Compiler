#include "temp.h"
#include <stdio.h>
struct Temp_temp_
{
	int num;
};
static int labels = 0;
static int temps = 100;

Temp_temp Temp_newtemp(void) {
	Temp_temp t = checked_malloc(sizeof(*t));
	t->num = temps++;
	return t;
}

Temp_tempList Temp_TempList(Temp_temp h, Temp_tempList t) {
	Temp_tempList tl = checked_malloc(sizeof(*t));
	tl->head = h;
	tl->tail = t;
	return tl;
}

Temp_label Temp_newlabel(void) {
	char buf[100];
	sprintf(buf, "L%d", labels++);
	return Temp_namedlabel(String(buf));
}
Temp_label Temp_namedlabel(string name) {
	return S_Symbol(name);
}
string Temp_labelstring(Temp_label s) {
	return S_name(s);
}
Temp_labelList Temp_LabelList(Temp_label h, Temp_labelList t) {
	Temp_labelList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = h;
	tmp->tail = t;
	return tmp;
}

#ifdef _DEBUG

int getTmpnum(Temp_temp t) {
	return t->num;
}

#endif // _DEBUG