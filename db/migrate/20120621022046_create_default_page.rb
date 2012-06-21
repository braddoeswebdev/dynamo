class CreateDefaultPage < ActiveRecord::Migration
  def up
    Page.create!(title: "Welcome", content: "Welcome to [[dynamo:/]]!")
  end

  def down
  end
end
