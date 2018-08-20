# frozen_string_literal: true

class Image < ActiveRecord::Base
  mount_uploader :asset, AttachmentsUploader

  belongs_to :album

  validates_presence_of :title
end
