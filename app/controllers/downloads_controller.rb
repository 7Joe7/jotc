class DownloadsController < ApplicationController
  include DownloadsHelper

  PATH = 'public/assets/data'
  FILES_TO_DOWNLOAD.each { |file| define_method(file.gsub('.', '_')) { send_file "#{PATH}/#{file}" } }
end
