# require_relative "./config/environment"
puts "Deleting old data..."
Product.destroy_all
User.destroy_all
puts "🌱 Seeding data..."


# Create users
bob = User.create(name: "Mike" )
alice = User.create(name: "Jane")

# Create products
phone = Product.create(name: "Phone")
laptop = Product.create(name: "Laptop")

# Create reviews
review1 = Review.create(user: bob, product: phone, star_rating: 4, comment: "Great phone!")
review2 = Review.create(user: alice, product: phone, star_rating: 5, comment: "Best phone ever!")
review3 = Review.create(user: bob, product: laptop, star_rating: 3, comment: "Good laptop.")
review4 = Review.create(user: alice, product: laptop, star_rating: 4, comment: "Nice laptop.")

# Object Association Methods

# Review
# Review#user
# Returns the User instance for this Review
puts "Review#user:"
puts review1.user == bob # true

# Review#product
# Returns the Product instance for this Review
puts "Review#product:"
puts review1.product == phone # true

# Product
# Product#reviews
# Returns a collection of all the Reviews for the Product
puts "Product#reviews:"
puts phone.reviews == [review1, review2] # true

# Product#users
# Returns a collection of all the Users who reviewed the Product
puts "Product#users:"
puts phone.users == [bob, alice] # true

# User
# User#reviews
# Returns a collection of all the Reviews that the User has given
puts "User#reviews:"
puts bob.reviews == [review1, review3] # true

# User#products
# Returns a collection of all the Products that the User has reviewed
puts "User#products:"
puts bob.products == [phone, laptop] # true

# Aggregate and Association Methods

# Review
# Review#print_review
# This should puts in the terminal a string formatted as follows: Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}
puts "Review#print_review:"
review1.print_review # "Review for Phone by Bob: 4. Great phone!"

# Product
# Product#leave_review(user, star_rating, comment)
# Takes a User (an instance of the User class), a star_rating (integer), and a comment (string) as arguments, and creates a new Review in the database associated with this Product and the User
puts "Product#leave_review:"
phone.leave_review(alice, 3, "Not bad.")
puts phone.reviews.last.user == alice # true

# Product#print_all_reviews
# This should puts in the terminal a string representing each review for this product
# Each review should be formatted as follows: Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}
puts "Product#print_all_reviews:"
phone.print_all_reviews
# "Review for Phone by Bob: 4. Great phone!"
# "Review for Phone by Alice: 5. Best phone ever!"
# "Review for Phone by Alice: 3. Not bad."

# Product#average_rating
# Returns a float representing the average star rating for all reviews for this product
puts "Product#average_rating:"
puts phone.average_rating == 4 # true

# User
# User#favorite_product
# Returns the product instance that has the highest star rating from this user
puts "User#favorite_product:"
puts alice.favorite_product == phone # true

# User#remove_reviews

puts "🌱 Done seeding!"