from infrastructure.flask import application_factory

app = application_factory.create()

if __name__ == '__main__':
    app.run('localhost', 8080)
