const { Router } = require('express')
const { checkIfAuthenticated } = require('../auth')
const { users, findUserById, addUser } = require('../database/userRepo')
const { updateDepotBudget } = require('../database/depotRepo')


const router = Router()


// const knownUsers = ["xI1U0SKQzQSfno09Q8KPf5vyPUE3", "S2waZwW6LZhhR1Ba6IP3ks0VwmF2", "ichHabeGradKeinenServiceAccountZumTesten"];



router.get('/', checkIfAuthenticated, (req, res) => {
    user = findUserById(req.authId)
    if (user) {
        res.status(200).send(user)
    } else {
        res.status(456).send("We could find no user matching your auth credentials")
    }
})



router.post('/', checkIfAuthenticated, (req, res) => {
    id = req.authId
    user = { ...req.body, id }
    addUser(user)
    res.status(200).send(user)
})

router.get('/info', checkIfAuthenticated, (req, res) => {
    userAuthId = req.authId
    res.status(200).send({ userAuthId: userAuthId })
})

router.post('/bank/deposit', checkIfAuthenticated, (req, res) => {
    userAuthId = req.authId
    amount = req.body.amount
    depot = updateDepotBudget(userAuthId, amount)
    res.status(200).send(depot)
})

router.post('/bank/withdraw', checkIfAuthenticated, (req, res) => {
    userAuthId = req.authId
    amount = req.body.amount * -1
    depot = updateDepotBudget(userAuthId, amount)
    res.status(200).send(depot)
})



router.get('/:id', checkIfAuthenticated, (req, res) => {

    user = findUserById(req.params.id)
    if (user) {
        res.status(200).send(user)
    } else {
        res.status(404).send("No user with this id could be found")
    }

})

module.exports = router