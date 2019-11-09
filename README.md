<TODO contents page>



# Levente Toth - T2A2 - Art Haus

Artists are often limited by the decisions of art dealers, and galleries. Due to the constraints of finite space and time, as well as the desire for profit, dealers and galleries limit artist exposure, reach and profits.

Making it harder for artists to create and display their work through the above constraints means less art for the world. In an age approaching post-scarcity the human race needs more and more ways to ponder about themselves and their surroundings. More ways to find meaning, more ways to express themselves.

The 2-way marketplace web application *Art Haus* has been created as a tool to help, by removing the middle man (art galleries or exclusive dealers) and connecting artists and art collectors directly to other collectors and admirers of art.

The target audience is artists and those who appreciate art.

View the live website for Art Haus [here](https://enigmatic-mountain-10943.herokuapp.com/).

View the source code and version control repository [here](https://github.com/LevPewPew/art-market).

## App Description

The following tech stack and plug-ins/services were used to achieve what is outlined below:

- HTML
- CSS/SCSS
- JavaScript
- Ruby
- Ruby on Rails
- Stripe
- AWS S3
- Heroku

### Functionality and Features
- Database to track entities such as Users, Listings, etc.
- Create user accounts with authorization and authentication (using Devise package).
- Any User account can both buy and sell art.
  - User can post a Listing to app for potential buyers to view or purchase.
  - User can browse art and use a search bar the look for specific artists.
  - User can purchase listed art.
- Payment Processing (using Stripe plug-in).
- Cloud Storage (using Amazon Web Services S3 plug-in).
- reCAPTCHA security to prevent spam or automated Listings from bots.
- Search bar (using Ransack package)
- Functional testing suite, (using Capybara package).
- GPS location with Google Maps API and approximate location indicator.
- Admin User role, has authority to take CRUD actions on Object's not owned by them. Also has access to Admin Dashboard.
- Admin Dashboard. Can view all users here and manage their account details. Can also view site statistics.
- Communications Manager User role, has authority to edit or delete any Comments.

### Future Developments

Some functionality and features for the future I would have liked to include but didn't have enough time for are:

  - Starred Listings, to bookmark them on a User's account.
  - Sort by "Trending", i.e. listings with lot's of views and stars at the top.
  - Search bar that searches for Listings with a certain Style, searching related models is an "advanced mode" feature of the Ransack gem that I didn't have time to implement.
  - Direct Message communication between Buyers and Sellers.
  - On Purchase of a Listing, change the approximate location marker on GPS to an exact one, and reveal the address of the Listing Owner to the Buyer.
  - Use of the CanCan gem for User Account Authorization management. I decided to avoid using a package because I felt this site would be relatively small and simple given the time frame, but in hindsight even a site this small and simple would have benefited greatly from abstracting authorization to be managed in a central location as it became a bit messy and hard to track having authorization checks spread throughout all the views and controllers.
  - Better and more comprehensive Functional Tests. I ran into difficulties creating objects using Factory Bot in Capybara to create dummy data when creating Objects that use related models. So instead I had to create them "live" by having the test scripts go through User and Listing instantiation by filling in forms on the website, this adds a lot of overhead to the tests in code as well as time to execute.
  - Change Purchases entities to be a duplicate of a Listing entity, rather than a join table to link Users that purchased to Listing they purchased. This is to allow a Users purchase history to not be have missing entires when the Seller of a Listing they purchased has their account deleted which deletes the related Listings. Originally I did this as join table as I thought I shouldn't create more data than I need to, not considering this limitation that would result from it.
  - On slower connections, it can take a while to render a Listing index due to all the images not being scaled down to a smaller file size appropriate to the displayed dimensions of the images. In the future I would account for this by following [this guide](https://aws.amazon.com/blogs/compute/resize-images-on-the-fly-with-amazon-s3-aws-lambda-and-amazon-api-gateway/).

### Sitemap

![Site Map](./docs/T2A2-sitemap.png)

### Example Screenshots

<TODO add screens when app is completed>

## User Stories

*Buying a Piece:*
The a brand new User will start browsing the listings on the home page and see a piece of art that looks interesting. They then click on that piece to see more high resolution photos and perhaps read a background on the piece or the artist. Deciding they would like to own the piece they then click a purchase button. Being a new user they have no account and are prompted to make a new one and enter their information. Once this is complete they enter payment details into the Stripe payment plug in to complete their purchase. A Purchase history is now present in their account.

*Selling a Piece:*
A new artist who already has an account logs in and decides they want to list one of their pieces. They go to their personal listings page which currently is empty. The click a New Listing button and are then taken to a new listing page where they fill in the details of their listing. Once they submit they are returned to their current listings page where they can see a new listing item that contains all the details they entered as well as the pick up location which is the address they have in their User account details.

## Wireframes

### Home Page

![Home Page](./docs/T2A2-wireframe-homepage.png)

### Log In

![Log In](./docs/T2A2-wireframe-login.png)

### New User

![New User](./docs/T2A2-wireframe-newuser.png)

### New/Edit Listing

![New/Edit Listing](./docs/T2A2-wireframe-neweditlisting.png)

### Show Listing

![Show Listing](./docs/T2A2-wireframe-showlisting.png)

### Successful Listing

![Successful Listing](./docs/T2A2-wireframe-successfullisting.png)

### Successful Purchase

![Successful Purchase](./docs/T2A2-wireframe-successfulpurchase.png)

### User Settings

![User Settings](./docs/T2A2-wireframe-usersettings.png)

## ERD, Schema, Models and Database Relations

### Entity Relationship Diagram (ERD)

![ERD](./docs/T2A2-ERD.png)

### Schema

![Schema 1](./docs/T2A2-schema-1.png)

![Schema 2](./docs/T2A2-schema-2.png)

![Schema 3](./docs/T2A2-schema-3.png)

![Schema 4](./docs/T2A2-schema-4.png)

### Models and Database Relations

#### Model and Relationship Design

A User is a model generated by the *Devise* package, as such it has the default parameters created by Devise. I had heard there can be difficulties adding custom parameters onto this Devise generated model so given the time constraints I decided to create related models to expand upon the User model rather than attempting to add the parameters directly onto the User Model. This is seen with the *One and Only to One and Only One* relationship between the User and UserDetail models, and the *One and Only to One and Only One* relationship between the UserDetail and the Address models. The Address is given it's own model so as to allow normalization of address data without cluttering the UserDetail model.

The Listing model has several related models:

The Style model (which is a list of art styles a listing can choose from to help describe it, e.g. Impressionism, Cubism, Minimalism, etc) is linked to the Listing model via a join table named ListingsStyle model. A join table was used as Listing and Style have a *Many to Many* relationship as many different Listings could share the same style but work of art could potentially be categorized by more than one style if it takes aspects from several art movements, e.g. a Surrealist Psychedelic painting, or a Minimalist piece of Street Art. Although not enforced through model validation in any way, the New/Edit Listing forms only allows the possibility of 3 Styles being linked to a Listing, this is to prevent users from claiming a listing is every type of art style possible to show up in more searches.

The Listing model has a *One to Many* relationship with the Comment model. Users can post comments on the Listing show page to discuss the art work. Obviously in order to have a conversation or more than one comment on a listing the Comment model will have a Foreign Key referencing the Listing ID to create the One to Many relationship.

And of course the Listing has a *Many to One* relationship with the User model via it's Foreign Key that references a User ID to allow a User to post several Listings at a time.

Purchases are a type of join table to link Users to Listings whenever a User purchases a Listing. The Purchases table is two Foreign Keys, one to reference the purchased Listing and another to reference the User who purchased the Listing. In this way a User can view what Listings they have Purchased by doing a query on what Listings have both a Purchase referencing it and reference the User. Although a join table was used this is actually implemented as a *One and Only One to Zero or Many* relationship. This is because a User may have not purchased anything, or purchase one or many Listings, but a Listing has either been purchased or it has not.

Due to many models referencing others, and SQL/Postgress enforcing relational integrity, in my model I sometimes needed to account for this. Specifically I wanted to force the destruction of table record when a table record being referenced by it is destroyed, in order to allow certain functionality without destroying relational integrity. For example when a User is deleted, I want all the related UserDetail, Address, Listing, Comment and Purchase entities destroyed as well, which is achieved by putting a ```dependant: destroy``` option into the model. This is so that the ability to delete a user exists, but if the user is deleted, the related table entries are deleted along with it so that, for example, a Listing isn't left on the website to be purchased when the User that posted it no longer exists.

#### Schema Design

All Primary Keys and Foreign Keys have the *bigint* data types. This is because an integer would not have enough bits to represent larger numbers, larger numbers are necessary for Primary Keys as each new table record that is created must be unique and never repeats, even when a smaller Primary Key doesn't exist due to an earlier record's destruction.





## High Level Components

TODO

* Explain the different high-level components (abstractions) in your App: is talk about active record and how SQL is abstracted to helpers. form helpers, active storage, devise, stripe, etc. mention active record is an ORM

## Task and Project Management

TODO trello and a brief discussion overview about how i used it and managed my time and my process e.g. erd and wireframes then side leave validtions last, and CSS at very end pump out models first, etc.






<TODO all this stuff once app is complete>

## R15	Explain the different high-level components (abstractions) in your app
* R16	Detail any third party services that your app will use
* R17	Describe your projects models in terms of the relationships (active record associations) they have with each other
* R18	Discuss the database relations to be implemented in your application
* R19	Provide your database schema design, basically tack onto ERDs info about nullable and defaults, talk about the types etc. talk abouy why you used certain types. example why postfcode is string, to have leading zeros.
* R20	Describe the way tasks are allocated and tracked in your project

rubrick
* Describe the way tasks are planned and tracked in your project (Shows significant planning for how tasks are planned and tracked, including a full description of the process and of the tools used)
* Explain the different high-level components (abstractions) in your App: is talk about active record and how SQL is abstracted to helpers. form helpers, active storage, devise, stripe, etc. mention active record is an ORM
* sanitziation is allowing permitted paramaters, form validation, and formatting values a user may enter for the database to use.
  - Sanitizing will remove any illegal character from the data.
  - Validating will determine if the data is in proper form.
* user stories follow this structure: as a <something> i can do <something> to achieve <something> https://www.atlassian.com/agile/project-management/user-stories