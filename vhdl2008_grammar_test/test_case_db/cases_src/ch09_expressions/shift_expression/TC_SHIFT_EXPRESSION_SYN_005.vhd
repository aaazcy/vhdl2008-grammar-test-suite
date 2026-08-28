-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Test Focus: sra arithmetic right shift: the sign bit is replicated, preserving sign extension
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;
entity shf_sra_ent is
  port(din : in signed(7 downto 0); dout : out signed(7 downto 0));
end entity;
architecture rtl of shf_sra_ent is
begin
  dout <= din sra 2;
end architecture rtl;
