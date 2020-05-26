CarrierWave.configure do |config|
  config.fog_credentials = {
    # Amazon S3用の設定
    :provider              => 'AWS',
    :region                => ENV['S3_REGION'],     # 例: 'ap-northeast-1'
    :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET_KEY'],
  }
  config.fog_directory     =  ENV['S3_BUCKET']

  unless Rails.env.production?
    config.fog_credentials.merge!(
      {
        :endpoint          => ENV['S3_ENDPOINT'],
        :path_style        => true,
      }
    )
    config.asset_host = "#{ENV['S3_ASSET_HOST']}/#{ENV['S3_BUCKET']}"
  end
end
