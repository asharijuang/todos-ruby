require 'spec_helper'

describe "Hapus atau destroy todo list"  do
	let!(:todo_list) { TodoList.create(title: "Ashari", description: "Ashari Juang.")}

	it "is successful when click destroy link" do
		visit "/todo_lists"

		within "#todo_list_#{todo_list.id}" do
			click_link "Destroy"
		end
		expect(page).to_not have_content(todo_list.title)
		expect(TodoList.count).to eq(0)
	end
end

