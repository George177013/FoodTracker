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

  private

  def day_params
    params.require(:day).permit(:calorie_goal, :protein_goal, :date)
  end
end
