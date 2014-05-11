require "rails_admin_toggleable/version"

require 'rails_admin/config/actions'
require 'rails_admin/config/model'

require 'rails_admin_toggleable/action'
require 'rails_admin_toggleable/bulk_action'
require 'rails_admin_toggleable/field'
require 'rails_admin_toggleable/engine'

def define_bulk_toggle_method(type, meth)
  u = "bulk_#{type}_#{meth}"
  c = u.camelize
  s = c.to_sym
  Object.const_set(s, Class.new("RailsAdmin::Config::Actions::Bulk#{type.to_s.camelize}".constantize) {})
  
  c.constantize.class_eval <<-RUBY, __FILE__, __LINE__+1
    def self.meth
      #{meth.to_sym.inspect}
    end
  RUBY

  RailsAdmin::Config::Actions.register(u.to_sym, c.constantize)
end
