class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction','Non-Fiction']}

    validate :title_must_be_clickbait

    def title_must_be_clickbait
        clickbait = ["Won't Believe","Secret","Top","Guess"]
        if title
            unless clickbait.any? {|word| title.include? word} 
                errors.add(:title, "must be clickbait")
            end
        end
    end
end
