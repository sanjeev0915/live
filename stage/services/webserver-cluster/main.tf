provider "aws" {
	region = "us-east-1"
}

module "webserver-cluster" {
	//source = "../../../modules/services/webserver-cluster"
	source = "git::git@github.com:sanjeev0915/modules.git//webserver-cluster?ref=v0.0.1"

	db_remote_state_bucket="terraform-up-and-runnig-state-sanjeev0915"
	db_remote_state_key="stage/data-stores/mysql/terraform.tfstate"
	cluster-name = "webservers-stage"

	min_size = 2
 	max_size =  2
	instance_type="t2.micro"

}