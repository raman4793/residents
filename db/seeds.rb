# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}"))
end

Admin.create!(name: 'admin', email: 'admin@residents.com', password: 'passphrase')

Blood.create!(group: 'AB+')
Blood.create!(group: 'AB-')
Blood.create!(group: 'O+')
Blood.create!(group: 'O-')
Blood.create!(group: 'A+')
Blood.create!(group: 'A-')

a1 = AssociationAdmin.create!(name: 'akhil', email: 'akhil.ml14@gmail.com', password: 'passphrase', blood_id: 1)
a2 = AssociationAdmin.create!(name: 'rakesh', email: 'rakesh.k@gmail.com', password: 'passphrase', blood_id: 2)


a1 = ResidenceAssociation.create!(name: 'Trivandrum Residents Association', description: Faker::Lorem.paragraph(2), subdomain: 'tra', association_admin_id: a1.id, approved: false, logo: seed_image('association.jpg'))
a2 = ResidenceAssociation.create!(name: 'Kochi Residents Association', description: Faker::Lorem.paragraph(2), subdomain: 'kra', association_admin_id: a2.id, approved: false, logo: seed_image('association.jpg'))
# a1.residence_association.create!(name: 'TRA', subdomain: 'tra')
# a1.residence_association.create!(name: 'VRA', subdomain: 'vra')

a1.update(approved: true)
a2.update(approved: true)

5.times do |i|
  no = Faker::Address.building_number
  name = Faker::Address.street_name
  lat = Faker::Address.latitude
  lng = Faker::Address.longitude
  h = a1.houses.create!(no: no, name: name, lat: lat, lng: lng)
  5.times do |j|
    name = Faker::Name.name
    no = Faker::PhoneNumber.phone_number
    blood = rand(1..6)
    email = Faker::Internet.email

    dob = Faker::Date.backward(18000)
    occupation = Faker::Company.profession
    designation = Faker::Lorem.word
    income = rand(10000..50000)
    office_address = Faker::Address.building_number.concat(Faker::Address.street_name)
    mobile = Faker::PhoneNumber.cell_phone
    office_number = Faker::PhoneNumber.phone_number
    residence_number = Faker::PhoneNumber.phone_number
    dp = seed_image('male.png')
    m = h.members.create!(email: email, password: 'passphrase',name: name, no: no, blood_id: blood, dob: dob, occupation: occupation, designation: designation, income: income, office_address: office_address, mobile: mobile, office_number: office_number, residence_number: residence_number, dp: dp)
    n = rand(10..50)
    n.times do |k|
      title = Faker::Lorem.word
      post = Faker::Lorem.paragraph(2)+Faker::Lorem.paragraph(2)+Faker::Lorem.paragraph(2)
      m.blogs.create(title: title, content: post)
    end
  end
end

5.times do |i|
  no = Faker::Address.building_number
  name = Faker::Address.street_name
  lat = Faker::Address.latitude
  lng = Faker::Address.longitude
  h = a2.houses.create!(no: no, name: name, lat: lat, lng: lng)
  5.times do |j|
    name = Faker::Name.name
    no = Faker::PhoneNumber.phone_number
    blood = rand(1..6)
    email = Faker::Internet.email

    dob = Faker::Date.backward(18000)
    occupation = Faker::Company.profession
    designation = Faker::Lorem.word
    income = rand(10000..50000)
    office_address = Faker::Address.building_number.concat(Faker::Address.street_name)
    mobile = Faker::PhoneNumber.cell_phone
    office_number = Faker::PhoneNumber.phone_number
    residence_number = Faker::PhoneNumber.phone_number
    m = h.members.create!(email: email, password: 'passphrase',name: name, no: no, blood_id: blood, dob: dob, occupation: occupation, designation: designation, income: income, office_address: office_address, mobile: mobile, office_number: office_number, residence_number: residence_number, dp: seed_image('male.png'))
    n = rand(10..50)
    n.times do |k|
      title = Faker::Lorem.word
      post = Faker::Lorem.paragraph(2)+Faker::Lorem.paragraph(2)+Faker::Lorem.paragraph(2)
      m.blogs.create(title: title, content: post)
    end
  end
end

100.times do |i|
  from_id = rand(1..50)
  to_id = rand(1..50)

  from = Member.find(from_id)
  to = Member.find(to_id)
  from.send_message(to, Faker::Lorem.paragraph(2))
end

n = rand(10..50)
n.times do |i|
  a1.events.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph(2), poster: seed_image('poster.png'))
end

n = rand(10..50)
n.times do |i|
  a2.events.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph(2), poster: seed_image('poster.png'))
  end