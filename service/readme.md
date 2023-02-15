# Service Helm Chart
Deploys a generic service

## Automatic generated readme.md
The readme.md file is automatic generated from the documentation-folder using github actions.

## Installing
First add KvalitetsIT Helm repo to Helm
```console
$ helm repo add KvalitetsIT https://raw.githubusercontent.com/KvalitetsIT/helm-repo/master/
$ helm repo update
```

Create values.yaml file with the parameters specified  

Run Helm command:  
```console
$ helm install web-service KvalitetsIT/service -f myValues.yaml --version 1.0.3
```
## Configuration
The following table, lists the configurable parameters.

Parameter | Description                                                                                                                                                                                                                                                                                    | Example
--- |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| ---
**[Basics](#adding-basics)** |
`fullnameOverride` | Name of the service                                                                                                                                                                                                                                                                            
`namespace` | Namespace to deploy into                                                                                                                                                                                                                                                                       
`podSecurityContext` | podSecurityContext                                                                                                                                                                                                                                                                             
`podAnnotations` | Annotations for the pod fx prometheus                                                                                                                                                                                                                                                          | `prometheus.io/path: actuator prometheus` <br> `prometheus.io/scrape: "true"` <br>
`serviceAccountName` | serviceAccountName                                                                                                                                                                                                                                                                             
`imagePullSecrets` | imagePullSecrets                                                                                                                                                                                                                                                                               
`image.repository` | Name of the web-service image                                                                                                                                                                                                                                                                  
`image.tag` | Web-service image tag                                                                                                                                                                                                                                                                          
`autoscaling.enabled` | Enable autoscaling                                                                                                                                                                                                                                                                             | `true` or `false`
`replicaCount` | Number of replicas - Not used if autoscaling is enabled                                                                                                                                                                                                                                        | `1`, `2`, `3` ..
`deploymentStrategy` | Enables to set deployment strategy                                                                                                                                                                                                                                                             | `Recreate`
`affinity`                          | Affinity for pod assignment.                                                                                                                                                                                                                                                                   |
`podAffinityPreset`                  | Pod affinity preset. Ignored if `affinity` is set. Allowed values: ``, `soft` or `hard`                                                                                                                                                                                                        | `""`                         |
`podAntiAffinityPreset`              | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: ``,`soft` or `hard`                                                                                                                                                                                                    | `soft`                       |
`nodeAffinityPreset.type`            | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                                                                                                                                                      | `""`                         |
`nodeAffinityPreset.key`             | Node label key to match Ignored if `affinity` is set.                                                                                                                                                                                                                                          | `""`                         |
`nodeAffinityPreset.values`          | Node label values to match. Ignored if `affinity` is set.                                                                                                                                                                                                                                      | `[]`
&nbsp; |
**[Deployment](#adding-deployment)** |
`deployment.enabled` | Enables the deployment                                                                                                                                                                                                                                                                         | `true` or `false`
`deployment.hostAliases` | hostAliases                                                                                                                                                                                                                                                                                    |
`deployment.containerPort` | Port on web-service                                                                                                                                                                                                                                                                            | `8080`
`deployment.extraContainerPort` | Extra port on deployment                                                                                                                                                                                                                                                                       | `Port1: 8051`
`deployment.configMapMountPaths` | Set value if config map needs to mount on deployment                                                                                                                                                                                                                                           | `/config`
`deplyment.extraVolumeMounts` | Extra volume mounts                                                                                                                                                                                                                                                                            
`deplyment.readinessProbe` | Set values under this to config readiness probe                                                                                                                                                                                                                                                
`deplyment.livenessProbe` | Set values under this to config liveness probe                                                                                                                                                                                                                                                 
`deplyment.commands` | List of cronjob commands                                                                                                                                                                                                                                                                       | `- /bin/bash`
`deplyment.args` | List of arguments to the commands                                                                                                                                                                                                                                                              |
**Deployment - Environment variables** |
`deployment.env` | Map of environment variables                                                                                                                                                                                                                                                                   
`deployment.env.{name}` | Name of the environment variables                                                                                                                                                                                                                                                              
`deployment.env.{name}.value` | Value of the environment variable                                                                                                                                                                                                                                                              
`deployment.env.{name}.type` | Optional: specify type of the environment variables if it should be read from a secret or configmap.<br> One of fieldPath, secretKeyRef, configMapKeyRef                                                                                                                                       | `type: secretKeyRef`
`deployment.env.{name}.fieldPath` | Optional: Value of fieldPath                                                                                                                                                                                                                                                                   
`deployment.env.{name}.name` | Optional: Name of the SecretKeyRef or ConfigMapKeyRef                                                                                                                                                                                                                                          
`deployment.env.{name}.key` | Optional: Key for the SecretKeyRef or ConfigMapKeyRef                                                                                                                                                                                                                                          
`deployment.envFrom` | Map of environment variables                                                                                                                                                                                                                                                                   
`deployment.envFrom.configMapRef` | List of ConfigMaps to read environment variables -from                                                                                                                                                                                                                                         | <code>configMapRef:<br>&nbsp;&nbsp;- my-configmap</code>
**Deployment - Volume mounts** |
`deployment.extraVolumeMounts` | Extra volume mounts                                                                                                                                                                                                                                                                            
`deployment.extraVolumeMounts.{name}` | Name of the extra volume mount. This must match the name of 'deployment.extraVolumes.{name}'                                                                                                                                                                                                   
`deployment.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume                                                                                                                                                                                                                                                                 
`deployment.extraVolumes` | Extra volumes for the mounts                                                                                                                                                                                                                                                                   
`deployment.extraVolumes.{name}` | Extra volumes for the mounts.<br>This must match the name of 'deployment.extraVolumeMounts.{name}'<br>The value can be one of persistentVolumeClaim or configMap and the value for claimname _must_ match 'pvc.{name}' or a configmap respectively                                             | <code>my-storage: &#124;-<br>&nbsp;&nbsp;persistentVolumeClaim:<br>&nbsp;&nbsp;&nbsp;&nbsp;claimName: my-application-storage</code>
&nbsp; |
**[initContainers](#adding-initcontainer)** |
`initContainers.<name>.image.repository` | image repo                                                                                                                                                                                                                                                                                     
`initContainers.<name>.image.tag` | image tag                                                                                                                                                                                                                                                                                      
`initContainers.<name>.env` | See: Deployment - Environment variables                                                                                                                                                                                                                                                        
`initContainers.<name>.configMapMountPaths` | Set value if config map needs to mount on init container                                                                                                                                                                                                                                       
`initContainers.<name>.extraVolumeMounts` | Extra volume mounts                                                                                                                                                                                                                                                                            
&nbsp; |
**[Ingress](#adding-ingress)** |
`ingress.enabled` | Set to false to disable ingress                                                                                                                                                                                                                                                                | `false`
`ingress.annotations` | Annotations for ingress                                                                                                                                                                                                                                                                        | `kubernetes.io/ingress.class: nginx`
`ingress.hosts` | Hosts served by the ingress                                                                                                                                                                                                                                                                    | `- host: domain.dk`
`ingress.tls` | TLS config                                                                                                                                                                                                                                                                                     
`extraIngress` | Map of extra ingress                                                                                                                                                                                                                                                                           
`extraIngress.{name}` | Place ingress values under the name value                                                                                                                                                                                                                                                      
&nbsp; |
**[Service](#adding-service)** |
`service.enabled` | Set to false to disable service                                                                                                                                                                                                                                                                | `false`
`service.port` | Port on the service                                                                                                                                                                                                                                                                            | `8080`
`service.targetPort` | Target port                                                                                                                                                                                                                                                                                    | `proxy-port`
`service.annotations` | Annotations for service                                                                                                                                                                                                                                                                        | `prometheus.io/path: /manage/actuator/appmetrics`
&nbsp; |
**[PVC](#adding-persistentvolume)** |
`pvc.{name}` | Name of the pvc - persistent volume claim                                                                                                                                                                                                                                                      |
`pvc.{name}.accessMode` | Accessmode of pvc. One of ReadWriteOnce, ReadOnlyMany or ReadWriteMany. Defaults to ReadWriteMany                                                                                                                                                                                              |
`pvc.{name}.request` | Storage request for pvc. Defaults to 2Gi                                                                                                                                                                                                                                                       |
`pvc.{name}.storageclass` | Storageclass for pvc                                                                                                                                                                                                                                                                           |
&nbsp; |
**[Documentation](#adding-documentation)** | Default documentation image is `image.repository`-documentation                                                                                                                                                                                                                                
**Documentation Deployment** |
`docDeployment.enabled` | Enables the deployment for the documentation                                                                                                                                                                                                                                                   | `true`
`docDeployment.containerPort` | Port on documentation web-service                                                                                                                                                                                                                                                              | `8080`
`docDeployment.autoscaling.enabled` | Set to `false` if docReplicaCount should be used, if not set to `true`                                                                                                                                                                                                                         | `8080`
`docDeployment.docReplicaCount` | Number of replicas                                                                                                                                                                                                                                                                             | `2`
`docDeployment.docPodAnnotations` | annotations for pods in deployment                                                                                                                                                                                                                                                             
`docDeployment.imagePullSecrets` | ?                                                                                                                                                                                                                                                                                              
`docDeployment.podSecurityContext` | securityContext for pods                                                                                                                                                                                                                                                                       
`docDeployment.securityContext` | securityContext for containers                                                                                                                                                                                                                                                                 
`docDeployment.readinessProbe` | Set values under this to config readiness probe                                                                                                                                                                                                                                                
`docDeployment.livenessProbe` | Set values under this to config liveness probe                                                                                                                                                                                                                                                 
**Documentation Ingress** |
`docIngress.enabled` | Enables the ingress for the documentation                                                                                                                                                                                                                                                      | `true`
`docIngress.annotations` | Annotations for documentation ingress                                                                                                                                                                                                                                                          | `kubernetes.io/ingress.class: nginx`
`docIngress.hosts` | Hosts served by the documentation ingress                                                                                                                                                                                                                                                      | `- host: domain.dk`
`docIngress.tls` | TLS config                                                                                                                                                                                                                                                                                     
**Documentation Service** |
`docService.enabled` | Enables the service for the documentation                                                                                                                                                                                                                                                      | `true`
`docService.port` | Port on the service                                                                                                                                                                                                                                                                            | `8080`
`docService.type` | Type of service. Either `ClusterIP` (default), `NodePort`, `LoadBalancer` or `ExternalName`                                                                                                                                                                                                    |
`docService.targetPort` | Target port                                                                                                                                                                                                                                                                                    | `proxy-port`
`docService.annotations` | Annotations for service                                                                                                                                                                                                                                                                        | `prometheus.io/path: /manage/actuator/appmetrics`
&nbsp; |
**[Cronjob](#adding-cronjob)** |
`cronjob.{name}` | Name of the cronjob                                                                                                                                                                                                                                                                            |
`cronjob.{name}.image.repository` | Cronjob image repository                                                                                                                                                                                                                                                                       |
`cronjob.{name}.image.tag` | Cronjob image tag                                                                                                                                                                                                                                                                              |
`cronjob.{name}.image.pullPolicy` | pullPolicy. Either `Always`, `IfNotPresent` or `Never`                                                                                                                                                                                                                                         |
`cronjob.{name}.schedule` | Schedule for cronjob                                                                                                                                                                                                                                                                           | `"*/15 * * * *"`
`cronjob.{name}.concurrencyPolicy` | ConcurrencyPolicy for cronjob. Either `Allow`, `Forbid` or `Replace`. Defaults to `Forbid`                                                                                                                                                                                                     
`cronjob.{name}.commands` | List of cronjob commands                                                                                                                                                                                                                                                                       | `- /bin/bash`
`cronjob.{name}.args` | List of arguments to the commands                                                                                                                                                                                                                                                              |
`cronjob.{name}.restartPolicy` | Restartpolicy. Either `Always`, `OnFailure` or `Never`. Defaults to `OnFailure`                                                                                                                                                                                                                
**Cronjob - Environment variables** |
`cronjob.{name}.env` | Map of environment variables                                                                                                                                                                                                                                                                   
`cronjob.{name}.env.{name}` | Name of the environment variables                                                                                                                                                                                                                                                              
`cronjob.{name}.env.{name}.value` | Value of the environment variable                                                                                                                                                                                                                                                              
`cronjob.{name}.env.{name}.type` | Optional: specify type of the environment variables if it should be read from a secret or configmap.<br> One of `fieldPath`, `secretKeyRef` or `configMapKeyRef`                                                                                                                               | `type: secretKeyRef`
`cronjob.{name}.env.{name}.fieldPath` | Optional: Value of fieldPath                                                                                                                                                                                                                                                                   
`cronjob.{name}.env.{name}.name` | Optional: Name of the SecretKeyRef or ConfigMapKeyRef                                                                                                                                                                                                                                          
`cronjob.{name}.env.{name}.key` | Optional: Key for the SecretKeyRef or ConfigMapKeyRef                                                                                                                                                                                                                                          
`cronjob.{name}.envFrom` | Map of environment variables                                                                                                                                                                                                                                                                   
`cronjob.{name}.envFrom.configMapRef` | List of ConfigMaps to read environment variables from                                                                                                                                                                                                                                          | <code>configMapRef:<br>&nbsp;&nbsp;- my-configmap</code>
**Cronjob - Volume mounts** |
`cronjob.{name}.extraVolumeMounts` | Extra volume mounts                                                                                                                                                                                                                                                                            
`cronjob.{name}.extraVolumeMounts.{name}` | Name of the extra volume mount. This must match the name of 'cronjob.{name}.extraVolumes.{name}'                                                                                                                                                                                               
`cronjob.{name}.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume                                                                                                                                                                                                                                                                 
`cronjob.{name}.extraVolumes` | Extra volumes for the mounts                                                                                                                                                                                                                                                                   
`cronjob.{name}.extraVolumes.{name}` | Extra volumes for the mounts.<br>This must match the name of 'cronjob.{name}.extraVolumeMounts.{name}'<br>The value can be one of `persistentVolumeClaim` or `configMap` and the value for claimname _must_ match 'pvc.{name}' or a configmap respectively                                     | <code>my-storage: &#124;-<br>&nbsp;&nbsp;persistentVolumeClaim:<br>&nbsp;&nbsp;&nbsp;&nbsp;claimName: my-application-storage</code>
&nbsp; |
**[Job](#adding-job)** |
`job.{name}` | Name of the job                                                                                                                                                                                                                                                                                |
`job.{name}.image.repository` | Name of the job image                                                                                                                                                                                                                                                                          |
`job.{name}.image.tag` | Job image tag                                                                                                                                                                                                                                                                                  |
`job.{name}.image.pullPolicy` | pullPolicy. Either `Always`, `IfNotPresent` or `Never`                                                                                                                                                                                                                                         |
`job.{name}.backoffLimit` | Number of retries before considering a job as failed                                                                                                                                                                                                                                           | `3` |
`job.{name}.commands` | List of job commands                                                                                                                                                                                                                                                                           | <code>commands:<br>&nbsp;&nbsp;- /bin/bash</code>
`job.{name}.args` | List of arguments to the commands                                                                                                                                                                                                                                                              |
`job.{name}.restartPolicy` | Restartpolicy. One of `Always`, `OnFailure`, `Never`. Defaults to `OnFailure`                                                                                                                                                                                                                  
**Job - Environment variables** |
`job.{name}.env` | Map of environment variables                                                                                                                                                                                                                                                                   
`job.{name}.env.{name}` | Name of the environment variables                                                                                                                                                                                                                                                              
`job.{name}.env.{name}.value` | Value of the environment variable                                                                                                                                                                                                                                                              
`job.{name}.env.{name}.type` | Optional: specify type of the environment variables if it should be read from a secret or configmap.<br> One of `fieldPath`, `secretKeyRef`, `configMapKeyRef`                                                                                                                                 | `type: secretKeyRef`
`job.{name}.env.{name}.fieldPath` | Optional: Value of fieldPath                                                                                                                                                                                                                                                                   
`job.{name}.env.{name}.name` | Optional: Name of the `SecretKeyRef` or `ConfigMapKeyRef`                                                                                                                                                                                                                                      
`job.{name}.env.{name}.key` | Optional: Key for the `SecretKeyRef` or `ConfigMapKeyRef`                                                                                                                                                                                                                                      
`job.{name}.envFrom` | Map of environment variables                                                                                                                                                                                                                                                                   
`job.{name}.envFrom.configMapRef` | List of ConfigMaps to read environment variables from                                                                                                                                                                                                                                          | <code>configMapRef:<br>&nbsp;&nbsp;- my-configmap</code>
**Job - Volume mounts** |
`job.{name}.extraVolumeMounts` | Extra volume mounts                                                                                                                                                                                                                                                                            
`job.{name}.extraVolumeMounts.{name}` | Name of the extra volume mount. This must match the name of 'job.{name}.extraVolumes.{name}'                                                                                                                                                                                                   
`job.{name}.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume                                                                                                                                                                                                                                                                 
`job.{name}.extraVolumes` | Extra volumes for the mounts                                                                                                                                                                                                                                                                   
`job.{name}.extraVolumes.{name}` | Extra volumes for the mounts.<br>This must match the name of `job.{name}.extraVolumeMounts.{name}`<br>The value can be one of persistentVolumeClaim or configMap and the value for claimname _must_ match 'pvc.{name}' or a configmap respectively                                             | <code>my-storage: &#124;-<br>&nbsp;&nbsp;persistentVolumeClaim:<br>&nbsp;&nbsp;&nbsp;&nbsp;claimName: my-application-storage</code>
&nbsp; |
**[Sidecar](#adding-sidecar)** |
`sidecar.{name}` | Name of sidecar                                                                                                                                                                                                                                                                                |
`sidecar.image.repository` | Repository of image                                                                                                                                                                                                                                                                            |
`sidecar.image.tag` | Image tag                                                                                                                                                                                                                                                                                      |
`sidecar.env` | Env variables                                                                                                                                                                                                                                                                                  |
`sidecar.commands` | Commands for sidecar                                                                                                                                                                                                                                                                           |
`sidecar.args` | Arguments for container                                                                                                                                                                                                                                                                        |
`sidecar.containerPort` | Port of container                                                                                                                                                                                                                                                                              |
`sidecar.extraVolumeMounts` | Extra volumes mount. Due to limitations of Helm, two mounts cannot refer to the same volume. This chart allows to ovecome this by adding `_<number>` to the end of the name. Thus, `myEmptyDir_1` and `myEmptyDir_2` (and `myEmptyDir`) will refer to the same volume, with name `myEmptyDir`. |
&nbsp; |
**[Sealed Secret](#adding-sealed-secret)** |
`sealedSecret.{name}` | Name of secret                                                                                                                                                                                                                                                                                 |
`sealedSecret.{name}.type` | Type of the secret - Default Opaque                                                                                                                                                                                                                                                            | `kubernetes.io/tls`
`sealedSecret.{name}.encryptedData` | List of 'Key: Value' pair of the encrypted data                                                                                                                                                                                                                                                | `password: AgBOQOoh7RGqTBPPSG0Ctbf...`


# Mini guides
There are a few guides, but if it is still not what you're looking for, please direct your attention to the [configuration](#Configuration). Here you will find all the configuration values that can be set.
## Adding Basics
Parameter | Description | Example
--- | --- | ---
**Basics** |
`fullnameOverride` | Name of the service
`namespace` | Namespace to deploy into
`podSecurityContext` | podSecurityContext
`podAnnotations` | Annotations for the pod fx prometheus | `prometheus.io/path: actuator prometheus` <br> `prometheus.io/scrape: "true"` <br>
`serviceAccountName` | serviceAccountName
`imagePullSecrets` | imagePullSecrets
`image.repository` | Name of the web-service image
`image.tag` | Web-service image tag
`autoscaling.enabled` | Enable autoscaling | `true` or `false`
`replicaCount` | Number of replicas - Not used if autoscaling is enabled | `1`, `2`, `3` ..
`revisionHistoryLimit` | Maximum replicasets that are saved for rollback. | `1`, `2`, `3` ..
`deploymentStrategy` | Enables to set deployment strategy | `Recreate`

> The `autoscaling.enabled` does not create autoscaling, but just makes sure that `replicaCount` is not used.

> see full configuration [here]( #Configuration)

First of all we need to specify the basics. We need to provide information about the image we wish to deploy.

For `deploymentStrategy`, Kubernetes offers two strategies; `Recreate` or `RollingUpdate` (default).
- `Recreate` : All existing Pods are killed before new ones are created
- `RollingUpdate` : The Deployment updates Pods in a rolling update fashion
> This chart does not support paramaters; `maxUnavailable` and `maxSurge` to control the rolling update process.

> Kubernetes Doc: [Deploymentstrategies](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy) \
> You can also achieve other kinds of deploymentstrategies like; canary, blue/green etc [read here](https://blog.container-solutions.com/kubernetes-deployment-strategies)

```yaml
fullnameOverride: mywebapp
namespace: my-tenant-namespace
podSecurityContext:
  runAsUser: 1000
  runAsGroup: 3000
  fsGroup: 2000
imagePullSecrets:
  - name: someSecret
replicaCount: 4
autoscaling: false
deploymentStrategy: Recreate
image:
  repository: kvalitetsit/greatestImageOfAllTime
  tag: 1.1.0
podAnnotations:
   prometheus.io/path: /metrics
   prometheus.io/port: "9113"
   prometheus.io/scrape: "true"
```
## Adding Deployment

 Parameter                                       | Description                                                                                                                                                                                                                                                                                                                                                             | Example                                                                                                                             
-------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------
 `deployment.enabled`                            | Enables the deployment                                                                                                                                                                                                                                                                                                                                                  | `true` or `false`                                                                                                                   
 `deplyment.kind`                                | Set kind - default Deploymeny | `DaemonSet` |                                                                                                                         | 
 `deployment.hostAliases`                        | hostAliases                                                                                                                                                                                                                                                                                                                                                             |
 `deployment.containerPort`                      | Port on web-service                                                                                                                                                                                                                                                                                                                                                     | `8080`                                                                                                                              
 `deployment.extraContainerPort`                 | Extra port on deployment                                                                                                                                                                                                                                                                                                                                                | `Port1: 8051`                                                                                                                       
 `deployment.configMapMountPaths`                | Set value if config map needs to mount on deployment                                                                                                                                                                                                                                                                                                                    | `/config`                                                                                                                           
 `deplyment.extraVolumeMounts`                   | Extra volume mounts                                                                                                                                                                                                                                                                                                                                                     
 `deplyment.readinessProbe`                      | Set values under this to config readiness probe                                                                                                                                                                                                                                                                                                                         
 `deplyment.livenessProbe`                       | Set values under this to config liveness probe                                                                                                                                                                                                                                                                                                                          
 `deplyment.commands`                            | List of cronjob commands                                                                                                                                                                                                                                                                                                                                                | `- /bin/bash`                                                                                                                       
 `deplyment.args`                                | List of arguments to the commands                                                                                                                                                                                                                                                                                                                                       |
 **Deployment - Environment variables**          |
 `deployment.env`                                | Map of environment variables                                                                                                                                                                                                                                                                                                                                            
 `deployment.env.{name}`                         | Name of the environment variables                                                                                                                                                                                                                                                                                                                                       
 `deployment.env.{name}.value`                   | Value of the environment variable                                                                                                                                                                                                                                                                                                                                       
 `deployment.env.{name}.type`                    | Optional: specify type of the environment variables if it should be read from a secret or configmap.<br> One of fieldPath, secretKeyRef, configMapKeyRef                                                                                                                                                                                                                | `type: secretKeyRef`                                                                                                                
 `deployment.env.{name}.fieldPath`               | Optional: Value of fieldPath                                                                                                                                                                                                                                                                                                                                            
 `deployment.env.{name}.name`                    | Optional: Name of the SecretKeyRef or ConfigMapKeyRef                                                                                                                                                                                                                                                                                                                   
 `deployment.env.{name}.key`                     | Optional: Key for the SecretKeyRef or ConfigMapKeyRef                                                                                                                                                                                                                                                                                                                   
 `deployment.envFrom`                            | Map of environment variables                                                                                                                                                                                                                                                                                                                                            
 `deployment.envFrom.configMapRef`               | List of ConfigMaps to read environment variables -from                                                                                                                                                                                                                                                                                                                  | <code>configMapRef:<br>&nbsp;&nbsp;- my-configmap</code>                                                                            
 **Deployment - Volume mounts**                  |
 `deployment.extraVolumeMounts`                  | Extra volume mounts                                                                                                                                                                                                                                                                                                                                                     
 `deployment.extraVolumeMounts.{name}`           | Name of the extra volume mount. This must match the name of 'deployment.extraVolumes.{name}'. Due to limitations of Helm, two mounts cannot refer to the same volume. This chart allows to ovecome this by adding `_<number>` to the end of the name. Thus, `myEmptyDir_1` and `myEmptyDir_2` (and `myEmptyDir`) will refer to the same volume, with name `myEmptyDir`. 
 `deployment.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume                                                                                                                                                                                                                                                                                                                                          
 `deployment.extraVolumeMounts.{name}.subPath`   | Subpath for the extra volume                                                                                                                                                                                                                                                                                                                                            
 `deployment.extraVolumes`                       | Extra volumes for the mounts                                                                                                                                                                                                                                                                                                                                            
 `deployment.extraVolumes.{name}`                | Extra volumes for the mounts.<br>This must match the name of 'deployment.extraVolumeMounts.{name}'<br>The value can be one of persistentVolumeClaim or configMap and the value for claimname _must_ match 'pvc.{name}' or a configmap respectively                                                                                                                      | <code>my-storage: &#124;-<br>&nbsp;&nbsp;persistentVolumeClaim:<br>&nbsp;&nbsp;&nbsp;&nbsp;claimName: my-application-storage</code> 

> see full configuration [here]( #Configuration)

First of all we need to specify the basics. We need to provide env-variables, arguments for our container, and also containerports. The image we need to deploy, has already been specified in chapter before [the basics](#adding-basics).
```yaml
deployment:
...
  enabled: true
  containerPort: 1313
  exstraContainerPort: 1314
  args: []
  env:
    someEnvVar1:
      value: goodValue1
    someEnvVar2:
      value: valueForSecrets
```
When that is done, we need to setup our probes. Kubernetes describes the probes as follows;
- *ReadinessProbe* The kubelet uses readiness probes to know **when a container is ready to start accepting traffic**. A Pod is considered ready when all of its containers are ready. One use of this signal is to control which Pods are used as backends for Services. When a Pod is not ready, it is removed from Service load balancers.
- *LivenessProbe* The kubelet uses liveness probes to know **when to restart a container**. For example, liveness probes could catch a deadlock, where an application is running, but unable to make progress. Restarting a container in such a state can help to make the application more available despite bugs.
- *StartupProbe* The kubelet uses startup probes to know **when a container application has started**. If such a probe is configured, it disables liveness and readiness checks until it succeeds, making sure those probes don't interfere with the application startup. This can be used to adopt liveness checks on slow starting containers, avoiding them getting killed by the kubelet before they are up and running.

> Read more [here](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/).

Now that we know what probes are, lets configure them!

> (Written 25 aug 2021) This servicechart does currently not support startupProbes

```yaml
deployment:
...
  readinessProbe:
    httpGet:
      path: /
      port: 1313
    initialDelaySeconds: 5
    periodSeconds: 5
    successThreshold: 1
    timeoutSeconds: 1

  livenessProbe:
    httpGet:
      path: /
      port: 1313
```
The service-chart supports all the paramaters that the regular liveness -and readinessprobes supports.

### Volumes
Now lets mount some volumes to the container. configMapMountPath shows where the referenced volume should be mounted in the container. For instance, if you mount a volume to configMapMountPath: `/a/b/c`, the volume will be available to the container under the directory `/a/b/c`.

Mounting a volume will make all of the volume available under configMapMountPath. If you need to mount only part of the volume, such as a single file in a volume, you use configMapMountSubPath to specify the part that must be mounted. For instance, configMapMountPath: `/a/b/c`, configMapMountSubPath: `d` will make whatever `d` is in the mounted volume under directory `/a/b/c`

```yaml
deployment:
...
  configMapMountPaths:
    nginx-conf:
      configMapMountPath: /config/
      configMapMountSubPath: nginx.conf

  # Extra
  extraVolumes:
    firstVolume: |
      persistentVolumeClaim:
        claimName: my-persistent-volume-claim
  extraVolumeMounts:
    firstVolume:
      mountPath: /path/in/container

```
## Set Pod affinity
This chart allows you to set custom Pod affinity using the affinity parameter. Find more information about Pod's affinity in the Kubernetes documentation.

As an alternative, you can use any of the preset configurations for pod affinity, pod anti-affinity, and node affinity. To do so, set the podAffinityPreset, podAntiAffinityPreset, or nodeAffinityPreset parameters.## Adding initcontainer
Parameter | Description | Example
--- | --- | ---
**initContainers** |
`initContainers.<name>.image.repository` | image repo
`initContainers.<name>.image.tag` | image tag
`initContainers.<name>.env` | See: Deployment - Environment variables
`initContainers.<name>.configMapMountPaths` | Set value if config map needs to mount on init container
`initContainers.<name>.extraVolumeMounts` | Extra volume mounts. Due to limitations of Helm, two mounts cannot refer to the same volume. This chart allows to ovecome this by adding `_<number>` to the end of the name. Thus, `myEmptyDir_1` and `myEmptyDir_2` (and `myEmptyDir`) will refer to the same volume, with name `myEmptyDir`.
`initContainers.<name>.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume
`initContainers.<name>.extraVolumeMounts.{name}.subPath` | Subpath for the extra volume

> see full configuration [here]( #Configuration)

### Why do we need initcontainers?
Lets say that we wish to add a custom theme to keycloak. The keycloak-app looks at the `/themes` folder to find the available themes. This `/themes` folder is mounted as a persistent volume from the container, to [emptyDir](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir), which means that everything we need to do is to add our theme into that folder in the volume.
> The reason why we need to run at every start, is because the persistent volume is mountet to [emptyDir](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir) which means that the lifetime of that volume does not exceed the lifetime of the pod.

So an initContainer in this example would inject a theme into the volume `/themes` and thereby provide the instance with the custom theme.

read more about initContainers [here](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/).


### Using initcontainer
#### Image
First of all we need to configure what image and tag we wish to use for our initContainer.
> Remember that initContainers must be able to run to completion!

```yaml
initContainers:
  my-initcontainer:
    image:
      repository: totallyMyUser/my-docker-image
      tag: 1.3.3.7
```

#### Env-variables
Now we define environment variables, in case thats needed
```yaml
env:
  environment:
    value: test
  password:
    value: dontShareWithGithub

```
#### Volumes
And thirdly we add volumeMounts to the container. configMapMountPath shows where the referenced volume should be mounted in the container. For instance, if you mount a volume to configMapMountPath: `/a/b/c`, the volume will be available to the container under the directory `/a/b/c`.

Mounting a volume will make all of the volume available under configMapMountPath. If you need to mount only part of the volume, such as a single file in a volume, you use configMapMountSubPath to specify the part that must be mounted. For instance, configMapMountPath: `/a/b/c`, configMapMountSubPath: `d` will make whatever `d` is in the mounted volume under directory `/a/b/c`

```yaml
#Used to mount specific file
configMapMountPaths:
  myconfigmap:
    configMapMountPath: /a/b/c
    configMapMountSubPath: d.txt

#Used to mount directory
extraVolumeMounts:
  service-tls:
    mountPath: /service-tls

```
## Adding Ingress
Parameter | Description | Example
--- | --- | ---
**Ingress** |
`ingress.enabled` | Set to false to disable ingress | `false`
`ingress.annotations` | Annotations for ingress | `kubernetes.io/ingress.class: nginx`
`ingress.hosts` | Hosts served by the ingress | `- host: domain.dk`
`ingress.tls` | TLS config
`extraIngress` | Map of extra ingress
`extraIngress.{name}` | Place ingress values under the name value

> see full configuration [here]( #Configuration)

When you find yourself in a position where you wish do deploy an application, that can be reached from the internet, you will need to add an ingress to your app. This ingress will direct traffic from a domain into the service configured.

1. Enable ingress in Configuration
1. Add the appropriate annotations
1. Specify what domain/host that should point to the service
1. Add the tls-part in the example below, if TLS/SSL should be used
    > *Please note that this uses the certificate existing in the secret specified in secretName. (It will not create the certificate)*

```yaml
  ingress:
    enabled: true
    annotations: {}
      # kubernetes.io/ingress.class: nginx
      # kubernetes.io/tls-acme: "true"
    hosts:
      - host: mydomain.com
        paths:
          - path: /
    tls:
      - hosts:
          - mydomain.com
        secretName: mydomain.com
```
### Create SSL/TLS Certificate
 If you wish to create the certificate you need to add the following to a new file in the template-folder. (This requires Cert-manager to be installed)
```yaml
{{- if .Values.certificate.enabled -}}
{{- if $.Capabilities.APIVersions.Has "cert-manager.io/v1" }}
apiVersion: cert-manager.io/v1
{{- else }}
apiVersion: cert-manager.io/v1alpha2
{{- end }}
kind: Certificate
metadata:
  name: {{ .Values.certificate.name }}
  namespace: {{ .Values.namespace }}
spec:
  dnsNames:
  {{- range .Values.certificate.dnsNames }}
  - {{ .  }}
  {{- end }}
  issuerRef:
    group: cert-manager.io
    kind: {{ .Values.certificate.issuer.kind }}
    name: {{ .Values.certificate.issuer.name }}
  secretName: {{ .Values.certificate.name }}
  {{- end }}
```
When this is in a `.yaml` file in the template-folder, add the following to your values-file
```yaml
certificate:
  mydomain.com:
    namespace: infrastructure
    spec:
      secretName: mydomain.com
      issuerRef:
        name: letsencrypt-prod
        kind: ClusterIssuer
        group: cert-manager.io
      dnsNames:
        - mydomain.com
```
## Adding PersistentVolume

Parameter | Description | Example
--- | --- | ---
**Pvc** |
`pvc.{name}` | Name of the pvc - persistent volume claim |
`pvc.{name}.accessMode` | Accessmode of pvc. One of ReadWriteOnce, ReadOnlyMany or ReadWriteMany. Defaults to ReadWriteMany |
`pvc.{name}.request` | Storage request for pvc. Defaults to 2Gi |
`pvc.{name}.storageclass` | Storageclass for pvc |

> see full configuration [here]( #Configuration)

To add a persistentVolumeClaim to our deployment we will need to provide a `name`, `accessMode`, `request`(size), and a `storageclass`. The `accessMode` describes how many nodes the volume can be mounted to, and what privileges that are allowed.

```yaml
pvc:
  my-persistent-volume-claim:
    accessMode: ReadWriteMany
    request: 2Gi
    storageclass: longhorn
```
>  Access modes;
> 1. ReadWriteOnce -- the volume can be mounted as read-write by a single node
> 1. ReadOnlyMany -- the volume can be mounted read-only by many nodes
> 1. ReadWriteMany -- the volume can be mounted as read-write by many nodes
> 1. ReadWriteOncePod -- the volume can be mounted as read-write by a single Pod. This is only supported for CSI volumes and Kubernetes version 1.22+.\
> \- *Source*; [Kubernetes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes)

When we create a persistentVolumeClaim we can reference it when creating volumes in our deployment-part of the configuration, just like;
```yaml
deployment:
  ....
  extraVolumeMounts:
      storage:
        mountPath: "/MyApp/GoesHere"
  extraVolumes:
        storage: |
          persistentVolumeClaim:
            claimName: my-persistent-volume-claim
```
## Adding Documentation
Parameter | Description | Example
--- | --- | ---
**Documentation** | Default documentation image is `image.repository`-documentation
**Documentation Deployment** |
`docDeployment.enabled` | Enables the deployment for the documentation | `true`
`docDeployment.containerPort` | Port on documentation web-service | `8080`
`docDeployment.autoscaling.enabled` | Set to `false` if docReplicaCount should be used, if not set to `true` | `8080`
`docDeployment.docReplicaCount` | Number of replicas | `2`
`docDeployment.docPodAnnotations` | annotations for pods in deployment
`docDeployment.imagePullSecrets` | List of references pointing to secrets that is used to pull images
`docDeployment.podSecurityContext` | securityContext for pods
`docDeployment.securityContext` | securityContext for containers
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
`docService.type` | Type of service. Either `ClusterIP` (default), `NodePort`, `LoadBalancer` or `ExternalName`|
`docService.targetPort` | Target port | `proxy-port`
`docService.annotations` | Annotations for service | `prometheus.io/path: /manage/actuator/appmetrics`

> see full configuration [here]( #Configuration)

When you create a service, often it is a good idea to have some documentation for it fx Swagger. This documentation-part of the values-file provides you with a place to put that documentation. This part can create a deployment, ingress and a service in kubernetes all depending on what you need.

First we create the deployment. This will create a ReplicaSet that will create pods, which will contain our containers, which contain our documentation.
```yaml
docDeployment:
  enabled: true
  containerPort: 80
  docReplicaCount: 3
  readinessProbe:
    httpGet:
      path: /videoapi/v1/videoapi/
      port: 80
    initialDelaySeconds: 5
    periodSeconds: 5
    successThreshold: 1
    timeoutSeconds: 1

```
Here we enable our docDeployment, that uses the containerport `80`, and uses a readinessprobe. Furthermore we have specified that there should be 3 replicas of the instance.

When we have our deployment up and running, we need to direct trafic to it. First step of this, is to create a service, which will loadbalance trafic to all pods in the deployment.

```yaml
docService:
  enabled: true
  type: ClusterIP
  port: 80
  targetPort: container-port
```
Now we have a service, that directs trafic to port 80 on the container - But this service is only accesible from inside the cluster. If we want others to reach it, we will have to create an ingress. This is created like this;

```yaml
docIngress:
  enabled: true
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: mydomain.com
        paths:
          - path: /
  tls:
    - hosts:
          - mydomain.com
      secretName: mydomain.com

```
>Type values and their behaviors are:
>- **ClusterIP**: Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default ServiceType.
>- **NodePort**: Exposes the Service on each Node's IP at a static port (the NodePort). A ClusterIP Service, to which the NodePort Service routes, is automatically created. You'll be able to contact the NodePort Service, from outside the cluster, by requesting <NodeIP>:<NodePort>.
>- **LoadBalancer**: Exposes the Service externally using a cloud provider's load balancer. NodePort and ClusterIP Services, to which the external load balancer routes, are automatically created.
>- **ExternalName**: Maps the Service to the contents of the externalName field (e.g. foo.bar.example.com), by returning a CNAME record with its value. No proxying of any kind is set up. \
>
>Source; https://kubernetes.io/docs/concepts/services-networking/service/

Here we have created our ingress. We enable it, add the annotations that we need, specify the host, and tls. Please be aware that the tls part does not create the certificate, but references a secret where it expects there to be a certificate.
> To create SSL/TLS-certificate see [here](#create-ssltls-certificate)

Now we are good to go! When a person opens a browser and pastes the domain into the browser it will reach the ingress, which will direct trafic to the service, which will direct trafic to the pods. And we are golden!
## Adding Cronjob

Parameter | Description                                                                                                                                                                                                                                                | Example
--- |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| ---
**Cronjob** |
`cronjob.{name}` | Name of the cronjob                                                                                                                                                                                                                                        |
`cronjob.{name}.nameOverwrite` | Optional name overwrite                                                                                                                                                                                                                                    |
`cronjob.{name}.image.repository` | Cronjob image repository                                                                                                                                                                                                                                   |
`cronjob.{name}.image.tag` | Cronjob image tag                                                                                                                                                                                                                                          |
`cronjob.{name}.image.pullPolicy` | pullPolicy. Either `Always`, `IfNotPresent` or `Never`                                                                                                                                                                                                     |
`cronjob.{name}.schedule` | Schedule for cronjob                                                                                                                                                                                                                                       | `"*/15 * * * *"`
`cronjob.{name}.concurrencyPolicy` | ConcurrencyPolicy for cronjob. Either `Allow`, `Forbid` or `Replace`. Defaults to `Forbid`                                                                                                                                                                 
`cronjob.{name}.startingDeadlineSeconds` | StartingDeadlineSeconds for cronjob                                                                                                                                                                                                                        
`cronjob.{name}.successfulJobsHistoryLimit` | SuccessfulJobsHistoryLimit for cronjob                                                                                                                                                                                                                     
`cronjob.{name}.failedJobsHistoryLimit` | FailedJobsHistoryLimit for cronjob                                                                                                                                                                                                                         
`cronjob.{name}.parallelism` | Parallelism for cronjob                                                                                                                                                                                                                                    
`cronjob.{name}.completions` | Completions for cronjob                                                                                                                                                                                                                                    
`cronjob.{name}.backoffLimit` | BackoffLimit for cronjob                                                                                                                                                                                                                                   
`cronjob.{name}.activeDeadlineSeconds` | ActiveDeadlineSeconds for cronjob                                                                                                                                                                                                                          
`cronjob.{name}.terminationGracePeriodSeconds` | TerminationGracePeriodSeconds for cronjob                                                                                                                                                                                                                  
`cronjob.{name}.commands` | List of cronjob commands                                                                                                                                                                                                                                   | `- /bin/bash`
`cronjob.{name}.args` | List of arguments to the commands                                                                                                                                                                                                                          |
`cronjob.{name}.restartPolicy` | Restartpolicy. Either `Always`, `OnFailure` or `Never`. Defaults to `OnFailure`                                                                                                                                                                            
**Cronjob - Environment variables** |
`cronjob.{name}.env` | Map of environment variables                                                                                                                                                                                                                               
`cronjob.{name}.env.{name}` | Name of the environment variables                                                                                                                                                                                                                          
`cronjob.{name}.env.{name}.value` | Value of the environment variable                                                                                                                                                                                                                          
`cronjob.{name}.env.{name}.type` | Optional: specify type of the environment variables if it should be read from a secret or configmap.<br> One of `fieldPath`, `secretKeyRef` or `configMapKeyRef`                                                                                           | `type: secretKeyRef`
`cronjob.{name}.env.{name}.fieldPath` | Optional: Value of fieldPath                                                                                                                                                                                                                               
`cronjob.{name}.env.{name}.name` | Optional: Name of the SecretKeyRef or ConfigMapKeyRef                                                                                                                                                                                                      
`cronjob.{name}.env.{name}.key` | Optional: Key for the SecretKeyRef or ConfigMapKeyRef                                                                                                                                                                                                      
`cronjob.{name}.envFrom` | Map of environment variables                                                                                                                                                                                                                               
`cronjob.{name}.envFrom.configMapRef` | List of ConfigMaps to read environment variables from                                                                                                                                                                                                      | <code>configMapRef:<br>&nbsp;&nbsp;- my-configmap</code>
**Cronjob - Volume mounts** |
`cronjob.{name}.extraVolumeMounts` | Extra volume mounts                                                                                                                                                                                                                                        
`cronjob.{name}.extraVolumeMounts.{name}` | Name of the extra volume mount. This must match the name of 'cronjob.{name}.extraVolumes.{name}'                                                                                                                                                           
`cronjob.{name}.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume                                                                                                                                                                                                                             
`cronjob.{name}.extraVolumes` | Extra volumes for the mounts                                                                                                                                                                                                                               
`cronjob.{name}.extraVolumes.{name}` | Extra volumes for the mounts.<br>This must match the name of 'cronjob.{name}.extraVolumeMounts.{name}'<br>The value can be one of `persistentVolumeClaim` or `configMap` and the value for claimname _must_ match 'pvc.{name}' or a configmap respectively | <code>my-storage: &#124;-<br>&nbsp;&nbsp;persistentVolumeClaim:<br>&nbsp;&nbsp;&nbsp;&nbsp;claimName: my-application-storage</code>

> see full configuration [here]( #Configuration)

To start off with your cronjob, lets start filling in the basics, so lets fill in the name, image, schedule and such.

> Schedule generator [here](https://crontab.guru/)

```yaml
cronjob:
  my-cron:
    image:
      repository: me/repository
      tag: 1.0.0
      pullPolicy: Always
    schedule: "*/15 * * * *"
    commands:
      - /bin/bash
    args: []
    concurrencyPolicy: Forbid
    restartPolicy: OnFailure
```
When that is done we can add environment-variables. We can do this in four different ways, depending on where you want the secret to be stored.
- You can store it as a string in your values-file
- You can store it in a kubernetes-secret and reference it
- You can store it in a configmap, and reference it
- You can store it in pod fields, or container resources, and reference it

> Read more about the different ways to do env-vars [here](https://humanitec.com/blog/handling-environment-variables-with-kubernetes)

We have listed below the four different ways you can store your env-vars:
```yaml
cronjob:
  my-cron:
    ...
    env:
      my-env-notype-var: # NoType
        value: secret
      my-env-secretRef-var: # secretKeyRef
        type: secretKeyRef
        name: mysecret
        key: password
      my-env-configmapref-var: # configmapref
        type: fieldPath
        name: mysecret
        key: password
      my-env-fieldpath-var: # fieldPath
        type: fieldPath
        fieldPath: status.podIP # Using other values follow a similar pattern, using metadata.*, status.*, spec.* to access the value you want.

```
Before we can use a volume, we need to create it [find out how to, right here!](#adding-persistentvolume)

To use the volume created for your cronjob, you can reference it like below
```yaml
cronjob:
  my-cron:
    ...
    extraVolumes:
      firstVolume: |
        persistentVolumeClaim:
          claimName: my-persistent-volume-claim
    extraVolumeMounts:
      firstVolume:
        mountPath: /path/in/container
```
## Adding job
Parameter | Description | Example
--- | --- | ---
**Job** |
`job.{name}` | Name of the job |
`job.{name}.image.repository` | Name of the job image |
`job.{name}.image.tag` | Job image tag |
`job.{name}.image.pullPolicy` | pullPolicy. Either `Always`, `IfNotPresent` or `Never` |
`job.{name}.backoffLimit` | Number of retries before considering a job as failed | `3` |
`job.{name}.commands` | List of job commands | <code>commands:<br>&nbsp;&nbsp;- /bin/bash</code>
`job.{name}.args` | List of arguments to the commands |
`job.{name}.restartPolicy` | Restartpolicy. One of `Always`, `OnFailure`, `Never`. Defaults to `OnFailure`
**Job - Environment variables** |
`job.{name}.env` | Map of environment variables
`job.{name}.env.{name}` | Name of the environment variables
`job.{name}.env.{name}.value` | Value of the environment variable
`job.{name}.env.{name}.type` | Optional: specify type of the environment variables if it should be read from a secret or configmap.<br> One of `fieldPath`, `secretKeyRef`, `configMapKeyRef` | `type: secretKeyRef`
`job.{name}.env.{name}.fieldPath` | Optional: Value of fieldPath
`job.{name}.env.{name}.name` | Optional: Name of the `SecretKeyRef` or `ConfigMapKeyRef`
`job.{name}.env.{name}.key` | Optional: Key for the `SecretKeyRef` or `ConfigMapKeyRef`
`job.{name}.envFrom` | Map of environment variables
`job.{name}.envFrom.configMapRef` | List of ConfigMaps to read environment variables from | <code>configMapRef:<br>&nbsp;&nbsp;- my-configmap</code>
**Job - Volume mounts** |
`job.{name}.extraVolumeMounts` | Extra volume mounts
`job.{name}.extraVolumeMounts.{name}` | Name of the extra volume mount. This must match the name of 'job.{name}.extraVolumes.{name}'
`job.{name}.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume
`job.{name}.extraVolumes` | Extra volumes for the mounts
`job.{name}.extraVolumes.{name}` | Extra volumes for the mounts.<br>This must match the name of `job.{name}.extraVolumeMounts.{name}`<br>The value can be one of persistentVolumeClaim or configMap and the value for claimname _must_ match 'pvc.{name}' or a configmap respectively | <code>my-storage: &#124;-<br>&nbsp;&nbsp;persistentVolumeClaim:<br>&nbsp;&nbsp;&nbsp;&nbsp;claimName: my-application-storage</code>

> see full configuration [here]( #Configuration)

```yaml
job:
  my-job:
    image:
      repository: me/repository
      tag: 1.0.0
      pullPolicy: Always
    commands:
      - /bin/bash
    args: []
    restartPolicy: OnFailure
```
When that is done we can add environment-variables. We can do this in four different ways, depending on where you want the secret to be stored.
- You can store it as a string in your values-file
- You can store it in a kubernetes-secret and reference it
- You can store it in a configmap, and reference it
- You can store it in pod fields, or container resources, and reference it

> Read more about the different ways to do env-vars [here](https://humanitec.com/blog/handling-environment-variables-with-kubernetes)

We have listed below the four different ways you can store your env-vars:
```yaml
job:
  my-job:
    ...
    env:
      my-env-notype-var: # NoType
        value: secret
      my-env-secretRef-var: # secretKeyRef
        type: secretKeyRef
        name: mysecret
        key: password
      my-env-configmapref-var: # configmapref
        type: fieldPath
        name: mysecret
        key: password
      my-env-fieldpath-var: # fieldPath
        type: fieldPath
        fieldPath: status.podIP # Using other values follow a similar pattern, using metadata.*, status.*, spec.* to access the value you want.

```
Before we can use a volume, we need to create it [find out how to, irght here!](#adding-persistentvolume)

To use the volume created for your cronjob, you can reference it like below
```yaml
job:
  my-job:
    ...
    extraVolumes:
      firstVolume: |
        persistentVolumeClaim:
          claimName: my-persistent-volume-claim
    extraVolumeMounts:
      firstVolume:
        mountPath: /path/in/container
```
## Adding sealed secret
Parameter | Description | Example
--- | --- | ---
**Sealed Secret** |
`sealedSecret.{name}` | Name of secret |
`sealedSecret.{name}.type` | Type of the secret - Default Opaque | `kubernetes.io/tls`
`sealedSecret.{name}.encryptedData` | List of 'Key: Value' pair of the encrypted data | `password: AgBOQOoh7RGqTBPPSG0Ctbf...`

> see full configuration [here]( #Configuration)

With sealed secrets it is possible to store your secrets in github with no security-risk. Sounds like something for you? [Follow this guide!](https://doc.hosting.kitkube.dk/deployment/secrets/)
```yaml
sealedSecret:
  my-secret:
    type: Opaque
    encryptedData:
      password: myEncryptedSecretPassword #remember to encrypt value!
      otherPassword: myOtherEncryptedAndMaybeRedundantPassword #remember to encrypt value!
      thirdPassword: encryptedQuestionWhySoManyPasswords? #remember to encrypt value!
```
