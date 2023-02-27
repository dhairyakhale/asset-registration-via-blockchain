//SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <=0.9.0;
pragma experimental ABIEncoderV2;

contract LandInit {
    struct land_details {
        string state;
        string district;
        string subdivision;
        uint256 val_inr; //Round figure always
        uint256 area_ha; //Multiplier is 1000, so 3 decimal places allowed
    }

    struct user_details {
        string[] full_name;
        uint256 dob;
        string aadhar_no;
        string pan_no;
    }

    address owner;

    constructor() public {
        owner = msg.sender;
    }

    user_details[] user_list;
    mapping(string => user_details[]) owner_info;
    mapping(string => land_details) land_info;

    function createUserStruct(
        string[] memory _full_name,
        uint256 _dob,
        string memory _aadhar_no,
        string memory _pan_no
    ) public returns (user_details memory) {
        user_details memory user;

        // check if the _pan_no and _aadhar_no is valid
        // check if user is a valid person (above agelimit)

        user.full_name = _full_name;
        user.aadhar_no = _aadhar_no;
        user.pan_no = _pan_no;
        user.dob = _dob;

        return user;
    }

    function registerUser(user_details memory user) public {
        // check if user does not exist
        // if it does:
        // save user in the database
    }

    function registerLand() public {
        // Check if land ID exists or not
        // Check and verify if owner exists in system
        // save land in database
        // generate hash and list on blockchain
    }

    function transactLand(
        user_details memory _buyer,
        user_details memory _seller,
        land_details memory _land
    ) public {}
}
