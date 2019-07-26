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

