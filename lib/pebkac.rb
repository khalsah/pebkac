require 'i18n'

module Kernel
  # Raise an exception but process the message with I18n
  # 
  # Accepts the same parameters as Kernel#raise but the string (message) may be 
  # followed by any options to be passed to I18n, additionally the string
  # parameter may be a symbol instead of a string
  def pebkac *args
    # Extract exception class, default to RuntimeError
    exception_class = args.shift if args.first.respond_to? :exception
    exception_class ||= RuntimeError

    # Extract message key, default to exception class name
    if args.first.is_a?(Symbol) || args.first.is_a?(String)
      msg_key = args.shift
    elsif exception_class == RuntimeError
      msg_key = :default
    else
      # Compute the default message key
      # Based on ActiveSupport's underscore method
      msg_key = exception_class.name.split("::").last
      msg_key.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      msg_key.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
      msg_key.tr!("-", "_")
      msg_key.downcase!
    end

    # Extract I18n options
    options = args.shift if args.first.is_a?(Hash)
    options ||= {}

    # Extract stack tract, default to caller
    trace = args.shift
    trace ||= caller

    # Raise an error if there are leftover arguments
    raise ArgumentError unless args.empty?

    # Apply default options for I18n
    options = {:scope => :pebkac}.merge options

    # Call I18n
    message = I18n.t msg_key, options

    # Finally, raise the exception!
    raise exception_class, message, trace
  end
end
