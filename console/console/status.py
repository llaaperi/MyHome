#!/usr/bin/env python

import requests

def get_status():
	res = requests.get('http://localhost:50001/api/status/')
	return res.json()
