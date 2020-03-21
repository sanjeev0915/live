provider "aws" {
	region = "us-east-1"
}

module "webserver-cluster" {
	source = "/users/sanjeev/terraform/modules/services/webserver-cluster"

	cluster-name = "webservers-prod"
	db_remote_state_bucket="terraform-up-and-runnig-state-sanjeev0915"
	db_remote_state_key="prod/data-stores/mysql/terraform.tfstate"

	min_size = 2
 	max_size =  10
	instance_type="m4.large"

}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours"{
	scheduled_action_name="scale_out_during_business_hours"
	min_size=2
	max_size=2
	desired_capacity=10
	recurrence="0 0 * * *"
	autoscaling_group_name ="${module.webserver_cluster.asg_name}"
}

resource "aws_autoscaling_schedule" "scale_in_at_night"{
	scheduled_action_name="scale_in_at_night"
	min_size=2
	max_size=10
	desired_capacity=2
	recurrence="0 17 * * *"
	autoscaling_group_name ="${module.webserver_cluster.asg_name}"
}