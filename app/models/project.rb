class Project < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: { message: " es requerido" }
  validates :name, uniqueness: { message: " ya existe"}, presence: { message: " es requerido" }
  validates :currentStatus, presence: { message: " es requerido" }
  validates :finishDate, presence: { message: " es requerido" }
  validates :active, inclusion: { in: [ true, false ] }

end
