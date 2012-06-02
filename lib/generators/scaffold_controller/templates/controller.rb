class <%= controller_class_name %>Controller < ApplicationController
  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>
  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>.json
  def index
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{plural_name} = @#{nested_parent_name}.#{plural_name}" %>

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @<%= plural_name %> }
    end
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/1.json
  def show
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.find(params[:id])" %>

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @<%= singular_name %> }
    end
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/new
  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/new.json
  def new
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.build" %>

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @<%= singular_name %> }
    end
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/1/edit
  def edit
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.find(params[:id])" %>
  end

  # POST <%= plural_nested_parent_name %>/1/<%= plural_name %>
  # POST <%= plural_nested_parent_name %>/1/<%= plural_name %>.json
  def create
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.build(params[:#{singular_name}])" %>

    respond_to do |format|
      if @<%= singular_name %>.save
        format.html { redirect_to([@<%= singular_name %>.<%= nested_parent_name %>, @<%= singular_name %>], :notice => '<%= human_name %> was successfully created.') }
        format.json { render :json => @<%= singular_name %>, :status => :created, :location => [@<%= singular_name %>.<%= nested_parent_name %>, @<%= singular_name %>] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @<%= singular_name %>.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  # PUT <%= plural_nested_parent_name %>/1/<%= plural_name %>/1.json
  def update
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.find(params[:id])" %>

    respond_to do |format|
      if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
        format.html { redirect_to([@<%= singular_name %>.<%= nested_parent_name %>, @<%= singular_name %>], :notice => '<%= human_name %> was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @<%= singular_name %>.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  # DELETE <%= plural_nested_parent_name %>/1/<%= plural_name %>/1.json
  def destroy
    @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.find(params[:id])" %>
    @<%= singular_name %>.destroy

    respond_to do |format|
      format.html { redirect_to <%= nested_parent_name %>_<%= index_helper %>_url(<%= nested_parent_name %>) }
      format.json { head :ok }
    end
  end
end
