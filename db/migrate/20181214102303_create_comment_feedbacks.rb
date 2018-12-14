class CreateCommentFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_feedbacks do |t|
      t.references :comment, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
