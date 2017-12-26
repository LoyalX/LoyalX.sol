pragma solidity ^0.4.18;

import './RewardProgram.sol';

/*
This Token Contract implements the standard token functionality (https://github.com/ethereum/EIPs/issues/20) as well as the following OPTIONAL extras intended for use by loyalty team.


1) Initial Finite Supply (upon creation one specifies how much is minted).
2) In the absence of a token registry: Optional Decimal, Symbol & Name.
3) Optional approveAndCall() functionality to notify a contract if an approval() has occurred.

.*/
contract ExtendedRewardProgram is RewardProgram {

 using SafeMath for uint256;

    event SupplyIncreased(uint value, address to);

    // stolen from https://github.com/ethereum/EIPs/pull/621
    function increaseSupply(uint value, address to) public onlyOwner returns (bool) {
        totalSupply = totalSupply.add(value);
        balances[to] = balances[to].add(value);
        Transfer(0, to, value);
        SupplyIncreased(value, to);
        return true;
    }

    event SupplyDecreased(uint value, address from);

    function decreaseSupply(uint value, address from) public onlyOwner returns (bool) {
        balances[from] = balances[from].sub(value);
        totalSupply = totalSupply.sub(value);  
        Transfer(from, 0, value);
        SupplyDecreased(value, from);
        return true;
    }

}
