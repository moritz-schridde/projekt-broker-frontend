const { checkIfAuthenticated } = require('.auth')
const { Router } = require('express')

const router = Router()


// i want a get endpoint which returns all stocks
router.get('/share', (req, res) => {
    res.send(
        [
            {
                shareId: 1,
                longName: "Tesla",
                shortName: "TSL",
                iconId: "1",
                price: 530,
            },
            {
                shareId: 2,
                longName: "Apple",
                shortName: "APL",
                iconId: "2",
                price: 750,
            },
            {
                shareId: 3,
                longName: "Google",
                shortName: "GOG",
                iconId: "3",
                price: 5000,
            },
        ]
    );
});


module.exports = Router