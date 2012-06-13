class JargonFile < ActiveRecord::Base

  attr_accessible :name, :source_id, :text_file

  belongs_to :source

  before_save :compute_jargon

  has_attached_file :text_file
  
  validates :text_file, attachment_presence: true

  def compute_jargon
    cat = "/home/web/dbacl"
    dbacl_path = "/usr/bin/dbacl -c #{cat}/jargon2 -c #{cat}/slate1 -c #{cat}/switch1 -vn"

    output = %x{ #{dbacl_path} #{text_file.queued_for_write[:original].path} }
    logger.debug "******************** #{output.inspect}"

		h = Hash.new{}
    h = parse_dbacl(output)
logger.debug "********************** #{h.inspect}"

    self.name = text_file.original_filename
    self.jargon_score = h[:jargon_score]
    self.slate_score = h[:slate_score]
    self.switch_score = h[:switch_score]
    self.composite_score = calculate_composite
  end

  def calculate_composite
		if self.switch_score == 0
			return 0
		else
			( self.jargon_score**2 + self.slate_score**2 ) / self.switch_score**2
		end
  end

	def parse_dbacl(valid_output)
		h = Hash.new 
		h[:jargon_score] = valid_output[/jargon2 +(\d+\.\d+)/, 1] 
		h[:switch_score] = valid_output[/switch1 +(\d+\.\d+)/, 1] 
		h[:slate_score] = valid_output[/slate1 +(\d+\.\d+)/, 1] 
		h[:jargonCDC_score] = valid_output[/jargonCDC +(\d+\.\d+)/, 1] 
		h[:plainCDC_score] = valid_output[/plainCDC +(\d+\.\d+)/, 1] 
		h[:letters_score] = valid_output[/letters1 +(\d+\.\d+)/, 1] 
		h
	end
    
end
