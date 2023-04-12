def print_names(names)
  names.each.with_index do |name, id|
    id += 1
    puts "#{id.to_s}. #{name}"
  end
end

print_names(['上田', '田仲', '堀田'])
