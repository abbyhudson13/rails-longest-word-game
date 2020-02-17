require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    charset = Array('A'..'Z')
    @letters = Array.new(10) { charset.sample }.join
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = JSON.parse(open(url).read)
        if response['found']
          @message = "Congratulations! #{@word} is an english word"
        else @message = "Sorry, #{@word} is not an english word"
      end

  end
end
