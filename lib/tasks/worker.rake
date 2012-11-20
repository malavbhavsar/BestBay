desc "This task is called by the Heroku scheduler add-on"
task :worker => :environment do
  Item.order("closing_date DESC").each do |item|
    if item.closing_date.past? && item.bids.find_all_by_tracked(true).empty?##and check if this process is done before
      if item.bids.empty?
        #do something
      else
        item.bids.all(:order=>"amount DESC").first.update_attributes!(:tracked => true)
        #item.bids.all(:order=>"amount DESC").first.user.wishlists.find_or_create_by_name("Bids Won").line_items.create!(item: item)
        print "succeeded----"
      end
    end
  end
end