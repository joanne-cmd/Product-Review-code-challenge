class Review < ActiveRecord::Base
   belongs_to :user
   belongs_to :product

   def print_review
    "Review for#{products.name} by#{users.name}: #{star_rating}.#{comment}"
   end

end