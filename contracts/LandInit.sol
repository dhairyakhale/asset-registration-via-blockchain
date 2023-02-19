//SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <=0.9.0;
pragma experimental ABIEncoderV2;

contract LandInit {
    struct land_details {
        uint256[] landID; //Slashes mean moving ahead in index
        string state;
        string district;
        string subdivision;
        uint256 val_inr; //Round figure always
        uint256 area_ha; //Multiplier is 1000, so 3 decimal places allowed
    }

    struct user_details {
        string[] full_name;
        string aadhar_no;
        string pan_no;
    }

    function createUserStruct(
        string[] memory _full_name,
        string memory _aadhar_no,
        string memory _pan_no
    ) public returns (user_details memory) {
        user_details memory user;

        user.full_name = _full_name;
        user.aadhar_no = _aadhar_no;
        user.pan_no = _pan_no;

        return user;
    }

    function registerUser(user_details memory user) public {
        // Check if hash exists from before
        // Auth for all user details
        // Check eligibility to make land txn
    }

    function registerLand() public {
        // Check if land ID exists or not
        // Check and verify if owner exists in system
        // save land in database
        // generate hash and list on blockchain
    }

    function transactLand() public {
        // arguments : land id, id of seller, id of buyer, land details agreed upon both parties,-+
    }
}
