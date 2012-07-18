
class Account::SetupModule::OrganizationSetup::ConceptsController < Account::SetupModule::OrganizationSetupController
  load_and_authorize_resource
  set_tab :concepts
  
  def index
    @concepts = Concept.accessible_by(current_ability).order("updated_at")
    @concepts_grid = initialize_grid(@concepts , :include => [:client])
  end
  
  def show
    @concept = Concept.find(params[:id])
  end
  
  def new
    @concept = Concept.new
  end
  
  def edit
    @concept = Concept.find(params[:id])
  end
  
  def create
    @concept = Concept.new(params[:concept])
    
    if @concept.save
      flash[:success] = "Restaurant has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @concept = Concept.find(params[:id])

    if @concept.update_attributes(params[:concept])
      flash[:success] = "Restaurant was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @concept = Concept.find(params[:id])
    @concept.destroy
    
    flash[:success] = "Restaurant was successfully deleted"
    redirect_to :action => :index
  end
end
