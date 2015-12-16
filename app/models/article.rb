class Article < ActiveRecord::Base
  mount_uploader :cover, Article::CoverUploader
end
