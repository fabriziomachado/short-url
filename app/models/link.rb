class Link < ActiveRecord::Base
  BASE = 32

  validates_format_of :url, :with => %r[^https?://]i

  def to_short
    id.to_s(BASE)
  end

  def to_param
    to_short
  end
end
