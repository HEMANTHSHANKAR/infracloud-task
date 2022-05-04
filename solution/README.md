PART 1

#1
docker run infracloudio/csvserver:latest

#3
nano gencsv.sh
chmod +x gencsv.sh
./gencsv.sh 
./gencsv.sh 100

#4
docker run --volume = ${pwd}/inputFile:csvserver/inputdata <image id>

#5
netstat -an
netstat -tulnp

#6
docker run --volume=${pwd}/inputFile:csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER='Orange' <image id>


