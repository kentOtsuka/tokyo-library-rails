require 'csv'

csv = CSV.read('db/fixtures/csv/administrations.csv')
i = 1

csv.each do |line|
  id = i
  name = line[0]
  homepage = line[1]
  i += 1

  Administration.seed(:id) do |s|
    s.id = id
    s.name = name
    s.homepage = homepage
  end
end
