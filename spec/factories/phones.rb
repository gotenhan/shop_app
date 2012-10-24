FactoryGirl.define do 
  factory :phone do
    name 'Phone'
    manufacturer 'Manufacturer'
    price 10.01
  end

  factory :phone_full, class: Phone do
    name 'Full phone'
    model_name 'model 1'
    manufacturer 'Manufacturer'
    
    cpu 'Qualcomm 1GHz'
    gpu 'adreno 200'
    ram 512
    os 'Android'
    os_version '2.3'
    wifi true
    gps false
    bluetooth 2.1
    price 11.11
  end
end
