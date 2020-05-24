CarrierWave.configure do |config|
  config.fog_credentials = {
    # Amazon S3用の設定
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET_KEY'],
    :region                => ENV['S3_REGION'],
    :endpoint              => 'http://localstack:4572',
    path_style: !Rails.env.production?,
  }
  config.fog_directory     =  ENV['S3_BUCKET_NAME']
end
