-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Positive
-- Test Focus: multiply-accumulate operation of the multiplying operator * in sequential logic — on the clock rising edge, the product of a signed input and a fixed coefficient is computed and accumulated into a register, verifying the use of * as a multiplying_operator in the factor { multiplying_operator factor } term structure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent_mul_mac is
  port (
    clk     : in  bit;
    data_i  : in  signed(7 downto 0);
    coeff   : in  signed(3 downto 0);
    accum_o : out signed(15 downto 0)
  );
end entity ent_mul_mac;

architecture rtl of ent_mul_mac is
  signal accum : signed(15 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      accum <= accum + (data_i * coeff);
    end if;
  end process;
  accum_o <= accum;
end architecture rtl;
