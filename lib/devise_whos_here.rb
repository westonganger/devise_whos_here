require 'devise_whos_here/version'

require 'devise'

Devise.add_module(:whos_here, model: 'devise_whos_here/model')

module Devise
  module WhosHere
    
    def self.get(model)
      val = Rails.cache.read("devise_whos_here_#{model}")
      if !val.is_a?(Hash)
        val = {}
        delete!(model)
      end
      val
    end

    def self.write!(model, id)
      h = get(model)
      h[id] = Time.now
      Rails.cache.write("devise_whos_here_#{model}", h)
    end

    def self.delete!(model)
      Rails.cache.write("devise_whos_here_#{model}", {})
    end

  end
end

Warden::Manager.after_set_user do |record, warden, opts|
  if record.respond_to?(:last_here_at)
    Devise::WhosHere.write!(record.class.name, record[record.class.primary_key])
  end
end
