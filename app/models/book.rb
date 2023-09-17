class Book < ApplicationRecord
  scope :costly, -> {where("price > ?",3000) }
  scope :written_about, -> (theme) {where("name like ?","%#{theme}%") }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name,presence: true
  validates :name,length: {maximum: 25}
  validates :price,numericality: {greater_than_or_equal_to: 0}
  before_validation do
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end
  # あるいはこう書ける
  # before_validation :add_lovery_to_cat
  # def add_lovery_to_cat
  #   self.name = self.name.gsub(/Cat/) do |matched|
  #     "lovely #{matched}"
  #   end
  # end

  after_destroy :if => :high_price? do
    Rails.logger.warn "Book with High price is deleted #{self.attributes}"
    Rails.logger.warn "Check It!!!"
  end

  def high_price?
    price >= 5000
  end
# データベースには名称、値どちらで登録しても名称で登録される
  enum salse_status: {
    reservation: 0, #予約受付中
    now_on_sale: 1, #発売中
    end_of_print: 2, #販売終了
  }

end
