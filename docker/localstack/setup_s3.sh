# awslocal s3 mb s3://backet
docker-compose exec localstack aws --endpoint-url=http://localstack:4572 s3 mb s3://microposts

# build check
docker-compose exec localstack aws --endpoint-url=http://localstack:4572 s3 ls s3://
