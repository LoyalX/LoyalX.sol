# LoyalX Smart Contracts

### Steps to run

For reference: http://truffleframework.com/tutorials/pet-shop

### Install:

```
npm install -g ethereumjs-testrpc truffle
npm install
```

### For compile and run:

1. start the test server `$ testrpc`
2. compile the contracts `$ truffle compile`
3. migrate the contracts `$ truffle migrate`
4. run lite server to host the contract apb `$ npm run dev`

### For hosted apb contracts:

`GET: {host ip}:3000/{contract name}.json`   
* Factory contract apb `GET: localhost:3000/LoyaltyTokenFactory.json`
* Token contract apb `GET: localhost:3000/LoyaltyToken.json`