class Alert < ActiveRecord::Base
  belongs_to :user
  belongs_to :document_type
end
