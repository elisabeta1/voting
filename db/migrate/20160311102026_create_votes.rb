class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :campaign, index: true, foreign_key: true
      t.references :candidate, index: true, foreign_key: true
      t.string :validity
      t.string :conn
      t.integer :msisdn, limit: 8
      t.string :guid
      t.integer :shortcode

      t.timestamps null: false
    end
  end
end
