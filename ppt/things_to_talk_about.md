nested comments form

nested address form

many to many

one to one

different listing views, in particular the check for if no Purchase exists where SQL query

custom validator, pretensiousness filter, "this piece invokes a sense of man's inhumanity to man as a result of the consumerist fetishism zeitgeist"

error handling for comments

admin abilities and dashboard, comms manager abilities

capybara, functional testing

zoom, airbnb marker, google api

recaptcha

in the future:
- would use cancan gem to control authorization, easier to define in one spot rather than putting if statements all over the place, wasn't too bad this time as small and quick app, but in a real project this would become hard to maintain very fast
- do capybara closer to the start, and figure out how to do factory for models with related models
- would create a purchase table that just duplicates the entry in the listings table rather than be a join table between User that purchased and the Listing. this is because now if an account gets deleted, any user that purchased an item from a deleted account will have that listing missing in their purchases
auth
- didn't have time:
  - Starred Listings, to bookmark them on a User's account
  - Sort by "Trending", i.e. listings with lot's of views and stars at the top
  - Direct Message communication between Buyers and Sellers
  - On Purchase of a Listing, change the approximate location marker on GPS to an exact one, and reveal the address of the Listing Owner to the Buyer
  - Better and more comprehensive Functional Tests. I ran into difficulties creating objects using Factory Bot in Capybara to create dummy data when creating Objects that use related models. So instead I had to create them "live" by having the test scripts go through User and Listing instantiation by filling in forms on the website, this adds a lot of overhead to the tests in code as well as time to execute.



didn't use css framework coz:
reasons TBA