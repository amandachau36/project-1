Geocoder.configure(
  units: :km,


  lookup: :google,


  api_key: Rails.application.secrets.google_api_key

)
