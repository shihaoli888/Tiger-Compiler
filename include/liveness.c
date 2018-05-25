#include "liveness.h"
#include "flowgraph.h"

int bitmap_len;
int node_num;
typedef unsigned int* bitmap;
#define BITLEN 32

static G_table def_table;
static G_table use_table;
static G_table in_table;
static G_table out_table;

Live_moveList Live_MoveList(G_node src, G_node dst, Live_moveList tail) {
	Live_moveList res = checked_malloc(sizeof(*res));
	res->dst = dst;
	res->src = src;
	res->tail = tail;
	return res;
}

static void enterLiveMap(G_table t, G_node flownode, bitmap map) {
	G_enter(t, flownode, map);
}

static bitmap lookupLiveMap(G_table t, G_node flownode) {
	return (bitmap)G_look(t, flownode);
}

Temp_temp Live_gtemp(G_node n) {
	return (Temp_temp)G_nodeInfo(n);
}

static int node_offset(Temp_temp temp, G_nodeList gl) {
	int i = 0;
	for (; gl; gl = gl->tail, i++) {
		if (temp == Live_gtemp(gl->head)) return i;
	}
	return -1;
}

static G_nodeList bitmap_to_nodelist(G_graph g, bitmap out) {
	G_nodeList res = NULL;
	G_nodeList tmp = G_nodes(g);
	int i;
	for (i = 0; i < node_num; i++,tmp=tmp->tail) {
		int block = i / BITLEN;
		int offset = i % BITLEN;
		if (out[block] & (1 << offset)) {
			res = G_NodeList(tmp->head, res);
		}
	}
	return res;
}

static bitmap Bitmap_empty() {
	bitmap tmp =  (bitmap)checked_malloc(sizeof(*tmp)*bitmap_len);
	int i;
	for (int i = 0; i < bitmap_len; i++) tmp[i] = 0;
	return tmp;
}

static void bitmap_copy(bitmap to, bitmap from) {
	int i;
	for (i = 0; i < bitmap_len; i++) to[i] = from[i];
}

static void bitmap_union(bitmap c, bitmap a, bitmap b) {
	int i;
	for (i = 0; i < bitmap_len; i++) {
		c[i] = a[i] | b[i];
	}
}

static void bitmap_diff(bitmap c, bitmap a, bitmap b) {
	int i;
	for (i = 0; i < bitmap_len; i++) {
		c[i] = a[i] & (~b[i]);
	}
}

static bool bitmap_equal(bitmap a, bitmap b) {
	int i;
	for (int i = 0; i < bitmap_len; i++)
		if (a[i] != b[i]) return FALSE;
	return TRUE;
}

static void bitmap_clear(bitmap a) {
	int i;
	for (int i = 0; i < bitmap_len; i++) a[i] = 0;
}

static void solve_data_equation(G_nodeList flist){
	bitmap inn = Bitmap_empty();
	bitmap outt = Bitmap_empty();
	while (1) {
		int flag = 0;
		G_nodeList t = flist;
		for (; t; t = t->tail) {
			G_node n = t->head;
			bitmap in = lookupLiveMap(in_table, n);
			bitmap out = lookupLiveMap(out_table, n);
			bitmap def = lookupLiveMap(def_table, n);
			bitmap use = lookupLiveMap(use_table, n);
			bitmap_copy(inn, in);
			bitmap_copy(outt, out);
			bitmap_clear(in);
			bitmap_clear(out);
			G_nodeList succ = G_succ(n);
			for (; succ; succ = succ->tail) {
				G_node s = succ->head;
				bitmap sin = lookupLiveMap(in_table, s);
				bitmap_union(out, out, sin);
			}
			bitmap_diff(in, out, def);
			bitmap_union(in, use, in);
			if (!(bitmap_equal(in, inn) && bitmap_equal(out, outt))) {
				//未结束
				flag = 1;
			}
		}
		if (!flag) break;
	}
}

static G_node get_node_temp(Temp_temp temp,G_graph g){
	G_nodeList gl = G_nodes(g);
	for (; gl; gl = gl->tail) {
		if (temp == G_nodeInfo(gl->head)) return gl->head;
	}
	return NULL;
}

struct Live_graph Live_liveness(G_graph flow) {
	def_table = G_empty();
	use_table = G_empty();
	in_table = G_empty();
	out_table = G_empty();

	G_graph lg = G_Graph();
	G_nodeList glist = G_nodes(flow),glistp;
	int node_count = 0;
	//构建变量图
	for (glistp=glist; glistp; glistp = glistp->tail) {
		G_node n = glistp->head;
		Temp_tempList def = FG_def(n);
		for (; def; def = def->tail) {
			if (node_offset(def->head, G_nodes(lg)) == -1) {
				G_Node(lg, def->head);//加入新变量
				node_count++;
			}
		}
		Temp_tempList use = FG_use(n);
		for (; use; use = use->tail) {
			if (node_offset(use->head, G_nodes(lg)) == -1) {
				G_Node(lg, use->head);
				node_count++;
			}
		}
	}

	bitmap_len = (node_count-1)/BITLEN+1;
	node_num = node_count;

	for (glistp = glist; glistp; glistp = glistp->tail) {
		G_node flownode = glistp->head;
		//初始化def
		bitmap defmap = Bitmap_empty();
		Temp_tempList def = FG_def(flownode);
		for (; def; def = def->tail) {
			int offset = node_offset(def->head, G_nodes(lg));
			if (offset >= 0) {
				int block = offset / BITLEN;
				int block_offset = offset % BITLEN;
				defmap[block] |= 1 << block_offset;
			}
		}
		enterLiveMap(def_table, flownode, defmap);
		//初始化use
		bitmap usemap = Bitmap_empty();
		Temp_tempList use= FG_use(flownode);
		for (; use;use = use->tail) {
			int offset = node_offset(use->head, G_nodes(lg));
			if (offset >= 0) {
				int block = offset / BITLEN;
				int block_offset = offset % BITLEN;
				usemap[block] |= 1 << block_offset;
			}
		}
		enterLiveMap(use_table, flownode, usemap);
		//初始化in out 空集
		bitmap inmap = Bitmap_empty();
		enterLiveMap(in_table, flownode, inmap);
		bitmap outmap = Bitmap_empty();
		enterLiveMap(out_table, flownode, outmap);
	}

	//解数据流方程
	solve_data_equation(G_nodes(flow));
	
	Live_moveList moveList = NULL;
	for (glistp = glist; glistp; glistp = glistp->tail) {
		G_node  n = glistp->head;
		Temp_tempList def = FG_def(n);
		if (def == NULL) continue;
		bitmap out = lookupLiveMap(out_table, n);
		G_nodeList outlist = bitmap_to_nodelist(lg, out);
		G_node defnode = get_node_temp(def->head, lg);
		if (FG_isMove(n)) {
			Temp_tempList use = FG_use(n);
			G_node usenode = get_node_temp(use->head, lg);
			moveList = Live_MoveList(usenode, defnode, moveList);
			for (; outlist; outlist = outlist->tail) {
				if (defnode != outlist->head&&outlist->head!=usenode) {
					G_addEdge(defnode, outlist->head);
					G_addEdge(outlist->head, defnode);
				}
			}
		}
		else {
			for (; outlist; outlist = outlist->tail) {
				if (defnode != outlist->head) {
					G_addEdge(defnode, outlist->head);
					G_addEdge(outlist->head, defnode);
				}
			}
		}
	}

	struct Live_graph res;
	res.graph = lg;
	res.moves = moveList;
	return res;

}