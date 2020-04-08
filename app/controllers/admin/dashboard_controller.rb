# frozen_string_literal: true

module Admin
  class DashboardController < AdminController
    before_action :dates
    def index
      @today_stats = stats_by_date(@today, @tomorrow)
      @yesterday_stats = stats_by_date(@yesterday, @today)
      @week_stats = stats_by_date(@today.beginning_of_week, @today.end_of_week)
      @month_stats = stats_by_date(@today.beginning_of_month, @today.end_of_month)
      @year_stats = stats_by_date(@today.beginning_of_year, @today.end_of_year)
    end

    private

    def stats_by_date(start, finish)
      hash = {}
      hash[:users] = User.by_date(start, finish).size
      hash[:comments] = Comment.by_date(start, finish).size
      orders = Order.by_date(start, finish)
      hash[:orders] = orders.size
      hash[:profit] = orders.sum(:total).round(2)
      hash
    end
    
    def dates
      @yesterday = Date.yesterday
      @today = Date.today
      @tomorrow = Date.tomorrow

    end

  end
end
