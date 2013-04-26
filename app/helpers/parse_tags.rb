helpers do
  def parse_tags(tag_string)
    tags = []
    tag_string.split(',').each do |tag|
      tags << Tag.find_or_create_by_name(tag.strip)
    end
    tags
  end
end
