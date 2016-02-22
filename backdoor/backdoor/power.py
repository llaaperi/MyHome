#!/usr/bin/env python

import os
from flask.ext.restplus import Resource, fields

from . import api

ns = api.namespace('power', 'Power')

@ns.route('/')
class Power(Resource):

	@api.doc(description='Reboot')
	def put(self):
		'''Reboot'''
		os.system("sudo reboot")
		return True

	@api.doc(description='Shutdown')
	def delete(self):
		'''Shutdown'''
		os.system("sudo shutdown -h now")
		return True
