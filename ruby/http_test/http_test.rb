#!/usr/bin/env ruby
require 'net/http'

def http_test(url='')
	uri = URI.parse("#{url}")
	Net::HTTP.get_response(uri).code()
	uri = URI.parse("#{url}")
	response_code = Net::HTTP.get_response(uri).code()
	response_body = Net::HTTP.get_response(uri).body()

	puts"TESTING: #{url} STATUS_CODE: #{response_code}"
end

def read_file (path='')
	f = File.open("#{path}", "r")
		f.each_line do |line|
			http_test("http://#{line}")
		end
	f.close
end 

if ARGV[0] == '-h'
	http_test("http://#{ARGV[1]}")
end 

if ARGV[0] == '-f'
	 read_file("#{ARGV[1]}")
end 

if ARGV[0] != '-f' or ARGV[0] != '-h'
	puts "Error!!"
	puts "How to use it!"
	puts "./http_test.rb -h www.yourhost.com"
	puts "./http_test.rb -f ~/hosts_file.txt"
end 
