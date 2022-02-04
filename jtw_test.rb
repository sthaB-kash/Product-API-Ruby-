require 'jwt'
secret_key = 'my_secret_key' # Rails.application.secrets.secret_key_base
# puts secret_key

exp = Time.now.to_i + 4 * 86_400 # valid upto 4 days
payload = { data: 'this is test data', exp: exp }

token = JWT.encode payload, secret_key, 'HS256'
puts token

# decoded_token = JWT.decode token, secret_key
# p decoded_token

# decoded_token = JWT.decode token, secret_key, true, { algorithm: 'HS256' }
# p decoded_token

# handle token expiration

begin
  decoded_token = JWT.decode token, secret_key, true, { algorithm: 'HS256' }
rescue JWT::ExpiredSignature => e
  p e, e.message
rescue JWT::VerificationError => e
  p e.message
rescue => e
  p e
else
  p decoded_token
end
