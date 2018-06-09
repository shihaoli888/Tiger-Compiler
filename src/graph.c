/**
 * @brief 
 * refer to textbook but wrote myself
 * @file graph.c
 * @author lishihao
 * @date 2018-06-09
 */
#include "graph.h"

struct G_graph_ {
	int num;
	G_nodeList glist;
};

struct G_node_ {
	void * info;
	int id;
	G_nodeList pred;
	G_nodeList succ;
};

G_graph G_Graph(void) {
	G_graph g = checked_malloc(sizeof(*g));
	g->glist = NULL;
	g->num = 0;
	return g;
}

G_graph G_copyGraph(G_graph g) {
	G_graph res = G_Graph();
	G_nodeList tmp = g->glist;
	for (; tmp; tmp = tmp->tail) {
		G_Node(res, tmp->head->info);
	}
	tmp = g->glist;
	for (; tmp; tmp = tmp->tail) {
		G_node n;
		G_nodeList tt = res->glist;
		for (; tt; tt = tt->tail) {
			if (tt->head->info == tmp->head->info) {
				n = tt->head;
				break;
			}
		}
		G_nodeList succ = tmp->head->succ;
		for (; succ; succ = succ->tail) {
			for (tt = res->glist; tt; tt = tt->tail) {
				if (tt->head->info == succ->head->info) {
					G_addEdge(n, tt->head);
					break;
				}
			}
		}
	}
	return res;
}

G_node G_rmNode(G_graph g, G_node n) {
	G_nodeList tmp = g->glist;
	if (tmp == NULL) return NULL;
	if (tmp->head == n) {
		g->glist = tmp->tail;
		return n;
	}
	for (; tmp->tail; tmp = tmp->tail) {
		if (tmp->tail->head == n) {
			tmp->tail = tmp->tail->tail;
			return n;
		}
	}
	return NULL;
}


G_node G_Node(G_graph g, void *info) {
	G_node n = checked_malloc(sizeof(*n));
	n->id = g->num++;
	n->info = info;
	n->pred = NULL;
	n->succ = NULL;
	g->glist = G_NodeList(n, g->glist);
	return n;
}

G_nodeList G_NodeList(G_node head, G_nodeList tail) {
	G_nodeList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = head;
	tmp->tail = tail;
	return tmp;
}

G_nodeList G_nodes(G_graph g) {
	return g->glist;
}

bool G_inNodeList(G_node a, G_nodeList l) {
	G_nodeList p = l;
	for (p = l; p; p = p->tail) {
		if (p->head == a) return TRUE;
	}
	return FALSE;
}

void G_addEdge(G_node from, G_node to) {
	if (!G_inNodeList(to, from->succ)) {
		from->succ = G_NodeList(to, from->succ);
		to->pred = G_NodeList(from, to->pred);
	}
}

void G_rmEdge(G_node from, G_node to) {
	G_nodeList p = from->succ;
	if (p) {
		for (; p->tail; p = p->tail) {
			if (p->tail->head == to) {
				p->tail = p->tail->tail;
				break;
			}
		}
		if (p->head == to) from->succ = NULL;
	}
	p = to->pred;
	if (p) {
		for (; p->tail; p = p->tail) {
			if (p->tail->head == from) {
				p->tail = p->tail->tail;
				break;
			}
		}
		if (p->head == from) to->pred = NULL;
	}
}

void G_show(FILE *out, G_nodeList p, void showInfo(FILE* out, void *)) {
	for (; p; p = p->tail) {
		showInfo(out, p->head->info);
		fprintf(out, "\tconflict:\t");
		G_nodeList t = p->head->succ;
		for (; t; t = t->tail)
			showInfo(out, t->head->info);
		fprintf(out, "\n");
	}
}

G_nodeList G_succ(G_node n) {
	return n->succ;
}

G_nodeList G_pred(G_node n) {
	return n->pred;
}

G_nodeList G_adj(G_node n) {
	G_nodeList t = NULL;
	G_nodeList p = n->pred;
	for (; p; p = p->tail)
		t = G_NodeList(p->head, t);
	p = n->succ;
	for (; p; p = p->tail)
		t = G_NodeList(p->head, t);
	return t;
}

bool G_goesTo(G_node a, G_node b) {
	G_nodeList p = a->succ;
	for (; p; p = p->tail) {
		if (p->head == b) return TRUE;
	}
	return FALSE;
}

int G_degree(G_node n) {
	int d = 0;
	G_nodeList p = n->pred;
	for (; p; p = p->tail) d++;
	p = n->succ;
	for (; p; p = p->tail) d++;
	return d;
}

void *G_nodeInfo(G_node n) {
	return n->info;
}


G_table G_empty(void) {
	return TAB_empty();
}

void G_enter(G_table t, G_node n, void *v) {
	 TAB_enter(t, n, v);
}

void *G_look(G_table t, G_node n) {
	return TAB_look(t, n);
}