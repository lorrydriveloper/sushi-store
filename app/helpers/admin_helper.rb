# frozen_string_literal: true

module AdminHelper
  def average_order(stats)
    (stats[:profit] / stats[:orders]).round(2)
  end

  def order_diff(stats1, stats2)
    stats2[:orders] = stats2[:orders].positive? ? stats2[:orders] : 1
    (stats1[:orders] - stats2[:orders]) * (100 / (stats2[:orders]))
  end

  def value_diff(stats1, stats2)
    today_average = average_order(stats1)
    yesterday_average = average_order(stats2)
    ((today_average - yesterday_average) * (100 / yesterday_average)).round(2)
  end

  def profit_diff(stats1, stats2)
    (stats1[:profit] - stats2[:profit]).round(2)
  end
end
