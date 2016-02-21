#!/usr/bin/env python

from setuptools import setup, find_packages

setup(	name = 'MyHomeBackdoor',
		version = '0.0.1',
		description='MyHomeBackdoor',
		url = 'https://github.com/llaaperi/MyHome',
		author = 'Lauri Laaperi',
		author_email = 'lauri.laaperi@gmail.com',
		license = '',
		packages = find_packages(),
		package_data={'': []},
		include_package_data = True,
		install_requires = [
			'uwsgi',
			'flask', 
			'SQLAlchemy',
			'Flask-SQLAlchemy',
			'Flask-HTTPAuth',
			'Flask-Login',
			'Flask-WTF',
			'Flask-Restplus',
			'psycopg2',
			'passlib',
			'netifaces'
		]
)
