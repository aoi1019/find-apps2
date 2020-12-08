class AddSchoolIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :school_id, :integer
  end
end
