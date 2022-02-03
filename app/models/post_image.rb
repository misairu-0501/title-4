class PostImage < ApplicationRecord

  has_one_attached :image #追記(20220203)

  #PostImage モデルに User モデルを関連付ける
  belongs_to :user

  #get_imageメソッドを作成
  #画像が設定されない場合：app/assets/imagesに格納されているno_image.pngという画像をデフォルト画像としてをActiveStorageに格納し、格納した画像を表示する
  #画像が設定されている場合：設定されている画像を表示する
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
