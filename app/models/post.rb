class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :non_clickbait



  clickbait_words = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def non_clickbait
    if clickbait_words.none? { |pat| pat.match title}
      errors.add(:title, "No Clickbait Allowed")
    end
  end
end
