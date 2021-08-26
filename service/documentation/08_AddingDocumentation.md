## Adding Documentation
Parameter | Description | Example
--- | --- | ---
**Documentation** | Default documentation image is `image.repository`-documentation
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
