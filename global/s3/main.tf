provider "aws" {
	region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {

	bucket = "terraform-up-and-runnig-state-sanjeev0915"
	
	versioning {
		enabled=true
	}

	lifecycle {
		prevent_destroy = true
	}
}



terraform {
	backend "s3" {
	
		bucket ="terraform-up-and-runnig-state-sanjeev0915"
		key="global/s3/terraform.tfstate"
		region="us-east-1"
		encrypt=true
	}
}