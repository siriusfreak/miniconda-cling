# Docker image for miniconda with cling

Usage:

```docker build -t miniconda-cling```

Then simply run by docker-compose:

```docker-compose up```

And connect to Jupiter notebook server by port 8666 (you may change it in docker-compose file). You will be able to see access token in docker-compose output.

All notebooks files located in notebooks folder.