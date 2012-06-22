class Page < ActiveRecord::Base

  def parse_syntax
    data = self.content
    data.gsub!(/\{#(.+)\s*\}\n*/) do |m|
      c = Page.where('title LIKE ?', m[2...m.length-1]).first
      c ? c.content : "INVALID INCLUDE"
    end
    data.gsub!(/\{%(.+):(.+)\s*\}\n*/,"<%= link_to('\\1', find_pages_path(:name => '\\2')) %>")
    data.gsub!(/\{%(.+)\s*\}\n*/,"<%= link_to('\\1', find_pages_path(:name => '\\1')) %>")
    data.gsub!(/\{=(.+)\s*\}\n*/,"<%= \\1 %>")
    data.gsub!(/\{(.+)\s*\}[\r\n]?/, "<% \\1 %>")
    data
  end

  def dynamize
	RedCloth.new(self.parse_syntax).to_html.gsub("{", "<%").gsub("}","%>")
  end
end
