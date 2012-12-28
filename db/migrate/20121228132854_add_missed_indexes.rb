class AddMissedIndexes < ActiveRecord::Migration
  def change
    add_index :answers, :question_id
    add_index :articles, :idea_id
    add_index :articles, :citizen_id
    add_index :dependencies, :question_id
    add_index :dependencies, :question_group_id
    add_index :dependency_conditions, :dependency_id
    add_index :dependency_conditions, :question_id
    add_index :dependency_conditions, :answer_id
    add_index :expert_suggestions, :citizen_id
    add_index :expert_suggestions, :idea_id
    add_index :money_transactions, :citizen_id
    add_index :questions, :survey_section_id
    add_index :questions, :question_group_id
    add_index :response_sets, :survey_id
    add_index :responses, :response_set_id
    add_index :responses, :question_id
    add_index :responses, :answer_id
    add_index :signatures, :citizen_id
    add_index :signatures, :idea_id
    add_index :survey_sections, :survey_id
    add_index :validation_conditions, :validation_id
    add_index :validation_conditions, :question_id
    add_index :validation_conditions, :answer_id
    add_index :validations, :answer_id
  end
end
