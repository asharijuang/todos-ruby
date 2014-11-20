require 'spec_helper'

describe "Viewing todo items"  do
	let!(:todo_list) { TodoList.create(title: "Ashari list", description: "Ashari Juang.")}
	
	def visit_todo_list(list)
		visit "/todo_lists"
		within "#todo_list_#{todo_list.id}" do
			click_link "List Items"
		end
	end

	it "displays the title todo list" do
		visit_todo_list(todo_list)
		within("h1") do
			expect(page).to have_content(todo_list.title)
		end
	end

	it "display no items when a todo list is empty" do
		expect(page.all("ul.todo_items li").size).to eq(0)
	end
 
	it "display no items when a todo list has items" do
		todo_list.todo_items.create(content: "Milk")
		todo_list.todo_items.create(content: "Eggs")
		
		visit_todo_list(todo_list)

		expect(page.all("ul.todo_items li").size).to eq(2)
		within "ul.todo_items" do 
			expect(page).to have_content("Milk")
			expect(page).to have_content("Eggs")
		end
	end
end