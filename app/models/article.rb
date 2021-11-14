class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true

  validates :body, length:{ minimum: 50}
  validates :title, length:{minimum: 10}
  
end
