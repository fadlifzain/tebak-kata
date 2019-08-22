@soal = [
  'kata',
  'buku',
  'notebook',
  'telpon',
  'majalah',
  'uang',
  'kertas',
  'pensil',
  'tas',
  'plastik'
]

@ranks = []

def acak_kata word
  word_splitted = word.split("")
  word_shuffled = word_splitted.shuffle

  word_shuffled.join
end

def susun_ranking
  @ranks.sort_by {|rank| rank[1] }
end

def cek_ranking
  @ranks.each do |rank|
    puts "#{rank[0]} memiliki score: #{rank[1]}"
  end
end

def game_on
  puts "Nama anda: "
  name = gets.chomp
  puts ""

  score = 0

  soal_games = @soal.shuffle
  soal_games.each_with_index do |soal_game, index|
    jawaban_soal = soal_game
    soal_sekarang = acak_kata soal_game

    puts ""
    puts "Pertanyaan ke - #{index+1}"
    puts "Tebak kata: #{soal_sekarang}"
    [1, 2, 3].each do |coba|
      jumlah_kesempatan = 3
      puts "Jawaban anda: "
      jawaban = gets.chomp
      puts ""

      if jawaban.eql? jawaban_soal
        score = score + 1
        puts "BENAR! Score anda: #{score}"
        puts ""
        break;
      end

      kesempatan = jumlah_kesempatan - coba
      puts "SALAH! Score anda: #{score}"
      puts "Kesempatan anda dalam soal ini: #{kesempatan}"
      puts ""
    end

    puts ""
    puts ""
  end

  puts "Game tebak kata selesai"
  @ranks << [name, score]
  susun_ranking
end

#start
puts "Masuk game..."

input = -1

loop do
  puts "1. Mulai main tebak kata"
  puts "2. Lihat score"
  puts "0. Keluar"
  puts "Input Pilihan: "
  input = gets.chomp

  # puts "#{input.is_a?(String)}"

  break if input.eql? '0'

  if (input.eql? '1')
    game_on
  elsif (input.eql? '2')
    cek_ranking
  else
    puts "Input salah!"
  end
end
