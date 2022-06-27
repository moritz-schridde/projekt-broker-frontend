const users = [
    { "name": "kldasjfksdf", "surname": "sdlkfjslkadf", "email": "New Email", "phone": "+49234234", "street": "sfsdfsdfa", "number": "New Number", "postalcode": "23423", "city": "sadfasdfasdf", "country": "New Country", "birthDay": "1", "birthMonth": "6", "birthYear": "2022", "bankAccount": { "kontoId": "New KontoId", "name": "asdfasf", "surname": "243q243", "taxNumber": "24 234 234", "iban": "DE34 8248 9023 849", "bic": "234329409234" }, "id": "xI1U0SKQzQSfno09Q8KPf5vyPUE3" }
]

const findUserById = (userId) => {
    var result = users.find(user => {
        return user.id === userId
    })
    return result
}

const addUser = (user) => {
    // user = {
    //     name: name,
    //     email: email,
    //     id: id
    // }
    users.push(user)
}

exports.users = users
exports.findUserById = findUserById
exports.addUser = addUser