module ApplicationHelper
  def options_for_buckets(buckets = [], selected = nil)
    options_for_select(buckets.collect{ |bucket| [ bucket.name, bucket.id ]}, selected)
  end
  
  def safely_formatted_text(string = "", css_class = "")
    auto_link(simple_format(strip_tags(string), :class => css_class), :html => { :rel => "nofollow", :target => "_blank"})
  end
end
