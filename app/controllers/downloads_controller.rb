class DownloadsController < ApplicationController
  include DownloadsHelper

  PATH = 'public/assets/data'
  FILES_TO_DOWNLOAD.each { |file| define_method(file.gsub('.', '_')) { send_public_asset(file) } }

  def send_public_asset(file)
    log_visit
    send_file "#{PATH}/#{file}"
  end
end
