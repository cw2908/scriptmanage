class CreateUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :uploads do |t|
      t.string      :attachment_type    null: false
      t.attachment  :file               null: false
      t.timestamps
    end
  end
end
