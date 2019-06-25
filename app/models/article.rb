class Article < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  validates :title, presence: true
  validates :content, presence: true
  has_many :article_categories
  has_many :categories, through: :article_categories
end
