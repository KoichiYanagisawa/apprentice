def print_capitals(capitals)
  capitals.each do |country, capital|
    puts "#{country}の首都は#{capital}です"
  end
end

print_capitals({ '日本' => '東京', 'アメリカ' => 'ワシントンD.C.' })
