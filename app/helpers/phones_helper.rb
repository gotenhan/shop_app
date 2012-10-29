module PhonesHelper
  def info(info, default = 'brak informacji')
    info.present? ? info : default
  end

  def feature(feature, additional_info = nil)
    msg = feature ? 'tak' : 'nie'
    msg += ', ' + additional_info if additional_info
    msg
  end

  def semantic_search_form_for(*args, &block)
    opts = args.extract_options!
    opts[:builder] = Formtastic::FormBuilder

    # add the default form class
    # (works whether existing class is a String like
    # "foo bar" or an Array like ["foo", "bar"])
    opts[:html] ||= {}
    opts[:html][:class] ||= []
    opts[:html][:class] << ' ' if opts[:html][:class].is_a? String
    opts[:html][:class] << Formtastic::Helpers::FormHelper.default_form_class

    search_form_for(*args, opts, &block)
  end
end
