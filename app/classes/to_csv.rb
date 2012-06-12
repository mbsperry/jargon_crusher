#!/usr/bin/ruby -w
$LOAD_PATH << './lib'
require "#{File.dirname(__FILE__)}/lib/parse_output.rb"

if ARGV[0]
	input = File.open(ARGV[0], "r")
else
	input = STDIN
end

output = []

input.each { |line|
	l = line.parse_dbacl
	output.push l if l
}

puts "Filename, Jargon Score, Slate Score, Switch Score"

output.each { |a|
	s = a[:file_name] << ","
	s << a[:jargon_score] << ","
	s << a[:slate_score] << ","
	s << a[:switch_score]
	puts s
}


