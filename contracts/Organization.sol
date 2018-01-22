pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './BadgeProgram.sol';
import './RewardProgram.sol';

contract Organization is Ownable {

    string public name;
    string public country;
    string public metaData;                      // a json string that hold the data
    string public version = "0.1";               // human 0.1 standard. Just an arbitrary versioning scheme.

    RewardProgram public rewardProgram;          // the reward program contract
    BadgeProgram public badgeProgram;            // the badge program contract
    
    function Organization(
        string _name,
        string _country,
        string _metaData,
        RewardProgram _rewardProgram,
        BadgeProgram _badgeProgram
    ) public Ownable() {
        name = _name;
        country = _country;
        metaData = _metaData;
        rewardProgram = _rewardProgram;
        badgeProgram = _badgeProgram;
    }

    function update(
        string _name,
        string _country,
        string _metaData
    ) external onlyOwner returns (bool) {
        name = _name;
        country = _country;
        metaData = _metaData;
        return true;
    }

}
