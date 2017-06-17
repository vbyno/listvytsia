module AppComponent
  class PositiveMoneyValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if value <= Money.new(0, 'UAH')
        record.errors[attribute] << 'Invalid value'
      end
    end
  end
end
