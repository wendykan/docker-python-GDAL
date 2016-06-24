
# in the same folder as Dockerfile
docker build -t "gdal-python" .

# then run it with mounting the data folder
docker run -v /Users/wendy/git/KaggleCompetitions/DigitalGlobe/BEE-CSharp/data/:/data -it gdal-python /bin/bash


# run jupyter notebook
docker run -v /Users/wendy/git/KaggleCompetitions/DigitalGlobe/BEE-CSharp/data/:/data -p 8888:8888 --rm -it gdal-python sh -c "ipython notebook --ip=0.0.0.0 --no-browser"

# with anaconda
# this sort of worked until I wanted tifffile
docker run -v /Users/wendy/git/KaggleCompetitions/DigitalGlobe/BEE-CSharp/data/:/data -p 8888:8888 --rm -it gdal-python /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && /opt/conda/bin/jupyter notebook --ip=0.0.0.0 --no-browser"

# with anaconda and install tifffile
# this didn't really work the way I wanted
docker run -v /Users/wendy/git/KaggleCompetitions/DigitalGlobe/BEE-CSharp/data/:/data -p 8888:8888 --rm -it gdal-python \
    /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && pip install tifffile && /opt/conda/bin/jupyter notebook --ip=0.0.0.0 --no-browser"
