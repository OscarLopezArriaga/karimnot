class CategoryDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :content_tag, :concat, :edit_category_path, :safe_join

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Category.id", cond: :eq, searchable: false },
       name: { source: "Category.name", cond: :like },
       description: { source: "Category.description", cond: :like }
    }
  end


  def data
    records.map do |category|
      {
        id: category.id,
        name: category.name,
        description: category.description,
        options: actions(category)
      }
    end
  end

  def actions(object)
    links = []
    links << link_to('<i class="material-icons">remove_red_eye</i>'.html_safe, object) + ' '
    links << link_to('<i class="material-icons">create</i>'.html_safe, edit_category_path(object)) + ' '
    links << link_to('<i class="material-icons">delete_outline</i>'.html_safe, object, method: :delete, data: { confirm: '¿Esta seguro que desea eliminar?' })
    safe_join(links, '')
  end


  def get_raw_records
    # insert query here
    Category.all
  end

end
