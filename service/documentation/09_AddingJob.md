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
To create a volume for your job, you can add it like below
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
