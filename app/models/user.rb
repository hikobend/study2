class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # nameが空だと保存できないように設定する
  validates :name, presence: true
  # 一人のユーザーは複数のrecipeを持つことができる
  has_many :recipes, dependent: :destroy
  # recipeはたくさんのいいねをされる可能性があるため
  has_many :favorites, dependent: :destroy

  # いいねをしたかしていないかを判定するメソッドを作成
   def already_favorited?(recipe)
    # selfの中にはcurrent_userが入ると思ってよい
    # current_userに結びついているいいねの中で、recipe_idの中にすでにrecipe.idが入っているなら。
    self.favorites.exists?(recipe_id: recipe.id)
   end
end
