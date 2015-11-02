#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import argparse
import traceback
import os

def main():

    CONFIG = os.environ.get('CONFIG','--NOT SET--')
    DEBUG = os.environ.get('DEBUG','--NOT SET--')

    parser = argparse.ArgumentParser(description='Sensor Collector')
    parser.add_argument('-C', '--config', default=CONFIG, help='Path to config file')
    parser.add_argument('-D', '--debug', default=DEBUG, help='Output debug information')
    parser.add_argument('-p', '--port', default=8080, help='Server port')
    args = parser.parse_args()

    print "config path: %s" %args.config
    print "debug? %s" %args.debug
    print "port? %s" %args.port



if __name__ == '__main__':
    try:
        main()
        sys.exit(0)
    except KeyboardInterrupt, e:
        raise e
    except SystemExit, e:
        raise e
    except Exception, e:
        print str(e)
        traceback.print_exc()
        sys.exit(1)
