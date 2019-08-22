class Answer < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one :best_answer, dependent: :destroy


  validates :body, presence: true, length: { maximum: 1000 }
  validates_uniqueness_of :post_id, scope: :user_id
  scope :recent, -> { order(updated_at: :desc) }

end
