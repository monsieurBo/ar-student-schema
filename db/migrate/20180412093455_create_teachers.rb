require_relative '../config'


class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :teachers do |t|
    	t.string	:name
    	t.string	:email
    	t.string	:phone
    	t.datetime :created_at
    	t.datetime :updated_at
      t.timestamps
    end
  end
end
