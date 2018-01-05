var Node = artifacts.require("Node");

module.exports = function(deployer) {
        deployer.deploy(Node, 1000000000, "NODE", "NODE", 2, false)
    Node.deployed().then(function(instance) {
//        console.log(instance);
        return instance.setNodePhases('0x627306090abab3a6e1400e9345bc60c78a8bef57');
    }).then(function(result) {
        console.log(result.tx);
        console.log(result.logs);
        console.log(result.receipt);
    });
};
