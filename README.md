# awscli-cifs-alpine
Docker image with AWS CLI + CIFS tools to mount SMB/Samba shares based on Alpine

AWS CLI + CIFS tools to mount SMB/Samba shares and rsync for good measure, all bundled on Alpine docker image

[![docker pulls](https://img.shields.io/docker/pulls/recipedude/awscli-cifs-alpine.svg?style=plastic)](https://cloud.docker.com/u/recipedude/repository/docker/recipedude/awscli-cifs-alpine)

This docker image contains:

- [Alpine 3.10.1](https://hub.docker.com/_/alpine)
- [AWS CLI](https://aws.amazon.com/cli/)
- [CIFS tools](https://wiki.samba.org/index.php/LinuxCIFS_utils)
- [rsync](https://linux.die.net/man/1/rsync)


## AWS Credentials

Pass in the following environment variables for AWS CLI credientals.

- ```AWS_ACCESS_KEY_ID``` – Specifies an AWS access key associated with an IAM user or role.
- ```AWS_SECRET_ACCESS_KEY``` – Specifies the secret key associated with the access key. This is essentially the "password" for the access key.
- ```AWS_DEFAULT_REGION``` – Specifies the [AWS Region](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#cli-quick-configuration-region) to send the request to.

For more options you can configure with environment variables refer to: [AWS Environment Variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

## Environment variables

Example of environment variables that will:

1. Mount a SMB/Samba share on ```/data```
2. Sync the ```/data``` folder to an S3 bucket

```
AWS_ACCESS_KEY_ID=_YOUR_ACCESS_KEY_
AWS_SECRET_ACCESS_KEY=_YOUR_SECRET_
AWS_DEFAULT_REGION=us-east-1
CIFS_SHARE=//_YOUR_SHARE_SERVER_>/<_YOUR_SHARE_PATH_
CIFS_OPTS=username=_YOUR_SHARE_USERNAME_,password=_YOUR_SHARE_PASSWORD_,domain=_YOUR_SHARE_DOMAIN+
AWS_S3_CMD=sync . s3://_YOUR_S3_BUCKET_NAME_
```


## Docker

```
docker run --rm -ti --cap-add SYS_ADMIN --cap-add -e config.env DAC_READ_SEARCH recipedude/awscli-cifs-alpine
```


## SMB/Samba/CIFS mounting permissions 

[Mounting NFS shared inside docker contaier](https://stackoverflow.com/questions/39922161/mounting-nfs-shares-inside-docker-container)

With Docker and, Kubernetes you will likely see an ```Operation not permitted``` error when trying 
to mount shares.

You will need the ```CAP_SYS_ADMIN``` capability, which is stripped by Docker and Kubernetes when it 
creates the container. 

### Docker

For Docker add the flag ```--cap-add sys_admin``` to your docker run command-line as thus:
```docker run -d --name nfs-client --cap-add sys_admin recipedude/alpine-nfs-client-aws:latest```

### Kubernetes

Additional priveleges will most likely be needed.  The stanza may vary depending on your version of Kubernetes. 


New versions (1.13+) seem to work with this:

Add a ```securityContext``` stanza to add ```SYS_ADMIN``` priveleges. 

```
      containers:
        - name: awscli-smb
          securityContext:
            capabilities:
              add: ["SYS_ADMIN"]
```


Version 1.12.7 seems to require this:

```
      containers:
        - name: awscli-smb
	        securityContext:          
  	        privileged: true
    	      allowPrivilegeEscalation: true        
      	    capabilities:
        	    add: ["SYS_ADMIN"]
```

YMMV.




