module V1
  class UserSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :email

    attribute :profile do
      object.try(:profile)
    end

    attribute :image do
      if object.try(:profile)&.image&.attached?
        "http://localhost:3000" + rails_blob_path(object.try(:profile).try(:image), only_path: true)
      else
        nil
      end
    end

    attribute :cover_photo do
      if object.try(:profile)&.cover_photo&.attached?
        "http://localhost:3000" + rails_blob_path(object.try(:profile).try(:cover_photo), only_path: true)
      else
        nil
      end
    end
  end
end
