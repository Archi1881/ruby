months = {
  january: 31,
  febrary: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  jule: 31,
  august: 31,
  september: 30,
  octouber: 31,
  november: 30,
  december: 31
}
months.each { |month, days| puts month if days == 30}
