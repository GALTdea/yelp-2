
import json
import csv
import collections
import numpy as np


bizpath = '../../yelp_dataset/yelp_academic_dataset_business.json'


resultFile = open("busCat.csv",'w')
wr = csv.writer(resultFile)

#biz_cat = {}
attrOpts = collections.Counter()
attrOptsBool = collections.Counter()
attrOptsDig = collections.Counter()
attrOptsUC = collections.Counter()
attrOptsDict = collections.Counter()

priceOpts = set()
ambianceOpts = set()
alcOpts = set()

count = 0
with open(bizpath) as biz_data:
    for line in biz_data:

        json_biz = json.loads(line)
        businessId = json_biz['business_id'].encode('utf-8','replace')
        

        attrAll = json_biz["attributes"]
        for attr in attrAll:

            objType = type(attrAll[attr])

            if objType == bool:
                attrOptsBool[attr] = attrOptsBool[attr] + 1
            elif objType == unicode:
                #u'Alcohol': 20457, u'Attire': 20390, u'Noise Level': 18519, u'Wi-Fi': 17898
                #all others low
                if(attr == u'Alcohol'):
                    alcOpts.add(attrAll[attr])
                attrOptsUC[attr] = attrOptsUC[attr] + 1
            elif objType == int: 
                #price range only
                attrOptsDig[attr] = attrOptsDig[attr] + 1
                priceOpts.add(attrAll[attr])
            elif objType == dict:
                #u'Parking': 37967, u'Good For': 19288, u'Ambience': 18547
                #all the rest have low counts anyway
                attrOptsDict[attr] = attrOptsDict[attr] + 1
                if(attr == u'Ambience'):
                    for opt in attrAll[attr]:
                        ambianceOpts.add(opt)
            else:
                print attr

            attrOpts[attr] = 1



print len(attrOpts)
print len(attrOptsBool)
print len(attrOptsDig)
print len(attrOptsUC)
print len(attrOptsDict)

print priceOpts
print ambianceOpts
print alcOpts



