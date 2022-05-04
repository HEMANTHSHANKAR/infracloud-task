PART 1

create a workdir. 

cd into workdir.

pull the image using `docker pull infracloudio/csvserver:latest`  

run the docker image using `docker run infracloudio/csvserver:latest` 

> (error will be a missing file in the given filepath)

Write a bash script gencsv.sh to generate a file named inputFile whose content looks like:\
0, 234\
1, 98\
2, 34

**or**

paste the following script into gencsv.sh
```
#!/bin/bash

randomnumbers=${1:-10} 
for i in $(seq 0 $randomnumbers);
do echo "$i, $((1 + $RANDOM % 100000))";
done > inputFile
```
and to run the script follow below steps

```
chmod +x gencsv.sh
./gencsv.sh 
```
after running the script `inputFile` will be created and it will have index and a random number in each line separated by comma 

to confirm you can try `cat inputFile` 

now run the container again in the background with `inputFile` available inside the container 

```docker run --volume = $(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest```

to find the port on which the application is listening. use `exec`docker command to gain shell access to the container

``` docker exec -it <container id> /bin/sh```

once your inside container run

`netstat -an` or `netstat -tulnp`

now stop / delete the running container using

```docker rm -f <container id>```

once you know the container port, map it to the host port using `-p` and set environment variably using `-e`

``` 
docker run --volume=$(pwd)/inputFile:csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER='Orange' infracloudio/csvserver:latest 
```

The application should be accessible at http://localhost:9393, it should have the 10 entries from inputFile and the welcome note should have an orange color border.
