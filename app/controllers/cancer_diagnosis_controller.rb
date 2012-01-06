class CancerDiagnosisController < ApplicationController
  def diagnose
    @cancer_type = 8;
  end

  def results
    session[:answer] = nil
    print("giringos1 #{params[:symptom1]} 00")
    print("giringos2 #{params[:symptom2]} 00")
    print("giringos3 #{params[:symptom3]} 00")

    @symptoms = [params[:symptom1].to_i,params[:symptom2].to_i,params[:symptom3].to_i,
      params[:symptom4].to_i, params[:symptom5].to_i]

    @cancer = CancerType.all.map{|c| c.id}
    puts("list can#{@cancer} == sym#{@symptoms} 00")
    
    @i=0; @c_array = [];@answer=[]
    
    until @i >= @cancer.length  do
      @j=0;@z=0;@r0=[@cancer[@i]];@r=[]

      until @j >= @symptoms.length
        if Cs.exists? :cancer_types_id => @cancer[@i], :cancer_symptoms_id => @symptoms[@j]
          @z += 1
          @r << @symptoms[@j]
        end
        @j += 1
      end
      puts("value of z #{@z} 00 ")
      @answer << [@cancer[@i], ((@z.to_f/5.to_f)*100)]
      puts("@i ==#{@i}")
      puts("Jemps #{@r} 00")
      @r0 << @r
      @c_array << @r0
      puts("Oromo #{@c_array} 00")
      @i += 1
    end

    @answer = @answer.sort {|x,y| y <=> x }
    puts("Bingo #{@answer} 00")
    puts("Buff #{@c_array} 00")
    session[:answer] = @answer
    session[:full_report] = @c_array
  end

  def full_report
    @answer = session[:answer]
    @full_report = session[:full_report]
    print("Hewala #{@c_array} 00")
  end
end