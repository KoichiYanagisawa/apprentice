def train_fare(age)
  man = { adult: 12, child: 6 }

  if(age >= man[:adult])
    puts "200"
  elsif(age >= man[:child])
    puts "100"
  else
    puts "0"
  end
end

train_fare(12)
train_fare(6)
train_fare(5)
