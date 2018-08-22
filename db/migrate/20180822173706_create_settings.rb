class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.boolean :email_alerts
      t.text :samanage_api_token
      t.text :webhook_token
      t.belongs_to :user, index: {unique: true}, foreign_key: true
      t.timestamps
    end
  end
end
