class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  before_save :set_ogp_url

  validates :title, presence: true

  private
  def set_ogp_url
    begin
      agent = Mechanize.new
      page = agent.get(self.url)
      url = page.at('meta[property="og:image"]')[:content]
    rescue => e
      url = "no-image.png"
    end
    self.ogp_url = url
  end
end
