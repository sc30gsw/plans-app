class NoteTagRelation
  
  include ActiveModel::Model
  attr_accessor :title, :text, :plan, :name

  with_options presence: true do
    validates :title
    validates :text
    validates :plan
  end

  def save
    note = Note.create(title: title, text: text, plan: plan)
    tag = Tag.create(name: name)

    NoteTag.create(note_id: note.id, tag_id: tag.id)
  end
end