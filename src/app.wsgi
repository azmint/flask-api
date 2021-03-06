import sys
sys.path.insert(0, '/opt/www/.venv/lib/python3.7/site-packages')
sys.path.insert(0, '/opt/www/src')

import os
# Change working directory so relative paths (and template lookup) work again
os.chdir(os.path.dirname(__file__))

from app import app as application