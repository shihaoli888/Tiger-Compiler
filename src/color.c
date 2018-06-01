//
// Created by Zhao Xiaodong on 2018/5/28.
//

#include <string.h>
#include "assem.h"
#include "graph.h"
#include "temp.h"
#include "color.h"

#define DEBUG_IT 1

static enum COL_nodeType {
    COL_NODE_PRECOLORED,
    COL_NODE_INITIAL,
    COL_NODE_SIMPLIFYWORKLIST,
    COL_NODE_FREEZEWORKLIST,
    COL_NODE_SPILLWORKLIST,
    COL_NODE_SPILLEDNODES,
    COL_NODE_COALESEDNODES,
    COL_NODE_COLOREDNODES,
    COL_NODE_SELECTSTACK
};

static struct Global {
    Temp_map precolored; // todo: temp_map使用
    Temp_map color;
    G_graph graph;
    G_table degrees;
    G_nodeList initial;
    G_nodeList simplifyWorklist;
    G_nodeList freezeWorklist;
    G_nodeList spillWorklist;
    G_nodeList spilledNodes;
    G_nodeList coalesedNodes;
    G_nodeList precoloredNodes;
    G_nodeList coloredNodes;
    G_nodeList selectStack;
    Temp_tempList registers;
    int K;
};

static struct Global global;

static enum COL_moveType {
    COL_MOVE_COALESED,
    COL_MOVE_CONSTRAINED,
    COL_MOVE_FROZEN,
    COL_MOVE_WORKLIST,
    COL_MOVE_ACTIVE
};

static AS_instrList coalesedMoves = NULL; // todo: AS_instrList使用
static AS_instrList constrainedMoves = NULL;
static AS_instrList frozenMoves = NULL;
static AS_instrList worklistMoves = NULL;
static AS_instrList activeMoves = NULL;

static Temp_tempList diff_Temp_tempList(Temp_tempList list, Temp_temp x) {
    if (!list)
        return NULL;
    if (list->head == x)
        return list->tail;
    Temp_tempList p = list; // todo: changed original structure
    while (p->tail) {
        if (p->tail->head == x) {
            p->tail = p->tail->tail; // todo: not free memory
            return list;
        }
        p = p->tail;
    }
    return list;
}

static Temp_tempList union_Temp_tempList(Temp_tempList list, Temp_temp x) {
    Temp_tempList p = list;
    while (p) {
        if (p->head == x)
            return list;
        p = p->tail;
    }
    return Temp_TempList(x, list);
}

static G_nodeList diff_G_nodeList(G_nodeList list, G_node x) {
    if (!list)
        return NULL;
    if (list->head == x)
        return list->tail;
    G_nodeList p = list; // todo: changed original structure
    while (p->tail) {
        if (p->tail->head == x) {
            p->tail = p->tail->tail; // todo: not free memory
            return list;
        }
        p = p->tail;
    }
    return list;
}

static G_nodeList union_G_nodeList(G_nodeList list, G_node x) {
    G_nodeList p = list;
    while (p) {
        if (p->head == x)
            return list;
        p = p->tail;
    }
    return G_NodeList(x, list);
}

static bool checkIn_G_nodeList(G_nodeList list, G_node x) {
    for (; list; list = list->tail) {
        if (list->head == x)
            return TRUE;
    }
    return FALSE;
}

static bool MoveRelated(G_node node) {
    return FALSE; // todo: not consider move and coalescing
}

static bool isPrecolored(G_node node);

static void MakeWorkList() {
    // todo: ...
    G_nodeList curr = global.initial;
    while (curr) {
//        global.initial = diff_G_nodeList(global.initial, curr->head);
#if 0
        printf("degree: %d\n", G_degree(curr->head) / 2);
#endif
        if (!isPrecolored(curr->head)) {
            if (G_degree(curr->head) / 2 >= global.K) {
                global.spillWorklist = union_G_nodeList(global.spillWorklist, curr->head);
            } else if (MoveRelated(curr->head)) {
                // todo: not consider move and coalescing
            } else {
                global.simplifyWorklist = union_G_nodeList(global.simplifyWorklist, curr->head);
            }
        }
        curr = curr->tail;
    }
}

static void decrementDegree(G_node node) {
    int d = (int) G_look(global.degrees, node);
    G_enter(global.degrees, node, (void *) (d - 1));
    if (d == global.K && !isPrecolored(node)) {
        // todo: without considering move related
        global.spillWorklist = diff_G_nodeList(global.spillWorklist, node);
        global.simplifyWorklist = union_G_nodeList(global.simplifyWorklist, node);
    }
}

static bool selectStack_Empty() {
    return global.selectStack == NULL;
}

static void selectStack_Push(G_node node) {
    global.selectStack = G_NodeList(node, global.selectStack);
}

