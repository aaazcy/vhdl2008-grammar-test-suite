-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_S03
-- Rule Type: Syntax
-- BNF Production: miscellaneous_operator
-- IEEE Section: 9.2
-- BNF Text: miscellaneous_operator ::= ** | abs | not
-- Test Focus: not operator applied to both boolean and bit types in combinatorial logic
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_miscellaneous_operator_syn_s03 is
  port (
    a       : in  bit;
    b       : in  boolean;
    y       : out bit;
    z       : out boolean
  );
end entity tc_miscellaneous_operator_syn_s03;

architecture not_unit of tc_miscellaneous_operator_syn_s03 is
begin
  y <= not a;
  z <= not b;
end architecture not_unit;
