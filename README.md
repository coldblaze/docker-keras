## Docker image for Keras

### Run docker 
First of all, check configuration in 'docker-keras.sh' file.

$ bash ./docker-keras.sh [pull|run|stop] 

### Jupyter Notebook

You can access Jupyter Notebook with your browser and the URL is on the terminal(http://localhost:8888/?token=xxxx...).

### Tensorboard

If you want to use tensorboard, you can use ssh connection and run tensorboad.

$ bash ./ssh_connect.sh

root's password is 'root'.

$ tensorboard --logdir=./grpah

and access http://localhost:6006

Enjoy.
