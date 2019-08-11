
# Sydney Yoga


**Link:** https://sydney-yoga.herokuapp.com/login


#### Yoga class  - student view
<img alt="sydney yoga student page" src="/app/assets/images/student.png" width="500px">

#### Yoga class - instructor view
<img alt="sydney yoga instructor page" src="images/instructor.png" width="500px">

#### Add a new yoga class - instructors only (authorisation required)
<img alt="sydney yoga instructor page" src="images/add_class.png" width="500px">


## Project 1 for GA's WDI

**Goal:**  To build my first full-stack application using a Rails app.

**Main Features**
* Encrypted login for students and instructors
* Students can book and cancel yoga classes
* Instructors can create, edit and delete yoga classes
* A yoga class can be set to reoccur weekly  
* Instructors can view students booked for each class
* Displays google map for class location
* Images can be uploaded to student/instructor profiles and instructors can upload an image for their class

**Tech Used**
* Ruby 2.6.3
* Ruby on Rails
* Gems: pry-rails, cloudinary, rails 12 factor, geocoder, jquery
* APIs: Google Maps JavaScript API, Google Geocoding API
* HTML
* CSS
* Deployed to Heroku

**List of bugs**
* Reoccurring classes can only happen at weekly intervals
* Design is not responsive

**Future features**
* Show page for instructors and students (only visible to instructors)
* Integrating Stripe for purchasing yoga classes
