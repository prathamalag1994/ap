class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :rolable, :polymorphic => true
  accepts_nested_attributes_for :rolable

  def admin?
    if rolable_type == 'Admin'
      true
    end
  end

end
