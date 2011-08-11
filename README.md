# JSONResponse

Define JSON responses, factory style!

    JSONResponse.define :character do |p|
      p.name = "Finn"
      p.age  = 13
      p.type = "human"
    end

Use those responses to do stuff!

    JSONResponse.build(:character)
    # => "{\"name\":\"Finn",\"age\":13,\"type\":\"human\"}"

Overwrite default values!

    JSONResponse.build(:character, name: "Jake", age: 48, type: "dog")
    # => "{\"name\":\"Jake",\"age\":48,\"type\":\"dog\"}"

MATHEMATICAL!
