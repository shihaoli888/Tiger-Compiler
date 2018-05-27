#include "flowgraph.h"


static TAB_table label_table;
static G_table def_table;
static G_table use_table;

Temp_tempList FG_def(G_node n) {
	return G_look(def_table, n);
}
Temp_tempList FG_use(G_node n) {
	return G_look(use_table, n);
}

bool FG_isMove(G_node n) {
	AS_instr ins = G_nodeInfo(n);
	return ins->kind == I_MOVE;
}

static G_node FG_AssemNode(G_graph g, AS_instr ins) {
	G_node n = G_Node(g, ins);
	switch (ins->kind)
	{
	case I_OPER:
	{
		G_enter(def_table, n, ins->u.OPER.dst);
		G_enter(use_table, n, ins->u.OPER.src);
		break;
	}
	case I_LABEL:
	{
		TAB_enter(label_table, ins->u.LABEL.label, n);
		break;
	}
	case I_MOVE:
	{
		G_enter(def_table, n, ins->u.OPER.dst);
		G_enter(use_table, n, ins->u.OPER.src);
		break;
	}
	}
	return n;
}

G_graph FG_AssemFlowGraph(AS_instrList il) {
	def_table = G_empty();
	use_table = G_empty();
	label_table = TAB_empty();
	G_graph g = G_empty();
	G_node pre = NULL;
	for (; il; il = il->tail) {
		G_node tmp = FG_AssemNode(g, il->head);
		if(pre){
			AS_instr preil = G_nodeInfo(pre);
			//不是无条件跳转
			if (!(preil->kind == I_OPER &&preil->u.OPER.dst==NULL&&preil->u.OPER.src == NULL&&preil->u.OPER.jumps)) {
				G_addEdge(pre, tmp);
			}
			//pre = tmp;
		}
		pre = tmp;
	}
	G_nodeList glist = G_nodes(g);
	for (; glist; glist = glist->tail) {
		G_node n = glist->head;
		AS_instr ins = G_nodeInfo(n);
		if (ins->kind == I_OPER && ins->u.OPER.jumps) {
			Temp_label label = (ins->u.OPER.jumps)->labels->head;
			G_node label_node = TAB_look(label_table, label);
			if (label_node) {
				G_addEdge(n, label_node);
			}
		}
	}
	return g;

}