class JargonFile < ActiveRecord::Base
  require 'dbacl'

  attr_accessible :jargon_score, :name, :source_id, :text_file

  belongs_to :source

  before_save :compute_jargon
  after_commit :test_before_create

  has_attached_file :text_file
  
  validates :text_file, attachment_presence: true

  def test_before_save
    logger.debug "***************BEFORE SAVE****************"
  end

  def test_before_create
    logger.debug "****************AFTER COMMIT*************"
  end

  def compute_jargon
    d = Dbacl.new
    logger.debug "************* File path: #{text_file.queued_for_write[:original].path}"
    library_prefix = "/Users/mbsperry/myjargon"
    dbacl_path = "/usr/local/bin/dbacl -c #{library_prefix}/jargon2 -vnF"
    d.output = %x{ #{dbacl_path} #{text_file.queued_for_write[:original].path} }
    logger.debug "********** Output: #{d.output}"
    h = d.parse_dbacl
    self.jargon_score = h[:jargon_score]
    self.name = text_file.original_filename
  end
    
end
