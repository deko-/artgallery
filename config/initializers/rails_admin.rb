RailsAdmin.config do |config|
  config.excluded_models << UserRole
  RailsAdmin.authorize_with :cancan
end