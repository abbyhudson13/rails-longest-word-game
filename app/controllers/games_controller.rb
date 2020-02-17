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
        if countdown(@word)
          @message = "words not included"
          if response['found']
            @message = "Congratulations! #{@word} is an english word"
          else @message = "Sorry, #{@word} is not an english word"
          end
        else
          @message = "Sorry not included"
        end
    end

  def countdown?(word)
    @letters = params[:letters].split(//).sort
    user_letters = word.upcase.split(//).sort
    (user_letters - @letters).empty?
  end
end
