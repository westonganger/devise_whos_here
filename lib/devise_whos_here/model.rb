module Devise
  module Models
    module WhosHere

      def self.included(base)
        base.class_eval do
          include InstanceMethods
          extend ClassMethods
        end
      end

      module InstanceMethods
        def last_here_at
          list = Devise::WhosHere.get(self.class.name)
          list[self[self.class.primary_key]]
        end
      end

      module ClassMethods
        def last_here_since(time)
          ids = Devise::WhosHere.get(self.class.name).select{|_,v| v && v >= time}.keys
          users = find(ids).index_by{|x| x[self.class.primary_key]}.slice(*ids).values
          users || []
        end

        def clear_whos_here!
          Devise::WhosHere.delete!(self.class.name)
        end
      end

    end
  end
end
