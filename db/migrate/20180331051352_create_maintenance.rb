class CreateMaintenance< ActiveRecord::Migration
  def change
    create_table :maintenance_calls do |t|
      t.belongs_to :user, index:true
      t.belongs_to :activitie, index:true
      t.timestamps
      t.boolean  "reseolved"
    end
  end
end
