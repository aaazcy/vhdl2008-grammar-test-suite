-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Negative
-- Test Focus: SNN: misspelled multiplying_operator — using "div" instead of a legal operator, verifying that multiplying_operator must be one of the 4 reserved symbols/keywords listed in the BNF (* / mod rem), the misspelling "div" is parsed as a user-defined function name or identifier
-- Expected Result: Triggers syntax error: "div" is not a recognized multiplying_operator
-- Dependencies: None
-- =============================================================
entity ent_bad_keyword is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out integer
  );
end entity ent_bad_keyword;

architecture rtl of ent_bad_keyword is
begin
  -- ERROR: "div" is not a valid multiplying_operator (use / instead)
  y_o <= a_i div b_i;
end architecture rtl;
