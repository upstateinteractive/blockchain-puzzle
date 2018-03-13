var PuzzleAccessControl = artifacts.require("./PuzzleAccessControl.sol");

module.exports = function(deployer) {
  deployer.deploy(PuzzleAccessControl);
};
