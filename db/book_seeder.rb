# frozen_string_literal: true

require 'open-uri'

# loads the test values ​​from the seed_book_db.txt file to the Books table
# rails runner book_seeder.rb
class BookSeeder
  def start
    path = Rails.root.join('public', 'seeds_book_db.txt')
    file = File.read(path)
    file_data = JSON.parse(file)
    parse(file_data)
  end

  private

  # {
  #   "OldPrice":0,
  #   "Price":2059.00,
  #   "Weight":47,
  #   "ItemId":10668942,
  #   "CategoryIds":[2719],
  #   "CategoryPathsToRoot":[[2719,31,30,26,2]],
  #   "Regions":null,
  #   "CategoryNames":["Научная фантастика"],
  #   "Params":{
  #     "Автор":"Герберт Ф.",
  #     "Like":"26",
  #     "Dislike":"0",
  #     "Bookmark":"141"
  #   },
  #   "GroupId":null,
  #   "StockId":null,
  #   "Size":null,
  #   "Color":null,
  #   "Algorithm":"p",
  #   "BuyUrl":null,
  #   "Vendor":null,
  #   "Description":"",
  #   "TypePrefix":null,
  #   "Model":null,
  #   "Url":"https://www.bookvoed.ru/book?id=10668942",
  #   "PictureUrl":"https://www.bookvoed.ru/files/1377/80/25/09/5.jpeg",
  #   "Name":"Дюна: Дюна. Мессия Дюны. Дети Дюны. Бог-Император Дюны. Еретики Дюны. Капитул Дюны"
  # }
  def parse(response_hash)
    result = []
    picture_hash = []
    response_hash.each_with_index do |hash, index|
      hash['NewPictureUrl'] = "images/#{index}.jpeg"
      result << format_result_hash(hash)
      picture_hash << hash['PictureUrl']
    end
    result if model_valid?(result, picture_hash)
  end

  def model_valid?(result, picture_hash)
    valid_array = []
    result.each_with_index do |hash_params, index|
      books = Book.new(hash_params)
      unless books.valid?
        valid_array << "book #{index} not saved - #{hash_params}"
      end
    end
    if valid_array.empty?
      picture_hash.each_with_index do |picture_url, index|
        download_photo(picture_url, index)
      end
      true
    else
      puts valid_array
      exit
    end
  end

  def download_photo(picture_url, index)
    unless picture_url.empty?
      download = URI.parse(picture_url).open
      path = Rails.root.join('public/images/', "#{index}.jpeg")
      IO.copy_stream(download, path)
    end
  end

  def format_result_hash(hash)
    {
      title: hash['Name'],
      author: hash['Params']['Автор'],
      category: hash['CategoryNames'],
      price: hash['Price'],
      picture_url: hash['NewPictureUrl'],
      description: 'blablablablablablablabla'
    }
  end
end

Book.create(BookSeeder.new.start)
