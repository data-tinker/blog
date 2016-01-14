#!/usr/bin/env python
from flask import Flask, request, redirect, url_for, send_from_directory, render_template, jsonify
from datetime import date
from urlparse import urlparse, urlunparse

app = Flask(__name__)

@app.route('/year_count')
def year_count():
    return render_template('year_count.html')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/tutorial')
def tutorial():
    return redirect('http://178.79.163.43:5000', code=302)

@app.route('/static/<path:path>')
def send_static():
    return app.send_static_file(path)

if __name__ == '__main__':
    app.run(host='::', port=8080, debug=True)
