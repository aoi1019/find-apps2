class RemoveSchoolIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :school_id, :integer
  end
end
