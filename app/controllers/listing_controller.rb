class ListingController < ApplicationController
    def new
        @listing = Listing.create
    end
end
