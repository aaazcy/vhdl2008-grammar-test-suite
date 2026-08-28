-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Positive
-- Test Focus: matching case? with don't-care: case? sel is when "0-" =>... when "1-" =>... — `-` matches any value, two branches cover all 2-bit combinations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee; use ieee.std_logic_1164.all;
entity mcs_syn3_ent is port(sel:in std_logic_vector(1 downto 0); y:out integer); end entity;
architecture bh of mcs_syn3_ent is
begin
  process(sel) begin
    case? sel is
      when "0-" => y <= 1;
      when "1-" => y <= 2;
      when others => y <= 0;
    end case?;
  end process;
end architecture bh;
