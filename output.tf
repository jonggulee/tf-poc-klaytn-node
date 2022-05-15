output "Bastion_public_ip" {
    value = aws_instance.test-blockchain-bastion-pub-2c.public_ip
}

# output "scn_private_ip_1" {
#     value = aws_instance.test-blockchain-scn-1-pri-2a.public_ip
# }

# output "scn_private_ip_2" {
#     value = aws_instance.test-blockchain-scn-2-pri-2b.public_ip
# }

# output "scn_private_ip_3" {
#     value = aws_instance.test-blockchain-scn-3-pri-2c.public_ip
# }

# output "scn_private_ip_4" {
#     value = aws_instance.test-blockchain-scn-4-pri-2d.public_ip
# }