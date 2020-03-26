class Category < ApplicationRecord
  has_many :projects
  validates :name, presence: { message: " es requerido" }
  validates :name, uniqueness: { message: " ya existe"}

end
