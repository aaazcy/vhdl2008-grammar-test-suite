-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Positive
-- Test Focus: cascaded comparisons of /= and ?/= in an if-elsif priority chain——a multi-way arbiter checks request priority with consecutive /= and ?/=, verifying the independent use of standard inequality and matching inequality in the same process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_arb_cmp is
  port (
    req   : in  std_logic_vector(2 downto 0);
    mask  : in  std_logic_vector(2 downto 0);
    gnt   : out integer range 0 to 2
  );
end entity ent_arb_cmp;

architecture rtl of ent_arb_cmp is
begin
  process(req, mask)
  begin
    if req(0) = '1' and mask(0) /= '0' then
      gnt <= 0;
    elsif req(1) = '1' and mask(1) /= '0' then
      gnt <= 1;
    elsif req(2) = '1' then
      gnt <= 2;
    else
      gnt <= 0;
    end if;
  end process;
end architecture rtl;
