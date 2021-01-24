# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    - Manager has_many bands
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - Band belongs to manager
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - Band has many members through bandmembers
    - Member has many bands through bandmembers
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - Band has many members through bandmembers
    - Member has many bands through bandmembers
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - BandMember instrument
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - Manager: validates username, email, password
    - Band: validates name
    - Member: validates name
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - Band: scope :ordered_by_name, -> { order(name: :asc) }
- [x] Include signup (how e.g. Devise)
    - Manager#create
- [x] Include login (how e.g. Devise)
    - Session#new
- [x] Include logout (how e.g. Devise)
    - Session#destroy
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - Facebook login
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    -   resources :managers, except: :index do
            resources :bands, only: [:new, :show, :index]
        end
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    -   resources :managers, except: :index do
            resources :bands, only: [:new, :show, :index]
        end
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - _errors.html.erb

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate