class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: ['Active', 'Completed', 'Inactive'] }
end
