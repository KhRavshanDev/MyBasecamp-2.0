class MsgsController < ApplicationController
  before_action :set_msg, only: %i[ show edit update destroy ]

  # GET /msgs or /msgs.json
  def index
    @project = Project.find(params[:project_id])
    @msgs = @project.msgs

  end

  # GET /msgs/1 or /msgs/1.json
  def show
    @project = @msg.project_id
    @sm = Sm.new
    @sms = @msg.sms
  end

  # GET /msgs/new
  def new
    @msg = Msg.new
    @project = Project.find(params[:project_id])
  end

  # GET /msgs/1/edit
  def edit
    @project = @msg.project


  end

  # POST /msgs or /msgs.json
  def create
    @msg = Msg.new(msg_params)

    respond_to do |format|
      if @msg.save
        format.html { redirect_to msg_url(@msg), notice: "Msg was successfully created." }
        format.json { render :show, status: :created, location: @msg }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /msgs/1 or /msgs/1.json
  def update
    respond_to do |format|
      if @msg.update(msg_params)
        format.html { redirect_to msg_url(@msg), notice: "Msg was successfully updated." }
        format.json { render :show, status: :ok, location: @msg }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /msgs/1 or /msgs/1.json
  def destroy
    @msg.destroy
    @project = @msg.project.id

    respond_to do |format|
      format.html { redirect_to project_msgs_path(@project), notice: "Msg was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_msg
      @msg = Msg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def msg_params
      params.require(:msg).permit(:title, :body, :project_id)
    end
end
