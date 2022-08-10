class ReviewsController < ApplicationController

    def index

        @reviews = ["Little Women", "Sylvia", "The Power of Now"]

    end

    def new

        @review = Review.new

    end
    
end
