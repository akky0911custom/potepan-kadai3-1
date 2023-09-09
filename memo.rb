require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

if memo_type == 1

  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp

  puts "メモしたい内容を記入して下さい。"
  puts "完了したらCtrl + Dを押します。"
  input_memo = $stdin.read
  memo = input_memo.chomp

  CSV.open("#{file_name}.csv" , "w") do |csv|
    csv.puts ["#{memo}"]
  end

elsif memo_type == 2

  puts "既存のメモを編集します。拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp

  puts "メモしたい内容を記入して下さい。"
  puts "完了したらCtrl + Dを押します。"
  input_memo = $stdin.read
  memo = input_memo.chomp

  CSV.open("#{file_name}.csv" , "r+") do |csv|
    csv.puts ["#{memo}"]
  end

end

exit