RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)
  # unless ENV['IGNORE_ADMIN_AUTH'] || Rails.env.development?
    config.authenticate_with do
      authenticate_or_request_with_http_basic('Lobby admin password') do |username, password|
        admin_username = ENV['ADMIN_USER']
        admin_pass = ENV['ADMIN_PASSWORD']
        unless admin_pass
          puts "No ADMIN_PASSWORD env variable, admin disabled"
          admin_pass = SecureRandom.hex(64)
        end
        username == admin_username && password == admin_pass
      end
    end
  # end


  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
