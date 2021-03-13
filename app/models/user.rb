# Schema info
# t.string :civility
# t.string :first_name
# t.string :last_name
# t.string :address
# t.string :phone
# t.boolean :is_admin

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_one_attached :avatar
  has_many :animals, through: :favorites

  validates :first_name,     presence: true, length: { minimum: 3 }
  validates :last_name,      presence: true, length: { minimum: 3 }

  def admin?
    is_admin
  end

  # fonction appellee pour le chargement de la vue
  def favorite?(animal)
    favorites.find_by(animal: animal).present?
  end
end
