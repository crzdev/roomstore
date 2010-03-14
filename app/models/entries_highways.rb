class EntriesHighways < ActiveRecord::Base
  belongs_to :entries
  belongs_to :highways , :class_name => "Highway", :foreign_key => "highway_id"
end
