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
