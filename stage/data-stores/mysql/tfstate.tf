

terraform {
	backend "s3" {
		key="stage/data-stores/mysql/terraform.tfstate"
		encrypt=true
		region="us-east-1"
		bucket="terraform-up-and-runnig-state-sanjeev0915"
	}
}


