CarrierWave.configure do |config|
  config.ftp_host = "ltzn.ftp.infomaniak.com"
  config.ftp_port = 21
  config.ftp_user = "ltzn_improgrammer"
  config.ftp_passwd = "password"
  config.ftp_folder = "/web/iamprogrammer"
  config.ftp_url = "http://chashmeetsingh.com"
  config.ftp_passive = true # false by default
end