const HDWalletProvider = require("@truffle/hdwallet-provider");
const provider = new HDWalletProvider({
	privateKeys: [""],
	providerOrUrl: "https://rpc-testnet.kcc.network"
	
});
module.exports = {
  // Uncommenting the defaults below
  // provides for an easier quick-start with Ganache.
  // You can also follow this format for other networks;
  // see <http://truffleframework.com/docs/advanced/configuration>
  // for more details on how to specify configuration options!
  //
  networks: {
   development: {
     host: "127.0.0.1",
     port: 8545,
     network_id: "*"
   },
   testnet: {
    provider: () => provider,
    network_id: 322,
    gas: 5000000,
    gasPrice: 50000000000,  // 1 gwei (in wei)
    confirmations: 1,
    networkCheckTimeout: 1000000,
    timeoutBlocks: 50000,
    skipDryRun: true
   },
   mainnet: {
    provider: () => provider,
    network_id: 1,
    gas: 5000000,
    gasPrice: 50000000000,  // 5 gwei (in wei)
    confirmations: 1,
    networkCheckTimeout: 1000000,
    timeoutBlocks: 50000,
    skipDryRun: true
   }
  },  
  compilers: {
    solc: {
      version: "0.5.16",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        }
      }
    }
  }
};
