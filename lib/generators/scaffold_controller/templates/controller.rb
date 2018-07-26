class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= nested_parent_name %>
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>
  def index
    <%= "@#{plural_name} = @#{nested_parent_name}.#{plural_name}" %>
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  def show
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/new
  def new
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.build" %>
  end

  # GET <%= plural_nested_parent_name %>/1/<%= plural_name %>/1/edit
  def edit
  end

  # POST <%= plural_nested_parent_name %>/1/<%= plural_name %>
  def create
    <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.build(#{singular_name}_params)" %>

    if @<%= singular_name %>.save
      redirect_to([@<%= singular_name %>.<%= nested_parent_name %>, @<%= singular_name %>], notice: '<%= human_name %> was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  def update
    if @<%= singular_name %>.update_attributes(<%= singular_name %>_params)
      redirect_to([@<%= singular_name %>.<%= nested_parent_name %>, @<%= singular_name %>], notice: '<%= human_name %> was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE <%= plural_nested_parent_name %>/1/<%= plural_name %>/1
  def destroy
    @<%= singular_name %>.destroy

    redirect_to <%= nested_parent_name %>_<%= index_helper %>_url(@<%= nested_parent_name %>)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= nested_parent_name %>
      @<%= nested_parent_name %> = <%= orm_class.find(nested_parent_class_name, "params[:#{nested_parent_id}]") %>
    end

    def set_<%= singular_table_name %>
      <%= "@#{singular_name} = @#{nested_parent_name}.#{plural_name}.find(params[:id])" %>
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params.fetch(:<%= singular_table_name %>, {})
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end
