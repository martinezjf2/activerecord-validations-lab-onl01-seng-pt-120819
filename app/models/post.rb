class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, presence: true, length: { minimum: 250 }
    validates :summary, presence: true, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    def is_clickbait?
       @clickbait = [/Won't Believe/i, /Secret/i, /Guess/i, /Top [1-9]/]
       if  @clickbait.none? {|clickbait| clickbait.match(self.title)}
                errors.add(:title, "Title must be clickbait")
        end
    end

end


# class Coffee < ApplicationRecord
#     validates :size, inclusion: { in: %w(small medium large),
#       message: "%{value} is not a valid size" }
#   end