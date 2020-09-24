# Service Helm Chart
Deploys a generic service  

## Installing
First add KvalitetsIT Helm repo to Helm
```console
$ helm repo add KvalitetsIT https://raw.githubusercontent.com/KvalitetsIT/helm-repo/master/
$ helm repo update
```

Create values.yaml file with the parameters specified  
See Configuration
  
Run Helm command:  
```console
$ helm install web-service KvalitetsIT/service -f myValues.yaml --version 1.0.3
```

## Configuration
The following table lists the configurable parameters of the KitCaddy and the web-service.

Parameter | Description | Example
--- | --- | ---
`fullnameOverride` | Name of the service
`namespace` | Namespace to deploy into
`image.repository` | Name of the web-service image 
`imgae.tag` | Web-service image tag 
`podAnnotations` | Annotations for the pod fx prometheus | `prometheus.io/path: actuator/prometheus` <br> `prometheus.io/scrape: "true"` <br> 
`deploymentStrategy` | Enables to set deployment strategy | `Recreate`
**Deployment** | 
`deployment.containerPort` | Port on web-service | `8080` 
`deployment.configMapMountPath` | Set value if config map needs to mount on deployment | `/config`
`deplyment.extraVolumeMounts` | Extra volume mounts 
`deplyment.readinessProbe` | Set values under this to config readiness probe
`deplyment.livenessProbe` | Set values under this to config liveness probe
**Deployment - Environment variables** |
`deployment.env` | Map of environment variables
`deployment.env.{name}` | Name of the environment variables
`deployment.env.{name}.value` | Value of the environment variable
`deployment.env.{name}.type` | Type of the environment variables. 'fieldPath' or 'secretKeyRef'. If not set classic environment variable. | `secretKeyRef`
SecretKeyRef |  
`deployment.env.{name}.name` | Name of the SecretKeyRef
`deployment.env.{name}.key` | Key for the SecretKeyRef
**Ingress** |
`ingress.enabled` | Set to false to disable ingress | `false`
`ingress.annotations` | Annotations for ingress | `kubernetes.io/ingress.class: nginx`
`ingress.hosts` | Hosts served by the ingress | `- host: domain.dk`
`ingress.tls` | TLS config 
`extraIngress` | Map of extra ingress 
`extraIngress.{name}` | Place ingress values under the name value
**Service** |
`service.enabled` | Set to false to disable service | `false`
`service.port` | Port on the service | `8080`
`service.targetPort` | Target port | `proxy-port`
`service.annotations` | Annotations for service | `prometheus.io/path: /manage/actuator/appmetrics`
**Documentation** | Default documentation image is `image.repository`-documentation
**Documentation Deployment** |
`docDeployment.enabled` | Enables the deployment for the documentation | `true`
`docDeployment.containerPort` | Port on documentation web-service | `8080` 
`docDeployment.readinessProbe` | Set values under this to config readiness probe
`docDeployment.livenessProbe` | Set values under this to config liveness probe
**Documentation Ingress** |
`docIngress.enabled` | Enables the ingress for the documentation | `true`
`docIngress.annotations` | Annotations for documentation ingress | `kubernetes.io/ingress.class: nginx`
`docIngress.hosts` | Hosts served by the documentation ingress | `- host: domain.dk`
`docIngress.tls` | TLS config 
**Documentation Service** |
`docService.enabled` | Enables the service for the documentation | `true`
`docService.port` | Port on the service | `8080`
`docService.targetPort` | Target port | `proxy-port`
`docService.annotations` | Annotations for service | `prometheus.io/path: /manage/actuator/appmetrics`
