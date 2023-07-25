# AWS EKS Monitoring and Logging (Using Container Insights)

## Prerequisite:
We must grant IAM permissions to enable Amazon EKS worker nodes to send metrics and logs to CloudWatch:

### Manual Steps:
- Attach AWS managed `CloudWatchAgentServerPolicy` to the IAM roles of the EKS worker nodes. 
- Policy `ARN` : `arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy` 


### Using terraform:
This terraform module provides an option to attach IAM Policy to EKS nodegroup roles : 
```hcl
# Attach CloudWatchAgentServerPolicy to EKS nodegroup roles

  nodegroup_roles = [
      "kubecloud-eks-private-nodegroup",
      "kubecloud-eks-public-nodegroup",
  ]

```
#### [More about CloudWatch Container Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContainerInsights.html) 

## Usage:
### With IAM Policy attachment option:
```hcl
module "eks_monitoring_logging" {
    
    source = "shamimice03/eks-monitoring-logging/aws"
    
    cluster_name      = "kubecloud-eks"
    aws_region        = "ap-northeast-1"
    namespace         = "amazon-cloudwatch"

    enable_cwagent    = true
    enable_fluent_bit = true
    
    # Attach CloudWatchServerPolicy to EKS nodegroup roles
    nodegroup_roles = [
      "kubecloud-eks-private-nodegroup",
      "kubecloud-eks-public-nodegroup",
    ]
}
```

### Without IAM Policy attachment option:
```hcl
module "eks_monitoring_logging" {
    
    source = "shamimice03/eks-monitoring-logging/aws"
    
    cluster_name      = "kubecloud-eks"
    aws_region        = "ap-northeast-1"
    namespace         = "amazon-cloudwatch"
    
    enable_cwagent    = true
    enable_fluent_bit = true
}
```

## Variables:

### Common Variables:

| Variable              | Type      | Description                                     | Default           |
|-----------------------|-----------|-------------------------------------------------|-------------------|
| cluster_name          | string    | EKS Cluster Name                                | null              |
| aws_region            | string    | Provide Cluster Region                         | null              |
| namespace             | string    | Name of the namespace                           | amazon-cloudwatch |
| nodegroup_roles       | list(any) | List of EKS nodegroup roles                     | [ ]                |

### Fluent Bit Variables:

| Variable              | Type   | Description                                     | Default         |
|-----------------------|--------|-------------------------------------------------|-----------------|
| enable_fluent_bit     | bool   | Enable or Disable Fluent-bit Agent on EKS cluster | true            |
| fluent_bit_http_server| string | Enable or Disable fluent bit HTTP server       | On              |
| fluent_bit_http_port  | string | Define fluent-bit HTTP Port                     | 2020            |
| fluent_bit_read_head  | string | Enable or Disable fluent-bit Head read          | Off             |
| fluent_bit_read_tail  | string | Enable or Disable fluent-bit Tail read          | On              |
| fluentbit_configmap_name | string | Name of the ConfigMap for Fluent Bit             | fluent-bit-cluster-info |

### CloudWatch Agent (CW Agent) Variables:

| Variable              | Type   | Description                                     | Default         |
|-----------------------|--------|-------------------------------------------------|-----------------|
| enable_cwagent        | bool   | Enable or Disable CloudWatch Agent on EKS cluster | true            |
| cwagent_configmap_name| string | Name of the ConfigMap for CloudWatch Agent       | cwagentconfig   |

## Resources (kubernetes manifests): 
  - [cwagent](https://github.com/aws-samples/amazon-cloudwatch-container-insights/tree/main/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent)
  - [fluent-bit](https://github.com/aws-samples/amazon-cloudwatch-container-insights/tree/main/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/fluent-bit)

## Required providers and versions:
| Provider               | Version   |
|------------------------|-----------|
| [hashicorp/aws ](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) | >= 5.0    |
| [hashicorp/kubernetes](https://registry.terraform.io/providers/hashicorp/http/latest/docs) |  >= 2.21   |
| [hashicorp/http ](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs) | >= 3.4.0  |
| [gavinbunney/kubectl](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs) | >= 1.14.0 |

