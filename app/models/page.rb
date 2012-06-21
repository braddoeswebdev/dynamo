class Page < ActiveRecord::Base

  def parse_syntax
    data = self.content
    data.gsub!(/\{%(.+):(.+)\s*\}\n*/,"<%= link_to('\\1', find_pages_path(:name => '\\2')) %>")
    data.gsub!(/\{%(.+)\s*\}\n*/,"<%= link_to('\\1', find_pages_path(:name => '\\1')) %>")
    data.gsub!(/\{=(.+)\s*\}\n*/,"<%= \\1 %>")
    data.gsub!(/\{(.+)\s*\}\s*/, "<% \\1 %>")
    data
  end

  def dynamize
	RedCloth.new(self.parse_syntax).to_html.gsub("{", "<%").gsub("}","%>")
  end
end
