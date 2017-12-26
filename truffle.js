var HDWalletProvider = require("truffle-hdwallet-provider");

var infura_apikey = "";
var mnemonic = "";


module.exports = {
	networks: {
		ganache: {
			host: "localhost",
			port: 8545,
			gas: 6712390,
			gasPrice: 100000000000,
			network_id: "*"
		},
		ropsten: {
			provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/" + infura_apikey),
			network_id: 3,
			gas: 4000000,
			gasPrice: 100000000000,
		},
		development: {
			host: "localhost",
			port: 8545,
			network_id: "*" // Match any network id
		},
	}
};