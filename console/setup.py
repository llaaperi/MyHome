#!../env/bin/python

from setuptools import setup, find_packages

setup(	name = 'MyHomeConsole',
		version = '0.0.1',
		description='MyHomeConsole',
		url = 'https://github.com/llaaperi/MyHome',
		author = 'Lauri Laaperi',
		author_email = 'lauri.laaperi@gmail.com',
		license = '',
		packages = find_packages(),
		package_data={'': [
			'templates/*.html',
			'templates/partials/*.html',
			'static/favicon.png',
			'static/css/*',
			'static/fonts/*.ttf',
			'static/js/*.js',
			'static/js/*.map',
			'static/js/app/*.js',
		]},
		include_package_data = True,
		install_requires = [
			'eventlet',
			'flask', 
			'SQLAlchemy',
			'Flask-SQLAlchemy',
			'Flask-HTTPAuth',
			'Flask-Login',
			'Flask-WTF',
			'Flask-Restplus',
			'flask-socketio',
			'psycopg2',
			'passlib',
			'requests'
		]
)
