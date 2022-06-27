const { checkIfAuthenticated } = require('../auth')
const { Router } = require('express')
const { getAllShares } = require('../database/shareRepo')

const router = Router()


// i want a get endpoint which returns all stocks
router.get('/', checkIfAuthenticated, (req, res) => {
    shares = getAllShares()
    res.send(shares);
});


module.exports = router