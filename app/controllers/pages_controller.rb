class PagesController < ApplicationController
  require 'garb'
  #google analytics
  #consumer = OAuth::Consumer.new('anonymous', 'anonymous', {
  #  :site => 'https://www.google.com',
  #  :request_token_path => '/accounts/OAuthGetRequestToken',
  #  :access_token_path => '/accounts/OAuthGetAccessToken',
  #  :authorize_path => '/accounts/OAuthAuthorizeToken'
  #})
  #
  #request_token = consumer.get_request_token({}, {:scope => 'https://www.google.com/analytics/feeds'})
  #access_token = request_token.get_access_token(:oauth_verifier => 'paste code from google here')
  #Garb::Session.access_token = access_token
  CA_CERT_FILE = "/Users/eoy/sandbox/cacert.pem"
  Garb::Session.login('eoy@manaflask.com', 'sandboxcontemporary', :secure => true, :account_type => "GOOGLE")

  def home
  	@title = "Home"
  end

  def contact
  end

  def about
  end

  def faq
  end

  def tos
  end

  def shipping
  end

  def press
  end
  
  def google
    profile = Garb::Management::Profile.all.first
    @results = Exits.results(profile, :limit => 10,
       :offset => 20,
       :start_date => (Date.today - 30),
       :end_date => Date.today,
       :sort => :pageviews
    )
  end
end

class Exits
  extend Garb::Model

  metrics :exits, :pageviews
  #dimensions :request_uri
end
