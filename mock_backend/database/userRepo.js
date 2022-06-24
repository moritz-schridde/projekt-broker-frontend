const users = [{name: "Hans", email:"test1", id:"132456"}, {name:"Peter", email:"test2", id:"ichHabeGradKeinenServiceAccountZumTesten"}]

const findUserById = (userId) => {
    var result = users.find(user => {
        return user.id === userId
      })
    return result
}

const addUser = (name, email, id) => {
    user = {
        name: name,
        email: email,
        id: id
    }
    users.push(user)
}

exports.users = users
exports.findUserById = findUserById
exports.addUser = addUser