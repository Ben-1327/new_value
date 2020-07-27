class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  mount_uploader :icon_img, ImagesUploader

  has_many :users,dependent: :nullify
  has_many :company_analyses, dependent: :destroy

  validates :name, presence: true



end
