cards = gets.chomp           # 文字列の入力を受け付ける
            .split             # 文字列を空白文字で分割して配列にする
            .map { _1.to_i }   # 配列の要素を数値にする

counts = []

if n == 3 && n ==2
  put "FULL HOUSE"
elsif n == 3
  put "THREE CARD"
elsif n == 2 && m == 2
  put "TWO PAIR"
elsif n == 2
  put "ONE PAIR"
else
  put "NO HAND"
end