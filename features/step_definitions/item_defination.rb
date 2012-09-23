Given /the following items exist/ do |items_table|
  items_table.hashes.each do |item|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Item.create!(item)
  end
end

Then /^I should see the following items:$/ do |expected_table|
  actual_table = []
  page.all("table#items tbody#itemsbody tr").each do |tr_node|
    td_part =[]
    tr_node.all("td").each do |td_node|
      td_part << td_node.text
    end
    actual_table << td_part
  end
  expected_table.transpose.diff!(actual_table.transpose)
end