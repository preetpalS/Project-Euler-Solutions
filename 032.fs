
(*
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
*)

let pandigitalTripleTest(multiplicand:int, multiplier:int, product:int) : bool =
    let concatenatedString = multiplicand.ToString() + multiplier.ToString() + product.ToString()

    if concatenatedString.Length = 9 then
        if [|'1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'|] = (concatenatedString.ToCharArray() |> Array.sort) then
            true
        else
            false
    else
        false

[<EntryPoint>]
let main argv =
    let mutable pandigitalProductSet = Set.empty

    (* The calculation (9,999 * 1 = 9,999) results in 9 digits, by choosing 10,000 as maximum
       for multiplicand and multiplier all possibilities are safely enumerated. *)
    for i = 1 to 10000 do
        for j = i to 10000 do
            let product = i * j
            let res = pandigitalTripleTest(i, j, product)

            match res with
            | true -> if not (pandigitalProductSet.Contains(product)) then pandigitalProductSet <- pandigitalProductSet.Add(product)
            | false -> ()

    printfn "%A" (Set.fold (fun acc elem -> acc + elem) 0 pandigitalProductSet)
    0

(*
C:\Project-Euler-Solutions>fsc --standalone --optimize 032.fs
Microsoft (R) F# Compiler version 4.1
Copyright (c) Microsoft Corporation. All Rights Reserved.

C:\Project-Euler-Solutions>032.exe
45228

C:\Project-Euler-Solutions>
*)
