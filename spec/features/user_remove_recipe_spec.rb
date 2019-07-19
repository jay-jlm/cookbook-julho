require 'rails_helper'

feature 'User removes a recipe' do
  scenario 'sucessfully' do

    #setup
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: 'Brasileira', difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
  
    #perform
    visit root_path
    click_on recipe.title
    click_on 'Vaporizar'

    #expect
    expect(current_path).to eq root_path
    expect(page).not_to have_content('Bolo de cenoura')
  end

  scenario 'specifically' do

    #setup
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: 'Brasileira', difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    recipe2 = Recipe.create(title: 'Bolo de abacate', recipe_type: recipe_type,
                            cuisine: 'Brasileira', difficulty: 'Médio',
                            cook_time: 60,
                            ingredients: 'Farinha, açucar, abacate',
                            cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
  
    #perform
    visit root_path
    click_on recipe2.title
    click_on 'Vaporizar'

    #expect
    expect(current_path).to eq root_path
    expect(page).not_to have_content(recipe2.title)
    expect(page).to have_content(recipe.title)
  end

end