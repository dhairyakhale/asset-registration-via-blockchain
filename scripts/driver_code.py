from brownie import accounts, config, LandInit, LandToken, network
from scripts.json_handler import create_txn_json, create_nft_json


pri_key_seller = accounts[1]
pri_key_buyer = accounts[2]


# def get_account():
#     if network.show_active() == "development":
#         return accounts[1]
#     else:
#         return accounts.add(config["wallets"]["from_key"])


def register_user():
    print(len(LandInit))
    # land = LandInit[-1]
    # uname = input("Enter username: ")
    # if land.verifyOwner(uname) == False:
    #     print("User already exists!")
    #     return
    # else:
    #     print("NICE")


def main():
    register_user()
