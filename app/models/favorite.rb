class Favorite < ApplicationRecord
    # 一人のユーザーに属している
    belongs_to :user
    # recipeに属している
    belongs_to :recipe

    # 一人のユーザーは「いいね」が一回まで
    validates_uniqueness_of :recipe_id, scope: :user_id
end
