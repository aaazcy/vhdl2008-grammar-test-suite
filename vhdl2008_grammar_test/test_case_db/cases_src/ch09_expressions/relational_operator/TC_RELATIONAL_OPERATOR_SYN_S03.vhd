-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >=
-- Case Type: Positive
-- Test Focus: comparisons on array (bit_vector)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rop_spc3_ent is port(r:out boolean); end entity;
architecture bh of rop_spc3_ent is
  signal a,b:bit_vector(7 downto 0):=X"00";
begin
  a<=X"AB"; b<=X"CD"; r<=a/=b;
end architecture bh;
