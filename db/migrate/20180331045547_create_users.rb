class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "username"
      t.timestamps
      t.string   "password_digest"
      t.integer  "admin",           default: false
      t.integer  "cowboy"
      t.integer  "handy"
      t.integer  "doctor"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "email"
      t.string   "phone"
      t.text     "address"
    end
  end
end
