class CreateFindings < ActiveRecord::Migration
  def change
    create_table :findings do |t|
      t.string  :documentcloud_id
      t.integer :alert_id
      t.boolean :sent, default: false
    end
  end
end
