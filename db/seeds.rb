# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
Product.delete_all

Product.create(title: 'Programming Ruby 1.9',
  description:
    %{<p>
      Ruby is the fastest growing and most exciting dynamic language out
      there.  If you need to get working programs delivered fast,
      you should add Ruby to your toolbox.
      </p>},
  image_url: 'ruby.jpg',
  price: 49.95
)

Product.create(title: 'CoffeeScript',
  description:
    %{<p>
      CoffeeScript is JavaScript done right. It provides all of
      JavaScript's' functionality in a more succinct syntax
      </p>},
  image_url: 'cs.jpg',
  price: 60.00
)

Product.create(title: "Why's poignant guide to Ruby'",
  description:
    %{<p>
      An entertaining and informative exploration into the world of Ruby,
      as told by your spirit guide Why.
      </p>},
  image_url: 'why.jpg',
  price: 0.00
)