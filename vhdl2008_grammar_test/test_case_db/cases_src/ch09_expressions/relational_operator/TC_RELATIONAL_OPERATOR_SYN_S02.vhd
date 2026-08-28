-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >=
-- Case Type: Positive
-- Test Focus: comparisons on enumeration type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rop_spc2_ent is port(r:out boolean); end entity;
architecture bh of rop_spc2_ent is
  type t_level is (LOW, MEDIUM, HIGH);
  signal a,b:t_level:=LOW;
begin
  process begin a<=MEDIUM; b<=HIGH; r<=a<b; wait; end process;
end architecture bh;
