require_relative '../config'


class ColumnBelongsto < ActiveRecord::Migration[5.0]
  def change
    change_table :students do |t|
      t.belongs_to :teachers
    end
  end
end
