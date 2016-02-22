#!../env/bin/python
from console import app, socketio
#app.run(port=8080, debug=True)
socketio.run(app, port=8080, debug=True)
