class DaysController < ApplicationController
  def index
    @days = Current.user.days.all
  end

  def create
    Day.new(date: Date.today, user_id: Current.user.id).save
    redirect_to days_path
  end

  def show
    @day = Current.user.days.includes(:meals).find(params[:id])

    @total_protein = @day.meals.sum(:protein)
    @total_calories = @day.meals.sum(:calories)
  end

  def update
    @day = Current.user.days.find(params[:id])
    if @day.update(day_params)
      redirect_to day_path
    end
  end

  def destroy
    @day = Current.user.days.find(params[:id])
    @day.destroy

    redirect_to days_path
  end

  def add_meal
    @day = Day.find(params[:id])
    @day.meals.create

    redirect_to day_path
  end

  def update_meal
    @day = Current.user.days.find(params[:id])
    @meal = @day.meals.find(params[:meal][:id])

    if @meal.update(meal_params)
      redirect_to day_path(@day)
    end
  end

  def delete_meal
    @day = Current.user.days.find(params[:id])
    @meal = @day.meals.find(params[:meal_id])

    @meal.destroy

    redirect_to day_path(@day)
  end

  private

  def day_params
    params.require(:day).permit(:calorie_goal, :protein_goal, :date)
  end

  def meal_params
    params.require(:meal).permit(:name, :calories, :protein)
  end
end
