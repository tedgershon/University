class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.references :course, null: false, foreign_key: true
      t.references :faculty, null: false, foreign_key: true

      # t.timestamps
    end
  end
end
