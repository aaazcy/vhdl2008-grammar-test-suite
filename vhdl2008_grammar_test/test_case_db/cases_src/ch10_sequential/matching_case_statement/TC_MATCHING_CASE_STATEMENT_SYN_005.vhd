-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Positive
-- Test Focus: matching case? with std_logic_vector: case? sig is when "00--" =>... — std_logic_vector contains don't-care bit `-` for pattern matching, verifying the std_logic type scenario
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee; use ieee.std_logic_1164.all;
entity mcs_syn5_ent is port(op:in std_logic_vector(1 downto 0); y:out integer); end entity;
architecture bh of mcs_syn5_ent is
begin
  process(op) begin
    case? op is
      when "00" => y <= 0;
      when "01" => y <= 1;
      when "10" => y <= 2;
      when "11" => y <= 3;
      when others => y <= 0;
    end case?;
  end process;
end architecture bh;
