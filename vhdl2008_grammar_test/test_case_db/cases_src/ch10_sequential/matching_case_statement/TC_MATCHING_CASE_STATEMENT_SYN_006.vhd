-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Positive
-- Test Focus: matching case? 4-bit all don't-care coverage: case? addr is when "00--"=>... when "01--"=>... when "10--"=>... when "11--"=>... — 4 branches cover all 16 4-bit values with don't-care
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee; use ieee.std_logic_1164.all;
entity mcs_syn6_ent is port(addr:in std_logic_vector(3 downto 0); y:out integer); end entity;
architecture bh of mcs_syn6_ent is
begin
  process(addr) begin
    case? addr is
      when "00--" => y <= 100;
      when "01--" => y <= 200;
      when "10--" => y <= 300;
      when "11--" => y <= 400;
      when others => y <= 0;
    end case?;
  end process;
end architecture bh;
