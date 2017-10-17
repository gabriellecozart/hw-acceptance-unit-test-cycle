Given /the following movies exist/ do |movies_table|
    movies_table.hashes.each do |movie|
        Movie.create!(movie)
    end
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
    step %Q{I should see "#{title}"}
    step %Q{I should see "#{director}"}
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
    rating_list.split(“,”).strip!
	rating_list.each do |rating|
		step %Q{When I #{un}check “#{rating}”}
	end
end

Then /I should( not)? see the following movies: (.*)/ do |notsee, movies|
	movies.split(“,”).strip!
	movies.each do |movie|
		step %Q{Then I should#{notsee} see “#{movie}”}
  	end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  movie_list = Movie.all
  movie_list.each do |movie|
    Step %Q{Then I should see “#{movie}"}
  end

end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  Hint: page.body is the entire content of the page as a string.
	page.body =~ /#{e1}.*#{e2}/

end

