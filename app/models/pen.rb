class Pen < ActiveRecord::Base
    has_many :activities, dependent: :destroy
    validates :num, numericality: { only_integer: true }
    validates :total_num, presence: true, numericality: { only_integer: true }
end
