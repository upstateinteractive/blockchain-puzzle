module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,  // ganache
      network_id: "*", // Match any network id
      gasPrice: 1000000000,  // 1 gwei
      gas: 2300000
    },
    ropsten: {
      network_id: 3,
      host: "localhost",
      port: 8545,
      gasPrice: 1000000000,  // 1 gwei
      gas: 2300000
    },
    mainnet: {
      network_id: 1,
      host: "localhost",
      port: 8545,
      gasPrice: 6000000000,  // 1 gwei
      gas: 2300000
    }
  }
};
