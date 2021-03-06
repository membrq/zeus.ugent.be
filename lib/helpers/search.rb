module SearchHelper
  def blog_search_json
    jsonify articles
  end

  def event_search_json
    jsonify all_events
  end

  private

  def jsonify(collection)
    elems = collection.map do |e|
      {
        title: e[:title],
        url: url_for(e),
        text: excerptize(e.reps[:text].compiled_content, length: 200).tr("\n", ' '),
        tags: ''
      }
    end
    { pages: elems }.to_json
  end
end
