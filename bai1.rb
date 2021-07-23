
def check(number)
    Integer(number) != nil rescue false
end

def createArray
    numbs = Array.new(0) 
    for i in 0..4
        puts "Enter number #{i}: "
        while (1) 
            n = gets.chomp
            if n == ''
                n = 0
                numbs.append(0)
                break
            elsif check(n) == true
                numbs.append(n.to_i)
                break
            else
            print "Think of a number  #{i}"
            end
        end
    end
    return numbs
end 

arrNumb = createArray
puts "Array: #{arrNumb}"
# sum of element
puts "Sum : #{arrNumb.reduce(0, :+)}"
#proc
proc = Proc.new do |x|
    if (x == 7 or x == 6)
        x
    else 
        x**2
    end
end
#use proc
arrNumb.map!(&proc)
puts "#{arrNumb}"
