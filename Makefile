.DEFAULT_GOAL := l 

network:;

# Variable
eth_rpc := https://polygon-rpc.com
contract_name:= "Contract"

install:; yarn && forge install

clean:; rm -rf build/

# Utils
l:;		yarn lint && forge build

# require mythril docker image
myth:
	forge flatten src/$(contract_name).sol > flat/$(contract_name).sol
	docker run -v $(shell pwd):/tmp mythril/myth analyze /tmp/flat/$(contract_name).sol

# Forge
test:; 		forge test 
test-fork:; forge test -vvv --fork-url $(eth_rpc) 
test-fork-gas:; forge test -vvv --fork-url $(eth_rpc) --gas-report

# Brownie Related
compile:; brownie compile
deploy:;  make clean && brownie run scripts/deploy.py
