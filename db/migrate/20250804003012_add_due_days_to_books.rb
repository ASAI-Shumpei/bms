class AddDueDaysToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :default_due_days, :integer
  end
end
