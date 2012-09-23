class AddMoreItems < ActiveRecord::Migration
    MORE_ITEMS = [
    { :name=>'snow white', :picture=> 'https://ssl.gstatic.com/movies/tbn_a7d75269b295f037.jpg?size=80x107&web', :description=> 'it is about snow white', :opening_bid=> 10, :highest_bid=>20},
    { :name=>'dredd', :picture=> 'http://ia.media-imdb.com/images/M/MV5BODkyNDQzMzUzOF5BMl5BanBnXkFtZTcwODYyMDEyOA@@._V1._SY317_.jpg', :description=> 'it is about dredd', :opening_bid => 15, :highest_bid=>30}
   ]

    def up
      MORE_ITEMS.each do |item|
        Item.create!(item)
      end
    end

    def down
      MORE_ITEMS.each do |item|
        User.find_by_name(item[:name]).destroy
      end
    end
  end