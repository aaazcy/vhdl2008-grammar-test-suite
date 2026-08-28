-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Negative
-- Test Focus: SNN: illegal comparison operator "!=" C-style not-equal——using "!=" instead of "/=" for inequality comparison, verifying that the VHDL relational_operator for not-equal must be "/=" and that the C/Verilog-style "!=" is not a legal VHDL operator
-- Expected Result: Triggers syntax error: "!=" is not a recognized relational_operator
-- Dependencies: None
-- =============================================================
entity ent_bad_neq is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out boolean
  );
end entity ent_bad_neq;

architecture rtl of ent_bad_neq is
begin
  -- ERROR: "!=" is not a valid VHDL relational_operator (use "/=")
  y_o <= a_i != b_i;
end architecture rtl;
