#!../env/bin/python

from datetime import timedelta
from flask import Flask, request, render_template
from flask.ext.socketio import SocketIO, emit, send
from threading import Thread, Event
import time
import eventlet

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app, async_mode='eventlet')

import backdoor

eventlet.monkey_patch()

thread = None

def background_thread():
	"""Example of how to send server generated events to clients."""
	count = 0
	while True:
		time.sleep(2)
		try:
			socketio.emit('status', backdoor.get_status(), namespace='/status')
		except:
			socketio.emit('status', None, namespace='/status')


@app.route('/')
def index():
	return render_template('index.html')

@socketio.on('connect', namespace='/status')
def test_connect():
	print 'Connect'
	global thread
	if thread is None:
		thread = Thread(target=background_thread)
		thread.daemon = True
		thread.start()

@socketio.on('disconnect', namespace='/status')
def test_disconnect():
	print('Client disconnected')
