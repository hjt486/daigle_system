class CreateMaintenances< ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.belongs_to :user, index:true
      t.belongs_to :activity, index:true
      t.timestamps
      t.boolean  "resolved"
    end
  end
end
