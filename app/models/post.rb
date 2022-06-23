class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  before_save :set_ogp_url

  private
  def set_ogp_url
    begin
      page = Mechanize.new.get(self.url)
      url = page.at('meta[property="og:image"]')[:content]
    rescue => e
      url = ""
    end
    self.ogp_url = url
  end
end
