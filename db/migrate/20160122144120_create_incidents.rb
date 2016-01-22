class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.datetime    'date'
      t.references  'city'
      t.string      'post_code'
      t.string      'location'
      t.string      'tourist_attraction'
      t.string      'description'
      t.references  'user'
      t.string      'contact'
      t.references  'sub_category'
      t.integer     'occurrence_factor'
      t.references  'chapter'
      t.references  'purpose'
      t.string      'proposal_for_action'
      t.boolean     'following', null: false, default: false
      t.timestamps null: false
    end
  end
end
