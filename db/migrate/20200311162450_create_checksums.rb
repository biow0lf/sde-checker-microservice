class CreateChecksums < ActiveRecord::Migration[6.0]
  def change
    create_table :checksums do |t|
      t.string :checksum, null: false
      t.string :md5

      t.timestamps
    end
  end
end
