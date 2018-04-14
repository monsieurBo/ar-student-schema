require_relative '../config'


class DeleteCol < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :teacher_id
  end
end
