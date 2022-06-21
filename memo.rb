require "csv"
require "readline"
require "io/console"

puts "1(新規でメモを作成)2(既存のメモを編集する)"

memo_type = gets.chomp

if memo_type == '1'

    puts "拡張子を除いたファイル名を入力してください"
    text_name = gets.chomp
    puts "#{text_name}.csvを作成"
    puts "----------"

    p "メモしたい内容を記入してください"
    p "完了したらCtrl + Dをおします"
    puts "----------"

    CSV.open("#{text_name}.csv", 'w') do |csv|

        text_content = gets.chomp
        csv << [text_content]

        while c = STDIN.getch
            exit if c == ?\C-d
            puts "Ctrl + Dで終了"
        end
    end

elsif memo_type == '2'
    puts "拡張子を除いた既存ファイル名を入力してください"
end