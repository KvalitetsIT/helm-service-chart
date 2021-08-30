## Adding Documentation
Parameter | Description | Example
--- | --- | ---
**Documentation** | Default documentation image is `image.repository`-documentation
**Documentation Deployment** |
`docDeployment.enabled` | Enables the deployment for the documentation | `true`
`docDeployment.containerPort` | Port on documentation web-service | `8080`
`docDeployment.autoscaling.enabled` | Set to `false` if docReplicaCount should be used, if not set to `true` | `8080`
`docDeployment.docReplicaCount` | Number of replicas | `2`
`docDeployment.docPodAnnotations` | annotations for pods in deployment
`docDeployment.imagePullSecrets` | List of references pointing to secrets that is used to pull images
`docDeployment.podSecurityContext` | securityContext for pods
`docDeployment.securityContext` | securityContext for containers
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
`docService.type` | Type of service. Either `ClusterIP` (default), `NodePort`, `LoadBalancer` or `ExternalName`|
`docService.targetPort` | Target port | `proxy-port`
`docService.annotations` | Annotations for service | `prometheus.io/path: /manage/actuator/appmetrics`

> see full configuration [here]( #Configuration)

When you create a service, often it is a good idea to have some documentation for it fx Swagger. This documentation-part of the values-file provides you with a place to put that documentation. This part can create a deployment, ingress and a service in kubernetes all depending on what you need.

First we create the deployment. This will create a ReplicaSet that will create pods, which will contain our containers, which contain our documentation.
```yaml
docDeployment:
  enabled: true
  containerPort: 80
  docReplicaCount: 3
  readinessProbe:
    httpGet:
      path: /videoapi/v1/videoapi/
      port: 80
    initialDelaySeconds: 5
    periodSeconds: 5
    successThreshold: 1
    timeoutSeconds: 1

```
Here we enable our docDeployment, that uses the containerport `80`, and uses a readinessprobe. Furthermore we have specified that there should be 3 replicas of the instance.

When we have our deployment up and running, we need to direct trafic to it. First step of this, is to create a service, which will loadbalance trafic to all pods in the deployment.

```yaml
docService:
  enabled: true
  type: ClusterIP
  port: 80
  targetPort: container-port
```
Now we have a service, that directs trafic to port 80 on the container - But this service is only accesible from inside the cluster. If we want others to reach it, we will have to create an ingress. This is created like this;

```yaml
docIngress:
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
>Type values and their behaviors are:
>- **ClusterIP**: Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default ServiceType.
>- **NodePort**: Exposes the Service on each Node's IP at a static port (the NodePort). A ClusterIP Service, to which the NodePort Service routes, is automatically created. You'll be able to contact the NodePort Service, from outside the cluster, by requesting <NodeIP>:<NodePort>.
>- **LoadBalancer**: Exposes the Service externally using a cloud provider's load balancer. NodePort and ClusterIP Services, to which the external load balancer routes, are automatically created.
>- **ExternalName**: Maps the Service to the contents of the externalName field (e.g. foo.bar.example.com), by returning a CNAME record with its value. No proxying of any kind is set up. \
>
>Source; https://kubernetes.io/docs/concepts/services-networking/service/

Here we have created our ingress. We enable it, add the annotations that we need, specify the host, and tls. Please be aware that the tls part does not create the certificate, but references a secret where it expects there to be a certificate.
> To create SSL/TLS-certificate see [here](#create-ssltls-certificate)

Now we are good to go! When a person opens a browser and pastes the domain into the browser it will reach the ingress, which will direct trafic to the service, which will direct trafic to the pods. And we are golden!