static G_node selectStack_Pop() {
    assert(global.selectStack);
    G_node res = global.selectStack->head;
    global.selectStack = global.selectStack->tail;
    return res;
}

static bool checkNodeInSelectStack(G_node node) {
    G_nodeList p = global.selectStack;
    while (p) {
        if (p->head == node)
            return TRUE;
        p = p->tail;
    }
    return FALSE;
}

static bool checkNodeInCoalescedNodes(G_node node) {
    // todo: check..
    return FALSE;
}

static G_nodeList Adjacent(G_node node) {
    G_nodeList res = NULL;
    for (G_nodeList p = G_succ(node); p; p = p->tail) {
        if (!checkNodeInSelectStack(p->head) && !checkNodeInCoalescedNodes(p->head)) {
            res = G_NodeList(p->head, res);
        }
    }
    return res;
}

static void Simplify() {
    G_nodeList p = global.simplifyWorklist;
    while (p) {
        G_node curr = p->head;
        global.simplifyWorklist = diff_G_nodeList(global.simplifyWorklist, curr);
        selectStack_Push(curr);
        G_nodeList adjacentNodes = Adjacent(curr);
        G_nodeList pAdjacent = adjacentNodes;
        while (pAdjacent) {
            decrementDegree(pAdjacent->head);
            pAdjacent = pAdjacent->tail;
        }
        p = p->tail;
    }
}

static void Coalesce() {

}

static void Freeze() {

}

static void PotentialSpill() {
    // todo: consider spill priority
    G_node node = global.spillWorklist->head;
    global.spillWorklist = diff_G_nodeList(global.spillWorklist, node);
    selectStack_Push(node);
    G_nodeList adjacentNodes = G_succ(node);
    G_nodeList pAdjacent = adjacentNodes;
    while (pAdjacent) {
        decrementDegree(pAdjacent->head);
        pAdjacent = pAdjacent->tail;
    }
}

static void SelectSpill() {

}

static int countRegs(Temp_tempList regs) {
    int res = 0;
    Temp_tempList p = regs;
    while (p) {
        res++;
        p = p->tail;
    }
    return res;
}

static string getTempColor(Temp_temp temp) {
    return Temp_look(global.precolored, temp);
}

static Temp_temp getColorTemp(string color) {
    Temp_tempList p = global.registers;
    while (p) {
        string col = Temp_look(global.precolored, p->head);
        if (col && 0 == strcmp(col, color))
            return p->head;
        p = p->tail;
    }
    return NULL;
}

static Temp_temp getNodeTemp(G_node node) {
    return (Temp_temp) G_nodeInfo(node);
}

static bool isPrecolored(G_node node) {
    string col = Temp_look(global.precolored, getNodeTemp(node));
    return col != NULL;
}

static void Init(G_graph ig, Temp_map initial, Temp_tempList regs) {
    // todo: init all global variable
    global.initial = G_nodes(ig); // todo: shallow copy, may need deep copy
    global.precolored = initial;
    global.coloredNodes = NULL;
    global.spilledNodes = NULL;
    global.color = Temp_empty();
    global.degrees = G_empty();
    global.registers = regs;
    global.K = countRegs(regs);

    // init degree
    G_nodeList p_nodeList = G_nodes(ig);
    while (p_nodeList) {
        G_enter(global.degrees, p_nodeList->head, (void *) (G_degree(p_nodeList->head) / 2));
        p_nodeList = p_nodeList->tail;
    }

    // 初始化precoloredNodes
    for (G_nodeList p = G_nodes(ig); p; p = p->tail) {
        if (isPrecolored(p->head)) {
            global.precoloredNodes = union_G_nodeList(global.precoloredNodes, p->head);
            Temp_enter(global.color, getNodeTemp(p->head), Temp_look(global.precolored, getNodeTemp(p->head)));
        }
    }
}

static Temp_tempList getColors() {
    Temp_tempList res = NULL;
    for (Temp_tempList p = global.registers; p; p = p->tail) {
        res = Temp_TempList(p->head, res);
    }
    return res;
}

static void AssignColors() {
    while (!selectStack_Empty()) {
        G_node top = selectStack_Pop();
        Temp_tempList okColors = getColors();

        G_nodeList adjacentNodes = Adjacent(top);
        G_nodeList pAdjacent = adjacentNodes;
        while (pAdjacent) {
            G_node node = pAdjacent->head;
            if (checkIn_G_nodeList(global.coloredNodes, node)) {
                string color = Temp_look(global.color, getNodeTemp(node));
                okColors = diff_Temp_tempList(okColors, getColorTemp(color));
            } else if (checkIn_G_nodeList(global.precoloredNodes, node)) {
                string color = Temp_look(global.precolored, getNodeTemp(node));
                okColors = diff_Temp_tempList(okColors, getColorTemp(color));
            }
            pAdjacent = pAdjacent->tail;
        }
        if (!okColors) {
            global.spilledNodes = union_G_nodeList(global.spilledNodes, top);
        } else {
            global.coloredNodes = union_G_nodeList(global.coloredNodes, top);
            Temp_temp colorTemp = okColors->head;
#if 0
            printf("color a node: %d - %s(%d)\n", getTmpnum(getNodeTemp(top)), getTempColor(colorTemp), getTmpnum(colorTemp));
#endif
            Temp_enter(global.color, getNodeTemp(top), getTempColor(colorTemp));
        }
    }
}

