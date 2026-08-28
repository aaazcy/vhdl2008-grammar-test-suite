-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Test Focus: sla arithmetic left shift: keep the sign bit unchanged while the other bits shift left
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;
entity shf_sla_ent is
  port(din : in signed(7 downto 0); dout : out signed(7 downto 0));
end entity;
architecture rtl of shf_sla_ent is
begin
  dout <= din sla 1;
end architecture rtl;
