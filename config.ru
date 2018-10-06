require_relative "./config/environment.rb"
require 'pry'
run Application.new
binding.pry
p "eof"
