class Profile < ApplicationRecord
    belongs_to :user
    
    has_one_attached :pfp, dependent: :purge_later
    has_one_attached :banner, dependent: :purge_later

    validate :acceptable_pfp
    validate :acceptable_banner

    def acceptable_pfp

        return unless pfp.attached?

        unless pfp.blob.byte_size <= 1.megabyte
            errors.add(:pfp, "is too big")
        end

        acceptable_types = ["image/jpeg", "image/png"]

        unless acceptable_types.include?(pfp.content_type)
            errors.add(:pfp, "must be a JPEG or PNG")
        end

    end

    def acceptable_banner

        return unless banner.attached?

        unless banner.blob.byte_size <= 1.megabyte
            errors.add(:banner, "is too big")
        end

        acceptable_types = ["image/jpeg", "image/png"]

        unless acceptable_types.include?(banner.content_type)
            errors.add(:banner, "must be a JPEG or PNG")
        end
    end

end
