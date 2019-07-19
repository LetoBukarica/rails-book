# frozen_string_literal: true

class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    if [0, nil].include?(session[:access_counter])
      session[:access_counter] = 1
    else
      session[:access_counter] += 1
    end
    @counter = session[:access_counter]
  end
end
