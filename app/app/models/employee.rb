class Employee < ApplicationRecord
	validates  :name, presence: true
	validates  :email, presence: true, format:{ with: URI::MailTo::EMAIL_REGEXP}
	validates  :position, presence: true
	validates  :id_employee, presence: true
	validates  :private_number, presence: true

	belongs_to :store
	has_many :daily_logs
	has_many :check_ins, through: :daily_logs
	has_many :check_outs, through: :daily_logs
end
