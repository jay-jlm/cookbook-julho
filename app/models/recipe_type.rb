class RecipeType < ApplicationRecord
  validates :name, uniqueness: true, presence: true

end
