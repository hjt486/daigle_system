class CreateMortalityAlerts < ActiveRecord::Migration
  def change
    create_table :mortality_alerts do |t|
      t.belongs_to :user, index:true
      t.belongs_to :activitie, index:true
      t.timestamps
      t.boolean  "reseolved"
      t.text     "reseolved_comment"
    end
  end
end
