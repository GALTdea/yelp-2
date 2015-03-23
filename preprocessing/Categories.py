
import json
import csv
import collections
import numpy as np


bizpath = '../../yelp_dataset/yelp_academic_dataset_business.json'


resultFile = open("busCat.csv",'w')
wr = csv.writer(resultFile)

#biz_cat = {}
#categoryOptsDict = collections.Counter()

mappings = {u'Restaurants':1, 
u'Shopping':2, 
u'Fashion':2, 
u'Beauty & Spas':3, 
u'Nail Salons':3,
u'Hair Salons':3,
u'Arts & Entertainment':4,
u'Bars':5, 
u'Nightlife':5, 
u'Food':7,
u'Grocery':7, 
u'Specialty Food':7,
u'Fast Food':8, 
u'Pizza':9, 
u'Mexican':10, 
u'American (Traditional)':11,
u'American (New)':11, 
u'Chinese': 12, 
u'Italian':13,
u'Sandwiches':14,
u'Burgers':15,
u'Coffee & Tea':16,
u'Breakfast & Brunch':17
}


count = 0
with open(bizpath) as biz_data:
    for line in biz_data:

        json_biz = json.loads(line)
        businessId = json_biz['business_id'].encode('utf-8','replace')
        for cat in json_biz["categories"]:
            if(cat in mappings):
                wr.writerow([businessId, mappings[cat]])

'''     if u'Restaurants' in json_biz["categories"]:
            biz_cat[json_biz["business_id"]]  = "Restaurants"
        elif u'Shopping' in json_biz["categories"]:
            biz_cat[json_biz["business_id"]]  = "Shopping"
        elif u'Food' in json_biz["categories"]:
            biz_cat[json_biz["business_id"]]  = "Restaurants"
        elif u'Beauty & Spas' in json_biz["categories"]:
            biz_cat[json_biz["business_id"]]  = "Wellness"
        elif u'Automotive' in json_biz["categories"]:
            biz_cat[json_biz["business_id"]]  = "Services"
        elif u'Health & Medical' in json_biz["categories"]:
            biz_cat[json_biz["business_id"]]  = "Wellness"
        elif u'Home Services' in json_biz["categories"]:
            biz_cat[json_biz["business_id"]]  = "Services"
        elif u'Nightlife' in json_biz["categories"]:
            biz_cat[json_biz["business_id"]]  = "Restaurants"
        elif u'Local Services' in json_biz["categories"]:
            biz_cat[json_biz["business_id"]]  = "Services"
        elif u'Active Life' in json_biz["categories"]:
            biz_cat[json_biz["business_id"]]  = "Wellness"
        else:
            biz_cat[json_biz["business_id"]]  = "Other" '''







