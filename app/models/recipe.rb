class Recipe < ActiveRecord::Base
    belongs_to :author, class_name: "User" 
    has_many :recipe_tags
    has_many :tags, through: :recipe_tags
    validates :title, presence: true
    validates :content, presence: true 
    # you want control over names of methods that you call 
    # conventions might not line up perfectly
    # you can call the method what makes sense to you, but have the right 
    # objects come back 
    # belongs_to and has_many makes assumptions about classes and database tables
    # if any assumption isn't true, you can still user the macros
    # but tell active record how to deal with it 
    # author returns instance of user class, because we specified the user class 
    # class name and foreign key are main two assumptions that belongs_to makes
    # that you can override. foreign key indicates with column in class table
    # is the foreign key that points to the primary key of the other class 
    # "when i look for author, i want you to look at this table and
    # return user with id that matches author id" 
    # class names, foreign key, source <- things you override most often 
    # main point: sense of how this has to work to do something that isn't magical 
    # can you figure it out from there? 
    # what situations would you use this in? why/where do you want to override class name
    # : in situation where something like "belongs_to :author"
    # isn't telling you everything you need to know to get back the correct object
    # if you had author class with foreign key author_id, that would be enough
    # but if you're saying when i call author on post, i'm describing a user 
    # that's related to this post AS an author. 
    # why is "User" a string? because it's the name of the class 
end
