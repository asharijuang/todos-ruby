require 'spec_helper'

describe "Membuat todo list"  do
	def create_todo_list(options={})
		options[:title] ||= "My todo list"
		options[:description] ||= "This is my todo list"

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Create Todo list"
	end

	it "redirects ke halaman index todo list dan success" do
		create_todo_list

		expect(page).to have_content("My todo list")  
	end

	it "tampilkan error ketika halaman todo list tidak punya judul" do
		expect(TodoList.count).to eq(0)

		create_todo_list title:""

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Ini adalah list untuk hari ini") 

	end

	it "tampilkan error ketika halaman todo list punya judul kurang dari 3 karakter" do
		expect(TodoList.count).to eq(0)

		create_todo_list title:"Hi"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Ini adalah list untuk hari ini") 

	end

	it "tampilkan error ketika halaman todo list tidak punya description" do
		expect(TodoList.count).to eq(0)

		create_todo_list title:"Ashari Juang", description:""

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Ashari Juang") 

	end

	it "tampilkan error ketika halaman todo list description kurang dari 5 karakter" do
		expect(TodoList.count).to eq(0)

		create_todo_list title:"Ashari juang", description:"Food"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Ashari Juang") 

	end

 end
