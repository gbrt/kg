#!/usr/bin/python
import requests
import argparse
from operator import itemgetter

parser = argparse.ArgumentParser()
parser.add_argument('-a','--abv', help='Minimum Alcohol by Volume', required=True)
args = parser.parse_args()


originalList = requests.get("https://api.punkapi.com/v2/beers").json()
sortedList = sorted(originalList, key=itemgetter('abv'), reverse=True) 

for beer in sortedList:
	if beer['abv'] >= int(args.abv):
		print(beer['name'] + "," + str(beer['abv']));
