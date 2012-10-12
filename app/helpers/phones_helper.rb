module PhonesHelper
  def info(info, default = 'brak informacji')
    info.present? ? info : default
  end

  def feature(feature, additional_info = nil)
    msg = feature ? 'tak' : 'nie'
    msg += ', ' + additional_info if additional_info
    msg
  end
end
