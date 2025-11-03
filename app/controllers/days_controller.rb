class DaysController < ApplicationController
  before_action :set_day, only: %i[ show ]

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

  private
    def set_day
      @day = Day.find(params[:id])
    end
end
