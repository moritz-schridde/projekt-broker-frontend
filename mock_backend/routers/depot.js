const { checkIfAuthenticated } = require('.auth')
const { Router } = require('express')

const router = Router()


router.get('/depot', (req, res) => {
    res.send(
        {
            budget: 1002,
            shares: [
                {
                    amount: 10,
                    purchasePrice: 420,
                    share: {
                        shareId: 1,
                        longName: "Tesla",
                        shortName: "TSL",
                        iconId: "1",
                        price: 530,
                    }
                },
                {
                    amount: 5,
                    purchasePrice: 550,
                    share: {
                        shareId: 2,
                        longName: "Apple",
                        shortName: "APL",
                        iconId: "2",
                        price: 750,
                    }
                },
            ],
        }
    )
}
);

module.exports = Router