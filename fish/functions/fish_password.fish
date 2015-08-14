function password
    ruby -e "require 'securerandom';print SecureRandom.urlsafe_base64"
end

