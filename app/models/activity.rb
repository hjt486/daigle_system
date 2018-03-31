class Activity < ActiveRecord::Base
    belongs_to :user
    validates :pen_id, numericality: { only_integer: true }
    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :total_num, presence: true, numericality: { only_integer: true }
    validates :pull_num, presence: true, numericality: { only_integer: true }
    validates :dead_num, presence: true, numericality: { only_integer: true }
    validates :feed_check, inclusion: { in: [true, false] }
    validates :water_check, inclusion: { in: [true, false] }
    validates :mud_check, inclusion: { in: [true, false] }
    validates :maintenance_check, inclusion: { in: [true, false] }
end
