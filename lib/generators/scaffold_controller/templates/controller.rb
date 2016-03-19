class <%= controller_class_name %>Controller < ApplicationController
  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>
  def index
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{plural_name} = @#{nested_parent_name}.#{plural_name}" %>
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  def show
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.find(params[:id])" %>
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/new
  def new
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.build" %>
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/1/edit
  def edit
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.find(params[:id])" %>
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
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.find(params[:id])" %>

    if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
      redirect_to([@<%= singular_name %>.<%= nested_parent_name %>, @<%= singular_name %>], :notice => '<%= human_name %> was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  def destroy
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.find(params[:id])" %>
    @<%= singular_name %>.destroy

    redirect_to <%= nested_parent_name %>_<%= index_helper %>_url(@<%= nested_parent_name %>)
  end
end
