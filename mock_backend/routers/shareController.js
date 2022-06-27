const { checkIfAuthenticated } = require('../auth')
const { Router } = require('express')
const { getAllShares, getSharePerformance } = require('../database/shareRepo')


const router = Router()


// i want a get endpoint which returns all stocks
router.get('/', checkIfAuthenticated, (req, res) => {
    shares = getAllShares()
    res.status(200).send(shares);
});

router.get('/:id/performance', checkIfAuthenticated, (req, res) => {
    perf = getSharePerformance(req.params.id)
    console.log(perf);
    res.status(200).send({ spots: perf });
});


module.exports = router