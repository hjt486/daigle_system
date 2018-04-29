class Mud_call < ActiveRecord::Base
    belongs_to :user
    belongs_to :pen
    belongs_to :activity
    validates :resolved, inclusion: { in: [true, false] }
end
