class User < ApplicationRecord
    def self.from_omniauth(auth, name)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = name
            user.image = auth.info.image
            user.oauth_token = auth.credentials.token
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            return user
        end
    end

    def self.convert_omniauth(auth)
        auth_info = {
          "provider" => auth.provider,
          "uid" => auth.uid,
          "name" => auth.info.name,
          "image" => auth.info.image,
          "oauth_token" => auth.credentials.token,
          "oauth_expires_at" => Time.at(auth.credentials.expires_at)
        }
        return auth_info
    end
end
