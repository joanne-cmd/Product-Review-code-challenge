class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews
def favorite_product
    products.order("review.star_rating DESC").first
end
def remove_reviews(product)
    reviews.where(product: product).delete_all
end
end