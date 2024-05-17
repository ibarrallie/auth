# to encrypt a secret, use BCrypt::Password.create(secret)
# to test a secret, use BCrypt::Password.new(encrypted) == secret
# run this file using rails runner scripts/encryption.rb

# TODO:
# 1. encrypt a secret and puts encrypted string
secret = "my password"
encrypted_secret = BCrypt::Password.create(secret)
puts encrypted_secret

# 2. prepare encrypted string for testing
user_entered_password = "my password"

# 3. test secret against prepared encrypted string
if BCrypt::Password.new(encrypted_secret) == user_entered_password
  valid = true
else
  valid = false
end
puts valid
