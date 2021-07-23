class Student
    def initialize (name, mathScore, englishScore, literaryScore)
        @name = name
        @mathScore = mathScore
        @englishScore = englishScore
        @literaryScore = literaryScore
    end

    def getGPA
        gpa = (@mathScore + @englishScore + @literaryScore)/3
    end

    def getScore
        hash = {:math => @mathScore, :english => @englishScore, :literary => @literaryScore, :avg => getGPA } 
    end

    def getName
        name = @name
    end
    def printInfo 
        puts "#{@name}:  - Math: #{@mathScore} - English: #{@englishScore} - Literary: #{@literaryScore}"
    end
end

class ClassRoom
    @@listStudent = Array.new(0)
    @@hashStudent  = Hash.new()
    def addNewStudent
        puts "Enter Name: "
        name = gets.chomp
        puts "Math: "
        mathScore = enterNumber
        puts "English: "
        englishScore = enterNumber
        puts "Literary: "
        literaryScore = enterNumber
        @@listStudent.append(Student.new(name, mathScore, englishScore,literaryScore))
    end

    def infoStudents
        @@listStudent.map{|student| student.printInfo} 
    end

    def hashInfoStudents
        temp = @@listStudent.length() - @@hashStudent.size
        listTemp = @@listStudent.last(temp)
        listTemp.map do |student|
            @@hashStudent.merge!({student.getName => student.getScore})
        end

        @@hashStudent.each do |key, value|
            puts "#{key}:#{value}"
        end
        
    end

    def bestGPA
        # @@hashStudent.each { |k, v| puts "#{k} : #{v}" if v == @@hashStudent.values.[avg].max}
        max = 0.0
        bestStudent = ''
        @@hashStudent.each do |k, v| 
            if v[:avg] >= max
                bestStudent = k
            end
        end
        puts bestStudent
    end

    def enterNumber
        while(1)
            puts "Enter Score: "
            numb = gets.chomp
            if check(numb) == true
                break
            end
        end
        return numb.to_f
    end  
end

def check(number)
    Integer(number) != nil rescue false
end  

newClassRoom = ClassRoom.new
begin
    while(1)
        puts "Enter the number: "
        puts "1. Add new student"
        puts "2. List Student"
        puts "3. Hash Student"
        puts "4. Best GPA"
        temp = gets.chomp
        if check(temp) == true
            numb = temp.to_i
            break
        end
    end
    case numb
        when 1  
            newClassRoom.addNewStudent            
        when 2  
            newClassRoom.infoStudents            
        when 3  
            newClassRoom.hashInfoStudents            
        when 4  
            newClassRoom.bestGPA
    else  
        break
    end      

end while ( numb > 0 and numb <= 4 )