const depots = {
    "xI1U0SKQzQSfno09Q8KPf5vyPUE3":
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
}

const findDepotByUserId = (userId) => {
    if (depots[userId] == undefined) {
        depots[userId] = {
            budget: 0,
            shares: [],
        }
    }
    console.log(depots[userId]);
    return depots[userId]
}

const updateDepotBudget = (userId, value) => {
    depot = findDepotByUserId(userId)
    depot.budget += value;
    return depot;
}


exports.findDepotByUserId = findDepotByUserId
exports.updateDepotBudget = updateDepotBudget