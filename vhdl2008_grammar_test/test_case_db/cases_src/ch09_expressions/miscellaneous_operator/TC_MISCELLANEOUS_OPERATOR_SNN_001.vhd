-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Negative
-- Test Focus: SNN: missing primary on the right side of the not operator — "not" followed directly by a semicolon with no operand, verifying that the BNF factor production (the not primary alternative) requires a primary after not
-- Expected Result: Triggers syntax error: missing operand after miscellaneous_operator not
-- Dependencies: None
-- =============================================================
entity ent_missing_not_op is
  port (
    a_i : in  bit;
    y_o : out bit
  );
end entity ent_missing_not_op;

architecture rtl of ent_missing_not_op is
begin
  -- ERROR: missing primary operand after miscellaneous_operator "not"
  y_o <= not ;
end architecture rtl;
