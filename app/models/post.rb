class Post < ApplicationRecord
  validates :body, presence: true, length: { maximum: 1000 }
  validates :title, presence: true, length: { maximum: 30 }
  belongs_to :category
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_one :best_answer, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[title body]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
