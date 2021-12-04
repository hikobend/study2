class RecipesController < ApplicationController
  # ログインしていない人のアクセスを制限する。ただしindexは除く
  before_action :authenticate_user!, except: [:index]

  def index
    @recipes = Recipe.all 
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # だれが投稿したのかを保存する
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    #  投稿者とログインしている人が同じではない場合、編集させたくないので
    if @recipe.user_id != current_user.id
      redirect_to recipes_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    # もしアップデートされたら
    if @recipe.update(recipe_params)
      # recipeの詳細画面に移動するようにする
      redirect_to recipe_path(@recipe), notice: "更新に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    # @がついていない理由。(ローカル変数で)viewに渡すとこができないため。
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :body)
  end
end
