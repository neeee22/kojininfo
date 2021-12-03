class Post < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, {presence: true , format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

  def self.search(search)
    if search != ""
      search = "%#{search}%"
      Post.find_by_sql(["
        select
         * 
         from
          posts
           where
            name like ? OR address like ? OR mail like ?", search, search, search
            ])
  else
      Post.all
    end
  end
end
