require 'csv'

csv = CSV.read('db/fixtures/csv/libraries_services.csv')
i = 1

csv.each do |line|
  id = i
  service_id = line[0]
  library_id = line[1]
  i += 1

  LibrariesService.seed(:id) do |s|
    s.id = id
    s.service_id = service_id
    s.library_id = library_id
  end
end
