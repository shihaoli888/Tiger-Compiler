/**
 * @brief 
 * refer to textbook
 * @file types.c
 * @author your name
 * @date 2018-06-09
 */
#include "types.h"
#include "util.h"
static struct Ty_ty_ tynil = {Ty_nil};
Ty_ty  Ty_Nil(void) { return &tynil; }
static struct Ty_ty_ tyint = { Ty_int };
Ty_ty Ty_Int(void) { return &tyint; }
static struct Ty_ty_ tystring = { Ty_string };
Ty_ty Ty_String(void) { return &tystring; }
static struct Ty_ty_ tyvoid = { Ty_void };
Ty_ty Ty_Void(void) { return &tyvoid; }

Ty_ty Ty_Record(Ty_fieldList fields) {
	Ty_ty tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = Ty_record;
	tmp->u.record = fields;
	return tmp;
}
Ty_ty Ty_Array(Ty_ty ty) {
	Ty_ty tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = Ty_array;
	tmp->u.array = ty;
	return tmp;
}
Ty_ty Ty_Name(S_symbol sym, Ty_ty ty) {
	Ty_ty tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = Ty_name;
	tmp->u.name.sym = sym;
	tmp->u.name.ty = ty;
	return tmp;
}
Ty_tyList Ty_TyList(Ty_ty head, Ty_tyList tail) {
	Ty_tyList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = head;
	tmp->tail = tail;
	return tmp;
}
Ty_field Ty_Field(S_symbol name, Ty_ty ty) {
	Ty_field tmp = checked_malloc(sizeof(*tmp));
	tmp->name = name;
	tmp->ty = ty;
	return tmp;
}
Ty_fieldList Ty_FieldList(Ty_field head, Ty_fieldList tail) {
	Ty_fieldList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = head;
	tmp->tail = tail;
	return tmp;
}