class Maintenance < ActiveRecord::Base
    belongs_to :user
    belongs_to :pen
    belongs_to :activity
    validates :resolved, inclusion: { in: 0..1 }
end
