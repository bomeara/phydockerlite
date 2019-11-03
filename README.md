# phydocker

For most users you first want to install docker.

Then in a command window (i.e., using a terminal program (on a Mac, in /Applications/Utilities/Terminal.app):

`docker run -v ~/Desktop:/data -e PASSWORD=mypassword -p 8787:8787 bomeara/phydockerlite`

Then you can go to http://localhost:8787 in your web browser to run it; log in as `rstudio` with password `mypassword`. Replace `~/Desktop` with the full path to the folder where you have files (i.e., `/Users/jsmith/Documents/Chapter1`). You can keep it `~/Desktop`, it'll then have your desktop present as the `/data` directory in Docker (i.e., in R, you can do `save(ape::rcoal(10), file="/data/random.tre")` and it'll save a random tree to your desktop. When you're done, you can kill the process with control+C.

## Advanced

If you want to run on the command line instead (i.e., from inside Terminal on a Mac) you can do

`docker run -it -v ~/Desktop:/data bomeara/phydockerlite /bin/bash`

You can then use any installed programs included in the build (not much in the lite version; see phydocker for more programs) without having to go through installation.  `exit` command when done.

## Building

For building this from scratch (not most users). Download (or clone) the github directory and then build:

`docker build -t bomeara/phydockerlite .`

Or if you want to not use the cached images:

`docker build --no-cache -t bomeara/phydockerlite .`

To push to docker hub

`docker push bomeara/phydockerlite`
