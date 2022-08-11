class ReviewsController < ApplicationController

    def index

        @reviews = Review.all

    end

    def new

        @review = Review.new

    end

    def create

        # take info from form and add it to the DB
        @review = Review.new(params.require(:review).permit(:title, :body, :score, :author, :genre))

        # save this to the DB
        @review.save

        # redirect back to the homepagee
        redirect_to root_path

    end

    def show

        # individual review page
        @review = Review.find(params[:id])

    end

    def destroy
        # find the individual review
        @review = Review.find(params[:id])

        # destroy
        @review.destroy

        # redirect to homepage
        redirect_to root_path

    end
    
end
