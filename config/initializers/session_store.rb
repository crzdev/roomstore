# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_roomstore_session',
  :secret      => '3600e8348f5573ef050bfb8ddc4c776d63aa5514d89f0c2d18642f8098353fffb1bd1cdb99cf37cec517de1f87ed5d0ef1af8c62e7d22bdd042b8e640b5d9504'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
