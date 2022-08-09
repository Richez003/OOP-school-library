class Person
    def initiallize(age, name = "unkown" parent_permission: true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    private method
    def is_of_age
        (age > 18)
    end 

    Public method
    def can_use_services
        (is_of_age || parent_permission)
    end
end
