require 'json'

json = '{"man": {"height":170, "weight":65}}'

new_hash = JSON.parse(json)
p new_hash
p new_hash['man']['height']