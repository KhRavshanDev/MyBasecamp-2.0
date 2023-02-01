class PattachesController < ApplicationController
  before_action :set_pattach, only: %i[ show edit update destroy ]

  # GET /pattaches or /pattaches.json
  def index
    @project = Project.find(params[:project_id])
    @pattaches = @project.pattaches
    
  end

  # GET /pattaches/1 or /pattaches/1.json
  def show
    @project = @pattach.project_id

  end

  # GET /pattaches/new
  def new
    @pattach = Pattach.new
  end

  # GET /pattaches/1/edit
  def edit
    @project = @pattach.project_id

  end

  # POST /pattaches or /pattaches.json
  def create
    
    @pattach = Pattach.new(pattach_params)

    respond_to do |format|
      if @pattach.save
        format.html { redirect_to pattach_url(@pattach), notice: "Pattach was successfully created." }
        format.json { render :show, status: :created, location: @pattach }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pattach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pattaches/1 or /pattaches/1.json
  def update
    respond_to do |format|
      if @pattach.update(pattach_params)
        format.html { redirect_to pattach_url(@pattach), notice: "Pattach was successfully updated." }
        format.json { render :show, status: :ok, location: @pattach }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pattach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pattaches/1 or /pattaches/1.json
  def destroy
    @pattach.destroy
    @pro = @pattach.project_id
    if @pattach.destroy
      redirect_to project_pattaches_path(@pro)
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pattach
      @pattach = Pattach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pattach_params
      params.require(:pattach).permit(:title, :project_id, :att)
    end
end
