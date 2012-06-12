class JargonFile < ActiveRecord::Base
  attr_accessible :jargon_score, :name, :source_id, :text_file

  belongs_to :source

  has_attached_file :text_file

  def text_file_contents
    text_file.to_file.read
  end
end
