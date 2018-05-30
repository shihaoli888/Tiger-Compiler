//
// Created by Zhao Xiaodong on 2018/5/28.
//

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
    G_graph graph;
    G_table degrees;
    G_nodeList initial;
    G_nodeList simplifyWorklist;
    G_nodeList freezeWorklist;
    G_nodeList spillWorklist;
    G_nodeList spilledNodes;
    G_nodeList coalesedNodes;
    G_nodeList coloredNodes;
    G_nodeList selectStack;
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

static bool MoveRelated(G_node node) {
    return FALSE; // todo: not consider move and coalescing
}

static void MakeWorkList() {
    // todo: ...
    G_nodeList curr = global.initial;
    while (curr) {
        global.initial = diff_G_nodeList(global.initial, curr->head);
#if DEBUG_IT
        printf("degree: %d\n", G_degree(curr->head));
#endif
        if (G_degree(curr->head) >= global.K) {
            global.spillWorklist = union_G_nodeList(global.spillWorklist, curr->head);
        } else if (MoveRelated(curr->head)) {
            // todo: not consider move and coalescing
        } else {
            global.simplifyWorklist = union_G_nodeList(global.simplifyWorklist, curr->head);
        }
        curr = curr->tail;
    }
}

void decrementDegree(G_node node) {
    int d = (int) G_look(global.degrees, node);
    d--;
    G_enter(global.degrees, node, (void *) d);
    if (d == global.K) {
        // todo: without considering move related
        global.spillWorklist = diff_G_nodeList(global.spillWorklist, node);
        global.simplifyWorklist = union_G_nodeList(global.simplifyWorklist, node);
    }
}

void selectStack_Push(G_node node) {
    global.selectStack = G_NodeList(node, global.selectStack);
}

G_node selectStack_Pop() {
    assert(global.selectStack);
    G_node res = global.selectStack->head;
    global.selectStack = global.selectStack->tail;
}

static void Simplify() {
    G_nodeList p = global.simplifyWorklist;
    while (p) {
        G_node curr = p->head;
        global.simplifyWorklist = diff_G_nodeList(global.simplifyWorklist, curr);
        selectStack_Push(curr);
        G_nodeList adjacentNodes = G_adj(curr);
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
    G_nodeList adjacentNodes = G_adj(node);
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

static void Init(G_graph ig, Temp_map initial, Temp_tempList regs) {
    // todo: init all global variable
    global.initial = G_nodes(ig); // todo: shallow copy, may need deep copy
    global.precolored = initial;
    global.degrees = G_empty();
    global.K = countRegs(regs);

    // init degree
    G_nodeList p_nodeList = G_nodes(ig);
    while (p_nodeList) {
        G_enter(global.degrees, p_nodeList->head, (void *) G_degree(p_nodeList->head));
        p_nodeList = p_nodeList->tail;
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

    if (global.spilledNodes) {
        // todo: deal with spill
        fprintf(stderr, "spill happen, not supported till now..\n");
        assert(0);
    }
}

struct COL_result COL_color(G_graph ig, Temp_map initial, Temp_tempList regs) {
    printf("coloring..\n");
#if DEBUG_IT
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
    Init(ig, initial, regs);
    Main();
    struct COL_result res; // todo: temp return for compile
    res.coloring = NULL;
    res.spills = NULL;
    return res;
}
