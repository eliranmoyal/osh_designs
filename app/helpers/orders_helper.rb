module OrdersHelper

	# def orders_chart_series(orders, start_time)
	# 	orders_by_day = orders.where(:created_at => start_time.beginning_of_day..Time.zone.now.end_of_day).
	# 	group("date(created_at)").
	# 	select("date(created_at), sum(price) as price")
	# 	(start_time.to_date..Date.today).map do |date|
	# 		order = orders_by_day.detect { |order| order.created_at.to_date == date }
	# 		order && order.price.to_f || 0
	# 	end.inspect
	# end
end
