module Core::Social
  class BaseAdapter
    attr_reader :response

    def initialize(response)
      @response = response
    end

    %i[
      first_name
      last_name
      email
      password
      provider
      uuid
      photo_url
    ].each do |name|
      define_method name do
        raise NotImplementedError
      end
    end
  end
end
