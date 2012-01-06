class CancerTypesController < ApplicationController
  # GET /cancer_types
  # GET /cancer_types.json
  def index
    @cancer_types = CancerType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cancer_types }
    end
  end

  # GET /cancer_types/1
  # GET /cancer_types/1.json
  def show
    @cancer_type = CancerType.find(params[:id])
    @cs = Cs.find(:all, :conditions => ["cancer_types_id = '#{@cancer_type.id}'"])
    @csn = Cs.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => {:cancer_type => @cancer_type,
          :cancer_symptoms => @cancer_symptoms,
          :cancer_symptom => @cancer_symptom}}

    end
  end

  # GET /cancer_types/new
  # GET /cancer_types/new.json
  def new
    @cancer_type = CancerType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cancer_type }
    end
  end

  # GET /cancer_types/1/edit
  def edit
    @cancer_type = CancerType.find(params[:id])
  end

  # POST /cancer_types
  # POST /cancer_types.json
  def create
    @cancer_type = CancerType.new(params[:cancer_type])

    respond_to do |format|
      if @cancer_type.save
        format.html { redirect_to @cancer_type, notice: 'Cancer type was successfully created.' }
        format.json { render json: @cancer_type, status: :created, location: @cancer_type }
      else
        format.html { render action: "new" }
        format.json { render json: @cancer_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cancer_types/1
  # PUT /cancer_types/1.json
  def update
    @cancer_type = CancerType.find(params[:id])

    respond_to do |format|
      if @cancer_type.update_attributes(params[:cancer_type])
        format.html { redirect_to @cancer_type, notice: 'Cancer type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cancer_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cancer_types/1
  # DELETE /cancer_types/1.json
  def destroy
    @cancer_type = CancerType.find(params[:id])
    @cancer_type.destroy

    respond_to do |format|
      format.html { redirect_to cancer_types_url }
      format.json { head :ok }
    end
  end


  def create_cs
    @cs = Cs.new(params[:cs])
    @cs.cancer_types_id = params[:cst]
    @cs.cancer_symptoms_id = params[:symptom]
    @cancer_type = CancerType.find(params[:cst])

    respond_to do |format|
      if @cs.save
        format.html { redirect_to :action => :show, :id => params[:cst], notice: 'Cancer symptom was added successfully.' }
        format.json { render json: @cs, status: :created, location: @cancer_type }
      else
        format.html { render action: "new" }
        format.json { render json: @cs.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_cs
    @cs = Cs.find(params[:id])
    @cs.destroy


    respond_to do |format|
      format.html { redirect_to :action => :show, :id => @cs.cancer_types_id}
      format.json { head :ok }
    end
  end
end
