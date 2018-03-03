var DougToken = artifacts.require("./DougToken.sol");

module.exports = function(deployer) {
  deployer.deploy(DougToken, 1000);
};
