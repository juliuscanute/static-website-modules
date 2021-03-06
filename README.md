Storage
=======

Input
-----
Input parameters for the module.

| Input                | Description                                   | Defaults  
| ---------------------|---------------------------------------------|---------
| aws_bucket_name      | The name of the S3 bucket                     |   
| acl                  | The access rights of the bucket               | private   
| allowed_headers      | The allowed HTTP headers                      | ["*"]     
| allowed_methods      | The allowed HTTP methods                      | ["GET"]   
| allowed_origins      | The domain name of the allowed origin         |   


Output
------
Output generated by this module.

| Output                | Description                                   
| ---------------------|---------------------------------------------
| bucket_arn           | Resource Name of the S3 bucket                
| bucket_id            | Bucket ID                                     
| bucket_domain_name   | Bucket Domain Name                            


DNS
=======

Input
-----
Input parameters for the module.

| Input                | Description                                   | Defaults  
| ---------------------|---------------------------------------------|---------
| domain_name          | Name of the primary Domain                     |   
| alias_domain_name    | Other alias names for the domain               | ""   
| alias_zone_id        | ZONE ID of the alias if there is one           | ""     
| alias_health_check   | Should health check?                           | false
| existing             | Create hosted zone if not already present      | false
| create_record        | Create Route53 records if not already present  | false   


Output
------
Output generated by this module.

| Output                | Description                                   
| ---------------------|---------------------------------------------
| zone_id              | Zone ID of the hosted Zone                


Code Build
==========

Input
-----
Input parameters for the module.

| Input                | Description                                   | Defaults  
| ---------------------|---------------------------------------------|---------
| project_name           | Name of the project                       |   
| project_description    | Describe what this project does briefly   |    
| iam_role_arn           | IAM Role ARN                              |      
| build_repository_name  | Name of the repository                    | 
| aws_bucket_name        | The name of the S3 bucket                 |
  

Certificate
===========

Input
-----
Input parameters for the module.

| Input                | Description                                   | Defaults  
| ---------------------|---------------------------------------------|---------
| domain_name          | Domain name of the server                   |   
| zone_id              | Zone ID of the server                       |   
| alternative_names    | Alternative names for the domain            |     

Output
------
Output generated by this module.

| Output                | Description                                   
| ---------------------|---------------------------------------------
| certificate_arn      | ARN of the generated certificate                


CDN
===

Input
-----
Input parameters for the module.

| Input                | Description                                   | Defaults  
| ---------------------|---------------------------------------------|---------
| domain_name          | Name of the Domain                          |   
| allowed_methods      | The allowed HTTP methods                    |    
| cached_methods       | The cached HTTP methods                     |      
| valid_aliases        | The valid aliases                           | 
| certificate_arn      | ARN of valid certificate to use             |

Output
------
Output generated by this module.

| Output                | Description                                   
| ---------------------|---------------------------------------------
| cloudfront_domain_name      | Cloudfront generated domain name                
| cloudfront_hosted_zone_id   | Cloudfront generated hosted zone ID                                     
| origin_iam_arn              | Origin Access Identity ARN   



Access Control
=============

Input
-----
Input parameters for the module.

| Input                | Description                                   | Defaults  
| ---------------------|---------------------------------------------|---------
| s3_bucket_arn        | S3 bucket ARN                               |   
| s3_bucket_id         | S3 bucket ID                                |    
| origin_iam_arn       | Origin Server IAM ARN                       |      
| codebuild_role_name  | Codebuild role name                         | 

Output
------
Output generated by this module.

| Output                | Description                                   
| ---------------------|---------------------------------------------
| codebuild_iam_role_arn | ARN of IAM Role to be used by Code Build                