#creates test user test group and some entries
class AddTestDataToEntries < ActiveRecord::Migration
  def self.up
    group1 = Group.create(:name => "Test Group")

    user1 = SimpleUser.create(:name => "User",
                              :surname => "Test", 
                              :login => "user",
                              :group_id => group1.id,
                              :password => "user",
                              :password_confirmation => "user"
                              )
    RentEntry.create(
                     :rooms_count => 4,
                     :rent_price => 2500,
                     :city => "Москва",
                     :street => "Тверская",
                     :house_number => 1,
                     :flat_number => 13,
                     :floor_number => 10,
                     :disctrict => "ЦАО",
                     :area_total => 150,
                     :area_kitchen => 20,
                     :rent_time => "12 мес.",
                     :contacts => "putin@kreml.ru",
                     :comment => "Отличная замечательная просто Суперская квартирка. КучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакуча текста",
                     :user_id => user1.id
                     )
    RentEntry.create(
                     :rooms_count => 4,
                     :rent_price => 2500,
                     :city => "Москва",
                     :street => "Тверская",
                     :house_number => 1,
                     :flat_number => 13,
                     :floor_number => 10,
                     :disctrict => "ЦАО",
                     :area_total => 150,
                     :area_kitchen => 20,
                     :rent_time => "12 мес.",
                     :contacts => "putin@kreml.ru",
                     :comment => "Отличная замечательная просто Суперская квартирка. КучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакуча текста",
                     :user_id => user1.id
                     )
    RentEntry.create(
                     :rooms_count => 4,
                     :rent_price => 2500,
                     :city => "Москва",
                     :street => "Тверская",
                     :house_number => 1,
                     :flat_number => 13,
                     :floor_number => 10,
                     :disctrict => "ЦАО",
                     :area_total => 150,
                     :area_kitchen => 20,
                     :rent_time => "12 мес.",
                     :contacts => "putin@kreml.ru",
                     :comment => "Отличная замечательная просто Суперская квартирка. КучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакуча текста",
                     :user_id => user1.id
                     )
    RentEntry.create(
                     :rooms_count => 4,
                     :rent_price => 2500,
                     :city => "Москва",
                     :street => "Тверская",
                     :house_number => 1,
                     :flat_number => 13,
                     :floor_number => 10,
                     :disctrict => "ЦАО",
                     :area_total => 150,
                     :area_kitchen => 20,
                     :rent_time => "12 мес.",
                     :contacts => "putin@kreml.ru",
                     :comment => "Отличная замечательная просто Суперская квартирка. КучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакуча текста",
                     :user_id => user1.id
                     )
    RentEntry.create(
                     :rooms_count => 4,
                     :rent_price => 2500,
                     :city => "Москва",
                     :street => "Тверская",
                     :house_number => 1,
                     :flat_number => 13,
                     :floor_number => 10,
                     :disctrict => "ЦАО",
                     :area_total => 150,
                     :area_kitchen => 20,
                     :rent_time => "12 мес.",
                     :contacts => "putin@kreml.ru",
                     :comment => "Отличная замечательная просто Суперская квартирка. КучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакуча текста",
                     :user_id => user1.id
                     )
    RentEntry.create(
                     :rooms_count => 4,
                     :rent_price => 2500,
                     :city => "Москва",
                     :street => "Тверская",
                     :house_number => 1,
                     :flat_number => 13,
                     :floor_number => 10,
                     :disctrict => "ЦАО",
                     :area_total => 150,
                     :area_kitchen => 20,
                     :rent_time => "12 мес.",
                     :contacts => "putin@kreml.ru",
                     :comment => "Отличная замечательная просто Суперская квартирка. КучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакуча текста",
                     :user_id => user1.id
                     )
    RentEntry.create(
                     :rooms_count => 4,
                     :rent_price => 2500,
                     :city => "Москва",
                     :street => "Тверская",
                     :house_number => 1,
                     :flat_number => 13,
                     :floor_number => 10,
                     :disctrict => "ЦАО",
                     :area_total => 150,
                     :area_kitchen => 20,
                     :rent_time => "12 мес.",
                     :contacts => "putin@kreml.ru",
                     :comment => "Отличная замечательная просто Суперская квартирка. КучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакуча текста",
                     :user_id => user1.id
                     )
    RentEntry.create(
                     :rooms_count => 4,
                     :rent_price => 2500,
                     :city => "Москва",
                     :street => "Тверская",
                     :house_number => 1,
                     :flat_number => 13,
                     :floor_number => 10,
                     :disctrict => "ЦАО",
                     :area_total => 150,
                     :area_kitchen => 20,
                     :rent_time => "12 мес.",
                     :contacts => "putin@kreml.ru",
                     :comment => "Отличная замечательная просто Суперская квартирка. КучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакучаКучакуча текста",
                     :user_id => user1.id
                     )

  end

  def self.down
  end
end
