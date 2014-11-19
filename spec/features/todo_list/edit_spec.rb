require 'spec_helper'

describe "Editing todo list"  do
	it "Update todo list successfully with correct information" do
		todo_list = TodoList.create(title: "Ashari Juang", description: "Ashari list.")

		visit "/todo_lists"
		within "todo_list_#{todo_list.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: "New title"
		fill_in
	end

end