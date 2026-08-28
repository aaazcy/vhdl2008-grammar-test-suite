-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Negative
-- Test Focus: SNN: misspelled relational_operator——using "==" instead of "=" for equality comparison, verifying that a relational_operator must be one of the reserved symbols listed in the BNF and that the C-style "==" is not a legal VHDL relational_operator
-- Expected Result: Triggers syntax error: "==" is not a recognized relational_operator
-- Dependencies: None
-- =============================================================
entity ent_bad_eq is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out boolean
  );
end entity ent_bad_eq;

architecture rtl of ent_bad_eq is
begin
  -- ERROR: "==" is not a valid VHDL relational_operator (use "=")
  y_o <= a_i == b_i;
end architecture rtl;
