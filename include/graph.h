#ifndef GRAPH_H
#define GRAPH_H
#include "util.h"
#include "table.h"
typedef struct G_graph_ *G_graph;
typedef struct G_node_ *G_node;

typedef struct G_nodeList_ *G_nodeList;
struct G_nodeList_ { G_node head; G_nodeList tail; };

/* 构建空的图*/
G_graph G_Graph(void);

/* 深拷贝图*/
G_graph G_copyGraph(G_graph g);

/*删除图节点*/
G_node G_rmNode(G_graph g, G_node n);

/*构造节点并加入到图中*/
G_node G_Node(G_graph g, void *info);

/*构造节点列表*/
G_nodeList G_NodeList(G_node head, G_nodeList tail);

/*返回图的全部节点*/
G_nodeList G_nodes(G_graph g);

/*判断节点是否在列表中*/
bool G_inNodeList(G_node a, G_nodeList l);

/*添加一条有向边*/
void G_addEdge(G_node from, G_node to);

/*删除一条有向边*/
void G_rmEdge(G_node from, G_node to);

/*打印图信息，调试用*/
void G_show(FILE *out, G_nodeList p, void showInfo(FILE* out, void *));

/*节点的出边相邻节点*/
G_nodeList G_succ(G_node n);

/*节点的入边相邻节点*/
G_nodeList G_pred(G_node n);

/*全部边相邻节点，不要用，liveness产生的冲突图是无向图，用succ返回全部节点,用这个会有重复，还慢*/
G_nodeList G_adj(G_node n);

/*a是否有条出边指向b*/
bool G_goesTo(G_node a, G_node b);

/*节点的度，入度加出度*/
int G_degree(G_node n);

/*获取节点信息*/
void *G_nodeInfo(G_node n);

typedef struct TAB_table_  *G_table;

G_table G_empty(void);

void G_enter(G_table t, G_node n, void *v);

void *G_look(G_table t, G_node n);

#endif // !GRAPH_H
