Terraform commands:

terraform init - запускть ее в папке, где лежит скрипт
terraform refresh - update state of infrastructure
terraform plan - посмотреть что будет создано
terraform apply - выполнить скрипт
terraform destroy - удалить все ресурсы
terraform destroy -target aws_subnet.dev-test-subnet-2 - удалить ресурс
terraform apply -auto-approve - автоматическое Yes
terraform state list - список ресурсов и данных
terraform state show data.aws_vpc.existing_vpc - описаниеи конкретного ресурса
