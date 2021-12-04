class Recipe < ApplicationRecord
    # recipeは一人のユーザーに属しているので、
    belongs_to :user
    # recipeはたくさんのいいねをされる可能性があるため
    has_many :favorites, dependent: :destroy

    # validateをかける
    with_options presence: true do 
        validates :title
        validates :body
    end
end
