class AddMoreItems < ActiveRecord::Migration
    MORE_ITEMS = [
    { :name=>'snow white',           :picture=> 'https://ssl.gstatic.com/movies/tbn_a7d75269b295f037.jpg?size=80x107&web', :description=> 'it is about snow white', :opening_bid=> 10, :highest_bid=>20},
    { :name=>'dredd',                :picture=> 'http://ia.media-imdb.com/images/M/MV5BODkyNDQzMzUzOF5BMl5BanBnXkFtZTcwODYyMDEyOA@@._V1._SY317_.jpg', :description=> 'it is about dredd', :opening_bid => 15, :highest_bid=>30},
    { :name=>'the wise little girl', :picture=> 'http://ingilizce.masaldiyari.net/wp-content/uploads/2010/09/the_wise_little_girl.jpg', :description=> 'it is about little wise girl', :opening_bid=> 5, :highest_bid=>29},
    { :name=>'The Wolf and the Seven Young Kids', :picture=> 'http://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Wolf_and_7_kids.jpg/220px-Wolf_and_7_kids.jpg', :description=> 'it is about wolf', :opening_bid=> 10, :highest_bid=>20},
    { :name=>'The Wounded Lion', :picture=> 'http://etc.usf.edu/clipart/59400/59410/59410_lion_wound_lg.gif', :description=> 'it is about lion', :opening_bid=> 10, :highest_bid=>20},
    { :name=>'The Witch', :picture=> 'http://upload.wikimedia.org/wikipedia/en/thumb/4/41/TheWitches.jpg/200px-TheWitches.jpg', :description=> 'it is about witch', :opening_bid=> 10, :highest_bid=>20},
    { :name=>'The White Duck', :picture=> 'http://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Ivan_Bilibin_011.jpg/300px-Ivan_Bilibin_011.jpg', :description=> 'it is about snow white', :opening_bid=> 10, :highest_bid=>20}
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