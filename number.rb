require 'sinatra'
require 'sinatra/reloader'

def fibonacci(n)
  if n == 1
    1
  elsif n == 2
    1
  else
    fibonacci(n-1) + fibonacci(n-2)
  end   
end

def factorial(n)
  (1..n).inject(:*) || 1
end

get '/' do
  fib = params['fib']
  fact = params['fact']
  n = params['n']
  
  #Calculate Fibonacci
  if(!fib.nil?)
    fib_result = fibonacci(fib.to_i)
  end
  
  #Calculate Factorial
  if(!fact.nil?)
    fact_result = factorial(fact.to_i)
  end
  
  #Upcase name
  if(!n.nil?)
    n = n.to_s.upcase
  end
    
  #Render Page
  erb :index, :locals => {fib: fib, fib_result: fib_result, fact: fact, fact_result: fact_result, n: n}
end

not_found do
  status 404
  erb :error
end