class AddMoreItems < ActiveRecord::Migration
    MORE_ITEMS = [
    { :name=>'snow white',           :picture=> 'http://t0.gstatic.com/images?q=tbn:ANd9GcTWfbqckrZzXH0F-worz2xtS9E_Pxitp_RaYfSLJXqoaLzFORAh', :description=> 'it is about snow white', :opening_bid=> 10, :highest_bid=>20},
    { :name=>'dredd',                :picture=> 'http://t1.gstatic.com/images?q=tbn:ANd9GcTIHK7A2c-thSBhgnqd9HXxMy0FUv0-gGRK2URW-ISPz5LEj2wHqg', :description=> 'it is about dredd', :opening_bid => 15, :highest_bid=>30},
    { :name=>'the wise little girl', :picture=> 'http://t3.gstatic.com/images?q=tbn:ANd9GcTgiOkGmDCLJweBI3C_pNWY-XZThMYqjVgjE0c6w02eJov1jczVhw', :description=> 'it is about little wise girl', :opening_bid=> 5, :highest_bid=>29},
    { :name=>'The Wolf and the Seven Young Kids', :picture=> 'http://www.gutenberg.org/files/15659/15659-h/images/illus-021.jpg', :description=> 'it is about wolf', :opening_bid=> 10, :highest_bid=>20},
    { :name=>'The Wounded Lion', :picture=> 'http://t0.gstatic.com/images?q=tbn:ANd9GcRQ3PPIzHBNMk5dEGTsn_xrsUGdKn7jxpenx47rHlj_3IQjYRxS3A', :description=> 'it is about lion', :opening_bid=> 10, :highest_bid=>20},
    { :name=>'The Witch', :picture=> 'http://t2.gstatic.com/images?q=tbn:ANd9GcSM2CKtww-zvmURsZxesTxSZcrNpU3YILgAiSToDelzgYXXtaD_', :description=> 'it is about witch', :opening_bid=> 10, :highest_bid=>20},
    { :name=>'The White Duck', :picture=> 'http://t3.gstatic.com/images?q=tbn:ANd9GcRvBeTMF8PsXC8PRmAwnW7QteEHGUlVvDsu8cLW6cuZGtcKNP_WfQ', :description=> 'it is about snow white', :opening_bid=> 10, :highest_bid=>20}
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