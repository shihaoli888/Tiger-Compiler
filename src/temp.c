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



int getTmpnum(Temp_temp t) {
	return t->num;
}

struct Temp_map_ { TAB_table tab; Temp_map under; };

static Temp_map debug_map = NULL;
Temp_map Temp_name(void) {
	if (!debug_map) debug_map = Temp_empty();
	return debug_map;
}

Temp_map Temp_Map(TAB_table tab, Temp_map under) {
	Temp_map tmp = checked_malloc(sizeof(*tmp));
	tmp->tab = tab;
	tmp->under = under;
	return tmp;
}

Temp_map Temp_empty(void) {
	return Temp_Map(TAB_empty(), NULL);
}

Temp_map Temp_layerMap(Temp_map over, Temp_map under) {
	if (over == NULL)
		return under;
	else return Temp_Map(over->tab, Temp_layerMap(over->under, under));
}

void Temp_enter(Temp_map m, Temp_temp t, string s) {
	TAB_enter(m->tab, t, s);
}

string Temp_look(Temp_map m, Temp_temp t) {
	string s;
	s = TAB_look(m->tab, t);
	if (s) return s;
	else if (m->under) return Temp_look(m->under, t);
	else return NULL;
}