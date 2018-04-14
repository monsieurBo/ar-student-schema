require_relative '../config'


class CreateAcademyDeleteTeacher < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :teacher_id

	  create_table :class do |t|
	  	t.belongs_to :teacher, index: true
	  	t.belongs_to :student, index: true
    end
  end
end
