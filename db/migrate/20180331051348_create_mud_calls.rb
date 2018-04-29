class CreateMudCalls < ActiveRecord::Migration
def change
  create_table :mud_calls do |t|
    t.belongs_to :user, index:true
    t.belongs_to :activity, index:true
    t.timestamps
    t.integer  "resolved"
  end
end
end
