class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  # GET /todos or /todos.json
  def index
    @project = Project.find(params[:project_id])
    @todo = Todo.new
    @todos = @project.todos.order("created_at DESC")

    @todo.destroy
    @project = Project.find(params[:project_id])

  end

  # GET /todos/1 or /todos/1.json
  def show
    @project = @todo.project_id

  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
    @project = @todo.project_id

  end

  # POST /todos or /todos.json
  def create
    
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        @project = @todo.project_id
        format.html { redirect_to project_todos_url(@project), notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todo_url(@todo), notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy
    @pro = @todo.project_id
    if @todo.destroy
      redirect_to project_todos_path(@pro)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :project_id)
    end
end
