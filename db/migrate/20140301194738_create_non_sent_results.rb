class CreateNonSentResults < ActiveRecord::Migration
  def change
    create_table :non_sent_results do |t|
      t.integer :alert_id
      t.string  :documentcloud_id
      t.string  :title
      t.string  :canonical_url
      t.string  :description
      t.string  :resources
      t.timestamps
    end
  end
end