static void Main() {
    // todo: liveness analysis
    MakeWorkList();

    while (global.simplifyWorklist != NULL || worklistMoves != NULL || global.freezeWorklist != NULL ||
           global.spillWorklist != NULL) {
        if (global.simplifyWorklist)
            Simplify();
        else if (worklistMoves)
            Coalesce(); // todo: never reach
        else if (global.freezeWorklist)
            Freeze(); // todo: never reach
        else if (global.spillWorklist) {
            PotentialSpill();
//            SelectSpill();
        }
    }
    AssignColors();
#if DEBUG_IT
    printf("Assigned Color:\n");
    for (G_nodeList p = global.initial; p; p = p->tail) {
        if (!isPrecolored(p->head))
            printf("%d - %s\n", getTmpnum(getNodeTemp(p->head)), Temp_look(global.color, getNodeTemp(p->head)));
    }
#endif
    if (global.spilledNodes) {
        // todo: deal with spill
        printf("spill happen\n");
//        fprintf(stderr, "spill happen, not supported till now..\n");
//        assert(0);
    }
}

static Temp_tempList nodeListToTempList(G_nodeList nodeList) {
    Temp_tempList res = NULL;
    while (nodeList) {
        res = Temp_TempList(getNodeTemp(nodeList->head), res);
        nodeList = nodeList->tail;
    }
    return res;
}

struct COL_result COL_color(G_graph ig, Temp_map initial, Temp_tempList regs) {
    printf("coloring..\n");
#if 0
    // show initial info
    {
        printf("initial test:\n");
        G_nodeList nodes = G_nodes(ig);
        while (nodes) {
            G_node node = nodes->head;
            Temp_temp t = (Temp_temp) G_nodeInfo(node);
            string s = Temp_look(initial, t);
            printf("%d - %s\n", getTmpnum(t), s);
            nodes = nodes->tail;
        }
        printf("\n");
        Temp_tempList temp_tempList = regs;
        while (temp_tempList) {
            int num = getTmpnum(temp_tempList->head);
            printf("%d - %s\n", num, Temp_look(initial, temp_tempList->head));
            temp_tempList = temp_tempList->tail;
        }
        printf("\n");
    };
#endif
#if 0
    Temp_temp r1 = Temp_newtemp();
    Temp_temp r2 = Temp_newtemp();
    Temp_temp r3 = Temp_newtemp();

    regs = Temp_TempList(r1,
                         Temp_TempList(r2,
                                       Temp_TempList(r3, NULL)));
    printf("registers: ");
    for (Temp_tempList p = regs; p; p = p->tail) {
        printf("%d ", getTmpnum(p->head));
    }
    printf("\n");

    ig = G_Graph();
    G_node n1 = G_Node(ig, (void *) (r1));
    G_node n2 = G_Node(ig, (void *) (Temp_newtemp()));
    G_node n3 = G_Node(ig, (void *) (Temp_newtemp()));
    G_node n4 = G_Node(ig, (void *) (Temp_newtemp()));
    G_addEdge(n1, n2);
    G_addEdge(n2, n1);
    G_addEdge(n1, n3);
    G_addEdge(n3, n1);
    G_addEdge(n1, n4);
    G_addEdge(n4, n1);
    G_addEdge(n2, n3);
    G_addEdge(n3, n2);
    G_addEdge(n3, n4);
    G_addEdge(n4, n3);
    G_addEdge(n2, n4);
    G_addEdge(n4, n2);
    G_nodeList nodes = G_nodes(ig);
    printf("nodes: ");
    for (G_nodeList p = nodes; p; p = p->tail) {
        printf("%d ", getTmpnum((Temp_temp) G_nodeInfo(p->head)));
    }
    printf("\n");

    initial = Temp_empty();
    Temp_enter(initial, r1, "r1");
    Temp_enter(initial, r2, "r2");
    Temp_enter(initial, r3, "r3");
    printf("\n");
#endif

    Init(ig, initial, regs);
    Main();
    struct COL_result res;
    res.coloring = global.color;
    res.spills = nodeListToTempList(global.spilledNodes);
    return res;
}
