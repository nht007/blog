atom_feed do |feed|   
  feed.title("Tien's Apprenticeship Blog")   
  feed.updated(@posts.first.created_at)
  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.content, :type => 'html')
      entry.author { |author| author.name("Tien Nguyen")}
    end
  end
end
