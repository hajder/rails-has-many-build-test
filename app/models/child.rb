class Child < ActiveRecord::Base
  belongs_to :parent
  
  validates_presence_of :parent
end
