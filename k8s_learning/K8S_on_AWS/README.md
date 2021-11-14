AWS UI Steps :
  1. Create IAM Role with AmazonEKSClusterPolicy
  2. Create VPC using CloudFormation template
     https://amazon-eks.s3.us-west-2.amazonaws.com/cloudformation/2020-10-29/amazon-eks-vpc-private-subnets.yaml
  3. Create EKS cluster from UI
  4. aws eks update-kubeconfig --name eks-cluster-test # --region option is default from "aws configure list"
В общем не фига в ручную не получилось создть нормально кластер, kubectl к не му не подключился, видимо не хватило какой-то роли

eksctl Steps:
eksctl create cluster \
 --name eks-cluster \
 --version 1.21 \
 --region eu-west-3 \
 --nodegroup-name eks-ng \
 --node-type t2.micro \
 --nodes 2 \
 --nodes-min 1 \
 --nodes-max 3
Так же можно использовать файл yaml в котором будут указаны параметры кластера

Jenkins pipeline:
  1. Install kubectl and aws-iam-authenticator on Jenkins server
  2. Create kubectl config file to use the AWS IAM authenticator for Kubernetes (https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html)
     change parametrs:
        <cluster-name> - from WEB UI
        <endpoint-url> - from WEB UI
        <base64-encoded-ca-cert> - from ~/.kube/config
