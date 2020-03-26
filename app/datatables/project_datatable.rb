class ProjectDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :content_tag, :concat, :edit_project_path, :safe_join

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Project.id", cond: :eq, searchable: false },
       name: { source: "Project.name", cond: :like },
       description: { source: "Project.description", cond: :like },
       currentStatus: { source: "Project.currentStatus", cond: :like },
       finishDate: { source: "Project.finishDate", cond: :like },
       active: { source: "Project.active", cond: :like }
    }
  end


  def data
    records.map do |project|
      {
        id: project.id,
        name: project.name,
        description: project.description,
        currentStatus: project.currentStatus,
        finishDate: project.finishDate,
        active: project.active,
        options: actions(project)
      }
    end
  end

  def actions(object)
    links = []
    links << link_to('Ver', object, class: 'btn btn-success') + ' '
    links << link_to('Editar', edit_project_path(object), class: 'btn btn-warning') + ' '
    links << link_to('Eliminar', object, method: :delete, data: { confirm: '¿Esta seguro que desea eliminar?' }, class: 'btn btn-danger')
    safe_join(links, '')
  end


  def get_raw_records
    # insert query here
    Project.all
  end

end
