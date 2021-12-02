class Recipe < ApplicationRecord
    # recipeは一人のユーザーに属しているので、
    belongs_to :user

    # validateをかける
    with_options presence: true do 
        validates :title
        validates :body
    end

    # 一人のユーザーは複数のrecipeを持つことができる
    has_many :recipes, dependent: :destroy
end
