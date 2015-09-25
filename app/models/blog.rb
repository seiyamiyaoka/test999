class Blog < ActiveRecord::Base
  validates :name, presence:{message: "名前を入れてください"}
  validates :title, presence:{message: "タイトルを入れてください"}
  validates :content, presence:{message: "内容を入れてください"}
end
