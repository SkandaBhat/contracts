#!/bin/bash

set -e -o pipefail

generate_binding() {
  contract=$(echo $1 | awk '{print $1}')
  go_source=$(echo $1 | awk '{print $2}')
  echo "Generating binding for (${contract})"
  abigen --abi ./data/abi/${contract}.json --pkg 'bindings' --type=${contract} --out ./pkg/bindings/${go_source}
}

contracts=(
  "AccessControl accessControl.go"
  "ACL acl.go"
  "BlockManager blockManager.go"
  "BlockStorage blockStorage.go"
  "Constants constants.go"
  "Delegator delegator.go"
  "ERC20 erc20.go"
  "ERC165 erc165.go"
  "Faucet faucet.go"
  "IAccessControl iAccessControl.go"
  "IBlockManager iBlockManager.go"
  "IDelegator iDelegator.go"
  "IERC20 iErc20.go"
  "IERC165 iErc165.go"
  "IJobManager iJobManager.go"
  "IStakeManager iStakeManager.go"
  "IStateManager iStateManager.go"
  "IVoteManager iVoteManager.go"
  "JobManager jobManager.go"
  "JobStorage jobStorage.go"
  "Random random.go"
  "SchellingCoin schellingCoin.go"
  "StakeManager stakeManager.go"
  "StakeStorage stakeStorage.go"
  "StateManager stateManager.go"
  "Utils utils.go"
  "VoteManager voteManager.go"
  "VoteStorage voteStorage.go"
)

for c in "${contracts[@]}"
do
    generate_binding "$c"
done

echo "done"