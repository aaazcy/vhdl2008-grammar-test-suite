-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Case Type: Positive
-- Test Focus: multiple concurrent assertions coexist — chk_range, chk_parity, chk_valid are three independent concurrent assertions checking different conditions, verifying that an architecture may contain multiple concurrent assertions monitoring in parallel
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
entity ca_multi_ent is
  port(data : in std_logic_vector(7 downto 0); parity : in std_logic; valid : in std_logic);
end entity ca_multi_ent;
architecture bh of ca_multi_ent is
begin
  chk_range : assert data /= "XXXXXXXX"
    report "data is undefined" severity warning;
  chk_parity : assert (data(0) xor data(1) xor data(2) xor data(3) xor
    data(4) xor data(5) xor data(6) xor data(7)) = parity
    report "parity error" severity error;
  chk_valid : assert valid = '1' or data = "00000000"
    report "invalid data when valid deasserted" severity warning;
end architecture bh;
