class CreateSkillsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :skills_users, id:false do |t|
      t.integer :skill_id
      t.integer :user_id
    end
  end
end
