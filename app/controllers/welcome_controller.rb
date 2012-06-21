class WelcomeController < ApplicationController
  def index
	  redirect_to Page.where(:title => "Welcome").first
  end
end
