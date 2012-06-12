require 'dbacl'

module SourcesHelper
  def dbacl_output
    dbacl_command = "/usr/local/bin/dbacl -c /Users/mbsperry/myjargon/jargon2 -vnF"
    file = Rails.public_path + "/nejm"
    foobar = %x{ #{dbacl_command} #{file} }
    parsed = Dbacl.new
    parsed.output = foobar
    hash = parsed.parse_dbacl
    hash[:jargon_score]
  end
end
