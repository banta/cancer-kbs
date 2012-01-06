class CancerSymptomsController < ApplicationController
  # GET /cancer_symptoms
  # GET /cancer_symptoms.json
  def index
    @cancer_symptoms = CancerSymptom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cancer_symptoms }
    end
  end

  # GET /cancer_symptoms/1
  # GET /cancer_symptoms/1.json
  def show
    @cancer_symptom = CancerSymptom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cancer_symptom }
    end
  end

  # GET /cancer_symptoms/new
  # GET /cancer_symptoms/new.json
  def new
    @cancer_symptom = CancerSymptom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cancer_symptom }
    end
  end

  # GET /cancer_symptoms/1/edit
  def edit
    @cancer_symptom = CancerSymptom.find(params[:id])
  end

  # POST /cancer_symptoms
  # POST /cancer_symptoms.json
  def create
    @cancer_symptom = CancerSymptom.new(params[:cancer_symptom])

    respond_to do |format|
      if @cancer_symptom.save
        format.html { redirect_to @cancer_symptom, notice: 'Cancer symptom was successfully created.' }
        format.json { render json: @cancer_symptom, status: :created, location: @cancer_symptom }
      else
        format.html { render action: "new" }
        format.json { render json: @cancer_symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cancer_symptoms/1
  # PUT /cancer_symptoms/1.json
  def update
    @cancer_symptom = CancerSymptom.find(params[:id])

    respond_to do |format|
      if @cancer_symptom.update_attributes(params[:cancer_symptom])
        format.html { redirect_to @cancer_symptom, notice: 'Cancer symptom was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cancer_symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cancer_symptoms/1
  # DELETE /cancer_symptoms/1.json
  def destroy
    @cancer_symptom = CancerSymptom.find(params[:id])
    @cancer_symptom.destroy

    respond_to do |format|
      format.html { redirect_to cancer_symptoms_url }
      format.json { head :ok }
    end
  end
end
