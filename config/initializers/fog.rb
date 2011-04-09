CarrierWave.configure do |config|
	config.fog_credentials = {
		:provider => 'AWS',
	  :aws_access_key_id => "secret",
	  :aws_secret_access_key => "top secret",
	  :region => 'eu-west-1'
	 }
	  config.fog_directory = "bucket name" 
	  #config.s3_access_policy = :public_read
	  #config.s3_cnamed = true
	  #config.s3_bucket = 'bucketname.domain.tld'
end