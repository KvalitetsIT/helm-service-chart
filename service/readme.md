# Service Helm Chart
Deploys a generic service
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
`imagePullSecrets` | imagePullSecrets
`image.repository` | Name of the web-service image
`image.tag` | Web-service image tag
`autoscaling.enabled` | Enable autoscaling | `true` or `false`
`replicaCount` | Number of replicas - Not used if autoscaling is enabled | `1`, `2`, `3` ..
`deploymentStrategy` | Enables to set deployment strategy | `Recreate`

> see full configuration [here]( #Configuration)
## Adding Deployment

Parameter | Description | Example
--- | --- | ---
**Deployment** |
`deployment.enabled` | Enables the deployment
`deployment.containerPort` | Port on web-service | `8080`
`deployment.extraContainerPort` | Extra port on deployment| `Port1: 8051`
`deployment.readinessProbe` | Set values under this to config readiness probe
`deployment.livenessProbe` | Set values under this to config liveness probe
`deployment.commands` | List of cronjob commands | `- /bin/bash`
`deployment.args` | List of arguments to the commands |
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

> see full configuration [here]( #Configuration)

```yaml
deployment:
...
  enabled: true
  containerPort: 1313
  exstraContainerPort: 1314
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
  args: []
  env:
    someEnvVar1:
      value: goodValue1
    someEnvVar2:
      value: valueForSecrets
```
### Volumes
Parameter | Description | Example
--- | --- | ---
**Deployment - Volume** |
`deployment.configMapMountPaths` | Set value if config map needs to mount on deployment | `/config`
**Deployment - Extra Volume** |
`deployment.extraVolumeMounts` | Extra volume mounts
`deployment.extraVolumeMounts.{name}` | Name of the extra volume mount. This must match the name of 'deployment.extraVolumes.{name}'
`deployment.extraVolumeMounts.{name}.mountPath` | Mountpath for the extra volume
`deployment.extraVolumes` | Extra volumes for the mounts
`deployment.extraVolumes.{name}` | Extra volumes for the mounts.<br>This must match the name of 'deployment.extraVolumeMounts.{name}'<br>The value can be one of persistentVolumeClaim or configMap and the value for claimname _must_ match 'pvc.{name}' or a configmap respectively | <code>my-storage: &#124;

> see full configuration [here]( #Configuration)


```yaml
deployment:
...
  configMapMountPaths:
    nginx-conf:
      configMapMountPath: /config/nginx.conf
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
## Adding initcontainer
Parameter | Description | Example
--- | --- | ---
**initContainers** |
`initContainers.<name>.image.repository` | image repo
`initContainers.<name>.image.tag` | image tag
`initContainers.<name>.env` | See: Deployment - Environment variables
`initContainers.<name>.configMapMountPaths` | Set value if config map needs to mount on init container
`initContainers.<name>.extraVolumeMounts` | Extra volume mounts

> see full configuration [here]( #Configuration)

### Why do we need initcontainers?
Lets say that we wish to add a custom theme to keycloak. The keycloak-app looks at the `/themes` folder to find the available themes. This `/themes` folder is mounted as a persistent volume from the container, to [emptyDir](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir), which means that everything we need to to is to add our theme into that folder in the volume.
> The reason why we need to run at every start, is because the persistent volume is mountet to [emptyDir](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir) which means that the lifetime of that volume does not exceed the lifetime of the pod.

So an initContainer in this example would inject a theme into the volume `/themes` and thereby provide the instance with the custom theme.

read more about initContainers [here](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/).


### Deployment) Using initcontainer
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
    > *Please note that this uses the certificate existing in the secret specified in secretName. (It will not create certificate)*





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
 If you wish to create the certificate you need to add the following to a new file in template-folder. (This required Cert-manager to be installed)
```yaml
{{- if .Values.certificate.enabled -}}
apiVersion: cert-manager.io/v1alpha2
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
1. ReadWriteOnce -- the volume can be mounted as read-write by a single node
1. ReadOnlyMany -- the volume can be mounted read-only by many nodes
1. ReadWriteMany -- the volume can be mounted as read-write by many nodes
1. ReadWriteOncePod -- the volume can be mounted as read-write by a single Pod. This is only supported for CSI volumes and Kubernetes version 1.22+.\
\- *Source*; [Kubernetes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes)

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
Now our storageclass will take care, and provision volumes for the `storage`-volume, and the other volumes
## Adding Cronjob
## Adding job
## Adding sealed secret
Parameter | Description | Example
--- | --- | ---
**Sealed Secret** |
`sealedSecret.{name}` | Name of secret |
`sealedSecret.{name}.type` | Type of the secret - Default Opaque | `kubernetes.io/tls`
`sealedSecret.{name}.encryptedData` | List of 'Key: Value' pair of the encrypted data | `password: AgBOQOoh7RGqTBPPSG0Ctbf...`

> see full configuration [here]( #Configuration)

With sealed secrets it is possible to store your secret in github. Sounds like something for you? [Follow this guide!](https://doc.hosting.kitkube.dk/deployment/secrets/)
```yaml
sealedSecret:
  my-secret:
    type: Opaque
    encryptedData:
      password: myEncryptedSecretPassword #remember to encrypt value!
      otherPassword: myOtherEncryptedAndMaybeRedundantPassword #remember to encrypt value!
      thirdPassword: encryptedQuestionWhySoManyPasswords? #remember to encrypt value!
```
