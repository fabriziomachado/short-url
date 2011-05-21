Factory.sequence :url do |i|
  i=+ 100
  "http://example.com/#{i}.html"
end

Factory.define :link do |f|
   f.url { Factory.next(:url) }
end

