pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './Badge.sol';
import './RewardProgram.sol';

contract Organization is Ownable {

    string public name;
    string public website;
    string public email;
    string public logoURL;
    string public tokenIconURL;
    string public about;

    address public rewardProgram;
    mapping(address => address[]) badgesOwnersMap;
    
    function Organization(
        string _name,
        string _website,
        string _email,
        string _logoURL,
        string _tokenIconURL,
        string _about,
        address _rewardProgram
    ) public {
        name = _name;
        website = _website;
        email = _email;
        logoURL = _logoURL;
        tokenIconURL = _tokenIconURL;
        about = _about;
        rewardProgram = _rewardProgram;
    }

    event BadgeIssued(string badgeName, string badgeClass, string ownerName, address ownerAddress);

    function issueBadge(string _badgeName, string _badgeClass, string _ownerName, address _ownerAddress) public {
        Badge newBadge = new Badge(_badgeName, _badgeClass, _ownerName, _ownerAddress);
        badgesOwnersMap[_ownerAddress].push(address(newBadge));
        BadgeIssued(_badgeName, _badgeClass, _ownerName, _ownerAddress);
    }

    function getBadgesAddress(address owner) public view returns (address[]) {
        return badgesOwnersMap[owner];
    }

}
