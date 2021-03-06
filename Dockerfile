# Pythonは公式イメージ
FROM python:3.7.0

# 各ライブラリインストール
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim sudo apache2 libapache2-mod-wsgi-py3

# default.confを修正
RUN rm /etc/apache2/sites-available/000-default.conf
COPY ./apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf

# default.confを修正
COPY ./Pipfile /opt/www/Pipfile
COPY ./Pipfile.lock /opt/www/Pipfile.lock
COPY ./src /opt/www/src

# Pythonライブラリインストール
WORKDIR /opt/www
RUN pip3 install pipenv
ENV WORKON_HOME=/opt/www/.venv
ENV PIPENV_VENV_IN_PROJECT=1
RUN pipenv sync

# Apache起動
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]