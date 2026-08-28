-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Positive
-- Test Focus: sll used for a multiply-equivalent operation — sll 1 is equivalent to multiplying by 2, using sll at the shift_expression level of expression to implement the multiply-by-2 hardware optimization
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_sll_mul2 is
  port (
    din  : in  unsigned(6 downto 0);
    dout : out unsigned(7 downto 0)
  );
end entity ent_sll_mul2;

architecture rtl of ent_sll_mul2 is
begin
  dout <= din sll 1;
end architecture rtl;
