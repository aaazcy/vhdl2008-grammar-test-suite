-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Positive
-- Test Focus: The subtraction operator - in difference computation within sequential logic - the difference of two signed signals is computed on the clock rising edge, verifying the use of - as an adding_operator in register-transfer-level design
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_sub_signed is
  port (
    clk       : in  bit;
    data_a    : in  signed(7 downto 0);
    data_b    : in  signed(7 downto 0);
    diff_o    : out signed(7 downto 0)
  );
end entity ent_sub_signed;

architecture rtl of ent_sub_signed is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      diff_o <= data_a - data_b;
    end if;
  end process;
end architecture rtl;
