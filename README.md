# test-blockchain-node-terraform

# Purpose
To create a 4-node Service Chain using Terraform

# Architecture
<img width="988" alt="스크린샷 2022-05-15 오후 11 57 20" src="https://user-images.githubusercontent.com/102651396/168479367-19ee7c19-9f42-45e6-9d1f-7da1c3c6abfb.png">

# Prerequisites
Completion of AWS configuration and credential file settings<br/> 
Create AWS Key pair<br/>
homi, kscn and key files in AWS S3 Bucket<br/> 
> Bucket name: {Your bucket name}<br/>
> homi name: homi-output<br/> 
> key name: key/<br/> 
> kscn name: kscn-linux-amd64<br/> 

# Getting Started
Git clone
```
$ git clone https://github.com/MZCBBD/test-blockchain-node-terraform.git
```

Open data.tf in a text editor then update the S3 bucket name
```
variable "s3_bucket_path" {
  description = "S3 bucket name"
  default     = "{Your bucket name}"
}
```

Execute the following command on local.
```
$ terraform init
$ terraform apply -auto-approve
```
## Check the Connection
You can check block generation status by watching klay.blockNumber on any node. If this number is not 0, the node is working fine.
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
