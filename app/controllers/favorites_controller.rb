class FavoritesController < ApplicationController
    def create
        # current_user.favorites.createはcurrent_userに結びついたいいねを作成 
        # recipe_idはいいねした記事のid
        # params[:recipe_id]で取ってきたモノをrecipe_idに入れる
        @favorite = current_user.favorites.create(recipe_id: params[:recipe_id])
        # いいねをしたときに前の画面に戻る
        # 一覧画面でいいねをしたら一覧画面に戻り、詳細画面でいいねをしたら詳細画面に戻る
        redirect_back(fallback_location: root_path)
    end

    def destroy
        # どのrecipeに結びついている「いいね」を削除するのかを設定
        @recipe = Recipe.find(params[:recipe_id])
        # current_userの中から結びついているものから、recipe_isはさっきとってきた@recipe.idに入れる
        @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
        @favorite.destroy
        # 一つ前のURLが見つからなっか場合、root_pathに遷移する
        redirect_back(fallback_location: root_path)
    end

end
