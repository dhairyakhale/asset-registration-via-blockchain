from brownie import accounts, config, LandInit, NFTHandling, network
from scripts.json_handler import create_txn_json, create_nft_json


def deploy_land_init():
    account = get_account()


def get_account():
    if network.show_active() == "development":
        return accounts[1]
    else:
        return accounts.add(config["wallets"]["from_key"])


def main():
    uname = input("Enter your username: ")
