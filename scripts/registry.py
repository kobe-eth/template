from brownie import Contract

name_to_artifact = {"Contract": Contract}


def contract_name_to_artifact(name):
    return name_to_artifact[name]
