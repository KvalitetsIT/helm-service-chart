# Service Helm Chart
Deploys a generic service

## Generate new readme
1. add (or modify) a file to the service/documentation-folder
1. Make sure that the file is prefixed with a chapter-number (needs to be two digits)
1. Run the `createReadme.sh` script
1. New readme is created!

> Future; Please make this a github action!

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
