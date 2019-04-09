## Docker image for Keras

### Run docker 
First of all, check the configuration in `docker-keras.sh` file.

```bash
$ bash ./docker-keras.sh [pull|run|stop] 
```

### Jupyter Notebook

You can access Jupyter Notebook with browser, the URL is on the terminal(like http://localhost:8888/?token=xxxx...).

### Tensorboard

If you want to use Tensorboard, use ssh connection and run tensorboad.

```bash
$ bash ./ssh_connect.sh
```
root's password is `root`.

```bash
root@keras:/notebook# tensorboard --logdir=./log
```
then access http://localhost:6006

### Flask

```python
# file: /notebook/hello.py

from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
```

Use ssh connection and run flask.
```bash
root@keras:/notebook# python3 hello.py
```

then access http://localhost:5000/


### X11 ssh forwading 

You need XWindow system(like XQuartz for macOS, VNC for MS Windows, or XWindow desktop manager for Linux) on your computer.

Make ssh connection to the container.
```bash
$ bash ./ssh_connect.sh
```
root's password is `root`.

Then test your GUI apps with python3-tk or python3-pyqt5. 

```bash
root@keras:/notebook# python3 surface3d.py
```
The example, surface3d.py is from https://matplotlib.org/gallery/mplot3d/surface3d.html

Enjoy.
