from flask import Flask

app = Flask('flask-api')


@app.route('/')
def home():
    return 'home'


if __name__ == '__main__':
    app.run('localhost', 8080)
