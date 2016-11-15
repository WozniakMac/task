class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    avarge_notes = subject_item.subject_item_notes.average(:value) || 0
    h.number_with_precision(avarge_notes, precision: 2)
  end
end
