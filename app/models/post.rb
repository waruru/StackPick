class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :likes, dependent: :destroy

  before_save :set_ogp_url

  validates :title, presence: true


  scope :order_desc, -> { order(created_at: :desc) }
  scope :pub, -> { where(published: true) }
  scope :pte, -> { where(published: false) }

  private
  def set_ogp_url
    begin
      agent = Mechanize.new

      if ENV['HTTP_PROXY']
        port = /[0-9]+\Z/.match(ENV['HTTP_PROXY']).to_s.to_i
        agent.set_proxy(ENV['HTTP_PROXY'], port)
      end

      page = agent.get(self.url)
      url = page.at('meta[property="og:image"]')[:content]
    rescue => e
      url = "no-image.png"
    end
    self.ogp_url = url
  end
end
