class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, dependent: :destroy       
  has_many :comments, dependent: :destroy
  has_many :comment_feedbacks       


  ROLES = %i[admin author default]

  after_create :set_default_role

  def set_default_role
    self.update(role: 'default')
  end

  def admin?
    self.role == 'admin'
  end

  def author?
    self.role == 'author'
  end

  def default?
    self.role == 'default'
  end
         
end
