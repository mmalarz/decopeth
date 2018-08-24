pragma solidity ^0.4.25;

contract Decopeth {
    struct Business {
        string name;
        uint rating;
    }

    struct Review {
        address businessAddress;
        address reviewerAddress;
        string reviewerName;
        string review;
        uint starts;
        uint date;
    }

    mapping (address => Business) public bussinesses;
    Review[] public reviews;
}
