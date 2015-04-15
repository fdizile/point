# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.create(
	name: 'Corey Pyle', 
	email: 'cpyle@alumni.flagler.edu', 
	school_id: 1, 
	password: 'foobar', 
	password_confirmation: 'foobar', 
	admin: true)

Computer.create( 
	school_id: 1, 
	acpsnumber: '025334', 
	bpinumber: '112983', 
	make: 'Dell', 
	computer_model: 'Optiplex 755', 
	os: 'Windows XP', 
	category: 'Student', 
	room: '01-022', 
	servicetag: 'JPQ3212',
	username: 'Corey',
	status: 'Active')


School.create(
	id: 1, 
	abbreviation: 'BHS',
	name: 'Buchholz High School',
	phone: '352-955-6702',
	address: '5510 NW 27th Ave. Gainesville, FL 32606')

