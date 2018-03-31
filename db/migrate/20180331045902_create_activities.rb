class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user, index:true
      t.integer  "pen_id"
      t.datetime "check_in"
      t.datetime "check_out"
      t.integer  "pull"
      t.integer  "dead"
      t.boolean  "feed_check"
      t.text     "feed_comment"
      t.boolean  "water_check"
      t.text     "water_comment"
      t.boolean  "mud_check"
      t.text     "mud_comment"
      t.boolean  "maintenance_check"
      t.text     "maintenance_comment"
    end
  end
end
