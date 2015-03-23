require 'json'
require 'csv'

# To run: ruby process_reviews.rb ...yelp_academic_dataset_review.json ...review.csv

# Returns the JSON from :file.
def process_file(file1, file2)
  CSV.open(file2, 'w', {:col_sep => "\t"}) do |csv|
  File.open(file1, "r").each_line do |line|
    x = JSON.parse(line)
    y = {}
    y['review_id'] = x['review_id']
    y['business_id'] = x['business_id']
    y['stars'] = x['stars']
    y['date'] = x['date']
    y['text'] = x['text'].gsub("\n", ' ').gsub("\t", ' ')
    csv << y.values
  end
  end
end

# Main method.
def main
  file1 = ARGV[0]
  file2 = ARGV[1]
  process_file(file1, file2)
end

main

