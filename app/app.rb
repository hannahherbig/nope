class Nope < Padrino::Application
  register Padrino::Routing
  register Padrino::Rendering
  register Padrino::Helpers

  enable :flash, :method_override, :sessions, :store_location

  configure :development do
    enable :reload, :raise_errors, :show_exceptions
  end
end
