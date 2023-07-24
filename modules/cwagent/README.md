#### Variables:

| Variable                         | Type   | Description                                      | Default                                                                                     |
|----------------------------------|--------|--------------------------------------------------|---------------------------------------------------------------------------------------------|
| enable_cwagent                   | bool   | Enable or disable Cloud Watch Agent on EKS cluster | true                                                                                        |
| cluster_name                     | string | EKS Cluster Name                                 | null                                                                                        |
| namespace                        | string | Name of namespace                               | null                                                                                        |
| cwagent_configmap_name           | string | Name of the ConfigMap for CloudWatch Agent       | cwagentconfig                                                                               |
| cwagent_serviceaccount_manifest_url | string | URL for the CloudWatch Agent ServiceAccount manifest. | https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-serviceaccount.yaml |
| cwagent_daemonset_manifest_url   | string | URL for the CloudWatch Agent DaemonSet manifest  | https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-daemonset.yaml |
