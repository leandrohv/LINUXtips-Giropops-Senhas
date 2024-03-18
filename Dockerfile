FROM ubuntu:22.04 as Builder

RUN apt-get update && \ 
	apt-get install pip git -y && \ 
	apt-get clean && \ 
	rm -rf /var/lib/apt/lists/*

COPY ./giropops-senhas /giropops-senhas

WORKDIR /giropops-senhas

RUN echo "\nWerkzeug==2.2.2" >> requirements.txt 
 
RUN sed -i 's/Flask==2.1.1/Flask==2.2.2/g' requirements.txt && pip install --no-cache-dir -r requirements.txt

ENV REDIS_HOST redis

EXPOSE 5000

CMD ["flask", "run", "--host", "0.0.0.0"]
