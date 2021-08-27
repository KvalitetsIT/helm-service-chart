## Adding Cronjob

Parameter | Description | Example
--- | --- | ---
**Cronjob** |
`cronjob.{name}` | Name of the cronjob |
`cronjob.{name}.image.repository` | Cronjob image repository |
`cronjob.{name}.image.tag` | Cronjob image tag |
`cronjob.{name}.image.pullPolicy` | pullPolicy. Either `Always`, `IfNotPresent` or `Never` |
`cronjob.{name}.schedule` | Schedule for cronjob | `"*/15 * * * *"`
`cronjob.{name}.concurrencyPolicy` | ConcurrencyPolicy for cronjob. Either `Allow`, `Forbid` or `Replace`. Defaults to `Forbid`
`cronjob.{name}.commands` | List of cronjob commands | `- /bin/bash`
`cronjob.{name}.args` | List of arguments to the commands |
`cronjob.{name}.restartPolicy` | Restartpolicy. Either `Always`, `OnFailure` or `Never`. Defaults to `OnFailure`
**Cronjob - Environment variables** |
`cronjob.{name}.env` | Map of environment variables
`cronjob.{name}.env.{name}` | Name of the environment variables
`cronjob.{name}.env.{name}.value` | Value of the environment variable
`cronjob.{name}.env.{name}.type` | Optional: specify type of the environment variables if it should be read from a secret or configmap.<br> One of `fieldPath`, `secretKeyRef` or `configMapKeyRef` | `type: secretKeyRef`
`cronjob.{name}.env.{name}.fieldPath` | Optional: Value of fieldPath
`cronjob.{name}.env.{name}.name` | Optional: Name of the SecretKeyRef or ConfigMapKeyRef
`cronjob.{name}.env.{name}.key` | Optional: Key for the SecretKeyRef or ConfigMapKeyRef
`cronjob.{name}.envFrom` | Map of environment variables
`cronjob.{name}.envFrom.configMapRef` | List of ConfigMaps to read environment variables from | <code>configMapRef:<br>&nbsp;&nbsp;- my-configmap</code>
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
Before we can use a volume, we need to create it [find out how to, irght here!](#adding-persistentvolume)

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
