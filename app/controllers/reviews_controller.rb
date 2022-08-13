class ReviewsController < ApplicationController

    def index

        @reviews = Review.all

    end

    def new

        @review = Review.new

    end

    def create

        # take info from form and add it to the DB
        @review = Review.new(form_params)

        # check if the model can be saved
        # save this to the DB
        if @review.save
            # if it can, redirect back to the homepagee
            redirect_to root_path
        else 
            # show the view for new.html.erb
            render "new"
        end

    end

    def show

        # individual review page
        @review = Review.find(params[:id])

    end

    def edit

        # find individual review
        @review = Review.find(params[:id])

    end

    def update

        # find individual review
        @review = Review.find(params[:id])

        # update with new info from form
        if @review.update(form_params)
            # redirect to individual review page
            redirect_to review_path(@review)
        else
            render "edit"
        end

    end

    def destroy
        # find the individual review
        @review = Review.find(params[:id])

        # destroy
        @review.destroy

        # redirect to homepage
        redirect_to root_path

    end

    def form_params
        params.require(:review).permit(:title, :body, :score, :author, :genre)
    end
    
end
