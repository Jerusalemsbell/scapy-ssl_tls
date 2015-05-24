#!/usr/bin/env bash
echo "* checking for virtualenv..."
if [ -d ".env" ]; then  
  echo "**> virtualenv exists"
else  
  echo "**> creating virtualenv"
  virtualenv .env
fi
echo "**> using virtualenv .env"
source .env/bin/activate
echo "* installing requirements..."
pip install -r requirements.txt
pip install nosexcover
echo "* running unittests"
python setup.py nosetests --with-xcoverage --cover-package=scapy_ssl_tls --cover-html --xcoverage-file=cover/cobertura.xml
echo "**> exiting virtualenv"
deactivate
