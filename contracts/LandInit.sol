//SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <=0.8.0;
pragma experimental ABIEncoderV2;

contract LandInit {
    struct land_details {
        uint32[] land_id;
        string state;
        string district;
        uint256 val_inr; //Round figure always
        uint256 area_ha; //Multiplier is 1000, so 3 decimal places allowed
    }

    struct user_details {
        string username;
        string[] full_name;
        uint256 dob;
        string aadhar_no;
        string pan_no;
    }

    address curruser;

    constructor() public {
        curruser = msg.sender;
    }

    string[] usernames;
    mapping(string => user_details) user_list;
    mapping(bytes32 => land_details) land_info; //Indirect mapping from land to users
    mapping(bytes32 => user_details) owner_info;

    function createUserStruct(
        string memory _username,
        string[] memory _full_name,
        uint256 _dob,
        string memory _aadhar_no,
        string memory _pan_no
    ) public returns (user_details memory) {
        user_details memory user;

        // check if the _pan_no and _aadhar_no is valid
        // check if user is a valid person (above agelimit)

        user.username = _username;
        user.full_name = _full_name;
        user.aadhar_no = _aadhar_no;
        user.pan_no = _pan_no;
        user.dob = _dob;

        return user;
    }

    function verifyOwner(string memory _username) public returns (bool) {
        for (uint256 i = 0; i < usernames.length; i++) {
            if (
                keccak256(abi.encode(_username)) ==
                keccak256(abi.encode(usernames[i]))
            ) {
                //found
                return true;
            }
        }

        return false;
    }

    function registerUser(
        string memory _username,
        string[] memory _full_name,
        uint256 _dob,
        string memory _aadhar_no,
        string memory _pan_no
    ) public {
        // check if user does not exist

        for (uint256 i = 0; i < usernames.length; i++) {
            if (verifyOwner(_username)) {
                //found
                return;
            }
        }
        // if it does not:
        // save user in the database
        user_details memory newuser = createUserStruct(
            _username,
            _full_name,
            _dob,
            _aadhar_no,
            _pan_no
        ); //take inputs

        usernames.push(_username);
        user_list[_username] = newuser;
    }

    function registerLand(string memory _username) public {
        // Check if land ID exists or not
        // Check and verify if owner exists in system
        if (!verifyOwner(_username)) return;
        // save land in database

        // mint nft by details
    }

    function transactLand(
        user_details memory _buyer,
        user_details memory _seller,
        land_details memory _land
    ) public {}
}
