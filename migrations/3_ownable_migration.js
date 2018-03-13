var Ownable = artifacts.require("./Ownable.sol");

module.exports = function(deployer) {
  deployer.deploy(Ownable);
};
