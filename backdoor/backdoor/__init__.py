#!/usr/bin/env python

from flask import Flask, Blueprint
from flask.ext.restplus import Api

app = Flask(__name__)

app.config['RESTPLUS_MASK_SWAGGER'] = False #Disables fields masks, http://flask-restplus.readthedocs.org/en/stable/mask.html
app.config['SWAGGER_UI_DOC_EXPANSION'] = 'list' #Intitial documentation expansion state (none, list or full), http://flask-restplus.readthedocs.org/en/stable/swaggerui.html

blueprint = Blueprint('api', __name__, url_prefix='/api')
#Disable documentation UI with "doc=False"
api = Api(blueprint, version='1.0', title='Vekarus API', description='' , doc='/')
app.register_blueprint(blueprint)

import power
import status
