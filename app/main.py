from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"message": "Hello from FastAPI + UV + Docker Compose!"}


@app.get("/hello")
def read_hello():
    return {"message": "Hello welcome to the baseline!!"}


@app.get("/health")
def health_check():
    return {"status": "ok"}
