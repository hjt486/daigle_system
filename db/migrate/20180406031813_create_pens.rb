class CreatePens < ActiveRecord::Migration
  def change
    create_table :pens do |t|
      t.integer  "num"
      t.integer  "total_num"
    end
  end
end
