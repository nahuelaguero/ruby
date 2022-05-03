# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding...'

Organization.create(name: 'ONU')
Organization.create(name: 'MEC')
Organization.create(name: 'IPS')

Person.create(
  name: 'John',
  last_name: 'Doe',
  is_supervisor: 'false'
)

Person.create(
  name: 'Jane',
  last_name: 'Doe',
  is_supervisor: 'true'
)

Project.create(
  name: 'HB Heathcare',
  organization_id: '1',
  status: 'In progress',
  person_id: '1',
  budget_id: '1',
  department_id: '1',
  office_id: '1',
  description: 'Honey Badger',
  start_date: '10/10/2021',
  end_date: '12/12/2021'
)

Project.create(
  name: 'HB Heathcare2',
  organization_id: '1',
  status: 'On hold',
  person_id: '2',
  budget_id: '2',
  department_id: '2',
  office_id: '2',
  description: 'Honey Badger2',
  start_date: '10/10/2021',
  end_date: '12/12/2021'
)
puts 'Seeded project...'

Budget.create(
  amount: '300000',
  organization_id: '1'
)

Budget.create(
  amount: '400000',
  organization_id: '2'
)

Budget.create(
  amount: '500000',
  organization_id: '3'
)

Department.create(
  name: 'QA',
  organization_id: '1'
)

Department.create(
  name: 'Cleaning',
  organization_id: '1'
)

Department.create(
  name: 'Security',
  organization_id: '2'
)

Department.create(
  name: 'Finance',
  organization_id: '2'
)

Office.create(
  name: 'Sofia Building',
  organization_id: '1'
)

Office.create(
  name: 'Varna Building',
  organization_id: '1'
)

Office.create(
  name: 'Asuncion Building',
  organization_id: '2'
)

Office.create(
  name: 'Luque Building',
  organization_id: '2'
)

Office.create(
  name: 'Minnesota Building',
  organization_id: '3'
)

puts 'Seeding done!'
