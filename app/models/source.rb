class Source < ActiveRecord::Base
  attr_accessible :name
  has_many :jargon_files
end
