module EventsHelper
  def weekday(date)
    weekdays = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
    weekdays[date.days_to_week_start]
  end

  def formated_event_date_time(date, time, css_class = "")
    tag.div "#{weekday(date)}, #{date.to_fs(:long_ordinal)} -
    #{time.strftime('%l:%M %p').downcase}", class: css_class
  end
end
