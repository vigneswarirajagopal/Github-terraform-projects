terraform {
   backend "s3" {
 	bucket     	= "terra-vignesh-demo-state-bucket"
 	key        	= "dev/terraform.tfstate"
 	region     	= "ap-south-1"
 	dynamodb_table = "terra-vigneh-demo-state-table"
 	encrypt    	= true
   }
 }