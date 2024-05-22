# ex1: do the following expressions return 'true' or 'false'?

(32 * 4) >= 129
# => false
false != !true
# => false
true == 4
# => true <-WRONG
# => false
    # the integer '4' is truthy, but not equal to the boolean 'true'
false == (847 = '847')
# => false? <-WRONG
# => true 
    # an integer is NEVER equal to a string
# Error Message
    # rb):5: syntax error, unexpected '=', expecting ')' (SyntaxError)
(!true || (!(100/5) == 20) || ((328/4) == 82)) || false
# false OR false OR true || false
# => true
    # if 'true' CAN be an answer, then the whole expression becomes true