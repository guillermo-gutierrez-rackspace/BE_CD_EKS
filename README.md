# CI/CD Repositorio para el despliegue automático del backend de Paperless

Este repositorio almacena los templates de CodeBuild (spec files) para realizar el despliegue de la aplicaiones de Paperless usando la metodología BLUE - GREEN

- **/BuildGreen:** Aquí almacenamos los script en shell y templates de K8S para realizar el despliegue de la aplicacion en el cluster de EKS

- **/CloudFormation-Templates:** Aquí almacenamos templates de cloudformation para desplegar el CODEPIPELINE que se encarga de la automatización del despliegue

- **image-spec.yml:** Este archivo contiene las instrucciones para que el servicio de AWS CODEBUILD pueda crear la imagen del contenedor y almacenarla en AWS ECR

- **green-spec.yml:** Este archivo contiene las instruciones para realizar el despliegue en el ambiente denominado como GREEN

- **green-blue-spec.yml:** Este archivo contiene las instruciones para realizar el swap entre el ambiente BLUE y el GREEN dejando el ambiente GREEN como productivo

## Depliegue BLUE GREEN
A continuación se muestra el proceso a alto nivel de como se realiza el despluegue de la applicación

1. En esta ilustración se aprecia el proceso de creación de la imagen de docker y el almacenamiento en el repositorio de ECR

2. También podemos observar el despliegue del ambiente GREEN que tendrá la versión mas reciente del aplicativo.

![image1](images/eks-bg-1.png)

3. En la siguiente ilustración se aprecia el SWAP entre los ambientes BLUE y GREEN dejando el GREEN como productivo

![image2](images/eks-bg-2.png)
