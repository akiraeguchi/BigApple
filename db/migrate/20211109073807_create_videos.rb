class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title, null:false
      t.text :body
      t.string :youtube, null:false
      t.datetime :video_date, null:false

      t.timestamps
    end
  end
end
