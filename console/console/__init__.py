#!/usr/bin/env python

from flask import Flask, render_template

app = Flask(__name__)

import status

@app.route('/')
def index():
	return render_template('index.html', status=status.get_status())
