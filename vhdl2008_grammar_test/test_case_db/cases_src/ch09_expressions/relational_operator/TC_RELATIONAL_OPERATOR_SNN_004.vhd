-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Negative
-- Test Focus: SNN: two relational_operators appear consecutively——"a < = b" splits <= into two separate < and = tokens with a space, verifying that the <= token as a relational_operator cannot be split ambiguously
-- Expected Result: Triggers syntax error: ambiguous relational_operator tokens
-- Dependencies: None
-- =============================================================
entity ent_broken_op is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out boolean
  );
end entity ent_broken_op;

architecture rtl of ent_broken_op is
begin
  -- ERROR: two juxtaposed relational_operators < and = (not <=)
  y_o <= a_i < = b_i;
end architecture rtl;
