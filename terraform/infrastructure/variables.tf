##############################################################
#
# AWS Details
#
# NOTE: Access Key and Secret Key will be pulled from the local
# credentials 
#
# ##############################################################

variable "region" {
  default = "eu-west-2"
}

data "aws_caller_identity" "current" {}

variable "environment_name" {
  default = "Production"
}

##############################################################
# Bastion host server settings
##############################################################

variable "bastion_ami" {
  default = "ami-0307e8ce88a8245d4"
}

variable "bastion_instance_class" {
  default = "t2.micro"
}

variable "bastion_key_name" {
  default = "ccs_bastion"
}

variable "bastion_storage" {
  default = 8
}

##############################################################
# cluster domain
##############################################################

variable domain_name {
  type = "string"
  default = ""
}

variable domain_internal_prefix {
  type = "string"
  default = "internal"
}

variable enable_https {
  type = "string"
  default = true
}
##############################################################
# cluster settings - Application
##############################################################

variable "app_cluster_ami" {
   default = "ami-01bee3897bba49d78"
}

variable "app_cluster_instance_class" {
  default = "m4.large"
}

variable "app_cluster_instance_count" {
  default = "3"
}

variable "app_cluster_key_name" {
  default = "ccs_cluster"
}

variable "app_cluster_alb_logging_enabled" {
  default = true
}

##############################################################
# cluster settings - APIs
##############################################################

variable "api_cluster_ami" {
  default = "ami-01bee3897bba49d78"
}

variable "api_cluster_instance_class" {
  default = "t2.medium"
}

variable "api_cluster_instance_count" {
  default = "1"
}

variable "api_cluster_key_name" {
  default = "ccs_cluster"
}

variable "api_cluster_alb_logging_enabled" {
  default = false
}

##############################################################
# Default Databases Settings
##############################################################
variable "create_default_rds_database" {
  default = true
}

variable "default_db_instance_class" {
  default = "db.t2.medium"
}

variable "default_db_storage" {
  default = 20
}

variable "default_db_type" {
  default = "postgresql"
}

variable "default_db_host" {
  default = ""
}

variable "default_db_port" {
  default = "5432"
}

variable "default_db_name" {
  default = "cmpdefault"
}

variable "default_db_username" {
  default = "ccsdev"
}

variable "default_db_password" {
  default = ""
}

variable "default_db_retention_period" {
  default = "7"
}

##############################################################
# Alarms and Dashboards
##############################################################

variable "create_cloudwatch_alarms" {
  default = true
}

##############################################################
# Elastic Search Settings
##############################################################

variable "create_elasticsearch_default_domain" {
  default = false
}

variable "elasticsearch_default_domain" {
  default = "cmpdefault"
}

variable "elasticsearch_default_instance_class" {
  default = "c4.large.elasticsearch"
}

##############################################################
# External access
##############################################################
variable ssh_access_cidrs {
  type    = "map"
  default = {}
}

variable app_access_cidrs {
  type    = "map"
  default = {}
}

##############################################################
# Common port constants
##############################################################

variable "ssh_port" {
  default = 22
}

variable "http_port" {
  default = 80
}

variable "https_port" {
  default = 443
}

variable "postgres_port" {
  default = 5432
}

##############################################################
# S3 Bucket name
##############################################################

locals {
  artifact_bucket_name = "ccs.${data.aws_caller_identity.current.account_id}.build-artifacts"
  log_bucket_name = "ccs.${data.aws_caller_identity.current.account_id}.${lower(var.environment_name)}.logs"
}
