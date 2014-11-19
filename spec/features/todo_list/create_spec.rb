require 'spec_helper'

describe "Membuat todo list"  do
	it "redirects ke halaman index todo list dan success" do
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "My todo list"
		fill_in "Description", with: "Ini adalah list untuk hari ini"
		click_button "Create Todo list"

		expect(page).to have_content("My todo list")  
	end

	it "tampilkan error ketika halaman todo list tidak punya judul" do
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: ""
		fill_in "Description", with: "Ini adalah list untuk hari ini"
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Ini adalah list untuk hari ini") 

	end

	it "tampilkan error ketika halaman todo list punya judul kurang dari 3 karakter" do
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "Hi"
		fill_in "Description", with: "Ini adalah list untuk hari ini"
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Ini adalah list untuk hari ini") 

	end

	it "tampilkan error ketika halaman todo list tidak punya description" do
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "Ashari Juang"
		fill_in "Description", with: ""
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Ashari Juang") 

	end

	it "tampilkan error ketika halaman todo list description kurang dari 5 karakter" do
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "Ashari Juang"
		fill_in "Description", with: "Food"
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Ashari Juang") 

	end

 end
