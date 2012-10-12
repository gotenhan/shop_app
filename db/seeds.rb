# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Phone.create( { name: 'Xperia S',
  model_name: 'LT26i',
  manufacturer: 'Sony',
  ram: 1024,
  cpu: 'Qualcomm MSM8260 Snapdragon, Dual-core 1.5 GHz',
  gpu: 'Adreno 220',
  gps: true,
  wifi: true,
  bluetooth: 2.1,
  os: 'Android',
  os_version: '4.0.4 Icecream Sandwich'
})
Phone.create( {
  name: 'iPhone 5',
  model_name: 'N42',
  manufacturer: 'Apple',
  ram: 1024,
  cpu: 'Apple A6',
  gpu: 'PowerVR SGX 543MP3',
  gps: true,
  wifi: true,
  bluetooth: 4.0,
  os: 'iOS',
  os_version: '6'
})
Phone.create( {
  name: 'Lumia 920',
  model_name: 'Phi',
  manufacturer: 'Nokia',
  ram: 1024,
  cpu: 'Qualcomm MSM8960 Snapdragon, Dual-core 1.5 GHz Krait',
  gpu: 'Adreno 225',
  gps: true,
  wifi: true,
  bluetooth: 3.1,
  os: 'MS Windows Phone',
  os_version: '8'
})
