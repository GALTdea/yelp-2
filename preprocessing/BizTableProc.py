
import json
#import util
import collections
import numpy as np
import csv


resultFile = open("business.csv",'w')
wr = csv.writer(resultFile)

jsonIn = '../../yelp_dataset/yelp_academic_dataset_business.json'

y = 0
x = 0
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
        fullAddress = obj['full_address']
        city = obj['city']
        state = obj['state']
        latitude = obj['latitude']
        longitude = obj['longitude']
        open1 = obj['open']
        if(state == "NV" and open1):
            wr.writerow([businessId,name,fullAddress,city,state,latitude,longitude])
