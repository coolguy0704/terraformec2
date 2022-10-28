![terradorm logo](https://www.datocms-assets.com/2885/1620155113-brandhcterraformprimaryattributedcolor.svg)



Terraform module to create an AWS EC2 instance with security group creation and imported key pair.


## Inputs

| Name | Description | Type |
| ------ | ----------- | ----------- |
| ami   | The AMI to use for the instance. | string |
| instance_type | The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance. | string|
| aws_security_group  ports  | ports to be opened for accessing ec2| list(string) |


## Outputs

| Name | Description |
| ------ | ----------- |
| ec2_global_ips   | public ip of created EC2 instance. |
