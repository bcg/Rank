module PostsHelper
  def options_for_buckets(buckets = [], selected = nil)
    options_for_select(buckets.collect{ |bucket| [ bucket.name, bucket.id ]}, selected)
  end
end
