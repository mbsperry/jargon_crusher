
class JargonFilesController < ApplicationController
  # GET /jargon_files
  # GET /jargon_files.json
  def index
    @jargon_files = JargonFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jargon_files }
    end
  end

  # GET /jargon_files/1
  # GET /jargon_files/1.json
  def show
    @jargon_file = JargonFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jargon_file }
    end
  end

  # GET /jargon_files/new
  # GET /jargon_files/new.json
  def new
    @jargon_file = JargonFile.new
    @source = Source.find(params[:source])
    @jargon_file.source_id = @source.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jargon_file }
    end
  end

  # GET /jargon_files/1/edit
  def edit
    @jargon_file = JargonFile.find(params[:id])
  end

  # POST /jargon_files
  # POST /jargon_files.json
  def create
    @jargon_file = JargonFile.new(params[:jargon_file])

    respond_to do |format|
      if @jargon_file.save
        format.html { redirect_to @jargon_file, notice: 'Jargon file was successfully created.' }
        format.json { render json: @jargon_file, status: :created, location: @jargon_file }
      else
        format.html { render action: "new" }
        format.json { render json: @jargon_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jargon_files/1
  # PUT /jargon_files/1.json
  def update
    @jargon_file = JargonFile.find(params[:id])

    respond_to do |format|
      if @jargon_file.update_attributes(params[:jargon_file])
        format.html { redirect_to @jargon_file, notice: 'Jargon file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jargon_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jargon_files/1
  # DELETE /jargon_files/1.json
  def destroy
    @jargon_file = JargonFile.find(params[:id])
    @source = @jargon_file.source
    @jargon_file.destroy

    respond_to do |format|
      format.html { redirect_to @source }
      format.json { head :no_content }
    end
  end
end
