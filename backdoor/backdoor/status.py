#!/usr/bin/env python

import netifaces
import datetime
from flask.ext.restplus import Resource, fields

from . import app, api

ns = api.namespace('status', 'Status')

status_model = api.model('Status',{
	'addr': fields.String(default='Unknown'),
	'netmask': fields.String(default='Unknown'),
	'gateway': fields.String(default='Unknown'),
	'interface': fields.String(default='Unknown'),
	'time': fields.String()
})

@ns.route('/')
class Status(Resource):

	@api.marshal_with(status_model)
	@api.doc(description='Status')
	def get(self):
		ifaces = netifaces.interfaces()

		addrs = None
		if 'en0' in ifaces:
			addrs = netifaces.ifaddresses('en0')
		if 'eth0' in ifaces:
			addrs = netifaces.ifaddresses('eth0')

		status = {}
		if addrs is not None and len(addrs[netifaces.AF_INET]) > 0:
			status['addr'] = addrs[netifaces.AF_INET][0].get('addr')
			status['netmask'] = addrs[netifaces.AF_INET][0].get('netmask')

		gw = netifaces.gateways().get('default')
		if gw is not None:
			addr, iface = gw[netifaces.AF_INET]
			status['gateway'] = addr
			status['interface'] = iface

		status['time'] = datetime.datetime.now()

		return status
