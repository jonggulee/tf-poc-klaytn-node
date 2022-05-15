#!/bin/bash

# Set localtime
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# SCN Download
aws s3 cp s3://klaytn-node-config/ /home/ec2-user/ --recursive
chown -R ec2-user:ec2-user /home/ec2-user/kscn-linux-amd64
chown -R ec2-user:ec2-user /home/ec2-user/homi-output
chmod +x /home/ec2-user/kscn-linux-amd64/bin/kscn*

# Add path
sudo sed -i -e "/^PATH/ s/$/\:\$HOME\/homi-linux-amd64\/bin\:\$HOME\/kscn-linux-amd64\/bin/" /home/ec2-user/.bash_profile
source /home/ec2-user/.bash_profile

# Create init
cp /home/ec2-user/homi-output/scripts/genesis.json /home/ec2-user/genesis.json
chown ec2-user:ec2-user /home/ec2-user/genesis.json
/home/ec2-user/kscn-linux-amd64/bin/kscn --datadir /home/ec2-user/data init /home/ec2-user/genesis.json
chown -R ec2-user:ec2-user /home/ec2-user/data

# Configre node key
cp /home/ec2-user/homi-output/scripts/static-nodes.json /home/ec2-user/data/
chown ec2-user:ec2-user /home/ec2-user/data/static-nodes.json

cat << EOF > copy_nodekey.sh
`
#!/bin/bash

current_ip="$(hostname -I | cut -d' ' -f1)"
scn_node1="10.0.5.50"
scn_node2="10.0.5.100"
scn_node3="10.0.5.150"
scn_node4="10.0.5.200"

if [[ $scn_node1 == $current_ip ]]; then
        \cp -f /home/ec2-user/homi-output/keys/nodekey1 /home/ec2-user/data/klay/nodekey
elif [[ $scn_node2 == $current_ip ]]; then
        \cp -f /home/ec2-user/homi-output/keys/nodekey2 /home/ec2-user/data/klay/nodekey
elif [[ $scn_node3 == $current_ip ]]; then
        \cp -f /home/ec2-user/homi-output/keys/nodekey3 /home/ec2-user/data/klay/nodekey
elif [[ $scn_node4 == $current_ip ]]; then
        \cp -f /home/ec2-user/homi-output/keys/nodekey4 /home/ec2-user/data/klay/nodekey
fi
`
EOF

chown -R ec2-user:ec2-user /home/ec2-user/data/klay/nodekey

# Delete files
rm -f copy_nodekey.sh
rm -rf /home/ec2-user/homi-output

# Start node
su - ec2-user "/home/ec2-user/kscn-linux-amd64/bin/kscnd" start
