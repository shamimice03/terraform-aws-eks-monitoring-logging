### Resources (kubernetes manifests): 
  - [fluent-bit](https://github.com/aws-samples/amazon-cloudwatch-container-insights/tree/main/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/fluent-bit)

### Variables:

| Variable                          | Type   | Description                                       | Default                                                                                     |
|-----------------------------------|--------|---------------------------------------------------|---------------------------------------------------------------------------------------------|
| cluster_name                      | string | EKS Cluster Name. Provide the name of your EKS cluster. | null                                                                                        |
| aws_region                        | string | Provide Cluster Region. Specify the AWS region where the EKS cluster is located. | null                                                                                        |
| namespace                         | string | Name of namespace. Specify the Kubernetes namespace for the deployment. | null                                                                                        |
| fluent_bit_http_server            | string | Enable or Disable fluent bit HTTP server. Set to 'On' to enable and 'Off' to disable. | On                                                                                          |
| fluent_bit_http_port              | string | Define fluent-bit HTTP Port. Specify the port number for the fluent-bit HTTP server. | 2020                                                                                        |
| fluent_bit_read_head              | string | Enable or Disable fluent-bit Head read. Set to 'On' to enable and 'Off' to disable. | Off                                                                                         |
| fluent_bit_read_tail              | string | Enable or Disable fluent-bit Tail read. Set to 'On' to enable and 'Off' to disable. | On                                                                                          |
| fluentbit_configmap_name          | string | Name of the ConfigMap for fluent-bit. Specify the name of the ConfigMap to use. | fluent-bit-cluster-info                                                                     |
| fluentbit_daemonset_manifest_url  | string | URL for the fluent-bit DaemonSet manifest. Specify the URL for the deployment manifest. | https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/main/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/fluent-bit/fluent-bit.yaml |
