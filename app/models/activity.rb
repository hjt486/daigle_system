class Activity < ActiveRecord::Base
    belongs_to :user
    validates :pen_id, numericality: { only_integer: true }
    validates :check_in, presence: true
    # If your field is called :date_field, use :date_field_before_type_cast
    def check_in
      check_in_before_type_cast.to_date
    rescue ArgumentError
      errors.add(:birthday, :invalid)
    end

    validates :check_out, presence: true
    def check_out
      check_out_before_type_cast.to_date
    rescue ArgumentError
      errors.add(:birthday, :invalid)
    end


    validates :pull, presence: true, numericality: { only_integer: true }
    validates :dead, presence: true, numericality: { only_integer: true }
    validates :feed_check, presence: true, inclusion: { in: [true, false] }
    validates :water_check, presence: true, inclusion: { in: [true, false] }
    validates :mud_check, presence: true, inclusion: { in: [true, false] }
    validates :maintenance_check, presence: true, inclusion: { in: [true, false] }
end
