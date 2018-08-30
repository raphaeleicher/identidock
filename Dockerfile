FROM python:3.4

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
#RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org Flask==0.10.1 uWSGI requests==2.5.1
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org Flask uWSGI requests redis
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]

