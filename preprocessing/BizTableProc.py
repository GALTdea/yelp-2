
import json
#import util
import collections
import numpy as np
import csv


resultFile = open("businesses.csv",'w')
wr = csv.writer(resultFile, delimiter='|')


# creates biz_hash
biz_cat = {}
#categoryOptsDict = util.Counter()

x=0

#jsonIn = '../yelp_dataset/yelp_academic_dataset_business.json'
jsonIn = '/Users/mvm/Documents/yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_business.json'

dataArray = []

y = 0
with open (jsonIn) as data_file:
    for line in data_file:

        x = x+1
        if x % 10000 == 0:
            print x

    #    y = y + 1
    #    if(y > 10000):
    #        break

        obj = json.loads(line)
        
        businessId = obj['business_id'].encode('utf-8','replace')
        name = obj['name'].encode('utf-8','replace')

        fullAddress = obj['full_address'].encode('utf-8','replace').replace('\n', ' ')

        city = obj['city'].encode('utf-8')
        state = obj['state'].encode('utf-8')
        latitude = obj['latitude']
        longitude = obj['longitude']
        open1 = obj['open']
        if open1:
            wr.writerow([businessId,name,fullAddress,city,state,latitude,longitude])
