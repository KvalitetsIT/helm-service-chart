## Adding Deployment

Parameter | Description | Example
--- | --- | ---
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

> see full configuration [here]( #Configuration)

First of all we need to specify the basics. We need to provide env-variables, arguments for our container, and also containerports.
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

Now that we know what our probes are, lets configure them!

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
