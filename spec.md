# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app 
    - ```gem 'sinatra'```, ```ApplicationController < Sinatra::Base```
- [x] Use ActiveRecord for storing information in a database
    - models inherit from ```ActiveRecord::Base```
- [x] Include more than one model class (e.g. User, Post, Category)
    - ```user.rb```, ```recipe.rb```, ```tag.rb```, ```recipe_tag.rb```
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - ```Recipe has_many :recipe_tags``` and ```has_many :tags, through: :recipe_tags```
    - ```Tag has_many :recipe_tags``` and ```has_many :recipes, through: :recipe_tags```
    - ```User has_many :recipes```
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - ```Recipe belongs_to author```
    - ```Recipe_tag belongs_to Recipe``` and ```belongs_to Tag```
- [x] Include user accounts with unique login attribute (username or email)
    - ```UserController``` handles creation of users with unique emails
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - ```get “/recipes”```
    - ```get “/recipes/new”```
    - ```post “/recipes”```
    - ```get “/recipes/:id”```
    - ```get “/recipes/:id/edit”```
    - ```patch “/recipes/:id”```
    - ```delete “/recipes/:id”```
- [x] Ensure that users can't modify content created by other users
    - ```#redirect_if_not_authorized``` displays error if user not authorized to modify content
- [x] Include user input validations
    - ```@user.save``` uses validations to check if required fields are properly filled out
    - ```User validates :email, presence: true, uniqueness: true```
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    - README.md: recipebox description, installation, contributing, license

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message