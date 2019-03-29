=begin
カロリー計算のプログラムをつくりましょう。以下のような仕様です。
メニュー画面ではカロリーを入力か、カロリーの合計を見るか選べます
カロリーを入力の場合、料理名とカロリーを入力します
入力後はメニューに戻り、続けてカロリーを入力か、カロリーの合計を見るかを選べます
カロリーの合計を見るを選んだら全ての料理名とカロリーを表示して、最後にカロリーの合計を表示します
カロリーの合計を見たらプログラムを終了します
=end


class Dish
  attr_accessor :name
  attr_accessor :calorie

  def initialize(name, calorie)
    @name = name
    @calorie = calorie
  end

  #料理名とカロリーを出力する
  def print
    printf("料理名:%s カロリー:%d\n", name, calorie)
  end
end

e = 0
num = 0
array = []

while e == 0 do
  #メニュー出力
  puts "------Calorie Counting------"
  puts "　1: カロリー入力"
  puts "　2: カロリーの合計を見る"
  puts "----------------------------"
  puts ""
  print "メニュー番号を入力してください:"

  menu = gets.chomp.to_i

  #入力したメニュー番号による分岐
  if menu == 1
    puts ""
    print "料理名を入力してください:"
    name = gets.chomp
    print "カロリーを入力してください:"
    calorie = gets.chomp.to_i

    namecalorie = name + calorie.to_s
    array.push(namecalorie)
    array[num] = Dish.new(name, calorie)

    num += 1

  elsif menu == 2
    #カロリーの合計を格納する
    sum = 0

    #配列に追加した順に料理名とカロリーを出力
    if array.length != 0
      #配列の要素ごとに料理名とカロリーを出力
      for a in array do
        a.print
        sum += a.calorie
      end
      puts ""
      puts "入力した料理のカロリーの合計は" + sum.to_s + "です"
    else
      puts "記録済みのデータがありません"
    end

    #プログラムを終了する
    e = 1

  #エラー処理
  else
    puts "上記のメニュー番号から入力してください"
  end
end
