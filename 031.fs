
(*
In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:
1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?
*)

[<Measure>] type pence
[<Measure>] type pound

type BritishCoinDenomination = { Value : int<pence> }

type CoinCombinationComparisonResult =
    | EqualTo
    | GreaterThan
    | LessThan

let to_pence(x: int<pound>) = x * (100<pence>/1<pound>)

let DesiredAmountOfBritishCurrency = to_pence(2<pound>)

let CoinDenominations = [
    { Value = 1<pence> };
    { Value = 2<pence> };
    { Value = 5<pence> };
    { Value = 10<pence> };
    { Value = 20<pence> };
    { Value = 50<pence> };
    { Value = to_pence(1<pound>) };
    { Value = to_pence(2<pound>) }
]

let CoinDenominationMultiplierUpperBounds = Seq.toList(CoinDenominations |> Seq.map (fun bcd ->
    let mutable upperBoundMultiplier = 0
    while (upperBoundMultiplier * bcd.Value) <= DesiredAmountOfBritishCurrency do
        upperBoundMultiplier <- upperBoundMultiplier + 1

    upperBoundMultiplier - 1))

let testCoinCombination(coinCombination : List<int>) : CoinCombinationComparisonResult =
    if coinCombination.Length > CoinDenominations.Length then
        failwithf "Invalid coin combination: Expected %A elements, Received %A elements." CoinDenominations.Length coinCombination.Length
    if (coinCombination |> Seq.exists (fun x -> x < 0)) then
        failwith "Invalid coin combination: Cannot have negative multiples of any coin."

    let value = List.fold2(fun acc coinDenomination mul -> acc + (mul * coinDenomination.Value)) 0<pence> CoinDenominations.[ 0 .. (coinCombination.Length - 1) ] coinCombination

    if value = DesiredAmountOfBritishCurrency then
        EqualTo
    else
        if value < DesiredAmountOfBritishCurrency then LessThan else GreaterThan
        
let solution =
    let mutable numCombinations = 0

    for onePenceMultiplier = 0 to CoinDenominationMultiplierUpperBounds.[0] do
        let combinationTestRes = testCoinCombination [ onePenceMultiplier ]
        match combinationTestRes with
        | EqualTo -> numCombinations <- numCombinations + 1
        | LessThan ->
            for twoPenceMultiplier = 0 to CoinDenominationMultiplierUpperBounds.[1] do
                let combinationTestRes = testCoinCombination [ onePenceMultiplier; twoPenceMultiplier ]
                match combinationTestRes with
                | EqualTo ->
                    if twoPenceMultiplier <> 0 then numCombinations <- numCombinations + 1
                | LessThan ->
                    for fivePenceMultiplier = 0 to CoinDenominationMultiplierUpperBounds.[2] do
                        let combinationTestRes = testCoinCombination [ onePenceMultiplier; twoPenceMultiplier; fivePenceMultiplier ]
                        match combinationTestRes with
                        | EqualTo -> if fivePenceMultiplier <> 0 then numCombinations <- numCombinations + 1
                        | LessThan ->
                            for tenPenceMultiplier = 0 to CoinDenominationMultiplierUpperBounds.[3] do
                                let combinationTestRes = testCoinCombination [ onePenceMultiplier; twoPenceMultiplier; fivePenceMultiplier; tenPenceMultiplier ]
                                match combinationTestRes with
                                | EqualTo -> if tenPenceMultiplier <> 0 then numCombinations <- numCombinations + 1
                                | LessThan ->
                                    for twentyPenceMultiplier = 0 to CoinDenominationMultiplierUpperBounds.[4] do
                                        let combinationTestRes = testCoinCombination [ onePenceMultiplier; twoPenceMultiplier; fivePenceMultiplier; tenPenceMultiplier; twentyPenceMultiplier ]
                                        match combinationTestRes with
                                        | EqualTo -> if twentyPenceMultiplier <> 0 then numCombinations <- numCombinations + 1
                                        | LessThan ->
                                            for fiftyPenceMultiplier = 0 to CoinDenominationMultiplierUpperBounds.[5] do
                                                let combinationTestRes = testCoinCombination [ onePenceMultiplier; twoPenceMultiplier; fivePenceMultiplier; tenPenceMultiplier; twentyPenceMultiplier; fiftyPenceMultiplier ]
                                                match combinationTestRes with
                                                | EqualTo -> if fiftyPenceMultiplier <> 0 then numCombinations <- numCombinations + 1
                                                | LessThan ->
                                                    for onePoundMultiplier = 0 to CoinDenominationMultiplierUpperBounds.[6] do
                                                        let combinationTestRes = testCoinCombination [ onePenceMultiplier; twoPenceMultiplier; fivePenceMultiplier; tenPenceMultiplier; twentyPenceMultiplier; fiftyPenceMultiplier; onePoundMultiplier ]
                                                        match combinationTestRes with
                                                        | EqualTo -> if onePoundMultiplier <> 0 then numCombinations <- numCombinations + 1
                                                        | LessThan ->
                                                            for twoPoundMultiplier = 0 to CoinDenominationMultiplierUpperBounds.[7] do
                                                                let combinationTestRes = testCoinCombination [ onePenceMultiplier; twoPenceMultiplier; fivePenceMultiplier; tenPenceMultiplier; twentyPenceMultiplier; fiftyPenceMultiplier; onePoundMultiplier; twoPoundMultiplier ]
                                                                match combinationTestRes with
                                                                    | EqualTo -> if twoPoundMultiplier <> 0 then numCombinations <- numCombinations + 1
                                                                    | LessThan | GreaterThan -> ()
                                                        | GreaterThan -> ()
                                                | GreaterThan -> ()
                                        | GreaterThan -> ()
                                | GreaterThan -> ()
                        | GreaterThan -> ()
                | GreaterThan -> ()
        | GreaterThan -> ()

    numCombinations
                                    
[<EntryPoint>]
let main argv =
    printfn "%A" solution
    0

(*
C:\Project-Euler-Solutions>fsc --standalone 031.fs
Microsoft (R) F# Compiler version 4.1
Copyright (c) Microsoft Corporation. All Rights Reserved.

C:\Project-Euler-Solutions>031.exe
73682
*)
