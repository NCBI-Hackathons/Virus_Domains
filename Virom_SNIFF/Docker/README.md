For each of the executables in the pipeline, we create a separate Docker container.

#Spades:
Spades already has a docker from biodckdev. To execute you need to mount a volume containing the files for analysis.

sudo docker pull biodckrdev/spades:latest
sudo docker run --rm -it -v /$DATA_DIR:/$DOCKER_DATA_DIR biodckrdev/spades


#MMSeq2

### Docker tutorials: 

* [How to use/run a Docker image](https://github.com/NCBI-Hackathons/Cancer_Epitopes_CSHL/blob/master/doc/Docker.md)
