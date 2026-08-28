-- =============================================================
-- Case ID: TC_SIGN_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Positive
-- Test Focus: Nested use of the minus sign — in "-(a_i - b_i)" the outer minus applies to the parenthesized subtraction result, verifying that sign can form a nested negation expression through parentheses
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_nested_neg is
  port (
    a_i : in  integer range 0 to 100;
    b_i : in  integer range 0 to 100;
    y_o : out integer range -100 to 100
  );
end entity ent_nested_neg;

architecture rtl of ent_nested_neg is
begin
  y_o <= -(a_i - b_i);
end architecture rtl;
