#### Variables:

| Variable                          | Type    | Description                                      | Default                                                                                     |
|-----------------------------------|---------|--------------------------------------------------|---------------------------------------------------------------------------------------------|
| enable_fluent_bit                 | bool    | Enable or Disable Fluent-bit on EKS cluster      | true                                                                                        |
| cluster_name                      | string  | EKS Cluster Name                                 | null                                                                                        |
| aws_region                        | string  | Provide Cluster Region                          | null                                                                                        |
| namespace                         | string  | Name of namespace                                | null                                                                                        |
| fluent_bit_http_server            | string  | Enable or Disable fluent bit HTTP server        | On                                                                                          |
| fluent_bit_http_port              | string  | Define fluent-bit HTTP Port                      | 2020                                                                                        |
| fluent_bit_read_head              | string  | Enable or Disable fluent-bit Head read           | Off                                                                                         |
| fluent_bit_read_tail              | string  | Enable or Disable fluent-bit Tail read           | On                                                                                          |
| fluentbit_configmap_name          | string  | Name of the ConfigMap for Fluent Bit             | fluent-bit-cluster-info                                                                     |
| fluentbit_daemonset_manifest_url  | string  | URL for the CloudWatch Agent DaemonSet manifest  | https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-daemonset.yaml |


```
cluster_name      = "kubecloud-eks-2"
aws_region        = "ap-northeast-1"
namespace         = "amazon-cloudwatch"
enable_fluent_bit = true
```