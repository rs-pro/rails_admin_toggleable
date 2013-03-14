require 'builder'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Toggle < RailsAdmin::Config::Fields::Base
          # Register field type for the type loader
          RailsAdmin::Config::Fields::Types::register(self)
          include RailsAdmin::Engine.routes.url_helpers

          register_instance_option :view_helper do
            :check_box
          end

          register_instance_option :formatted_value do
            case value
              when nil
                '-'
              when false
                'On'
              when true
                'Off'
            end
          end

          register_instance_option :pretty_value do
            case value
              when nil
                %{<span class="badge">-</span>}
              when false
                bindings[:view].link_to '&#x2718;'.html_safe, toggle_path(model_name: @abstract_model, id: bindings[:object].id, method: name, on: '1'), method: :post, class: 'badge badge-important'
              when true
                bindings[:view].link_to '&#x2713;'.html_safe, toggle_path(model_name: @abstract_model, id: bindings[:object].id, method: name, on: '0'), method: :post, class: 'badge badge-success'
            end.html_safe
          end

          register_instance_option :export_value do
            value.inspect
          end

          # Accessor for field's help text displayed below input field.
          register_instance_option :help do
            ""
          end
        end
      end
    end
  end
end