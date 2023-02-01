class SmsController < ApplicationController
  before_action :set_sm, only: %i[ show edit update destroy ]

  # GET /sms or /sms.json
  def index
    @sms = Sm.all
  end

  # GET /sms/1 or /sms/1.json
  def show
    @msg = @sm.msg
  end

  # GET /sms/new
  def new
    @sm = Sm.new
  end

  # GET /sms/1/edit
  def edit
    @msg = @sm.msg
  end

  # POST /sms or /sms.json
  def create
    @sm = Sm.new(sm_params)

    respond_to do |format|
      if @sm.save
        @msg = @sm.msg_id
        format.html { redirect_to msg_path(@msg) }
        format.json { render :show, status: :created, location: @sm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sms/1 or /sms/1.json
  def update
    respond_to do |format|
      if @sm.update(sm_params)
        format.html { redirect_to sm_url(@sm), notice: "Sm was successfully updated." }
        format.json { render :show, status: :ok, location: @sm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sms/1 or /sms/1.json
  def destroy
    @sm.destroy

    respond_to do |format|
      @msg = @sm.msg_id
      format.html { redirect_to msg_path(@msg)}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sm
      @sm = Sm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sm_params
      params.require(:sm).permit(:title, :msg_id)
    end
end
