class Activity < ActiveRecord::Base
    belongs_to :user
    belongs_to :pen
    has_many :maintenances, dependent: :destroy
    validates :pen_id, numericality: { only_integer: true }
    validates :check_in, presence: true
    validates :pen_pull_num, presence: true, numericality: { only_integer: true }
    validates :pen_dead_num, presence: true, numericality: { only_integer: true }
    validates :pen_feed_check, inclusion: { in: [true, false] }
    validates :pen_water_check, inclusion: { in: [true, false] }
    validates :pen_mud_check, inclusion: { in: [true, false] }
    validates :pen_maintenance_check, inclusion: { in: [true, false] }
end
