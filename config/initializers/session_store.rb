# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_02_Pangea_session',
  :secret      => '599513cc5a9ec7bded4da1ca4a0f62398323ede0cb4ffd792b03aff3a1bb563ab912c5aeaf0ccf655f84c6ef618965fdf7b8839a17594594c8727a2b52a8a309'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
