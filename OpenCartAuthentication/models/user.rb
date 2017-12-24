# frozen_string_literal: true

require 'pry'

class User

  attr_accessor :country_id, :email, :zone_id, :address_1,  :postcode, :first_name, :last_name, :telephone, :password, :company, :city

  def initialize
    @first_name = String.new
    @last_name = String.new
    @email = String.new
    @telephone = String.new
    @company = String.new
    @address_1 = String.new
    @city = String.new
    @postcode = String.new
    @country_id = String.new
    @zone_id = String.new
    @password = String.new
  end

  def to_s
    puts first_name
  end


end

