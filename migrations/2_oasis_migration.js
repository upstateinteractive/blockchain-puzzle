var OasisToken = artifacts.require("./OasisToken.sol");

module.exports = function(deployer) {
  deployer.deploy(OasisToken, 100);
};
