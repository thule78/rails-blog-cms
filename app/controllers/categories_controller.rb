class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!,  except: [:index, :show]
  def index
    @categories = policy_scope(Category).order(created_at: :desc)
  end

  def show
    @category = Category.find(params[:id])
    authorize @category
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    authorize @category
  end

  def update
    @category = Category.find(params[:id])
    authorize @category
    @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    authorize @category
    @category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)

  end
end
