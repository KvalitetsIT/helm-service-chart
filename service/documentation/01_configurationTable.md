## Configuration
The following table, lists the configurable parameters.

Parameter | Description | Example
--- | --- | ---
**[Basics](#adding-basics)** |
`fullnameOverride` | Name of the service
`namespace` | Namespace to deploy into
`podSecurityContext` | podSecurityContext
`podAnnotations` | Annotations for the pod fx prometheus | `prometheus.io/path: actuator prometheus` <br> `prometheus.io/scrape: "true"` <br>
`imagePullSecrets` | imagePullSecrets
`image.repository` | Name of the web-service image
`image.tag` | Web-service image tag
`autoscaling.enabled` | Enable autoscaling | `true` or `false`
`replicaCount` | Number of replicas - Not used if autoscaling is enabled | `1`, `2`, `3` ..
`deploymentStrategy` | Enables to set deployment strategy | `Recreate`
&nbsp; |
**[Deployment](#adding-deployment)** |
`deployment.enabled` | Enables the deployment | `true` or `false`
`deployment.hostAliases` | hostAliases |
`deployment.containerPort` | Port on web-service | `8080`
`deployment.extraContainerPort` | Extra port on deployment| `Port1: 8051`
`deployment.configMapMountPaths` | Set value if config map needs to mount on deployment | `/config`
`deplyment.extraVolumeMounts` | Extra volume mounts
`deplyment.readinessProbe` | Set values under this to config readiness probe
`deplyment.livenessProbe` | Set values under this to config liveness probe
`deplyment.commands` | List of cronjob commands | `- /bin/bash`
`deplyment.args` | List of arguments to the commands |
**Deployment - Environment variables** |
`deployment.env` | Map of environment variables
`deployment.env.{name}` | Name of the environment variables
`deployment.env.{name}.value` | Value of the environment variable
`deployment.env.{name}.type` | Optional: specify type of the environment variables if it should be read from a secret or configmap.<br> One of fieldPath, secretKeyRef, configMapKeyRef | `type: secretKeyRef`
`deployment.env.{name}.fieldPath` | Optional: Value of fieldPath
`deployment.env.{name}.name` | Optional: Name of the SecretKeyRef or ConfigMapKeyRef
`deployment.env.{name}.key` | Optional: Key for the SecretKeyRef or ConfigMapKeyRef
`deployment.envFrom` | Map of environment variables
`deployment.envFrom.configMapRef` | List of ConfigMaps to read environment variables -from | <code>configMapRef:<br>&nbsp;&nbsp;- my-configmap</code>
**Deployment - Volume mounts** |
`deployment.extraVolumeMounts` | Extra volume mounts
`deployment.extraVolumeMounts.{name}` | Name of the extra volume mount. This must match the name of 'deployment.extraVolumes.{name}'
`deployment.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume
`deployment.extraVolumes` | Extra volumes for the mounts
`deployment.extraVolumes.{name}` | Extra volumes for the mounts.<br>This must match the name of 'deployment.extraVolumeMounts.{name}'<br>The value can be one of persistentVolumeClaim or configMap and the value for claimname _must_ match 'pvc.{name}' or a configmap respectively | <code>my-storage: &#124;-<br>&nbsp;&nbsp;persistentVolumeClaim:<br>&nbsp;&nbsp;&nbsp;&nbsp;claimName: my-application-storage</code>
&nbsp; |
**[initContainers](#adding-initcontainer)** |
`initContainers.<name>.image.repository` | image repo
`initContainers.<name>.image.tag` | image tag
`initContainers.<name>.env` | See: Deployment - Environment variables
`initContainers.<name>.configMapMountPaths` | Set value if config map needs to mount on init container
`initContainers.<name>.extraVolumeMounts` | Extra volume mounts
&nbsp; |
**[Ingress](#adding-ingress)** |
`ingress.enabled` | Set to false to disable ingress | `false`
`ingress.annotations` | Annotations for ingress | `kubernetes.io/ingress.class: nginx`
`ingress.hosts` | Hosts served by the ingress | `- host: domain.dk`
`ingress.tls` | TLS config
`extraIngress` | Map of extra ingress
`extraIngress.{name}` | Place ingress values under the name value
&nbsp; |
**[Service](#adding-service)** |
`service.enabled` | Set to false to disable service | `false`
`service.port` | Port on the service | `8080`
`service.targetPort` | Target port | `proxy-port`
`service.annotations` | Annotations for service | `prometheus.io/path: /manage/actuator/appmetrics`
&nbsp; |
**[PVC](#adding-persistentvolume)** |
`pvc.{name}` | Name of the pvc - persistent volume claim |
`pvc.{name}.accessMode` | Accessmode of pvc. One of ReadWriteOnce, ReadOnlyMany or ReadWriteMany. Defaults to ReadWriteMany |
`pvc.{name}.request` | Storage request for pvc. Defaults to 2Gi |
`pvc.{name}.storageclass` | Storageclass for pvc |
&nbsp; |
**[Documentation](#adding-documentation)** | Default documentation image is `image.repository`-documentation
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
&nbsp; |
**[Cronjob](#adding-cronjob)** |
`cronjob.{name}` | Name of the cronjob |
`cronjob.{name}.image` | Name of the cronjob image |
`cronjob.{name}.tag` | Cronjob image tag |
`cronjob.{name}.schedule` | Schedule for cronjob | `"*/15 * * * *"`
`cronjob.{name}.concurrencyPolicy` | ConcurrencyPolicy for cronjob. One of Allow, Forbid, Replace. Defaults to Forbid
`cronjob.{name}.commands` | List of cronjob commands | `- /bin/bash`
`cronjob.{name}.args` | List of arguments to the commands |
`cronjob.{name}.restartPolicy` | Restartpolicy. One of Always, OnFailure, Never. Defaults to OnFailure
**Cronjob - Environment variables** |
`cronjob.{name}.env` | Map of environment variables
`cronjob.{name}.env.{name}` | Name of the environment variables
`cronjob.{name}.env.{name}.value` | Value of the environment variable
`cronjob.{name}.env.{name}.type` | Optional: specify type of the environment variables if it should be read from a secret or configmap.<br> One of fieldPath, secretKeyRef, configMapKeyRef | `type: secretKeyRef`
`cronjob.{name}.env.{name}.fieldPath` | Optional: Value of fieldPath
`cronjob.{name}.env.{name}.name` | Optional: Name of the SecretKeyRef or ConfigMapKeyRef
`cronjob.{name}.env.{name}.key` | Optional: Key for the SecretKeyRef or ConfigMapKeyRef
`job.{name}.envFrom` | Map of environment variables
`job.{name}.envFrom.configMapRef` | List of ConfigMaps to read environment variables from | <code>configMapRef:<br>&nbsp;&nbsp;- my-configmap</code>
**Cronjob - Volume mounts** |
`cronjob.{name}.extraVolumeMounts` | Extra volume mounts
`cronjob.{name}.extraVolumeMounts.{name}` | Name of the extra volume mount. This must match the name of 'cronjob.{name}.extraVolumes.{name}'
`cronjob.{name}.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume
`cronjob.{name}.extraVolumes` | Extra volumes for the mounts
`cronjob.{name}.extraVolumes.{name}` | Extra volumes for the mounts.<br>This must match the name of 'cronjob.{name}.extraVolumeMounts.{name}'<br>The value can be one of persistentVolumeClaim or configMap and the value for claimname _must_ match 'pvc.{name}' or a configmap respectively | <code>my-storage: &#124;-<br>&nbsp;&nbsp;persistentVolumeClaim:<br>&nbsp;&nbsp;&nbsp;&nbsp;claimName: my-application-storage</code>
&nbsp; |
**[Job](#adding-job)** |
`job.{name}` | Name of the job |
`job.{name}.image` | Name of the job image |
`job.{name}.tag` | Job image tag |
`job.{name}.commands` | List of job commands | <code>commands:<br>&nbsp;&nbsp;- /bin/bash</code>
`job.{name}.args` | List of arguments to the commands |
`job.{name}.restartPolicy` | Restartpolicy. One of Always, OnFailure, Never. Defaults to OnFailure
**Job - Environment variables** |
`job.{name}.env` | Map of environment variables
`job.{name}.env.{name}` | Name of the environment variables
`job.{name}.env.{name}.value` | Value of the environment variable
`job.{name}.env.{name}.type` | Optional: specify type of the environment variables if it should be read from a secret or configmap.<br> One of fieldPath, secretKeyRef, configMapKeyRef | `type: secretKeyRef`
`job.{name}.env.{name}.fieldPath` | Optional: Value of fieldPath
`job.{name}.env.{name}.name` | Optional: Name of the SecretKeyRef or ConfigMapKeyRef
`job.{name}.env.{name}.key` | Optional: Key for the SecretKeyRef or ConfigMapKeyRef
`job.{name}.envFrom` | Map of environment variables
`job.{name}.envFrom.configMapRef` | List of ConfigMaps to read environment variables from | <code>configMapRef:<br>&nbsp;&nbsp;- my-configmap</code>
**Job - Volume mounts** |
`job.{name}.extraVolumeMounts` | Extra volume mounts
`job.{name}.extraVolumeMounts.{name}` | Name of the extra volume mount. This must match the name of 'job.{name}.extraVolumes.{name}'
`job.{name}.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume
`job.{name}.extraVolumes` | Extra volumes for the mounts
`job.{name}.extraVolumes.{name}` | Extra volumes for the mounts.<br>This must match the name of 'job.{name}.extraVolumeMounts.{name}'<br>The value can be one of persistentVolumeClaim or configMap and the value for claimname _must_ match 'pvc.{name}' or a configmap respectively | <code>my-storage: &#124;-<br>&nbsp;&nbsp;persistentVolumeClaim:<br>&nbsp;&nbsp;&nbsp;&nbsp;claimName: my-application-storage</code>
&nbsp; |
**[Sidecar](#adding-sidecar)** |
`sidecar.{name}` | Name of sidecar |
`sidecar.image.repository` | Repository of image |
`sidecar.image.tag` | Image tag |
`sidecar.env` | Env variables |
`sidecar.commands` | Commands for sidecar |
`sidecar.args` | Arguments for container |
`sidecar.containerPort` | Port of container |
`sidecar.extraVolumeMounts` | Extra volumes mount  |
&nbsp; |
**[Sealed Secret](#adding-sealed-secret)** |
`sealedSecret.{name}` | Name of secret |
`sealedSecret.{name}.type` | Type of the secret - Default Opaque | `kubernetes.io/tls`
`sealedSecret.{name}.encryptedData` | List of 'Key: Value' pair of the encrypted data | `password: AgBOQOoh7RGqTBPPSG0Ctbf...`


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
