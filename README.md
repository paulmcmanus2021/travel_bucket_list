# travel_bucket_list
CodeClan Week 4 Solo Project

Travel Bucket List
Build an app to track someone’s travel adventures.

MVP:
The app should allow the user to track countries and cities they want to visit and those they have visited.
The user should be able to create, edit and delete countries
Each country should have one or more cities to visit
The user should be able to create, edit and delete cities
The app should allow the user to mark destinations as visited or still to see
Possible Extensions:
Have separate pages for destinations visited and those still to visit
Add sights to the destination cities
Search for destination by continent, city or country
Any other ideas you might come up with

to run this file:
- create database. In terminal createdb travels
- run seeds file. In terminal ruby db/seeds.rb
- psql -d travels -f db/travels.sql
- ensure sinatra gem is installed (sudo gem install )
- spin up server: ruby app.rb
- navigate to localhost:4567

Challenges encountered during the project:

1.Continually adding to working pages.
  Once a page worked I'd want to add more to that page instead of moving on to the next problem.
2.Immediately tried to encompass the entire brief.
  I tried to factor in everything I would need by the end straight away. Essentially I bit off more than I could chew at this stage
  in my career. To solve this problem I kept my classes and methods but started again going through MVP step by step.
3.Adding a city to a country needed a that countries id.
  This of course makes sense but was difficult to implement due to my site needing someone to add a city after they'd chosen a
  country. I solved this by writing a method in city.rb to grab the country id.
4.Updating a country followed the same POST route as adding a city to the country.
  To solve this I changed the route that Country Update takes.
5.Updating Continents/ Sights to visited/not visited.
  I tried to add these features in last minute. I have the seed data going where it should and had the forms up and running but
  the data was not updating. This is something I will work on over the Christmas break.
6.CSS.
  Rather than wade into .css I decided to focus more on functionality and rereading class notes up to this point to get a better
  understanding of what we've worked on so far.
7.Lack of experience!
  This is my second website. My first was the one I built as pre-coursework for CC. I'm happy with the progress I've made.
