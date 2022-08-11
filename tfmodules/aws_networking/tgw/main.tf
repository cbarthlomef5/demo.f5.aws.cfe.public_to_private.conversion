resource "aws_ec2_transit_gateway" "demo_env" {
    
    
    tags = {
        Name = "demo_env_tgw"
    }
}