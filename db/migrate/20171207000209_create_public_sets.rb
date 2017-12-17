class CreatePublicSets < ActiveRecord::Migration[5.1]
  def change
    create_table :public_sets do |t|

      t.timestamps
    end
  end
end
