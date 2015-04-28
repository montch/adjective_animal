require 'spec_helper'

describe AdjectiveAnimal do


  it "creates a name using adjective_animal" do
    adjective_animal = AdjectiveAnimal.new
    expect(adjective_animal.adj.length).to be > 0
    expect(adjective_animal.ani.length).to be > 0
  end


  it "creates a name using the same starting letter as the symbol or string passed in" do
    adjective_animal = AdjectiveAnimal.new(:y)
    expect(adjective_animal.adj).to start_with 'Y'
    expect(adjective_animal.ani).to start_with 'Y'
    adjective_animal = AdjectiveAnimal.new(:K)
    expect(adjective_animal.adj).to start_with 'K'
    expect(adjective_animal.ani).to start_with 'K'
    adjective_animal = AdjectiveAnimal.new('b')
    expect(adjective_animal.adj).to start_with 'B'
    expect(adjective_animal.ani).to start_with 'B'
    adjective_animal = AdjectiveAnimal.new('C')
    expect(adjective_animal.adj).to start_with 'C'
    expect(adjective_animal.ani).to start_with 'C'
  end

  it "ignores new() arguments that are not a single character or a single symbol" do
    adjective_animal = AdjectiveAnimal.new('woops')
    expect(adjective_animal.adj.length).to be > 0
    expect(adjective_animal.ani.length).to be > 0
    adjective_animal = AdjectiveAnimal.new('1')
    expect(adjective_animal.adj.length).to be > 0
    expect(adjective_animal.ani.length).to be > 0
  end

  it "generates an array of 26 objects with letters A-Z" do
    adjective_animals = AdjectiveAnimal.all
    expect(adjective_animals.length).to eql 26
    expect(adjective_animals.first.adjective).to start_with 'A'
    expect(adjective_animals.first.animal).to start_with 'A'
    expect(adjective_animals.last.adjective).to start_with 'Z'
    expect(adjective_animals.last.animal).to start_with 'Z'
  end

  it "outputs the adjective and animal as two words using to_s" do
    adjective_animal = AdjectiveAnimal.new
    expect(adjective_animal.to_s.split(' ').length).to eql 2
  end


end