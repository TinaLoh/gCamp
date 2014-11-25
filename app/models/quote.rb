class Quote < ActiveRecord::Base
  attr_accessor :quote, :author

  def initialize(quote, author)
    @quote = quote
    @author = author
  end
    
end
