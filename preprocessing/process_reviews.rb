require 'json'
require 'csv'

# Returns the JSON from :file.
def get_file(file)
  arr = []
  File.open(file, "r").each_line do |line|
   arr << JSON.parse(line)
  end
  arr
end

# Saves :data to :file as CSV.
def save(data, file)
  CSV.open(file, 'w') do |csv|
    csv << data.first.keys
    data.each do |row|
      csv << row.values
    end
  end
end

# Cleans :data.
def clean(data)
  data.map do |x|
    {
      'review_id' => x['review_id'],
      'business_id' => x['business_id'],
      'stars' => x['stars'],
      'date' => x['date'],
      'text' => x['text'].gsub("\n", ' ')
    }
  end
end

# Main method.
def main
  file = ARGV[0]
  data = clean(get_file(file))
  save(data, 'review.csv')
end

main

