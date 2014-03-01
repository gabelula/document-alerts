class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :keyword
      t.references :user

      t.timestamps
    end
  end
end
