class Store < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5}
  validates :address, presence: true, length: {minimum: 10}
end
