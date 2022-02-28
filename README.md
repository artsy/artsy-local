# artsy-local

This repo contains the necessary docker-compose configurations to run everything
Artsy on your local machine in Docker.

### Step One: Clone the **artsy-local** git repo:

```bash
$ git clone git@github.com:artsy/artsy-local.git
```

### Step Two: Environment Configuration

You'll need several environment variables in your `~/.bash_profile` or `~/.zshrc` file.

```bash
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-east-1
export AWS_ACCOUNT_ID=
```

- `AWS_ACCESS_KEY_ID` - Part of your credentials for accessing AWS Resources
- `AWS_SECRET_ACCESS_KEY` - Part of your credentials for accessing AWS Resources
- `AWS_DEFAULT_REGION` - The aws region commands will execute in.
- `AWS_ACCOUNT_ID` - The account id associated with your aws account, find it [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/console_account-alias.html)

After you've configured your AWS credentials its time to authenticate with ECR. Restart your shell and run the following command.

```
aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com
```

### Step Three: Run Setup

Ensure that Docker is installed on your system using the proper instructions from their [website](https://docs.docker.com/get-docker/)

**NOTE: If you are running on a Mac you should adjust your memory and cpu allocations as the default will be to low**

Finally, run the setup script.

```bash
./scripts/setup.sh
```

### Step Four: Starting All Services

Run `docker-compose up -d` from your terminal to start all of the services.

As many services are being booted up at the same time in this step, your host might
have a hard time allocating resources. If you run into issues, try
`docker-compose up -d` one more time.

### Step Five: Installing the ssl certificate

** TODO: add ssl instructions**

## Step Six: Login

** TODO: verify login**

## Mocking specific stack dependencies

## Running a partial stack

## Adding a new Service
