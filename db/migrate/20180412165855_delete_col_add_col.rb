require_relative '../config'


class DeleteColAddCol < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :teachers_id

	  change_table :students do |t|
	  	t.belongs_to :teacher
    end
  end
end
