class AddDocumentTypeIdToAlerts < ActiveRecord::Migration
  def self.up
    add_column :alerts, :document_type_id, :integer
  end
  def self.down
    remove_column :alerts, :document_type_id
  end
end
