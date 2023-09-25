Changelog

1.6.0
* Integration with EKS IaC 

1.5.0 (2023-08-14)
* Productization adjustments

1.4.2 (2023-08-12)
* Enable service level configuration

1.4.1 (2023-08-09)
* AMX-RXS-CIC-BKN-EKS-CF.yaml: Add CMK to SNS Topic(s)
* AMX-RXS-CIC-BKN-EKS-IAM-CF.yaml: Add KMS Policies
* BuildGreen/k8s/paperless-deployment-blue.yml: Add SecurityContext
* BuildGreen/k8s/paperless-deployment-green.yml: Add SecurityContext
* policy/IamIdentityMapping.sh: Iam Identity Mapping
* policy/CloudWatchlogs.json: CloudWatch logs KMS policy

1.4.0 (2023-07-08)
* AMX-RXS-CIC-BKN-EKS-CF.yaml: De-embed buildspecs
* buildspecs/green-blue-spec.yml: De-embed buildspecs
* buildspecs/green-spec.yml: De-embed buildspecs
* buildspecs/image-spec.yml: De-embed buildspecs
* buildspecs/vscan-spec.yml: De-embed buildspecs
* replace.sh: Adjust to new main file

1.3.0 (2023-06-25)
* CloudFormation-Templates/AMX-APP-PPL-CNLS.yml: Add branchRepoName to CICD BranchName source stage
* CloudFormation-Templates/AMX-APP-PPL-CNLS.yml: Add cicdRepoBranchName parameter for CICD repo
* CloudFormation-Templates/AMX-APP-PPL-MAI.yml: Remove AmazonVPCFullAccess and specific ec2 actions.
* CloudFormation-Templates/AMX-APP-PPL-CNLS-SWAP.yml: Swap Blue/Green environments.

1.2.1 (2023-06-05)
* bin/install_adot.sh: Instalador ADOT (métricas)
* bin/install_eks_cluster.sh: Instalador Cluster EKS
* bin/install_elb_controller.sh: Instalador ELB Controller
* bin/install_hpa.sh: Instalador Horizontal Pod Autoscaler
* bin/install_observability.sh: Instalador AWS Observability

1.2.0 (2023-05-31)
* CloudFormation-Templates/AMX-APP-PPL-CNLS.yml: Add vulnerability scan + approval stages
* CloudFormation-Templates/AMX-APP-PPL-CNLS.yml: Add conditional approval for DES and QA
* vscan-spec.yml: Vulnerability scan buildspec

1.0.4 (2023-04-17)
* bin/switch-green-blue.sh: Add Swap Green/Blue maintenance script

1.0.3 (2023-03-30)
* CloudFormation-Templates/AMX-APP-PPL-CNLS.yml: Add cidrPortalInterno parameter
* CloudFormation-Templates/AMX-APP-PPL-CNLS.yml: Pass CIDR_PORTAL_INTERNO as parameter to buildGreen stage
* green-spec.yml: Add CIDR_PORTAL_INTERNO value to cidrs

1.0.2 (2023-02-27)
BuildGreen/k8s/paperless-ingress-blue.yml: Remove 80 from ingress
BuildGreen/k8s/paperless-ingress-green.yml: Remove 80 from ingress

1.0.1 (2023-02-17)
* BuildGreen/k8s/paperless-deployment-blue.yml: Add resource limits to blue deployment
* BuildGreen/k8s/paperless-deployment-green.yml: Add resource limits to green deployment
* CloudFormation-Templates/AMX-APP-PPL-CNLS.yml:
  - Add controlPlanSecurityGroup parameter
  - Add arnCodeBuildCMK parameter
  - Attach Security Groups for Build Green and Swap Blue Green CodeBuild stages to private VPC.
  - Associate CMK to Codepipeline stages.
  - Comment vulnerability scan as it is still pending definition.
* CloudFormation-Templates/AMX-APP-PPL-MAI.yml
  - Add Encrypt/Decrypt capabilities to existing roles

1.0.0 (2023-02-03)
* Initial release
