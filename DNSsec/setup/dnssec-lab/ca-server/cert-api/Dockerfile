FROM python:3.12-alpine
RUN pip install --no-cache-dir flask==3.0.3
WORKDIR /app
COPY app.py /app/app.py
EXPOSE 9443
CMD ["python","/app/app.py"]
