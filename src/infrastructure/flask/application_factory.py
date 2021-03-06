from flask import Flask

from infrastructure.flask.routes import app_routes


def create() -> Flask:
    application = Flask('flask-api')

    application.register_blueprint(app_routes)

    return application
