
<TODO contents page>

* R13	Wireframes for your app
* R14	An ERD for your app
* R15	Explain the different high-level components (abstractions) in your app
* R16	Detail any third party services that your app will use
* R17	Describe your projects models in terms of the relationships (active record associations) they have with each other
* R18	Discuss the database relations to be implemented in your application
* R19	Provide your database schema design
* R20	Describe the way tasks are allocated and tracked in your project

# Levente Toth - T2A2 - Art Haus

Artists are often limited by the decisions of art dealers, and galleries. Due to the constraints of finite space and time, as well as the desire for profit, dealers and galleries limit artist exposure, reach and profits.

Making it harder for artists to create and display their work through the above constraints means less art for the world. In an age approaching post-scarcity the human race needs more and more ways to ponder about themselves and their surroundings. More ways to find meaning, more ways to express themselves.

The 2-way marketplace web application *Art Haus* has been created as a tool to help, by removing the middle man (art galleries or exclusive dealers) and connecting artists and art collectors directly to other collectors and admirers of art.

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
- Functional testing suite, (using Capybara package).
- GPS location with Google Maps API and approximate location indicator.
- Admin User role, has authority to take CRUD actions on Object's not owned by them. Also has access to Admin Dashboard.
- Admin Dashboard. Can view all users here and manage their account details. Can also view site statistics.
- Communications Manager User role, has authority to edit or delete any Comments.

### Future Developments

Some functionality and features for the future I would have liked to include but didn't have enough time for are:

  - Starred Listings, to bookmark them on a User's account.
  - Sort by "Trending", i.e. listings with lot's of views and stars at the top.
  - Direct Message communication between Buyers and Sellers.
  - On Purchase of a Listing, change the approximate location marker on GPS to an exact one, and reveal the address of the Listing Owner to the Buyer.
  - Use of the CanCan gem for User Account Authorization management. I decided to avoid using a package because I felt this site would be relatively small and simple given the time frame, but in hindsight even a site this small and simple would have benefited greatly from abstracting authorization to be managed in a central location as it became a bit messy and hard to track having authorization checks spread throughout all the views and controllers.
  - Better and more comprehensive Functional Tests. I ran into difficulties creating objects using Factory Bot in Capybara to create dummy data when creating Objects that use related models. So instead I had to create them "live" by having the test scripts go through User and Listing instantiation by filling in forms on the website, this adds a lot of overhead to the tests in code as well as time to execute.
  - Change Purchases entities to be a duplicate of a Listing entity, rather than a join table to link Users that purchased to Listing they purchased. This is to allow a Users purchase history to not be have missing entires when the Seller of a Listing they purchased has their account deleted which deletes the related Listings. Originally I did this as join table as I thought I shouldn't create more data than I need to, not considering this limitation that would result from it.

### Sitemap

![Site Map](./docs/T2A2-sitemap.png)

### Screenshots

<TODO add screens when app is completed>

### Target audience

Artists and those who appreciate art.

### Tech stack (e.g. html, css, deployment platform, etc)



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

## ERD

<TODO place here when app is finished as my first draft may end up changing>

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