import boto3

client = boto3.client('eks', region_name='eu-west-3')
clusters = client.list_clusters()['clusters']

for cluster in clusters:
    response = client.describe_cluster(name=cluster)
    print(f"Cluster {cluster} is {response['cluster']['status']}")
    print(f"Cluster {cluster} endpoint is {response['cluster']['endpoint']}")
    print(f"Cluster {cluster} version is {response['cluster']['version']}")

