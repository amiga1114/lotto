2. 로또 번호 추천 사이트 만들기

get '/' {} : '로또 추천'라는 버튼을 만들고 -> '/lotto'
get '/lotto' {} : 로또 번호를 추천하는데, 매번 추천된 번호를 lotto.txt 파일에 저장을 한다.
app.rb 만들기
# 2일차 복습
# 2. 로또 번호 추천 사이트를 만든다.
#  - get '/' {} : '로또 추천'라는 버튼을 만들고 -> '/lotto'
# - get '/lotto' {} : 로또 번호를 추천하는데, 매번 추천된 번호를 lotto.txt 파일에 저장을 한다.

require 'sinatra'
require 'uri'

get '/' do
  erb :index
end

get '/lotto' do
  numbers = (1..45).to_a
  @lot = numbers.sample(6).sort

  File.open("log.txt", "a+") do |f|
    f.write("#{@lot}" + "\n")
  end
  erb :lotto
end
index.erb 만들기
<html>
  <head>
    <meta charset="utf-8">
    <title>로또 번호 추천 사이트</title>
  </head>
  <body>
    <h1>로또 번호 추천</h1>
    <form action="/lotto">
      <!-- <input type="button" value="로또번호추천"> -->
      <input type="submit" value="로또번호추천">
    </form>
  </body>
</html>
lotto.erb 만들기
<html>
  <head>
    <meta charset="utf-8">
    <title>로또 번호 추천</title>
  </head>
  <body>
    <h1>이번 주 로또 번호 추천<h1>
    <p><%= @lot %></p>
  </body>
</html>
