require_relative '../config'


class AlterTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :teachers, :name
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string
  end
end
