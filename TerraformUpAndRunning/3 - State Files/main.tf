provider "aws" {
	region = "us-east-1"
}

output "s3_bucket_arn" {
	value = "${aws_s3_bucket.terraform_state.arn}"
}

resource "aws_s3_bucket" "terraform_state" {
	bucket = "khines-terraform-up-and-running-state"

	versioning {
		enabled = true
	}

	/* lifecycle {
		prevent_destroy = true
	} */

	tags {
		BU = "it"
		Consumer = "IT"
		Creator = "Kristofor Hines"
		Owner = "IT"
		ENV = "devuseast1"
	}
}