class Dbacl < String
	def parse_dbacl
		h = Hash.new("NaN")
		if self[/\/(.+\.txt)/, 1]
			h[:file_name] = $1
		else
			return false
		end
		h[:jargon_score] = self[/jargon2 +(\d+.\d+)/, 1] if $1
		h[:switch_score] = self[/switch1 +(\d+.\d+)/, 1] if $1
		h[:slate_score] = self[/slate1 +(\d+.\d+)/, 1] if $1
		h[:jargonCDC_score] = self[/jargonCDC +(\d+.\d+)/, 1] if $1
		h[:plainCDC_score] = self[/plainCDC +(\d+.\d+)/, 1] if $1
		h[:letters_score] = self[/letters1 +(\d+.\d+)/, 1] if $1
		return h
	end
end
