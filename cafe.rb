# frozen_string_literal: true
#上記は文字列リテラルをデフォルトで immutable （破壊的変更不可）にするためのマジックコメント

#debugのgemのソースコードを読み込む
require 'debug'

#Drinkの種類と金額をハッシュ、配列にし変数DRINKSへ代入。配列の最初は0なのでここがポイント？
DRINKS = [
  { name: 'コーヒー', price: '300' },
  { name: 'カフェラテ', price: '400' },
  { name: 'チャイ', price: '460' },
  { name: 'エスプレッソ', price: '340' },
  { name: '緑茶', price: '450' }
].freeze

#Foodの種類と金額をハッシュ配列にしにし変数FOODSへ代入。配列の最初は0なのでここがポイント？
FOODS = [
  { name: 'チーズケーキ', price: '470' },
  { name: 'アップルパイ', price: '520' },
  { name: 'ホットサンド', price: '410' }
].freeze

#メニューと番号が一致していない
#0からカウントするため番号が1ずれてる？
def take_order(menus) 

#index(1)を（0）にしたら実行時の数字が変わってしまったのでここは変更しない
#menuはDRINKSのハッシュ、iは数字だった
  menus.each.with_index(1) do |menu, i| 
    puts "(#{i})#{menu[:name]}: #{menu[:price]}円"
  end
  print '>'
  #ターミナルから数値を入力するにはgetsメソッドを使うが、文字列ではなく数字にするためにto_iで変換している
  order_number = gets.to_i - 1
  puts "#{menus[order_number][:name]}(#{menus[order_number][:price]}円)ですね。"
  order_number
end


puts 'bugカフェへようこそ！ご注文は？ 番号でどうぞ'
order1 = take_order(DRINKS)
puts 'フードメニューはいかがですか?'
order2 = take_order(FOODS)

#会計は「FOOD」+「DRINK」の総和ではなく並列で出力されている。数字が文字列になっているのが原因。
#total = FOODS[order1][:price].to_i + DRINKS[order2][:price].to_i
#ここをなおす
total = DRINKS[order1][:price].to_i + FOODS[order2][:price].to_i
puts "お会計は#{total}円になります。ありがとうございました！"
