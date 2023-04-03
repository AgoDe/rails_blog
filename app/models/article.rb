class Article < ApplicationRecord
    
    has_many    :comments
    belongs_to  :user
    # many to many relationship
    has_many    :article_categories
    has_many    :categories, through: :article_categories

    validates   :title, presence: true
    validates   :body,  presence: true, length: { minimum: 10 }

    
end
