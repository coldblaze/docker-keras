Docker image for Keras

First of all, check configuration in 'docker-keras.sh' file.

$ bash ./docker-keras.sh [pull|run|stop] 

You can access Jupyter Notebook with your browser and the URL is on the terminal(http://localhost:8888/?token=xxxx...).
If you want to use tensorboard, you can use ssh connection and run tensorboad.

$ bash ./ssh_connect.sh

root's password is 'root'.
