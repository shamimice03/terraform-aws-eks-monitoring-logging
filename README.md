## AWS Cloud Watch Container Insights Monitoring for EKS

#### Usage:
```hcl
module "eks_monitoring_logging" {
    
    source = "github.com/shamimice03/terraform-aws-eks-monitoring-logging"
    
    cluster_name      = "kubecloud-eks-2"
    aws_region        = "ap-northeast-1"
    namespace         = "amazon-cloudwatch"
    enable_cwagent    = true
    enable_fluent_bit = true
}

```

#### Variables:

| Variable          | Type   | Description                                     | Default         |
|-------------------|--------|-------------------------------------------------|-----------------|
| cluster_name      | string | EKS Cluster Name                                | null            |
| aws_region        | string | Provide Cluster Region                         | null            |
| namespace         | string | Name of namespace                               | amazon-cloudwatch |
| enable_fluent_bit | bool   | Enable or Disable Fluent-bit Agent on EKS cluster | true            |
| enable_cwagent    | bool   | Enable or Disable Cloud Watch Agent on EKS cluster | true            |


#### Resources (kubernetes manifests): 
  - [cwagent](https://github.com/aws-samples/amazon-cloudwatch-container-insights/tree/main/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent)
  - [fluent-bit](https://github.com/aws-samples/amazon-cloudwatch-container-insights/tree/main/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/fluent-bit)

#### Required providers and versions:
| Provider               | Version   |
|------------------------|-----------|
| [hashicorp/aws ](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) | >= 5.0    |
| [hashicorp/kubernetes](https://registry.terraform.io/providers/hashicorp/http/latest/docs) |  >= 2.21   |
| [hashicorp/http ](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs) | >= 3.4.0  |
| [gavinbunney/kubectl](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs) | >= 1.14.0 |


