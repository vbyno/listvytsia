class Phone
  attr_reader :human_number

  # PhoneValue.new("0673540404"), PhoneValue.new("+3803243-55-31")
  def initialize(human_number)
    @human_number = human_number
  end

  def to_s
    number
  end

  def number
    @number ||= to_number(human_number)
  end

  def link_tel
    mask = "380320000000"
    "tel:+#{mask[0, mask.length - number.length]}#{number}"
  end

  private

  def to_number(value)
    value.to_s.gsub(/[^0-9]/, '')
  end
end
