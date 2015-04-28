# AdjectiveAnimal

Creates an adjective and an animal. Things like "Hulking Hornet", "Ambivalent Duck" and "Overjoyed Beaver". That's all it does.

## Installation

Add this line to your application's Gemfile:

    gem 'adjective_animal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install adjective_animal

## Usage
There are four fun and exciting ways to use adjective_animal:

1. Create a random adjective animal.
```ruby
aa = AdjectiveAnimal.new
aa.adjective = "Overjoyed"
aa.animal = "Beaver"
```

2. Create an adjective animal with the same starting letter
```ruby
aa = AdjectiveAnimal.new(:k)
aa.adjective = "Knowledgeable"
aa.animal = "Kangaroo"
```

3. Create an array of 26 adjective animals that start with the letters A-Z
```ruby
aa = AdjectiveAnimal.all
# [#<AdjectiveAnimal::AdjAni:0x0000010378fe48 @adjective="Accessible", @animal="Alpaca", @starts_with="a">, #<AdjectiveAnimal::AdjAni:0x0000010377ec88 @adjective="Better", @animal="Baboon", @starts_with="b">, #<AdjectiveAnimal::AdjAni:0x000001036949a8 @adjective="Cloudy", @animal="Camel", @starts_with="c">, #<AdjectiveAnimal::AdjAni:0x00000103686dd0 @adjective="Didactic", @animal="Deer", @starts_with="d">
... to Z
```

4. Fork the gem and add your own stupid stuff to it.  This is a really good way to procrastinate when you are supposed to be working on seed data.
##Helpers
```ruby
aa = AdjectiveAnimal.new
# yield both adjective and animal together as a string
aa.to_s  =  "Tawdry Cod"
# if typing 'adjective' is too much work, you can type 'adj'
aa.adj = "Tawdry"
# and 'ani'
aa.ani = "Cod"
# but wait, theres more! You can also do 'first_name' and 'last_name'
aa.first_name = "Tawdry"
aa.last_name = "Cod"
# you can also pass a string or symbol, upper or lower case as an argument to new()
aa = AdjectiveAnimal.new(:K)
aa = AdjectiveAnimal.new('k')
```

## Uses
I can imagine three possible uses for this gem.
* Liven up your seed or factory data!  User.first_name = 'Test' and User.last_name = 'User' is boring. A user named "Lowly Herring" is good times.
* Create names for medieval or fantasy Inns! "The Broken Beetle" is a great place to find adventure.  I think it would also work for taverns, bordellos and alehouses.
* Start conversations with people more attractive than you. They would go something like:
> You: "Hi, have you heard of the gem adjective_animal?"

 > Them: "Who are you? Please get away from me."

Note: I have only tested one of the above uses, so YMMV.

## FAQ
* Q: What about the gem [faker](https://github.com/stympy/faker), isn't that a better gem?
* A: Yes it is, in pretty much every way imagineable. You should probably use faker.




## Contributing

1. Fork it ( https://github.com/[my-github-username]/adjective_animal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
