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

## why not work??? since one transcation have both from_user and "to_user"
# if one transcation only used for "from_user", then it "to_user" will be ignored
# every transcation includes either ben or brain, and there is no transcation between them
# thus the result of ben and brain is correct. other two wrong
# e.g. line 12, take 9000 from ben and add 9000 to evan, if statement hit the first one, which is from_user, then it stop, and go to next hash

ben_balance = 0
brian_balance = 0
evan_balance = 0
anthony_balance = 0

for transactions in blockchain # for each hash in array
  if transactions["from_user"] == "ben"
    ben_balance = ben_balance - transactions["amount"]
  elsif transactions["to_user"] == "ben"
    ben_balance = ben_balance + transactions["amount"]
  elsif transactions["from_user"] == "brian"
    brian_balance = brian_balance - transactions["amount"]
  elsif transactions["to_user"] == "brian"
    brian_balance = brian_balance + transactions["amount"]
  elsif transactions["from_user"] == "evan"
    evan_balance = evan_balance - transactions["amount"]
  elsif transactions["to_user"] == "evan"
    evan_balance = evan_balance + transactions["amount"]
  elsif transactions["from_user"] == "anthony"
    anthony_balance = anthony_balance - transactions["amount"]
  elsif transactions["to_user"] == "anthony"
    anthony_balance = anthony_balance + transactions["amount"]

  end

end 

puts "Ben's KelloggCoin balance is #{ben_balance}"
puts "brian's KelloggCoin balance is #{brian_balance}"
puts "evan's KelloggCoin balance is #{evan_balance}"
puts "anthony's KelloggCoin balance is #{anthony_balance}"


######## solution

ben_balance = 0
brian_balance = 0
evan_balance = 0
anthony_balance = 0

for transactions in blockchain
  if transactions["from_user"] == "ben"
    ben_balance = ben_balance - transactions["amount"]
  elsif transactions["from_user"] == "brian"
    brian_balance = brian_balance - transactions["amount"]
  elsif transactions["from_user"] == "evan"
    evan_balance = evan_balance - transactions["amount"]
  elsif transactions["from_user"] == "anthony"
    anthony_balance = anthony_balance - transactions["amount"]
  end 
  
  
  if transactions["to_user"] == "ben"
    ben_balance = ben_balance + transactions["amount"]
  elsif transactions["to_user"] == "brian"
    brian_balance = brian_balance + transactions["amount"]
  elsif transactions["to_user"] == "evan"
    evan_balance = evan_balance + transactions["amount"]
  elsif transactions["to_user"] == "anthony"
    anthony_balance = anthony_balance + transactions["amount"]

  end

end 

puts "Ben's KelloggCoin balance is #{ben_balance}"
puts "brian's KelloggCoin balance is #{brian_balance}"
puts "evan's KelloggCoin balance is #{evan_balance}"
puts "anthony's KelloggCoin balance is #{anthony_balance}"



# how to challenge?? 
# Why might you be feeling dissatisfied - i.e. what are the drawbacks?
# Well, this solution only works with these 4 specific users.  
# But what if we added someone new to the blockchain?
#  We would need to duplicate a lot of the code to accommodate other user balances.
#  Are there other ways to implement the solution that are not dependent on
#  knowing who and how many users there are in the transactions?

# if add someone, then need to a new balacne, a for loo, and a new put.  

people = ["ben","brian","evan","anthony","yang"] #think of people in the list and go through each person and then go thorugh transcations

# track each person's balance, update people into array hashes

accounts = [{"name"=>"ben","balance"=>0},
{"name"=>"brian","balance"=>0},
{"name"=>"evan","balance"=>0},
{"name"=>"anthony","balance"=>0},
{"name"=>"yang","balance"=>0}
]

for transactions in blockchain 
  for account in accounts
    if transactions["from_user"] == account["name"] # similar to inner join
      account["balance"] = account["balance"] - transactions["amount"]
    end 
    if transactions["to_user"] == account["name"]
      account["balance"] = account["balance"] + transactions["amount"]
    end 
  end 

end 


for account1 in accounts
  puts "#{account1["name"]}'s KelloggCoin balance is #{account1["balance"]}"
end 


