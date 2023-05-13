class AddAssociationToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :host_id, :integer
    add_foreign_key :events, :users, column: :host_id
  end
end
