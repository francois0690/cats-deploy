
class Theme < ApplicationRecord

  has_one_attached :logo, service: :cloudinary
  has_one_attached :avatar, service: :cloudinary

  # has_one_attached :sign_form, pdf_uploader #service: :upload_pdf_form
  mount_uploader :pdf, PdfUploader
  has_many :configs
  has_one :config


  validates :name,                    presence: true
  validates :basic_description,       presence: true
  validates :full_description,        presence: true
  validates :email,                   presence: true
  validates :phone,                   presence: true
  validates :address,                 presence: true

  validates :logo,                    presence: true



end
