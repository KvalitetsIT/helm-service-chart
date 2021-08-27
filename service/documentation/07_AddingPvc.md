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
