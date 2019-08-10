class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  # validate :non_clickbait

  # private
  # def non_clickbait
  #   if self.title.include?("Won't Believe" || "Secret" || "Top [0..100]" || "Guess")
  #     errors.add(:title, "No Clickbait Allowed")
  #   end
  # end
end
