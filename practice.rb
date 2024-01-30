# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇
#Method 1: Tried this myself

ben = 0
brian = 0
evan = 0
anthony = 0
for transfer in blockchain
  if transfer["from_user"] == "ben"
    ben = ben - transfer["amount"]
  elsif transfer["from_user"] == "brian"
    brian = brian - transfer["amount"]
  elsif transfer["from_user"] == "evan"
    evan = evan - transfer["amount"]
  elsif transfer["from_user"] == "anthony"
    anthony = anthony - transfer["amount"]
  end

  if transfer["to_user"] == "ben"
    ben = ben + transfer["amount"]
  elsif transfer["to_user"] == "brian"
    brian = brian + transfer["amount"]
  elsif transfer["to_user"] == "evan"
    evan = evan + transfer["amount"]
  elsif transfer["to_user"] == "anthony"
    anthony = anthony + transfer["amount"]
  end
end

puts "Ben's KelloggCoin balance is #{ben}"
puts "Brian's KelloggCoin balance is #{brian}"
puts "Evan's KelloggCoin balance is #{evan}"
puts "Anthony's KelloggCoin balance is #{anthony}"



# Method 2: Brainstorm a bit with GPT

# Initialize an empty hash to store balances
balances = Hash.new(0)
# Process transfers using a for loop
for x in 0...blockchain.length
  transfer = blockchain[x]             #get detail of each transfer 
  if transfer["from_user"]             #this will be always true
  balances[transfer["from_user"]]= balances[transfer["from_user"]] - transfer["amount"]
  end
  balances[transfer["to_user"]] = balances[transfer["to_user"]] + transfer["amount"]
end

# Output results using  for loop
users = balances.keys    #get the names of all users
for i in 0...users.length
  user = users[i]
  balance = balances[user]
  user_name = user&.capitalize || "System"               #Capitalizing the name  
  puts "Method 2: #{user_name}'s KelloggCoin balance is #{balance}"
end

