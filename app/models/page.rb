class Page < ActiveRecord::Base
  def parse_syntax included=false
    data = self.content
    data.gsub!(/\{!\s*(.+?)\s*\}\n*/xm,"")
    data.gsub!(/\{#\s*(.+)\s*\}\n*/) do |m|
      c = Page.where('title LIKE ?', m[2...m.length-1]).first
      if c
        c.parse_syntax true
      else
        "INVALID INCLUDE - #{m}"
      end
    end

    data.gsub!(/\{%\s*(.+?):(.+?)\s*\}\n*/xm,"<%= link_to('\\1', find_pages_path(:name => '\\2')) %>")
    data.gsub!(/\{%\s*(.+?)\s*\}\n*/xm,"<%= link_to('\\1', find_pages_path(:name => '\\1')) %>")
    data.gsub!(/\{=\s*(.+?)\s*\}\n*/xm,"<%= \\1 %>")
    if included
      data.gsub!(/\{-\s*(.+?)\s*\}\n*/xm,"")
      data.gsub!(/\{&\s*(.+?)\s*\}\n*/xm,"\\1")
    else
      data.gsub!(/\{-\s*(.+?)\s*\}\n*/xm,"\\1")
      data.gsub!(/\{&\s*(.+?)\s*\}\n*/xm,"")
    end
    
    data.gsub!(/\s*\{\s*(.+?)\s*\}\n*/xm,"<% \\1 %>")
    data
  end

  def unparsed
    self.content
  end

  def embedded_data
    data = []
    if self.content.match /\{!\s*(.+?)\s*\}\n*/xm
      self.content.gsub(/\{!\s*(.+?)\s*\}\n*/xm) do |m|
        data << m
        m
      end
      data
    else
     [] 
    end
  end
end
