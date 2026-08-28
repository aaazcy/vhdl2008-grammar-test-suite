-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Positive
-- Test Focus: sla arithmetic left shift and sra arithmetic right shift — shift operations on signed type that preserve the sign bit, verifying the syntax of sla/sra in shifting signed numbers
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_sla_sra is
  port (
    din    : in  signed(7 downto 0);
    left_o : out signed(7 downto 0);
    right_o: out signed(7 downto 0)
  );
end entity ent_sla_sra;

architecture rtl of ent_sla_sra is
begin
  left_o  <= din sla 1;
  right_o <= din sra 2;
end architecture rtl;
