class CheckJob
  def perform
    URL_CHECKSUM = "https://eve-static-data-export.s3-eu-west-1.amazonaws.com/tranquility/checksum"

    current_checksum = File.read(open(URL_CHECKSUM))

    if Checksum.find_by(checksum: current_checksum).zero?
      DownloadNewSDE.perform
      NotifyAdmins.perform
    end
  end
end
