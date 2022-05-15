# test-blockchain-node-terraform

# Purpose
To create a 4-node Service Chain using Terraform

# Architecture
<img width="986" alt="스크린샷 2022-05-15 오후 7 21 52" src="https://user-images.githubusercontent.com/102651396/168467999-283f004e-b86e-45a2-9572-b08c5f8fab17.png">

# Prerequisites
homi, kscn and key files in AWS S3 Bucket
  Bucket name: klaytn-node-config
  homi name: homi-output
  key name: key/
  kscn name: kscn-linux-amd64
Completion of AWS configuration and credential file settings

# Getting Started
Execute the following command on local.
```
git clone https://github.com/MZCBBD/test-blockchain-node-terraform.git
tf apply -auto-approve
```
## Check the Connection
You can check block generation status by watching klay.blockNumber. If this number is not 0, the node is working fine.
```
$ kscn attach --datadir ~/data
Welcome to the Klaytn JavaScript console!

instance: Klaytn/v1.8.2+7584e71de6/linux-amd64/go1.15.7
 datadir: /home/ec2-user/data
 modules: admin:1.0 debug:1.0 eth:1.0 governance:1.0 istanbul:1.0 klay:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

> klay.blockNumber
```

# APPENDIX
https://docs.klaytn.foundation/node/service-chain/getting-started/4nodes-setup-guide
