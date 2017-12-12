# 2.lotto
require 'sinatra'

get '/' do
  send_file 'home.html'
end

get '/lotto' do
  num = (1..45).to_a
  @choice = num.sample(6).sort
  File.open("lotto.txt", "a+") do |f|
    f.write("#{@choice}" + "\n")
  end
  erb :lotto
end
