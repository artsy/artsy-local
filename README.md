# artsy-local

This repo contains the necessary docker-compose configurations to run everything
Artsy on your local machine in Docker.

### Step One: Clone the **artsy-local** git repo:

```bash
$ git clone git@github.com:artsy/artsy-local.git
```

### Step Two: Run Setup

To ease setup, you can simply execute the script below. If Docker for Mac isn't
already installed, this will automatically install it, then
**prompt you to adjust the memory/cpu allocation**.

**TODO: Add script**

### Step Three: Environment Configuration

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

### Step Four: Starting All Services

As many services are being booted up at the same time in step 3, your host might
have a hard time allocating resources. If you ran into issues, try
`docker-compose up -d` one more time after a couple minutes.

### Step Five: Installing the ssl certificate

** TODO: add ssl instructions**

## Step Six: Login

** TODO: verify login**

## Mocking specific stack dependencies


## Running a partial stack

## Adding a new Service
