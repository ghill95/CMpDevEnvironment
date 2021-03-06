# IAM Security

## Groups ##
The security scripts generate a number of IAM user groups and policies documents. They do not create any actual users.

The following groups are created:

- CCS_System_Administration
- CCS_User_Administration
- CCS_Infrastructure_Administration
- CCS_Application_Developer
- CCS_API_Developer
- CCS_Code_Build_Pipeline
- CCS_Code_Build_Pipeline
- CCS_Cognito_Administration
- CCS_Terraform_Execution
- CCS_Developer_API_Access

Where possible pre-existing, AWS defined, policies have been assigned to these groups. Custom policies that related to specific infrastructure have been avoided but cannot be ruled out in the future.

When executing the Terraform scripts the AWS user corresponding to the access keys will be added to all of these groups.

### CCS_System_Administration ###
This group is for for *super users* and membership would normally be combined with the infrastructure administration and build pipeline groups. Members of this group are the only ones who can add or remove users from this group.

**NOTE** The IAMFullAccess policy as been removed from this group in this release. The ability to create and maintain any users should be granted outside of the CCS CMp configuration.

The following policies are attached:

- AWSCertificateManagerFullAccess
- AmazonS3FullAccess
- AmazonSSMFullAccess
- KMS Full access using custom policy

### CCS_User_Administration ###
This group allows a user to create IAM users and add them to the infrastructure administration, user administration, application developer, api developer and build pipe line groups.

It uses a custom policy to limit the user to only the actions needed for these tasks and to the specific IAM resources. To avoid errors in the AWS console the policy provides list and get capabilities to more than would be expected.


### CCS_Infrastructure_Administration ###
This group provides full access to most of the infrastructure assets. The degree of access to some of these assets may be restricted in the future.

Adding custom policies that restrict access to specific resources would make these scripts dependent on the infrastructure scripts.

The following policies are attached:

- AmazonVPCFullAccess
- AmazonRoute53FullAccess
- AmazonEC2FullAccess
- AmazonEC2ContainerRegistryFullAccess
- AmazonECS_FullAccess
- service-role/AWSConfigRole
- AmazonRDSFullAccess
- CloudWatchLogsFullAccess

### CCS_Application_Developer ###
This group provides access to the AWS assets typically needed by a developer who will be deploying applications. For example they have no access to RDS.

The following policies are attached:

- AmazonEC2ReadOnlyAccess
- AmazonEC2ContainerRegistryPowerUser
- AmazonECS_FullAccess
- CloudWatchReadOnlyAccess
- AmazonSSMFullAccess
- KMS ListAliases access using custom policy

### CCS_API_Developer ###
This group provides access to the AWS assets typically needed by a developer who will be deploying apis.

The following policies are attached:

- AmazonEC2ReadOnlyAccess
- AmazonEC2ContainerRegistryPowerUser
- AmazonECS_FullAccess
- AmazonRDSFullAccess
- CloudWatchReadOnlyAccess
- AmazonSSMFullAccess
- KMS ListAliases access using custom policy

### CCS_Developer_API_Access ###
Users in the group have access to specific AWS resources via an access key.

No specific policies are attached. Individual resources will attach to this group.
For example the Application/API S3 data bucket will attach a policy to this group to allow limited API access.

### CCS_Code_Build_Pipeline ###
This group provides access to the code build and code pipeline assets. The AWS access keys used to execute the application and api terraform scripts must be a member of this group.

The following policies are attached:

- CodeBuildAdminAccess
- CodePipelineFullAccess

### CCS_Cognito_Administration ###
This group provides access to the AWS Cognito service. This service provides authentication and management of application users.

The following policies are attached:

- AmazonCognitoPowerUser

### CCS_Terraform_Execution ###
Membership of this group is required for users who need to execute the Terraform scripts, it allows them to access
the shared state information. The AWS user who initially created the environment will already have suitable permissions.

The following policies are attached:

- AmazonS3FullAccess
- AmazonDynamoDBFullAccess 

