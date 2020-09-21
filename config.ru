require './config/environment'

run ApplicationController
use RecipesController
use UsersController
use SessionsController
use TagsController