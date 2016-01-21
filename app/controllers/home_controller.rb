class HomeController < ApplicationController
  def index
  	if params[:q].nil? || params[:q].empty?
	  @listings = Listing.last(4).sort {|a,b| b <=> a}
	else

	  @listings = Listing.search params[:q], fields: [:title]
	end
  end
end
