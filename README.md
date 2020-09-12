# RecipeBox

RecipeBox is an app for posting and sharing recipes. On RecipeBox, a user will be able to create, store, and categorize recipes. Recipes will be accessible to the public from the homepage, so users can share their recipes with the world!

## Installation

To try out RecipeBox:

- download or clone the repository
- ```cd``` into the recipe_box directory
- run ```bundle install``` in your console
- create a file in the root directory called ```.env```
- inside ```.env```, enter ```SESSION_SECRET=```
- in your terminal, run ```generate_secret```
- copy and paste the output into your ```.env``` file directly after ```SESSION_SECRET=```
- create a file in the root directory called ```.gitignore```
- inside ```.gitignore```, enter ```.env```. This will make sure your ```.env``` file is not tracked in git
- run ```rake db:migrate```
- run ```shotgun``` 
- open up your web browser and enter the local url provided by the shotgun server

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

Licensed with [MIT](https://choosealicense.com/licenses/mit/)

