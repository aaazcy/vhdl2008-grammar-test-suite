-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Positive
-- Test Focus: srl logical right shift — 8-bit unsigned shifted right by 3 with zero fill in the high bit, verifying the use of srl (shift right logical) in sequential logic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_srl_unsigned is
  port (
    clk  : in  bit;
    din  : in  unsigned(7 downto 0);
    dout : out unsigned(7 downto 0)
  );
end entity ent_srl_unsigned;

architecture rtl of ent_srl_unsigned is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      dout <= din srl 3;
    end if;
  end process;
end architecture rtl;
