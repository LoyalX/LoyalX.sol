App = {
  web3Provider: null,
  contracts: {},

  init: function() {
    return App.initWeb3();
  },
  
  var addToLog = function(id, txt) {
	$(id + " .logs").append("<br>" + txt);
  },


  initWeb3: function() {
    // Initialize web3 and set the provider to the testRPC.
	if (typeof web3 !== 'undefined') {
	  App.web3Provider = web3.currentProvider;
	  web3 = new Web3(web3.currentProvider);
	} else {
	  // set the provider you want from Web3.providers
	  App.web3Provider = new web3.providers.HttpProvider('http://localhost:8545');
	  web3 = new Web3(App.web3Provider);
	}

    return App.initContract();
  },

  initContract: function() {
    $.getJSON('HumanStandardTokenFactory.json', function(data) {
	  // Get the necessary contract artifact file and instantiate it with truffle-contract.
	  var HumanStandardTokenFactoryArtifact = data;
	  App.contracts.HumanStandardTokenFactory = TruffleContract(HumanStandardTokenFactoryArtifact);

	  // Set the provider for our contract.
	  App.contracts.HumanStandardTokenFactory.setProvider(App.web3Provider);
	});

    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '.deploy-token', App.handleDeployToken);
  },

  handleDeployToken: function() {
    event.preventDefault();
	
	var initial_amount = parseInt($("#initial-amount").val(), 10);
	var name = $("#name").val();
	var decimals = parseInt($("#decimals").val(), 10);
	var symbol = $("#symbol").val();
	
	initial_amount = initial_amount * 10 ^ decimals;

    var tokenFactoryInstance;

	web3.eth.getAccounts(function(error, accounts) {
	  if (error) {
		console.log(error);
	  }

	  var account = accounts[0];

	  App.contracts.HumanStandardTokenFactory.deployed().then(function(instance) {
		tokenFactoryInstance = instance;

		return tokenFactoryInstance.createHumanStandardToken(initial_amount, name, decimals, symbol, {from: account});
	  }).then(function(result) {
		addToLog("#blockchain", "address : " + result);
	  }).catch(function(err) {
		console.log(err.message);
	  });
	});
  },


};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
