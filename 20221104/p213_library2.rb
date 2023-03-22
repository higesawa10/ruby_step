require 'open-uri'
require 'json'

file = URI.open('https://www.google.com/')
# p file.read

a = file.read
a = JSON.parse(a)