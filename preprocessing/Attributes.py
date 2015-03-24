
import json
import csv
import collections



bizpath = '../../yelp_dataset/yelp_academic_dataset_business.json'


resultFile = open("busAttr.csv",'w')
wr = csv.writer(resultFile)


mappings = {u'Accepts Credit Cards':1, 
u'Caters':2, 
u'Delivery':3, 
u'Good For Dancing':4,
u'Good For Groups':5,
u'Good for Kids':6,
u'Good For Kids':6,
u'Outdoor Seating':7,
u'Take-out':8,
u'Takes Reservations':9,
u'Waiter Service':10,
u'Wheelchair Accessible':11,
u'Alcohol':12,
u'Parking':13,
u'Wi-Fi':14
}

ambianceMappings = {u'casual':20,
u'classy':21,
u'divey':22,
u'hipster':23,
u'intimate':24,
u'romantic':25,
u'touristy':26,
u'trendy':27,
u'upscale':28
}

attireMappings = {u'casual':30,
u'dressy':31,
u'formal':32
}

goodForMappings = {
u'breakfast':40,
u'brunch':41,
u'dessert':42,
u'dinner':43,
u'latenight':44,
u'lunch':45
}

noiseMappings = {
u'average':50,
u'quiet':51,
u'loud':52,
u'very_loud':53,
}

priceMappings = {
1:60,
2:61,
3:62,
4:63,
}

with open(bizpath) as biz_data:
    for line in biz_data:

        json_biz = json.loads(line)
        businessId = json_biz['business_id'].encode('utf-8','replace')


        attrAll = json_biz["attributes"]
        for attr in attrAll:

            objType = type(attrAll[attr])

            if objType == bool:
                if(attr in mappings):
                    wr.writerow([businessId, mappings[attr]])
            #num/unicode types
            elif attr ==  u'Alcohol':
                #convert to bool
                if(attrAll[attr] == u'beer_and_wine'):
                    wr.writerow([businessId, mappings[attr]])
                elif(attrAll[attr] == u'full_bar'):
                    wr.writerow([businessId, mappings[attr]])
            elif attr ==  u'Noise Level':
                wr.writerow([businessId, noiseMappings[attrAll[attr]]])
            elif attr ==  u'Parking':
                #convert to bool
                wr.writerow([businessId, mappings[attr]])
            elif attr ==  u'Attire':
                wr.writerow([businessId, attireMappings[attrAll[attr]]])
            elif attr ==  u'Price Range':
                wr.writerow([businessId, priceMappings[attrAll[attr]]])
            elif attr ==  u'Wi-Fi':
                 #convert to bool
                if(attrAll[attr] == u'free'):
                    wr.writerow([businessId, mappings[attr]])
                elif(attrAll[attr] == u'paid'):
                    wr.writerow([businessId, mappings[attr]])
            
            #dictionary types
            elif attr ==  u'Good For':
                for gf in attrAll[attr]:
                    if attrAll[attr][gf]:
                        wr.writerow([businessId, goodForMappings[gf]])
            elif attr ==  u'Ambience':
                for gf in attrAll[attr]:
                    if attrAll[attr][gf]:
                        wr.writerow([businessId, ambianceMappings[gf]])





