pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './BadgeProgram.sol';
import './RewardProgram.sol';

contract Organization is Ownable {

    string public version = "0.1";               // human 0.1 standard. Just an arbitrary versioning scheme.
    string public name;
    string public website;
    string public email;
    string public country;
    string public image;
    string public about;

    RewardProgram public rewardProgram;
    BadgeProgram public badgeProgram;
    
    function Organization(
        string _name,
        string _website,
        string _email,
        string _country,
        string _image,
        string _about,
        RewardProgram _rewardProgram,
        BadgeProgram _badgeProgram
    ) public {
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
