RailsAdmin.config do |config|
  config.excluded_models << UserRole
  RailsAdmin.authorize_with :cancan
  config.excluded_models << Role
  config.model Artwork do
    edit do
      field :name
      field :description, :text
      field :created_at
      field :width
      field :height
    end
  end
end