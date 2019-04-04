## Docker image for Keras

### Run docker 
First of all, check the configuration in `docker-keras.sh` file.

```bash
$ bash ./docker-keras.sh [pull|run|stop] 
```

### Jupyter Notebook

You can access Jupyter Notebook with browser, the URL is on the terminal(http://localhost:8888/?token=xxxx...).

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
# hello.py
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

Enjoy.
