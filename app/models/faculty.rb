class Faculty < ApplicationRecord
    # Relationships
    belongs_to :department
    has_many :assignments
    has_many :courses, through: :assignments
  
    # Scopes
    # 1. `alphabetical` [order]
    scope :active, -> { where(active: true) }
    # 2. `active`       [where]
    scope :alphabetical, -> { order(:last_name, :first_name) }
  
    # Validations
    # 1. must have first, last names
    validates_presence_of(:first_name)
    validates_presence_of(:last_name)
    # 2. rank must be either `Assistant Professor`, `Associate Professor`, or `Professor`
    # got help from copilot for the below:
    validates :rank, inclusion: { in: ["Assistant Professor", "Associate Professor", "Professor"] }
  
end
