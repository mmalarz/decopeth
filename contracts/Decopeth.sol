pragma solidity ^0.4.24;

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

    mapping (address => Business) public businesses;
    Review[] public reviews;

    modifier validateReview(string _reviewerName, string _review, uint _stars) {
        require(bytes(_reviewerName).length > 0);
        require(bytes(_review).length > 0);
        require(_stars >= 0 && _stars <= 5);
        _;
    }
    
    modifier validateBusiness(string _name) {
        require(bytes(_name).length > 0);
        _;
    }

    function addBusiness(string _name) public validateBusiness(_name) {
        businesses[msg.sender] =  Business(_name, 0);
    }

    function addReview(
        address _businessAddress,
        string _reviewerName,
        string _review,
        uint _stars
    ) public validateReview(_reviewerName, _review, _stars) {
        reviews.push(
            Review(
                _businessAddress,
                msg.sender,
                _reviewerName,
                _review,
                _stars,
                now
            )
        );
    }
}
