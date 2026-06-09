#harmon u
# 2026/6/8
# server code for the laptop to run


from flask import Flask, request
import os

app = Flask(__name__)

SECRET = "insert_secret_here"

@app.route("/shutdown")
def shutdown():

    token = request.args.get("token")

    if token != SECRET:
        return "Unauthorized", 401

    os.system("shutdown /s /t 0")

    return "Shutting down..."

@app.route("/")
def home():
    return "Server running"

app.run(host="0.0.0.0", port=5000)