class List < ActiveRecord::Base
  attr_accessible :est_list, :name_list
  validates_presence_of :name_list
end
