class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :best_answer, dependent: :destroy

  has_secure_password
  
  validates :nick_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :occupation, presence: true

  scope :recent, -> { order(updated_at: :desc) }

  def already_bestanswered?(post)
    self.best_answer.exists?(post_id: post.id)
  end
end
