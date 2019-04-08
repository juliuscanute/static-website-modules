#Storage

 
##Input

| Input                | Description                                   | Defaults  
| ---------------------|---------------------------------------------|---------
| aws_bucket_name      | The name of the S3 bucket                     | Required  
| acl                  | The access rights of the bucket               | private   
| allowed_headers      | The allowed HTTP headers                      | ["*"]     
| allowed_methods      | The allowed HTTP methods                      | ["GET"]   
| allowed_origins      | The domain name of the allowed origin         | Required  

##Output

| Output                | Description                                   
| ---------------------|---------------------------------------------
| bucket_arn           | Resource Name of the S3 bucket                
| bucket_id            | Bucket ID                                     
| bucket_domain_name   | Bucket Domain Name                            