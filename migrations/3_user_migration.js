var UserFactory = artifacts.require("./UserFactory.sol");

module.exports = function(deployer) {
  deployer.deploy(UserFactory);
};
