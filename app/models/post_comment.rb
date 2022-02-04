class PostComment < ApplicationRecord

  #PostComment モデルに User モデルを関連付ける
  belongs_to :user

  #PostComment モデルに post_image モデルを関連付ける
  belongs_to :post_image
end
