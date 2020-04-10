# My trip on Rails

<center><img src=https://i.imgur.com/ABo4188.jpg alt="drawing" width="600"/></center>

## [Live demo](https://sushi-to-you.herokuapp.com/)


 Today is the Day than finally I finished my Rails project two weeks of hard work in Front-end and enjoying my back-end part, where Rails make your life easy.
The ones than follow my progression will already know that the front-end and CSS aren't my best friends...yet.
I decided to go with the pretty friend of CSS,  Sass, which is more manageable and friendly for me as you can reuse code through mixins, and you can use nesting selectors, which makes targeting things way easy.

Work with Rails feels like is more accessible than with Sinatra with Generators of all kind and condition.

#### Sacaffolds
`rails generate scaffold Post name:string title:string content:text`

This one is like God but in a line of code.
It will create everything you need for your model when I mean all is all.

* migration
* model
* controller whit all the actions
* routes
* routes
* views for all the CRUD actions
* helpers
* and a cup of coffee to relax

It can look handy, but it creates way more than what you might need, so I don't like it a lot except for the Cappucino.

#### Resources

`rails generate resource Post title:string body:text published:boolean`

This it is my Fourite as it creates the things you will need almost sure in any model like:

* migration
* model
* folder for your views
* empty controller for your model
* routes
* helpers
* no much more.



#### Model

`rails generate model Post title:string body:text published:boolean`

This one is more basic, and it creates the model and his migration, handy if you don't need views or controllers for your model.


#### Migrations

`rails generate migration create_post title:string body:text published:boolean`

This is the most basic one than create if you write it using convention; it establishes the migration ready to migrate.

There are much more related to generators, and it worth a full article or two for them; this is just the tip of the iceberg.

As I said before, Rails makes your life easier, but on the other hand, it is easy to lose track of how quickly your App is growing and how many things you have to manage. Like routes, nested routes, controllers and its actions, model relationships, views, views helpers, partials, layouts a mare-magnum of files and folder than sometimes is easy to get confused at the beginning.

<center><img src="https://i.imgur.com/8XDOdIZ.jpg" alt="drawing" width="600"/></center>


### The process

After the pass of the days working on the Project, I felt more familiar with the structure and the Rails convention, so I decided to try to do a small incursion on the UX side and create with the help fo Figma the main lines of the App. 

<center><img src="https://i.imgur.com/sWkd5x2.png" alt="drawing" width="600"/></center>

Well, now I know why UX/UI is a branch itself.

When the front end was more or less on track I though than any good e-commerce should be able to manage all the items displayed on the client-side in a comfortable and manageable way, so I took that train over Rails everything is more straightforward. Isn't it?

But finally, after a lot of hard work bugs here and there, refactor after refactor and many other complications. I gave birth to my first e-commerce app with a small admin site to add new items or categories and see the e-commerce stats. For obvious reasons, I haven't implemented any kind of payment gateway.

I hope you enjoy using my App a reading my blog as I did create this App.

<center><img src="https://upload.wikimedia.org/wikipedia/commons/e/ea/Thats_all_folks.svg" alt="drawing" width="600"/></center>
