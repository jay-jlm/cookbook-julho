require 'rails_helper'

RSpec.describe RecipeType, type: :model do
  it 'should valid if it has a non-empty name' do
    #setup
    recipe_type = RecipeType.new(name: '')

    #assert
    expect(recipe_type.valid?).to eq false
  end

  it 'should not be valid if the name is empty' do
    #setup
    recipe_type = RecipeType.new(name: '')

    #assert
    expect(recipe_type.valid?).to eq false
  end

  it 'should not be valid if it has a duplicated name' do
    #setup
    recipe_type = RecipeType.create(name: 'Comidinhas')
    duplicated_recipe_type = RecipeType.new(name: 'Comidinhas')

    #assert
    expect(duplicated_recipe_type.valid?).to eq false
  end
end
