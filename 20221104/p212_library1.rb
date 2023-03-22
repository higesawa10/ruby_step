require 'date'

today =  Date.today

p today
p today.year

day_of_the_weeks = %w(日 月 火 水 木 金 土)
day_of_the_week = day_of_the_weeks[today.wday]

p today.strftime('%Y年%m月%d日') + day_of_the_week + '曜日'