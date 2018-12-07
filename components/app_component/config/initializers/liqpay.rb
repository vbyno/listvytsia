Liqpay.default_options = {
  public_key:  ENV['LIQPAY_PUBLIC_KEY'],
  private_key: ENV['LIQPAY_PRIVATE_KEY'],
  currency:    ENV['LIQPAY_CURRENCY'],
  sandbox:     ENV['LIQPAY_SANDBOX'].to_i
}.freeze
