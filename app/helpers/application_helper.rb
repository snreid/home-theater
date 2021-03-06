module ApplicationHelper
  ALERT_TYPES = [:error, :info, :success, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :info      if type.to_s == :notice.to_s
      type = :warning   if type.to_s == :alert.to_s
      type = :danger    if type.to_s == :error.to_s
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                               msg, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  def title_for(dvd)
    dvd.title.present? ? dvd.title : dvd.home_theater_info.dvd_title
  end

  def genre_for(dvd)
    dvd.genre.present? ? dvd.genre : dvd.home_theater_info.genre
  end
end
