class JargonFile < ActiveRecord::Base
  require 'dbacl'

  attr_accessible :name, :source_id, :text_file

  belongs_to :source

  before_save :compute_jargon

  has_attached_file :text_file
  
  validates :text_file, attachment_presence: true

  def compute_jargon
    d = Dbacl.new
    
    cat = "/Users/mbsperry/myjargon"
    dbacl_path = "/usr/local/bin/dbacl -c #{cat}/jargon2 -c #{cat}/slate1 -c #{cat}/switch1 -vnF"

    d.output = %x{ #{dbacl_path} #{text_file.queued_for_write[:original].path} }
    h = d.parse_dbacl

    self.name = text_file.original_filename
    self.jargon_score = h[:jargon_score]
    self.slate_score = h[:slate_score]
    self.switch_score = h[:switch_score]
    self.composite_score = calculate_composite
  end

  def calculate_composite
    ( self.jargon_score**2 + self.slate_score**2 ) / self.switch_score**2
  end
    
end
