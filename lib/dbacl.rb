class Dbacl
  attr_accessor :output

	def parse_dbacl
    valid_output = @output.encode('UTF-8', 'UTF-8', invalid: :replace)
    
		h = Hash.new("NaN")
		if valid_output[/\/(.+\.txt)/, 1]
			h[:file_name] = $1
      puts "yes"
		else
			return false
		end
		h[:jargon_score] = valid_output[/jargon2 +(\d+.\d+)/, 1] if $1
		h[:switch_score] = valid_output[/switch1 +(\d+.\d+)/, 1] if $1
		h[:slate_score] = valid_output[/slate1 +(\d+.\d+)/, 1] if $1
		h[:jargonCDC_score] = valid_output[/jargonCDC +(\d+.\d+)/, 1] if $1
		h[:plainCDC_score] = valid_output[/plainCDC +(\d+.\d+)/, 1] if $1
		h[:letters_score] = valid_output[/letters1 +(\d+.\d+)/, 1] if $1
		return h
	end
end
