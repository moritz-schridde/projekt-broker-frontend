const { checkIfAuthenticated } = require('../auth')
const { Router } = require('express')
const { findDepotByUserId } = require('../database/depotRepo')

const router = Router()


router.get('/', checkIfAuthenticated, (req, res) => {
    console.log("Request angekommen");
    depot = findDepotByUserId(req.authId);
    res.send(depot);
});

module.exports = router
