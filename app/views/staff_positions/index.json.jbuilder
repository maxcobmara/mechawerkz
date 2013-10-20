json.array!(@staff_positions) do |staff_position|
  json.extract! staff_position, :code, :combo_code, :name, :unit, :tasks_main, :tasks_other, :ancestry, :ancestry_depth, :is_acting, :staff_grade_min, :staff_id
  json.url staff_position_url(staff_position, format: :json)
end
