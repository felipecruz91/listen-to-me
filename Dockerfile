FROM cgr.dev/chainguard/python
WORKDIR /src
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . ./
EXPOSE 8080
ENTRYPOINT ["cgr.dev/chainguard/python3", "app.py"]
