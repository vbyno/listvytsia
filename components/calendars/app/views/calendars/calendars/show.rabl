attributes :id, :city, :start_date, :end_date, :contacts, :course, :dates

collection items.map { |item| present(item) }
