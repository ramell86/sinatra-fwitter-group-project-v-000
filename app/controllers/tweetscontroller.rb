class TweetsController < ApplicationController

    

    get '/show' do
        @tweets = Tweet.all
        erb :'/show'
    end

    get '/tweets/new' do
        if logged_in?

        erb :'/new'
        else # logged out and doesn't let them view the create tweet

        redirect to '/login'
        end
    end

     post '/tweets' do
        if logged_in? && params["tweet"]["content"] != "" #blank tweet
        @tweets = Tweet.create(:content => params["tweet"]["content"])
        redirect to '/tweets'
        else

        redirect to '/login'
        end
    end

    get '/users/:slug' do
        @tweets = Tweet.all
        erb :'/tweets'
    end

    get '/tweets/:id' do

        erb :'/tweets'
    end

   

    get 'tweets/:id/edit' do
        if logged_in?

           erb :'/edit'
           else
        redirect to '/login'
        end

    post '/tweets/:slug' do
        binding.pry
        @tweet = Tweet.find_by_id(params[:id])
        @tweet.content = Tweet.find_or_update_by(:content => params["tweet"]["content"])
        binding.pry
        @tweet.update(:content => params["tweet"])

        redirect to "/tweets/#{@tweet.slug}"

        end
    end

    

    get '/tweets/:id/delete' do
        if logged_in?
        @tweet = Tweet.find_by_id(params[:id])
        @tweet.destroy
        redirect to '/tweets'
        else
        redirect to '/login'
        end

    end
end