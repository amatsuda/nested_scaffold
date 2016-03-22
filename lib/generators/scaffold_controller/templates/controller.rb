class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>
  def index
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{plural_name} = @#{nested_parent_name}.#{plural_name}" %>
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  def show
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/new
  def new
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.build" %>
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/1/edit
  def edit
  end

  # POST <%= plural_nested_parent_name %>/1/<%= plural_name %>
  def create
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.build(params[:#{singular_name}])" %>

    if @<%= singular_name %>.save
      redirect_to([@<%= singular_name %>.<%= nested_parent_name %>, @<%= singular_name %>], :notice => '<%= human_name %> was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  def update
    if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
      redirect_to([@<%= singular_name %>.<%= nested_parent_name %>, @<%= singular_name %>], :notice => '<%= human_name %> was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  def destroy
    @<%= singular_name %>.destroy

    redirect_to <%= nested_parent_name %>_<%= index_helper %>_url(@<%= nested_parent_name %>)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
      <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.find(params[:id])" %>
    end
end
