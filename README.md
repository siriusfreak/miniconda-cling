# Docker image for miniconda with cling

Usage:

1. Edit file ```create_users.sh``` jupyterhub users.
2. Make directories for users in ```users_home```
3. ```docker build -t miniconda-cling .```
4. Then simply run by docker-compose: ```docker-compose up -d```
5. JupiterHub using port ```8666```, nbviewer ```8777``` and files from home folder of public user. 

And connect to Jupiter notebook server by port 8666 (you may change it in docker-compose file).
