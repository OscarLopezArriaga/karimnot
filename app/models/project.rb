class Project < ApplicationRecord
  belongs_to :category
  validates :name, uniqueness: { message: " ya existe"}, presence: { message: " es requerido" }
  validates :currentStatus, presence: { message: " es requerido" }
  validates :finishDate, presence: { message: " es requerido" }
  validates :active, presence: { message: " es requerido" }

end
