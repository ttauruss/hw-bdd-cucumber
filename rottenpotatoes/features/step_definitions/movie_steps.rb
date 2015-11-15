# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  page.body.index(e1).should < page.body.index(e2)
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each { |x| step %{I #{uncheck}check "ratings_#{x}"} }
end

Then /I should see all the movies/ do
  rows = page.all('#movies tbody tr').size
  rows.should == Movie.count
end
