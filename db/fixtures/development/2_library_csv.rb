require 'csv'

csv = CSV.read('db/fixtures/csv/libraries.csv')
i = 1

csv.each do |line|
  id = i
  administration_id = line[0]
  name = line[1]
  phone_number = line[2]
  post_code = line[3]
  address = line[4]
  open_time = line[5]
  close_time = line[6]
  opening_details = line[7]
  closed_body_first = line[8]
  closed_body_second = line[9]
  seats = line[10]
  lat = line[11]
  lng = line[12]
  i += 1

  Library.seed(:id) do |s|
    s.id = id
    s.administration_id = administration_id
    s.name = name
    s.phone_number = phone_number
    s.post_code = post_code
    s.address = address
    s.open_time = open_time
    s.close_time = close_time
    s.opening_details = opening_details
    s.closed_body_first = closed_body_first
    s.closed_body_second = closed_body_second
    s.seats = seats
    s.lat = lat
    s.lng = lng
  end
end
