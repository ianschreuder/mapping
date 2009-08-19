# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mapping_session',
  :secret      => 'f0120faecc7ccc63f6245206808c0b79ca99abba43fbf0bf924f81dc78fa6cd2ccefb5465b1c55998e4e3afbcc5e8b60535daf4e2e446ae5fa349d487d0d2a69'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
