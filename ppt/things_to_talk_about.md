nested comments form

nested address form

many to many

one to one

different listing views, in particular the check for if no Purchase exists where SQL query

custom validator, pretensiousness filter, "this piece invokes a sense of man's inhumanity to man as a result of the consumerist fetishism zeitgeist"

error handling for comments

admin abilities and dashboard, comms manager abilities

capybara because more time to setup

zoom, airbnb marker, google api

recaptcha

in the future:
- would use cancan gem to control authorization, easier to define in one spot rather than putting if statements all over the place, wasn't too bad this time as small and quick app, but in a real project this would become hard to maintain very fast
- do capybara closer to the start, and figure out how to do factory for models with related models
- would create a purchase table that just duplicates the entry in the listings table rather than be a join table between User that purchased and the Listing. this is because now if an account gets deleted, any user that purchased an item from a deleted account will have that listing missing in their purchases
auth



didn't use css framework coz:
reasons TBA