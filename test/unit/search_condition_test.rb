require File.dirname(__FILE__) + '/../test_helper'
require 'search_condition'
require 'entry'
class SearchConditionTest < ActiveSupport::TestCase
  fixtures :administrative_areas, :sub_administrative_areas, :localities, :streets, :entries, :highways, :address_highways, :subway_stations, :address_subway_stations

  def test_searching_entries_with_subway_stations
    puts "test_searching_entries_with_subway_stations"
    puts "1st SC"
    sc1 = SearchCondition.new(:time_to_nearest_subway_station => 20)
    entries = Entry.find(:all,:conditions => sc1.get_sql_condition)
    puts sc1.get_sql_condition
    assert_equal 2, entries.length
    assert_equal 1, entries[0].id

    puts "2nd SC"
    sc2 = SearchCondition.new(:time_to_nearest_subway_station => 11, :nearest_subway_stations => [2,3])
    entries = Entry.find(:all,:conditions => sc2.get_sql_condition)
    puts sc2.get_sql_condition
    assert_equal 1, entries.length
    assert_equal 2, entries[0].id
  end

  def test_searching_entries_with_highways
    puts "test_searching_entries_with_highways"
    puts "1st SC"
    sc1 = SearchCondition.new(:max_distance_to_mkad => 999)
    entries = Entry.find(:all, :conditions => sc1.get_sql_condition)
    puts sc1.get_sql_condition
    assert_equal 2, entries.length

    puts "2nd SC"
    sc2 = SearchCondition.new(:max_distance_to_mkad => 150)
    entries = Entry.find(:all, :conditions => sc2.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal entries[0].id, 1

    puts "3d SC"
    sc3 = SearchCondition.new(:highways =>[1,3])
    entries = Entry.find(:all, :conditions => sc3.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal entries[0].id, 1

    puts "4th SC"
    sc4 = SearchCondition.new(:max_distance_to_mkad => 150, :highways =>[2,3])
    entries = Entry.find(:all, :conditions => sc4.get_sql_condition)
    assert_equal 0, entries.length
  end

  def test_searching_address_with_search_condition
    #1 
    #0|0|0|0
    Ml.w "Testing #0|0|0|0"
    puts "#0|0|0|0 Building new SearchCondition object"
    sc1 = SearchCondition.new()
    entries = Entry.find(:all,:conditions => sc1.get_sql_condition)
    assert_equal   (Entry.find(:all)).length, entries.length
    assert_equal   "AA4", entries[3].address.street.locality.sub_administrative_area.administrative_area.name
    assert_equal   "AA4", entries[4].address.street.locality.sub_administrative_area.administrative_area.name
    assert_equal   "AA4", entries[5].address.street.locality.sub_administrative_area.administrative_area.name
    assert_equal   "AA4", entries[6].address.street.locality.sub_administrative_area.administrative_area.name
    assert_equal   "AA5", entries[7].address.street.locality.sub_administrative_area.administrative_area.name

    #2 
    #0|0|0|1
    Ml.w "Testing #0|0|0|1"
    puts "#0|0|0|1 Building new SearchCondition object"
    sc2 = SearchCondition.new(:street => "S8")
    entries = Entry.find(:all,:conditions => sc2.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal "S8", entries[0].address.street.name
    assert_equal 8, entries[0].id

    #3 
    #0|0|1|0
    Ml.w "Testing #0|0|1|0"
    puts "#0|0|1|0 Building new SearchCondition object"
    sc3 = SearchCondition.new(:locality => "L7")
    entries = Entry.find(:all,:conditions => sc3.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal "S8", entries[0].address.street.name
    assert_equal "L7", entries[0].address.street.locality.name
    assert_equal 8, entries[0].id

    #4 
    #0|0|1|1
    Ml.w "Testing #0|0|1|1"
    puts "#0|0|1|1 Building new SearchCondition object"
    sc4 = SearchCondition.new(:locality => "L4",
                              :street => "S5"
                              )
    entries = Entry.find(:all,:conditions => sc4.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal "S5", entries[0].address.street.name
    assert_equal "L4", entries[0].address.street.locality.name
    assert_equal 5, entries[0].id

    #5 
    #0|1|0|0
    Ml.w "Testing #0|1|0|0"
    puts "#0|1|0|0 Building new SearchCondition object"
    sc5 = SearchCondition.new(:sub_administrative_area => "SA6"
                              )
    entries = Entry.find(:all,:conditions => sc5.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal "SA6", entries[0].address.street.locality.sub_administrative_area.name
    assert_equal 8, entries[0].id

    #6 
    #0|1|0|1
    Ml.w "Testing #0|1|0|1"
    puts "#0|1|0|1 Building new SearchCondition object"
    sc6 = SearchCondition.new(:sub_administrative_area => "SA4",
                              :street => "S5"
                              )
    entries = Entry.find(:all,:conditions => sc6.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal "SA4", entries[0].address.street.locality.sub_administrative_area.name
    assert_equal "S5", entries[0].address.street.name
    assert_equal 5, entries[0].id

    #7 
    #0|1|1|0
    Ml.w "Testing #0|1|1|0"
    puts "#0|1|1|0 Building new SearchCondition object"
    sc7 = SearchCondition.new(:sub_administrative_area => "SA4",
                              :locality => "L4"
                              )
    entries = Entry.find(:all,:conditions => sc7.get_sql_condition)
    assert_equal 2, entries.length
    assert_equal "SA4", entries[0].address.street.locality.sub_administrative_area.name
    assert_equal "S4", entries[0].address.street.name
    assert_equal "SA4", entries[1].address.street.locality.sub_administrative_area.name
    assert_equal "S5", entries[1].address.street.name
    assert_equal 4, entries[0].id
    assert_equal 5, entries[1].id

    #8 
    #0|1|1|1
    Ml.w "Testing #0|1|1|1"
    puts "#0|1|1|1 Building new SearchCondition object"
    sc8 = SearchCondition.new(:sub_administrative_area => "SA4",
                              :locality => "L4",
                              :street => "S5"
                              )
    entries = Entry.find(:all,:conditions => sc8.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal "SA4", entries[0].address.street.locality.sub_administrative_area.name
    assert_equal "L4", entries[0].address.street.locality.name
    assert_equal "S5", entries[0].address.street.name
    assert_equal 5, entries[0].id

    #9 
    #1|0|0|0
    Ml.w "Testing #1|0|0|0"
    puts "#1|0|0|0 Building new SearchCondition object"
    sc9 = SearchCondition.new(:administrative_area => "AA4")

    entries = Entry.find(:all,:conditions => sc9.get_sql_condition)
    assert_equal   5, entries.length
    assert_equal   "SA4", entries[0].address.street.locality.sub_administrative_area.name
    assert_equal   "SA4", entries[1].address.street.locality.sub_administrative_area.name
    assert_equal   "SA4", entries[2].address.street.locality.sub_administrative_area.name
    assert_equal   "SA5", entries[3].address.street.locality.sub_administrative_area.name
    assert_equal   "AA4", entries[4].address.street.locality.administrative_area.name
    assert_equal   10, entries[4].id


    #10 
    #1|0|0|1
    Ml.w "Testing #1|0|0|1"
    puts "#1|0|0|1 Building new SearchCondition object"
    sc10 = SearchCondition.new(:administrative_area => "AA5",
                              :street => "S8"
                              )
    entries = Entry.find(:all,:conditions => sc10.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal "AA5", entries[0].address.street.locality.sub_administrative_area.administrative_area.name
    assert_equal "S8", entries[0].address.street.name
    assert_equal 8, entries[0].id

    #11 
    #1|0|1|0
    Ml.w "Testing #1|0|1|0"
    puts "#1|0|1|0 Building new SearchCondition object"
    sc11 = SearchCondition.new(:administrative_area => "AA5",
                               :locality => "L8"
                              )
    entries = Entry.find(:all,:conditions => sc11.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal "AA5", entries[0].address.street.locality.administrative_area.name
    assert_equal "S9", entries[0].address.street.name
    assert_equal 9, entries[0].id

    #12 
    #1|0|1|1
    Ml.w "Testing #1|0|1|1"
    puts "#1|0|1|1 Building new SearchCondition object"
    sc12 = SearchCondition.new(:administrative_area => "AA5",
                               :locality => "L8",
                               :street => "S9"
                              )
    entries = Entry.find(:all,:conditions => sc12.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal "AA5", entries[0].address.street.locality.administrative_area.name
    assert_equal "L8", entries[0].address.street.locality.name
    assert_equal "S9", entries[0].address.street.name
    assert_equal 9, entries[0].id

    #13 
    #1|1|0|0
    Ml.w "Testing #1|1|0|0"
    puts "#1|1|0|0 Building new SearchCondition object"
    sc13 = SearchCondition.new(:administrative_area => "AA4",
                               :sub_administrative_area => "SA4"
                               )

    entries = Entry.find(:all,:conditions => sc13.get_sql_condition)
    assert_equal   3, entries.length
    assert_equal   "L4", entries[0].address.street.locality.name
    assert_equal   "L4", entries[1].address.street.locality.name
    assert_equal   "L5", entries[2].address.street.locality.name

    #14 
    #1|1|0|1
    Ml.w "Testing #1|1|0|1"
    puts "#1|1|0|1 Building new SearchCondition object"
    sc14 = SearchCondition.new(:administrative_area => "AA4",
                               :sub_administrative_area => "SA5",
                               :street => "S7"
                              )
    entries = Entry.find(:all,:conditions => sc14.get_sql_condition)
    assert_equal 1, entries.length
    assert_equal "AA4", entries[0].address.street.locality.sub_administrative_area.administrative_area.name
    assert_equal "SA5", entries[0].address.street.locality.sub_administrative_area.name
    assert_equal "S7", entries[0].address.street.name
    assert_equal 7, entries[0].id

    #15 
    #1|1|1|0
    Ml.w "Testing #1|1|1|0"
    puts "#1|1|1|0 Building new SearchCondition object"
    sc15 = SearchCondition.new(:administrative_area => "AA4",
                              :sub_administrative_area => "SA4",
                              :locality => "L4"
                              )

    entries = Entry.find(:all,:conditions => sc15.get_sql_condition)
    assert_equal   2, entries.length
    assert_equal   "S4", entries[0].address.street.name
    assert_equal   "S5", entries[1].address.street.name

    #16 
    #1|1|1|1
    Ml.w "Testing #1|1|1|1"
    puts "#1|1|1|1 Building new SearchCondition object"
    sc16 = SearchCondition.new(:administrative_area => "AA4",
                              :sub_administrative_area => "SA4",
                              :locality => "L4",
                              :street => "S4"
                              )

    #puts "Query is:"
    #puts sc.get_sql_condition
    entry = Entry.find(:first,:conditions => sc16.get_sql_condition)
    puts "Id: #{entry.id} Premise of entry: #{entry.address.premise}" 
    assert_equal   "111", entry.address.premise



  end
end
