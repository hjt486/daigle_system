class CreatePens < ActiveRecord::Migration
  def change
    create_table :pens do |t|
      t.integer  "num"
      t.integer  "total_num"
      t.integer  "pull_num"
      t.integer  "dead_num"
      t.boolean  "feed_check"
      t.boolean  "water_check"
      t.boolean  "mud_check"
      t.boolean  "maintenance_check"
    end
  end
end
