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
