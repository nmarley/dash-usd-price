require 'erb'

path = 'dash-price.html.erb'
page = ERB.new(File.read(path)).result(binding)
File.open('dash-price.html', 'w') { |f| f.write(page) }


