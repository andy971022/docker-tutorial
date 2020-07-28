# Brief
This is a no-bullshit guide to running your first Docker application. 

# Source Code
[https://github.com/andy971022/docker-tutorial](https://github.com/andy971022/docker-tutorial)

# Environment
- Ubuntu 18.04

# Steps
1. Setting up Your Docker
2. Configuring Your Own DockerFile/ Writing Your Own Docker Image
3. Building Your Docker Image
4. Running Your Image as a Container

# Step 1 : Setting up Your Docker

Install Docker via the following command:

`sudo snap install docker`

Check if your docker is installed properly by running:

`docker run hello-world`

You might encounter the following issue,
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/503314/7f104874-0843-a381-ccaa-e32070118648.png)

and a quick solution to this is by changing the file permission of  `/var/run/docker.sock` by

`sudo chmod 666 /var/run/docker.sock`

You should get the following message if everything works smoothly.

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/503314/72c4ad7c-39ce-972e-655b-6a2a88519817.png)

# Step 2 : Configuring Your Own DockerFile/ Writing Your Own Docker Image

`Dockerfile`

``` docker
FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install python -y

COPY ./hello.txt /root/hello.txt

ENTRYPOINT cat ~/hello.txt
```

- Words in caps are Docker instructions.

- All Dockerfiles must start with a `FROM` instruction pointing to an OS or another image.

- The `RUN` instruction runs its succeeding command inside the Docker image. 

- The `COPY` command copies files from the local machine to the Docker image.

- The `ENTRYPOINT` is the first command that'll be run when a container is instantiated.
YOU

# Step 3 : Building Your Docker Image

`docker build . -t test`

When you finish running the above command, you should see the following output.

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/503314/75ad36e8-bc46-8c87-0ed1-211ef0c495fb.png)

Run

`docker images`

to see if your image is registered or not.

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/503314/24ef8e02-33a4-0a69-02ac-7d01061eeaae.png)

Seems like our image has been built successfully.

# Step 4 : Running Your Image as a Container

`docker run test`

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/503314/36ac35ed-e762-2134-6b2a-41a09a0faf5b.png)

Indeed, our Docker container has been successfully instantiated.
