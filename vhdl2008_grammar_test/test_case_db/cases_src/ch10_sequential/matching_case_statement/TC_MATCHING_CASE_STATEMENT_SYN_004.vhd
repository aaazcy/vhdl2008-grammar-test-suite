-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Positive
-- Test Focus: matching case? with label: l_mux: case? sel is ... end case? l_mux; — case label is optional at both the beginning and the end, here label is added at both ends
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee; use ieee.std_logic_1164.all;
entity mcs_syn4_ent is port(sel:in std_logic_vector(2 downto 0); din:in integer; y:out integer); end entity;
architecture bh of mcs_syn4_ent is
begin
  process(sel,din) begin
    l_mux: case? sel is
      when "00-" => y <= din;
      when "01-" => y <= din * 2;
      when "10-" => y <= din / 2;
      when "11-" => y <= 0;
      when others => y <= 0;
    end case? l_mux;
  end process;
end architecture bh;
