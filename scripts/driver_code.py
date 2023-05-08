from brownie import accounts, config, LandInit, LandToken, network
from scripts.json_handler import create_txn_json, create_nft_json


pvt_key_seller = accounts[1]
pvt_key_buyer = accounts[2]


def register_user():
    land_init = LandInit[-1]

    _uname = input("Enter username: ")

    if land_init.verifyOwner(_uname) == True:
        print("User already exists!")
        return
    else:
        _wallet_addr = pvt_key_seller
        _full_name = input("Enter full name: ")
        _aadhar_no = input("Enter aadhar number: ")
        _pan_no = input("Enter PAN number: ")

        land_init.registerUser(
            _uname,
            _wallet_addr,
            _full_name,
            _aadhar_no,
            _pan_no,
            {"from": pvt_key_seller},
        )


def register_land(uname):
    land_id = input("Enter Land ID: ")


def main():
    register_user()
