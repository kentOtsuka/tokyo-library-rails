require 'csv'

csv = CSV.read('db/fixtures/csv/services.csv')
i = 1

csv.each do |line|
  id = i
  name = line[0]
  i += 1

  Service.seed(:id) do |s|
    s.id = id
    s.name = name
  end
end
