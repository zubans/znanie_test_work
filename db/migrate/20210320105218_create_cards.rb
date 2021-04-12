class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string      :eng
      t.integer     :errors_count, :default => 0
      t.references  :group,   :default => 1
      t.integer   :recall_time
      t.timestamps
    end
  end
end
