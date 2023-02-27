class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
    def leave_review(user, star_rating, comment)
        Review.create(user: user, star_rating: star_rating, comment: comment)

    end

    def print_all_reviews
        reviews.each do |review|
            puts"Review for #{name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
        end
    end

  def average_rating
    reviews.average(:star_rating)
  end
end