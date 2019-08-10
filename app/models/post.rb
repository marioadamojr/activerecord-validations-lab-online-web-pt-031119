class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :non_clickbait

  private

  clickbait_words = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def non_clickbait
    if self.title.include?(clickbait_words)
      errors.add(:title, "No Clickbait Allowed")
    end
  end
end
