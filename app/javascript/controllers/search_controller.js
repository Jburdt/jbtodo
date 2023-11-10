import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["query", "todos"];
  connect() {}
  submit(e) {
	e.preventDefault();
	const val = this.queryTarget.value;
	fetch(`/todos?query=${val}`, {
	  headers: { accept: 'application/json' }
	}).then((response) => response.json())
	  .then(data => {
		var todoHTML = "";
		var todoArray=Object.values(data)[0];
		todoArray.forEach( todo => {
		  todoHTML+= this.todoTemplate(todo);
		} )
		this.todosTarget.innerHTML = todoHTML;
	  });

  }

  todoTemplate(todo) {
	return `<li id="todo_${todo.id}" data-controller="todo">
		<input class="mx-6" ${todo.status == 'complete' ? 'checked' : ''} type="checkbox" value="status_box" data-action="click->todo#toggle" />
		<span class="mx-6 font-bold"> ${todo.task}</span>
		<span class="mx-6"> ${todo.due_on} </span>
		<a href="/todos/${todo.id}" class="rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">Show this todo"</a>
		<a href="/todos/${todo.id}/edit">
		  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" class="w-12 inline bg-inherit">
			<path d="M21.731 2.269a2.625 2.625 0 00-3.712 0l-1.157 1.157 3.712 3.712 1.157-1.157a2.625 2.625 0 000-3.712zM19.513 8.199l-3.712-3.712-8.4 8.4a5.25 5.25 0 00-1.32 2.214l-.8 2.685a.75.75 0 00.933.933l2.685-.8a5.25 5.25 0 002.214-1.32l8.4-8.4z"></path>
			  <path d="M5.25 5.25a3 3 0 00-3 3v10.5a3 3 0 003 3h10.5a3 3 0 003-3V13.5a.75.75 0 00-1.5 0v5.25a1.5 1.5 0 01-1.5 1.5H5.25a1.5 1.5 0 01-1.5-1.5V8.25a1.5 1.5 0 011.5-1.5h5.25a.75.75 0 000-1.5H5.25z"></path>
			  </svg>
		  <div class="inline-block ml-2">
<form class="button_to" method="post" action="/todos/${todo.id}"><input type="hidden" name="_method" value="delete" autocomplete="off"><button class="mt-2 rounded-lg py-3 px-5 bg-[red] font-medium" type="submit">Destroy this todo</button><input type="hidden" name="authenticity_token" value="1BqbPDfRV5D6CV9iflPH0PybTE60TZxYQRLrGMOazFPNFwi5FrfplpDpvGFU8U3wZzs4NzGc7u4R_g8Rxxr4Ng" autocomplete="off"></form>
			  </div>
		  <hr class="mt-6">
		</a>
	  </li>`
  }

}

/* fix search */
