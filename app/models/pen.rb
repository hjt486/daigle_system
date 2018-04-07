class Pen < ActiveRecord::Base
    has_many :activities, dependent: :destroy
    validates :num, numericality: { only_integer: true }
    validates :total_num, presence: true, numericality: { only_integer: true }
    validates :pull_num, presence: true, numericality: { only_integer: true }
    validates :dead_num, presence: true, numericality: { only_integer: true }
    validates :feed_check, inclusion: { in: [true, false] }
    validates :water_check, inclusion: { in: [true, false] }
    validates :mud_check, inclusion: { in: [true, false] }
    validates :maintenance_check, inclusion: { in: [true, false] }
end
