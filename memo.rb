require "csv"  

#メモ内容の入力関数
#addFlg:追記フラグ
def inputMemoValue(addFlg, memo)
  puts"メモの内容を記入して下さい。Ctrl+Dで保存します。"
  if addFlg == true
    puts memo
  end
  imput = STDIN.read.chomp
  memo = imput.chomp
  return memo
end

#ファイル操作関数
#file_name:ファイル名
#memo:メモ内容
def writeMemo(file_name,memo)
  CSV.open("#{file_name}.csv" , "a") do |csv|
    csv.puts ["#{memo}"]
  end
end

#main
input_type = nil
puts "1(新規でメモを作成)2(既存のメモを編集する)"
input_type = gets.to_s.chomp
puts "選択：" + input_type

if input_type == "1"
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp
  
  #入力処理
  memo = inputMemoValue(false,nil)
elsif input_type == "2"
  puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
  file_name = gets.chomp
  
  memo_value = CSV.read(file_name + ".csv")
  #入力処理
  memo_value= inputMemoValue(true,memo)
else
  puts "1か2の数字を半角数字で入力してください。"
end

if input_type != nil
  #ファイル書き込み
  writeMemo(file_name,memo)
  puts "\n保存しました。"
end
#main end