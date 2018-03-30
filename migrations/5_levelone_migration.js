LevelOne = artifacts.require("./LevelOne.sol");

module.exports = function(deployer) {
  deployer.deploy(LevelOne);
};
