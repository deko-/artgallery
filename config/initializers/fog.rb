CarrierWave.configure do |config|
	config.fog_credentials = {
		:provider => 'AWS',
	  :aws_access_key_id => "AKIAJKHYTNW4NUVMACBQ",
	  :aws_secret_access_key => "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",
	  :region => 'eu-west-1'
	 }
	  config.fog_directory = "sandboxcontemporary" 
	  #config.s3_access_policy = :public_read
	  #config.s3_cnamed = true
	  #config.s3_bucket = 'bucketname.domain.tld'
end