# your code goes here
require "pry"

class Person

    attr_reader :name
    attr_accessor :bank_account, :happiness, :hygiene

    def initialize (name)
        @name = name
        @bank_account = 25
        @hygiene = 8
        @happiness = 8
    end

    def happiness=(happiness)
       @happiness = get_valid_value(happiness)

    end

    def hygiene=(hygiene)
        @hygiene = get_valid_value(hygiene)
    end

    def clean?
        return @hygiene > 7
    end

    def happy?
        return @happiness > 7
    end

    def get_paid (amount)
        @bank_account = @bank_account + amount
        return "all about the benjamins"
    end

    def take_bath 
        # add "self" to use my custom setter (hygiene *instance* method)
        self.hygiene = self.hygiene + 4
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.happiness = self.happiness + 2
        self.hygiene = self.hygiene - 3
        return "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        self.happiness = self.happiness + 3
        friend.happiness = friend.happiness + 3
        return "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation (friend, topic)
        if topic == "politics"
            self.happiness = self.happiness - 2
            friend.happiness = friend.happiness - 2
            return "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            self.happiness = self.happiness + 1
            friend.happiness = friend.happiness + 1
            return "blah blah sun blah rain"
        end
        return "blah blah blah blah blah"
    end

    # can only be used by instance/class methods
    private 

    # helper **private** method
    def get_valid_value(value)
        if value >= 0 && value <= 10
            return value
        elsif value < 0
          return 0
        else
            return 10
        end
    end
end

choco_boy = Person.new("Choco Boy")
choco_boy.happiness = 20
choco_boy.hygiene = 14

cream_puffs = Person.new("Cream Puffs")
cream_puffs.happiness = 8