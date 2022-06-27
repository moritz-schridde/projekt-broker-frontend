const shares = [
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

const getAllShares = () => {
    return shares;
}


exports.getAllShares = getAllShares