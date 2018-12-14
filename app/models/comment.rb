class Comment < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :user, optional: true
  has_many :comment_feedbacks
end
