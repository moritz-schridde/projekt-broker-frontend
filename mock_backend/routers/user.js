const { Router } = require('express')
const { checkIfAuthenticated } = require('../auth')
const { users, findUserById, addUser } = require('../database/userRepo')

const router = Router()


const knownUsers = ["xI1U0SKQzQSfno09Q8KPf5vyPUE3", "S2waZwW6LZhhR1Ba6IP3ks0VwmF2", "ichHabeGradKeinenServiceAccountZumTesten"];



router.get('/', checkIfAuthenticated, (req, res) => {
    res.status(200).send(users)
})



router.post('/', checkIfAuthenticated, (req, res) => {
    // userAuthId = req.authId
    // knownUsers.push(userAuthId)

    name = req.body.name || "default"
    email = req.body.email || "default"
    id = req.body.id || "default"
    addUser(name, email, id)
    res.status(200).send("ok")
})

router.get('/info', checkIfAuthenticated, (req, res) => {
    userAuthId = req.authId
    res.status(200).send({ userAuthId: userAuthId })
})

router.post('/bank/deposit', checkIfAuthenticated, (req, res) => {
    userAuthId = req.authId
    amount = req.body.amount
    res.status(200).send({ amount: amount })
})

router.post('/bank/withdraw', checkIfAuthenticated, (req, res) => {
    userAuthId = req.authId
    amount = re.body.amount
    res.status(200).send({ amount: amount })
})



router.get('/:id', checkIfAuthenticated, (req, res) => {
    
    user = findUserById(req.params.id)
    if(user){
        res.status(200).send(user)
    }else{
        res.status(404).send("No user with this id could be found")
    }
    
})

module.exports = router