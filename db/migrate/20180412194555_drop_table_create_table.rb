class DropTableCreateTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :class

    create_table :subjects do |t|
	  	t.belongs_to :teacher, index: true
	  	t.belongs_to :student, index: true
    end
  end
end
