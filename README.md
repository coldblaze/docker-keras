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

You need XWindow system(like XQuartz for macOS or XWindow desktop manager for Linux) on your computer.

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

### tightvncserver for X11 using on Windows

Sorry. It's not convenient to use. Make ssh connection to container.
```bash
root@keras:~# vncserver

You will require a password to access your desktops.

Password:(Enter your password for vnc connction)
Verify:(The password again)
Would you like to enter a view-only password (y/n)? n

New 'X' desktop is keras:1

Starting applications specified in /root/.vnc/xstartup
Log file is /root/.vnc/keras:1.log
```

Then kill the vncserver.

```bash
root@keras:~# vncserver -kill :1
```

Edit `~/.vnc/xstartup` file.
```bash
#!/bin/sh
  
xrdb $HOME/.Xresources
xsetroot -solid grey
xterm &
openbox &
export XKL_XMODMAP_DISABLE=1
/etc/X11/Xsession
```

And start up the vncserver again.

```bash
root@keras:~# vncserver
```

On Windows, Download putty and vnc viwer.

Run putty and Click on “Change Settings”–> Connection –> SSH –> Tunnels. In “Add new forwarded port” –> Enter source port as 5901 and Destination as localhost:5901. Click on Add button and Click on Apply button. Then, save the session.

Do not close the putty ssh connection window, Open VNC viewer and connect to localhost:1

Enjoy.
