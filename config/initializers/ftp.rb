<<<<<<< HEAD
CarrierWave.configure do |config|
  config.ftp_host = "ltzn.ftp.infomaniak.com"
  config.ftp_port = 21
  config.ftp_user = "ltzn_improgrammer"
  config.ftp_passwd = "password"
  config.ftp_folder = "/web/iamprogrammer"
  config.ftp_url = "http://chashmeetsingh.com"
  config.ftp_passive = true # false by default
end
=======
# Just an example 

# If using ftp
CarrierWave.configure do |config|
  config.ftp_host = "ftp.example.com"
  config.ftp_port = 21
  config.ftp_user = "example"
  config.ftp_passwd = "secret"
  config.ftp_folder = "/public_html/uploads"
  config.ftp_url = "http://example.com/uploads"
  config.ftp_passive = false # false by default
end

# If using sftp

CarrierWave.configure do |config|
  config.sftp_host = "example.com"
  config.sftp_user = "example"
  config.sftp_folder = "public_html/uploads"
  config.sftp_url = "http://example.com/uploads"
  config.sftp_options = {
    :password => "secret",
    :port     => 22
  }
end
>>>>>>> 47f321a77e2abc34d3492331a0a056a49299951e
