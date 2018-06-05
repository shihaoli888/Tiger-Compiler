var config = {
    container: '#tree',
    animateOnInit: true,

    node: {
        collapsable: true
    },
    animation: {
        nodeAnimation: "easeOutBounce",
        nodeSpeed: 700,
        connectorsAnimation: "bounce",
        connectorsSpeed: 700
    }
};
var nodes = [
    {
        text: {
            name: "ROOT"
        }
    }
];
var treeConfig = [config];
// treeConfig = treeConfig.concat(nodes);
// for (i = 0; i < nodes.length; i++) {
//     if (nodes[i].hasOwnProperty('parent'))
//         nodes[i].parent = nodes[nodes[i].parent];
//     treeConfig.push(nodes[i]);
// }
$.get('ir_vis.txt', function (data) {
    var nodesText = data.split('\n');
    // console.log(nodesText);
    for (i = 0; i < nodesText.length; i++) {
        var idStr = nodesText[i].substring(0, nodesText[i].indexOf(' '));
        var id = parseInt(idStr);
        var value = nodesText[i].substring(nodesText[i].indexOf(' ') + 1);
        var parent = nodes[id];
        nodes.push({
            parent: parent,
            text: {
                name: value
            }
        });
    }
    for (i = 0; i < nodes.length; i++) {
        treeConfig.push(nodes[i])
    }
    // console.log(treeConfig);
    new Treant(treeConfig);
});
