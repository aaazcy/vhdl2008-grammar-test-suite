-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Test Focus: shift applied to unsigned type: unsigned vector sll/srl shifts used for DSP multiplier scaling operations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;
entity shf_unsigned_ent is
  port(din : in unsigned(15 downto 0); dout : out unsigned(15 downto 0));
end entity;
architecture rtl of shf_unsigned_ent is
  signal scale : integer := 2;
begin
  dout <= din sll scale;
end architecture rtl;
