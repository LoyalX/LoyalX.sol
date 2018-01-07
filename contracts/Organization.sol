pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './BadgeProgram.sol';
import './RewardProgram.sol';

contract Organization is Ownable {

    string public name;
    string public website;
    string public email;
    string public country;
    string public image;                    // image url or an ipfs hash.
    string public about;                    // details about the org, can contain html / md.
    string public version = "0.1";          // human 0.1 standard. Just an arbitrary versioning scheme.

    RewardProgram public rewardProgram;     // the reward program contract
    BadgeProgram public badgeProgram;       // the badge program contract
    
    function Organization(
        string _name,
        string _website,
        string _email,
        string _country,
        string _image,
        string _about,
        RewardProgram _rewardProgram,
        BadgeProgram _badgeProgram
    ) public Ownable() {
        name = _name;
        website = _website;
        email = _email;
        country = _country;
        image = _image;
        about = _about;
        rewardProgram = _rewardProgram;
        badgeProgram = _badgeProgram;
    }

}
