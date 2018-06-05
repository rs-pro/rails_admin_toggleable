# RailsAdminToggleable

Master repository has moved to gitlab, all new code will be there:

https://gitlab.com/rocket-science/rails_admin_toggleable

Make any boolean field easily toggleable on\off from index view in rails admin

## Installation

Add this line to your application's Gemfile:

    gem 'rails_admin_toggleable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_admin_toggleable

## Usage

Add the toggleable action:

    RailsAdmin.config do |config|
      config.actions do
        ......
        toggle
      end
    end

Make the field you need toggleable:

    rails_admin do
      list do
        field :enabled, :toggle
        ...
      end
      ...
    end

## Bulk action usage

    # Add the bulk action:
    # define_bulk_toggle_method(type of action, model field)
    define_bulk_toggle_method(:enable, :enabled)
    define_bulk_toggle_method(:disable, :enabled)
    define_bulk_toggle_method(:toggle, :enabled)
    define_bulk_toggle_method(:enable, :deleted)
    define_bulk_toggle_method(:disable, :deleted)
    define_bulk_toggle_method(:toggle, :deleted)

    # enable it for all or some models
    RailsAdmin.config do |config|
      config.actions do
        ......
        bulk_enable_enabled  do
          visible do
            ['Adder::Contest'].include? bindings[:abstract_model].model_name
          end
        end
        bulk_disable_enabled  do
          visible do
            ['Adder::Contest'].include? bindings[:abstract_model].model_name
          end
        end
        bulk_toggle_enabled  do
          visible do
            ['Adder::Contest'].include? bindings[:abstract_model].model_name
          end
        end
        
        bulk_enable_deleted
        bulk_disable_deleted
        bulk_toggle_deleted
      end
    end
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
