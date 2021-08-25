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
