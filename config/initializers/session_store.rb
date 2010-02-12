# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_jaylibrary_session',
  :secret => 'b5e2781526063f430421ae8c303c4831ca9b55fd4b18c3e40c44354af50a47ca96c612a77c768524ddeded44ed5deca1536de0e28d0d384080d2b57ab9bff7c1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
