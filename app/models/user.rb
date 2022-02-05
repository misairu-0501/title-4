class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Userモデルに対して、PostImageモデルが1:Nになるよう関連付けをする
  has_many :post_images, dependent: :destroy

  #Userモデルに対して、PostCommentモデルが1:Nになるように関連付けをする
  has_many :post_comments, dependent: :destroy

  #Userモデルに対して、Favoriteモデルが1:Nになるように関連付けをする
  has_many :favorites, dependent: :destroy

  #profile_imageという名前でActiveStorageでプロフィール画像を保存できるように設定
  has_one_attached :profile_image

  #get_profile_image(引数)メソッドを作成
  #画像が設定されない場合：app/assets/imagesに格納されているsample-author1.jpgという画像をデフォルト画像としてをActiveStorageに格納し、格納した画像を表示する
  #画像が設定されている場合：設定されている画像を表示する
  #引数に設定した画像サイズ●x●に変換する
  def get_profile_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize: size).processed
  end

end
