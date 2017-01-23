require "refile/backend/s3"

if Rails.env.production?
  aws = {
    access_key_id: Rails.application.secrets.AWS_ACCESS_KEY_ID, 
    secret_access_key: Rails.application.secrets.AWS_SECRET_ACCESS_KEY, 
    bucket: "hmsocio"
  }

  Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)
end
     
