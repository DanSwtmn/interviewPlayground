/* Used for the intent of working through some technical problems I have done during interviews from multiple companies. These were my takes at them durring the interviews and just wanted to compile them all together to reference back to. I have also started adding some sorts that i have wanted to try out.
 
    These solutions might not be the best answers to the questions, they are just my take on them.
 
    All examples were orriginally written in Swift 2 and have been updated to Swift 3.
 
    By Dan Sweetman
*/

import UIKit // Used for GCD in the Sleep sort problem.

/* Binary Problem (Apple)
    Problem: A function takes in a non negative Int and returns the numbers of 1's in it's binary form.
    
    My solution is using recursion. 
    
    Binary numbers are made up of 0's and 1's. Example: the int 25 is 11001 in binary so the output will be 3, another example the int 18 is 10010 where the output will be 2.
 
    With this you can see that binary works on the power of 2. So all we need to is see if the inputed number is even or odd using modular division. If the number is odd then we can take the returned 1 and add it to a counter and divide that number by 2 to move down one level of 2.If it's even then we don't have to worry about it so we just divide the number by 2 to move down another power of 2. We keep doing this till we get 0 and we are done and take the total count that we get of odd nubmers.
 
    Lets say we are given the number 9. In binary that is 1001. So if we do 9 % 2 the output is 1 so we can add that to our count and then do this again but with 9/2 (9 divided by 2).Note that we are using Integers. So when you divide and odd number in half it will round down to a whole number. So now our next loop has the number 4 (binary: 100). 4 % 2 is 0 so lets just divide 4 by 2. We are now at our next loop which is 2 (binary: 10). It's even so we just divide 2 by 2 and we get 1 (binary: 1). 1 % 2 is 1 so we add that to the count. Then we divide 1 by 2 and the returned int is 0. So this is the end. So our final count is 2.
 
*/
var count = 0
func binary(x : Int) -> Int{
    let n = x
    // general check for zero
    if x == 0{
        return 0
    }else{
        // check to see if the number inputed is odd
        if n % 2 == 1{
            // If it is then add the 1 to our count and move to the next level
            count += 1
            binary(x: n/2)
        }else{
            // If it is even then it is a zero and we try again
            binary(x: n/2)
        }
    }
    return count
}
binary(x: 9)

/* Fizz Buzz (Apple)
    - You know what this is... if you dont just google it...
*/
func fizzBuzz(x : Int, y : Int, z : Int){
    if z % x == 0 && z % y == 0{
        print("Fizz-Buzz")
    }else if z % x == 0 && z % y != 0{
        print("Fizz")
    }else if z % x != 0 && z % y == 0{
        print("Buzz")
    }else{
       print(z)
    }
}
fizzBuzz(x: 2, y: 1, z: 2)

/* Staircase (Hubspot)
    if x = 6 Prints

      #
     ##
    ###
   ####
  #####
 ######
*/

func staircase(x : Int){
    /*print("Staircase")
    let steps = 0
    let level = 0
    let line = ""
    //step one all spaces
    if step == 0{
    }*/
}
staircase(x: 6)

/* Maximum Difference (Hubspot)

*/

func maxDifference(_ input:[Int])-> Int{
    let arraySize = input.count
    var diff = -1
    for x in 0 ..< arraySize {
        for y in x ..< arraySize {
            if input[y] - input[x] > diff {
                diff = input[y] - input[x]
            }
        }
    }
    
    return diff
}

var test1 = [2, 3, 10, 6, 4, 8, 1]
var test2 = [7, 9, 5, 6, 3, 2]
var test3 = [2,1,5,2]
var test4 = [5,4,3,2,1]
maxDifference(test3)


/* All Sums (Hubspot)

*/

func allSums(list: [Int], target: Int) -> [[Int]]{
    var list = list
    let val = list[0]
    var listOfLists : [[Int]] = []
    for x in 0 ..< list.count{
        let hi = list[x]
        if val + hi == target{
            let addTo = [val,hi]
            listOfLists.append(addTo)
        }
    }
    
    return listOfLists
    
}

allSums(list:[-1,1,6,2,3,4], target: 5 )

/*
Sleep Sort
*/
func sleep(){
    for i in [2, 11, 5, 4, 6, 7, 20, 14, 1] {
        let time = DispatchTime.now() + Double(Int64(i * Int(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            print(i)
        }
    }
    
    CFRunLoopRun()
}
sleep()






