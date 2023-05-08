from brownie import accounts, config, LandInit, LandToken, network
from scripts.json_handler import create_txn_json, create_nft_json

pri_key_inspector = accounts[0]


def deploy_all():
    # account = get_account()
    land_init = LandInit.deploy({"from": pri_key_inspector})
    nft_handling = LandToken.deploy({"from": pri_key_inspector})


# def get_account():
#     if network.show_active() == "development":
#         return accounts[0]
#     else:
#         return accounts.add(config["wallets"]["from_key"])


def main():
    deploy_all()
