module Devise
  module Models

    module WhosHere
      def last_here_at
        list = Devise::WhosHere.get(class_name)
        list[self[primary_key]]
      end

      def self.last_here_since(time)
        ids = get.select{|_,v| v && v >= time}.keys
        users = find(ids).index_by{|x| x[primary_key]}.slice(*ids).values
        users || []
      end

      def self.clear_whos_here!
        Rails.cache.write!("devise_whos_here_#{class_name}", {})
      end
    end

  end
end
