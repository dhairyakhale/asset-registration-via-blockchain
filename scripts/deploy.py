from brownie import accounts, config, LandInit, NFTHandling, network
from scripts.json_handler import create_txn_json, create_nft_json


def deploy_all():
    account = get_account()
    land_init = LandInit.deploy({"from": account})
    nft_handling = NFTHandling.deploy({"from": account})


def get_account():
    if network.show_active() == "development":
        return accounts[0]
    else:
        return accounts.add(config["wallets"]["from_key"])


def main():
    deploy_all()
