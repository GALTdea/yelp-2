import json

#place this file in same directory as "yelp_academic_dataset_business.json"

with open('hours_parsed.csv', 'w') as f:
	with open("yelp_academic_dataset_business.json") as data_file:    

		for line in data_file:

			data = json.loads(line)

			for day in data['hours']:

				#bizid, opening, day, hour
				f.write(data['business_id'] + "\tT\t" + day + "\t" + data['hours'][day]['open'] + "\n")
				f.write(data['business_id'] + "\tF\t" + day + "\t" + data['hours'][day]['close'] + "\n")



